//
//  MKLInspector.m
//  mkgen
//
//  Created by Alex on 08/08/2017.
//  Copyright © 2017 Jarroo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MarkupKit.h>
#import <MAObjCRuntime/MARTNSObject.h>
#import <MAObjCRuntime/RTProperty.h>

#import "MKLInspector.h"

@implementation MKLInspector

+(NSArray<Class> *)superclassesOfClass:(Class)Clazz {
    NSArray<NSString*> *excludedClasses = @[ @"UIResponder", @"NSObject" ];
    NSMutableArray<Class> *superclasses = [[NSMutableArray alloc] init];
    Class currentClass = Clazz;

    while ([currentClass superclass] != nil && ![excludedClasses containsObject:NSStringFromClass([currentClass superclass])]) {
        Class superClass = [currentClass superclass];

        [superclasses addObject:superClass];
        currentClass = superClass;
    }

    return superclasses;
}

+(void)iteratePropertiesOfClass:(Class)Clazz block:(void (^)(RTProperty *property, NSString *name, NSString *type))block {
    NSArray *properties = [Clazz rt_properties];
    for (RTProperty *property in properties) {
        NSString *name = [property name];
        NSString *typeEncoding = [property attributes][@"T"];
        NSString *type = [self typeOfEncoding:typeEncoding];

        // Properties prefixed with _ are probably private, skip these
        if ([name hasPrefix:@"_"]) { continue; }

        // Properties with types prefixed with <_ are probably private, skip these
        if ([type hasPrefix:@"<"]) { continue; }

        block(property, name, type);
    }
}

+ (nullable NSString *)typeOfEncoding:(NSString *)encoding {
    static NSDictionary *types;
    types = @{ @"B": @"Bool",
               @"s": @"Int",
               @"i": @"Int",
               @"l": @"Int",
               @"q": @"Int",
               @"I": @"Int",
               @"S": @"Int",
               @"L": @"Int",
               @"Q": @"Int",
               @"d": @"Double",
               @"f": @"Double",
               @"*": @"String",
               @"@": @"id",
               @"#": @"Class" };

    // Struct type
    if ([encoding hasPrefix:@"{"]) {
        return [[[encoding componentsSeparatedByString:@"="] firstObject] substringFromIndex:1];
    }
    // Pointer type
    else if ([encoding hasPrefix:@"^"]) {
        return [encoding substringFromIndex:1];
    }
    // Object type
    else if ([encoding length] > 1 && [encoding hasPrefix:@"@"]) {
        return [encoding componentsSeparatedByString:@"\""][1];
    }
    // Primitive type
    else {
        return types[encoding] ?: encoding;
    }
}

@end
