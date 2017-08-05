//
//  ViewController.m
//  mkgen
//
//  Created by Alex on 04/08/2017.
//  Copyright © 2017 Jarroo. All rights reserved.
//

#import "ViewController.h"

#import <UIKit/UIKit.h>
#import <MarkupKit.h>
#import <MAObjCRuntime/MARTNSObject.h>
#import <MAObjCRuntime/RTProperty.h>

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"\n\n----- UIView -----");
    [self iteratePropertiesOfClass:UIView.class block:^(RTProperty *property, NSString *name, NSString *type) {
        NSLog(@"[%@] UIView.%@", type, name);
    }];

    NSLog(@"\n\n----- UIControl -----");
    [self iteratePropertiesOfClass:UIControl.class block:^(RTProperty *property, NSString *name, NSString *type) {
        NSLog(@"[%@] UIControl.%@", type, name);
    }];

    NSLog(@"\n\n----- UIScrollView -----");
    [self iteratePropertiesOfClass:UIScrollView.class block:^(RTProperty *property, NSString *name, NSString *type) {
        NSLog(@"[%@] UIScrollView.%@", type, name);
    }];
}

#pragma mark - Helpers

- (void)iteratePropertiesOfClass:(Class)Clazz block:(void (^)(RTProperty*, NSString*, NSString*))block {
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

- (nullable NSString *)typeOfEncoding:(NSString *)encoding {
    NSDictionary *const types = @{ @"B": @"Bool",
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
