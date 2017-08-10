//
//  MKLSchema.m
//  mkgen
//
//  Created by Alex on 08/08/2017.
//  Copyright © 2017 Jarroo. All rights reserved.
//

#import "MKLSchema.h"

@implementation MKLSchema

-(instancetype)init {
    if ((self = [super init])) {
        self.rootElementReferences = [[NSMutableArray alloc] init];
        self.markupkitElementReferences = [[NSMutableArray alloc] init];
        self.definitions = [[NSMutableArray alloc] init];
        self.anyExclusions = [[NSMutableArray alloc] init];
        self.traits = [[NSMutableArray alloc] init];
    }
    return self;
}

-(MKLTrait *)findTraitByName:(NSString *)name {
    for (MKLTrait *trait in self.traits) {
        if ([trait.name isEqualToString:name]) {
            return trait;
        }
    }
    return nil;
}


-(BOOL)containsTraitWithAttribute:(MKLElementAttribute *)attribute {
    for (MKLTrait *trait in self.traits) {
        if ([trait.attributes containsObject:attribute]) {
            return YES;
        }
    }
    return NO;
}

@end
