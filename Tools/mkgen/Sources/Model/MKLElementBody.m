//
//  MKLElementBody.m
//  mkgen
//
//  Created by Alex on 09/08/2017.
//  Copyright © 2017 Jarroo. All rights reserved.
//

#import "MKLElementBody.h"
#import "MKLSchemaBuilder.h"

@interface MKLElementBody()
@property(nonatomic,assign,readwrite) BOOL empty;
@end

@implementation MKLElementBody

-(instancetype)initWithEmpty:(BOOL)empty {
    if ((self = [super init])) {
        self.empty = empty;
        self.attributes = [[NSMutableArray alloc] init];
        self.traitReferences = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSString *)string {
    GRMustacheTemplate *template;

    if (self.isEmpty) {
        template = [MKLSchemaBuilder emptyElementBodyTemplate];
    } else {
        template = [MKLSchemaBuilder elementBodyTemplate];
    }
    return [template renderObject:self error:NULL];
}

-(BOOL)containsTraitReferenceWithAttribute:(MKLElementAttribute *)attribute {
    for (MKLTrait *trait in self.traitReferences) {
        if ([trait.attributes containsObject:attribute]) {
            return YES;
        }
    }
    return NO;
}

@end
