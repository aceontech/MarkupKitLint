//
//  MKLClass.m
//  mkgen
//
//  Created by Alex on 10/08/2017.
//  Copyright © 2017 Jarroo. All rights reserved.
//

#import "MKLClass.h"

@interface MKLClass()
@property(nonatomic,copy,readwrite) NSString *name;
@end

@implementation MKLClass

-(instancetype)initWithType:(Class)type canContainChildren:(BOOL)canContainChildren {
    if ((self = [super init])) {
        self.type = type;
        self.name = NSStringFromClass(type);
        self.canContainChildren = canContainChildren;
    }
    return self;
}

@end
