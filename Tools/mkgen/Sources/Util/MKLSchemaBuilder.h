//
//  MKLSchemaBuilder.h
//  mkgen
//
//  Created by Alex on 08/08/2017.
//  Copyright © 2017 Jarroo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GRMustache.h"

@interface MKLSchemaBuilder : NSObject

+(void)renderToFile;

+(GRMustacheTemplate *)emptyElementBodyTemplate;
+(GRMustacheTemplate *)elementBodyTemplate;

@end
