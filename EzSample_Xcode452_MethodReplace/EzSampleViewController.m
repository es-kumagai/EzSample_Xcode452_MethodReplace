//
//  EzSampleViewController.m
//  EzSample_Xcode452_MethodReplace
//
//  Created by 熊谷 友宏 on H.24/11/28.
//  Copyright (c) 平成24年 Tomohiro Kumagai. All rights reserved.
//

#import "EzSampleViewController.h"
#import <objc/runtime.h>

@interface EzSampleViewController ()

@end

@implementation EzSampleViewController

+ (void)test
{
	NSLog(@"TEST 1");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[self originalMethod];
}

- (void)update:(id)sender
{
	[[self class] load];
	
	[self originalMethod];
}

- (void)originalMethod
{
	NSLog(@"1 %s", __FUNCTION__);
	self.label1.text = @"Original Method 1 was called.";
}

- (void)replaceMethod
{
	NSLog(@"1 %s", __FUNCTION__);
	self.label1.text = @"Replace Method 1 was called.";
}

- (void)superTest:(id)sender
{
	self.label1.text = nil;
	self.label2.text = nil;
}

@end
