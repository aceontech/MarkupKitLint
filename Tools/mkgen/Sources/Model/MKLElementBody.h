//
//  MKLElementBody.h
//  mkgen
//
//  Created by Alex on 09/08/2017.
//  Copyright © 2017 Jarroo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKLElementAttribute.h"
#import "MKLTrait.h"

@interface MKLElementBody : NSObject

@property(nonatomic,assign,getter=isEmpty,readonly) BOOL empty;
@property(nonatomic,strong,nonnull) NSMutableArray<MKLElementAttribute *> *attributes;
@property(nonatomic,strong,nonnull) NSMutableArray<MKLTrait *> *traitReferences;

-(nonnull instancetype)initWithEmpty:(BOOL)empty;
-(nonnull NSString *)string;

-(BOOL)containsTraitReferenceWithAttribute:(nullable MKLElementAttribute *)attribute;

@end
