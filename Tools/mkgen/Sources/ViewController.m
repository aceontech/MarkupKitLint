//
//  ViewController.m
//  mkgen
//
//  Created by Alex on 04/08/2017.
//  Copyright © 2017 Jarroo. All rights reserved.
//

#import "ViewController.h"

#import <MarkupKit.h>
#import <MAObjCRuntime/MARTNSObject.h>
#import <MAObjCRuntime/RTProperty.h>

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *uiViewProperties = [UIView rt_properties];
    NSLog(@"[ UIView properties ]");
    for (RTProperty *property in uiViewProperties) {
        NSLog(@"Name: %@", [property name]);
    }
}

@end
