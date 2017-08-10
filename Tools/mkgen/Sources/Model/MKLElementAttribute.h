//
//  MKLElementAttribute.h
//  mkgen
//
//  Created by Alex on 09/08/2017.
//  Copyright © 2017 Jarroo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MKLElementAttribute : NSObject

@property(nonatomic,copy,nonnull) NSString *name;

-(nonnull instancetype)initWithName:(nonnull NSString *)name;
-(BOOL)isEqualToMKLElementAttribute:(nullable MKLElementAttribute *)other;

@end
