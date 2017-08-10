//
//  MKLSchema.h
//  mkgen
//
//  Created by Alex on 08/08/2017.
//  Copyright © 2017 Jarroo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKLElement.h"
#import "MKLElementDefinition.h"
#import "MKLTrait.h"

@interface MKLSchema : NSObject

@property(nonatomic,strong,nonnull) NSMutableArray<MKLElement *> *rootElementReferences;
@property(nonatomic,strong,nonnull) NSMutableArray<MKLElement *> *markupkitElementReferences;
@property(nonatomic,strong,nonnull) NSMutableArray<MKLElementDefinition *> *definitions;
@property(nonatomic,strong,nonnull) NSMutableArray<MKLElement *> *anyExclusions;
@property(nonatomic,strong,nonnull) NSMutableArray<MKLTrait *> *traits;

-(nullable MKLTrait *)findTraitByName:(nonnull NSString *)name;
-(BOOL)containsTraitWithAttribute:(nullable MKLElementAttribute *)attribute;

@end
