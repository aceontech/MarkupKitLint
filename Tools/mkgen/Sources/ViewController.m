//
//  ViewController.m
//  mkgen
//
//  Created by Alex on 04/08/2017.
//  Copyright © 2017 Jarroo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ViewController.h"
#import "MKLSchemaBuilder.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MKLSchemaBuilder renderToFile];
}

//-(void)iterateProperties {
//    NSLog(@"\n\n----- UIView -----");
//    [self iteratePropertiesOfClass:UIView.class block:^(RTProperty *property, NSString *name, NSString *type) {
//        NSLog(@"[%@] UIView.%@", type, name);
//    }];
//
//    NSLog(@"\n\n----- UIControl -----");
//    [self iteratePropertiesOfClass:UIControl.class block:^(RTProperty *property, NSString *name, NSString *type) {
//        NSLog(@"[%@] UIControl.%@", type, name);
//    }];
//
//    NSLog(@"\n\n----- UIScrollView -----");
//    [self iteratePropertiesOfClass:UIScrollView.class block:^(RTProperty *property, NSString *name, NSString *type) {
//        NSLog(@"[%@] UIScrollView.%@", type, name);
//    }];
//}

@end
