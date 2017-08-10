//
//  MKLDefinition.h
//  mkgen
//
//  Created by Alex on 08/08/2017.
//  Copyright © 2017 Jarroo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKLElementBody.h"

@interface MKLElementDefinition : NSObject

@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy,readonly) NSString *body;

-(instancetype)initWithName:(NSString *)name;
-(instancetype)initWithName:(NSString *)name body:(MKLElementBody *)body;

-(void)setElementBody:(MKLElementBody *)body;

@end
