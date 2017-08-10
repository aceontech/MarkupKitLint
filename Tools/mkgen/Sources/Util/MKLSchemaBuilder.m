//
//  MKLSchemaBuilder.m
//  mkgen
//
//  Created by Alex on 08/08/2017.
//  Copyright © 2017 Jarroo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MarkupKit/MarkupKit.h>

#import "MKLSchemaBuilder.h"
#import "GRMustache.h"
#import "MKLSchema.h"
#import "MKLInspector.h"
#import "MKLClass.h"

@implementation MKLSchemaBuilder

+(void)renderToFile {
    MKLSchema *schema = [[MKLSchema alloc] init];
    NSArray<MKLClass *> *markupKitClasses = @[
        [[MKLClass alloc] initWithType:LMSpacer.class canContainChildren:NO],
        [[MKLClass alloc] initWithType:LMLinearGradientView.class canContainChildren:NO],
        [[MKLClass alloc] initWithType:LMRadialGradientView.class canContainChildren:NO],
        [[MKLClass alloc] initWithType:LMPlayerView.class canContainChildren:NO],

        [[MKLClass alloc] initWithType:LMColumnView.class canContainChildren:YES],
        [[MKLClass alloc] initWithType:LMRowView.class canContainChildren:YES],
        [[MKLClass alloc] initWithType:LMLayerView.class canContainChildren:YES],
        [[MKLClass alloc] initWithType:LMAnchorView.class canContainChildren:YES],
        [[MKLClass alloc] initWithType:LMScrollView.class canContainChildren:YES],
        [[MKLClass alloc] initWithType:LMPageView.class canContainChildren:YES],
        [[MKLClass alloc] initWithType:LMPickerView.class canContainChildren:YES],
    ];

    for (MKLClass* mkClass in markupKitClasses) {
        // Create references to this class
        MKLElement *elementReference = [[MKLElement alloc] initWithName: mkClass.name];
        [schema.rootElementReferences addObject:elementReference];
        [schema.markupkitElementReferences addObject:elementReference];
        [schema.anyExclusions addObject:elementReference];

        // Build definition body
        MKLElementBody *elementBody = [[MKLElementBody alloc] initWithEmpty:!mkClass.canContainChildren];

        // Add parent traits
        NSArray<MKLTrait *> *parentTraits = [self generateParentTraitsIfNecessaryOfClass:mkClass.type schema:schema];
        [elementBody.traitReferences addObjectsFromArray:parentTraits];

        // Add element attributes
        [MKLInspector iteratePropertiesOfClass:mkClass.type block:^(RTProperty *property, NSString *name, NSString *type) {
            MKLElementAttribute *attribute = [[MKLElementAttribute alloc] initWithName:name];

            // Only add attribute definition if not already defined by a trait
            if (![elementBody containsTraitReferenceWithAttribute:attribute]) {
                [elementBody.attributes addObject:attribute];
            }
        }];

        // Create definition & persist
        MKLElementDefinition *elementDefinition = [[MKLElementDefinition alloc] initWithName:mkClass.name body:elementBody];
        [schema.definitions addObject:elementDefinition];
    }

    // Create schema
    NSString *schemaString = [[self schemaTemplate] renderObject:schema error:NULL];
    NSLog(@"%@", schemaString);

    // Write schema to disk
    [schemaString writeToFile:[self path] atomically:YES encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@", [self path]);
}

+(NSArray<MKLTrait *> *)generateParentTraitsIfNecessaryOfClass:(Class)Clazz schema:(MKLSchema *)schema {
    NSMutableArray<MKLTrait *> *traitsToReturn = [[NSMutableArray alloc] init];
    NSArray<Class> *superClasses = [MKLInspector superclassesOfClass:Clazz];

    for (Class superClass in superClasses) {
        NSString *superClassName = NSStringFromClass(superClass);
        MKLTrait *trait = [[MKLTrait alloc] initWithName:superClassName];

        // Break out if parent definition already exists
        if ([schema.traits containsObject:trait]) {
            MKLTrait *existingTrait = [schema findTraitByName:superClassName];
            if (existingTrait != nil) {
                [traitsToReturn addObject:existingTrait];
            }
            continue;
        }

        // Generate trait attributes
        [MKLInspector iteratePropertiesOfClass:superClass block:^(RTProperty *property, NSString *name, NSString *type) {
            MKLElementAttribute *attribute = [[MKLElementAttribute alloc] initWithName:name];

            // Only add attribute definition if no other trait has it defined, and the current trait doesn't already define it
            if (![trait.attributes containsObject:attribute] && ![schema containsTraitWithAttribute:attribute]) {
                [trait.attributes addObject:attribute];
            }
        }];

        [schema.traits addObject:trait];
        [traitsToReturn addObject:trait];
    }


    return traitsToReturn;
}

#pragma mark - Templates

+(GRMustacheTemplate *)schemaTemplate {
    static GRMustacheTemplate *_template = nil;
    if(_template == nil ) { _template = [GRMustacheTemplate templateFromResource:@"Schema.rng" bundle:nil error:NULL]; }
    return _template;
}

+(GRMustacheTemplate *)elementBodyTemplate {
    static GRMustacheTemplate *_template = nil;
    if(_template == nil ) { _template = [GRMustacheTemplate templateFromResource:@"ElementBody.rng" bundle:nil error:NULL]; }
    return _template;
}

+(GRMustacheTemplate *)emptyElementBodyTemplate {
    static GRMustacheTemplate *_template = nil;
    if(_template == nil ) { _template = [GRMustacheTemplate templateFromResource:@"EmptyElementBody.rng" bundle:nil error:NULL]; }
    return _template;
}

#pragma mark - Util

+(NSString *)path {
    static NSString *_path = nil;
    if(_path == nil) {
        NSURL *documentsDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        _path = [[documentsDirectory path] stringByAppendingPathComponent:@"MarkupKit.rng"];
    }
    return _path;
}

@end
