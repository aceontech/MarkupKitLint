//
//  MKLInspector.h
//  mkgen
//
//  Created by Alex on 08/08/2017.
//  Copyright © 2017 Jarroo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MAObjCRuntime/RTProperty.h>

@interface MKLInspector : NSObject
+(NSArray<Class> *)superclassesOfClass:(Class)Clazz;
+(void)iteratePropertiesOfClass:(Class)Clazz block:(void (^)(RTProperty *property, NSString *name, NSString *type))block;
@end
