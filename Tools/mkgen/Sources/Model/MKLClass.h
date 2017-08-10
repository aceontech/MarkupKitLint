//
//  MKLClass.h
//  mkgen
//
//  Created by Alex on 10/08/2017.
//  Copyright © 2017 Jarroo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MKLClass : NSObject

@property(nonatomic,assign,nonnull) Class type;
@property(nonatomic,assign) BOOL canContainChildren;
@property(nonatomic,copy,readonly,nonnull) NSString *name;

-(nonnull instancetype)initWithType:(nonnull Class)type canContainChildren:(BOOL)canContainChildren;

@end
