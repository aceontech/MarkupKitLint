//
//  MKLElementAttribute.m
//  mkgen
//
//  Created by Alex on 09/08/2017.
//  Copyright © 2017 Jarroo. All rights reserved.
//

#import "MKLElementAttribute.h"

@implementation MKLElementAttribute

-(instancetype)initWithName:(NSString *)name {
    if ((self = [super init])) {
        self.name = name;
    }
    return self;
}


#pragma mark - Equality

-(BOOL)isEqualToMKLElementAttribute:(MKLElementAttribute *)other {
    return [self.name isEqualToString:other.name];
}

-(BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }

    if (![object isKindOfClass:[MKLElementAttribute class]]) {
        return NO;
    }

    return [self isEqualToMKLElementAttribute:(MKLElementAttribute *)object];
}

@end
