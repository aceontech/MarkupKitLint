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

@end
