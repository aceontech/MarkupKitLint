//
//  MKLDefinition.m
//  mkgen
//
//  Created by Alex on 08/08/2017.
//  Copyright © 2017 Jarroo. All rights reserved.
//

#import "MKLElementDefinition.h"

@interface MKLElementDefinition()
@property(nonatomic,copy,readwrite) NSString *body;
@end

@implementation MKLElementDefinition

-(instancetype)initWithName:(NSString *)name {
    if ((self = [super init])) {
        self.name = name;
    }
    return self;
}

-(instancetype)initWithName:(NSString *)name body:(MKLElementBody *)body {
    if ((self = [super init])) {
        self.name = name;
        self.body = body.string;
    }
    return self;
}

-(void)setElementBody:(MKLElementBody *)body {
    self.body = body.string;
}

#pragma mark - Equality 

-(BOOL)isEqualToMKLElementDefinition:(MKLElementDefinition *)other {
    return [self.name isEqualToString:other.name];
}

-(BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }

    if (![object isKindOfClass:[MKLElementDefinition class]]) {
        return NO;
    }

    return [self isEqualToMKLElementDefinition:(MKLElementDefinition *)object];
}

@end
