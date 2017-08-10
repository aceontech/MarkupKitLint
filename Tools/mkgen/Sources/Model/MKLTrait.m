//
//  MKLTrait.m
//  mkgen
//
//  Created by Alex on 10/08/2017.
//  Copyright © 2017 Jarroo. All rights reserved.
//

#import "MKLTrait.h"

@implementation MKLTrait

-(instancetype)initWithName:(NSString *)name {
    if ((self = [super init])) {
        self.name = name;
        self.attributes = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark - Equality

-(BOOL)isEqualToMKLTrait:(MKLTrait *)other {
    return [self.name isEqualToString:other.name];
}

-(BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }

    if (![object isKindOfClass:[MKLTrait class]]) {
        return NO;
    }

    return [self isEqualToMKLTrait:(MKLTrait *)object];
}

@end
