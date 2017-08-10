//
//  MKLTrait.h
//  mkgen
//
//  Created by Alex on 10/08/2017.
//  Copyright © 2017 Jarroo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKLElementAttribute.h"

@interface MKLTrait : NSObject

@property(nonatomic,copy,nonnull) NSString *name;
@property(nonatomic,strong,nonnull) NSMutableArray<MKLElementAttribute*> *attributes;

-(nonnull instancetype)initWithName:(nonnull NSString *)name;
-(BOOL)isEqualToMKLTrait:(nullable MKLTrait *)other;

@end
