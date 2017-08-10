//
//  MKLElement.m
//  mkgen
//
//  Created by Alex on 08/08/2017.
//  Copyright © 2017 Jarroo. All rights reserved.
//

#import "MKLElement.h"

@implementation MKLElement

-(instancetype)initWithName:(NSString *)name {
    if ((self = [super init])) {
        self.name = name;
    }
    return self;
}

@end
