//
//  MKLElement.h
//  mkgen
//
//  Created by Alex on 08/08/2017.
//  Copyright © 2017 Jarroo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MKLElement : NSObject
@property(nonatomic,copy) NSString *name;
-(instancetype)initWithName:(NSString *)name;
@end
