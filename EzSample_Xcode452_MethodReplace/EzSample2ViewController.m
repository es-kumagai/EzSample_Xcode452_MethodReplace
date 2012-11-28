//
//  EzSample2ViewController.m
//  EzSample_Xcode452_MethodReplace
//
//  Created by 熊谷 友宏 on H.24/11/28.
//  Copyright (c) 平成24年 Tomohiro Kumagai. All rights reserved.
//

#import "EzSample2ViewController.h"
#import <objc/runtime.h>

@interface EzSample2ViewController ()

@end

@implementation EzSample2ViewController

+ (void)load
{
	NSLog(@"load 2");
	
	Class targetClass = [EzSample2ViewController class];
	SEL targetSelector = @selector(originalMethod);
	
	Class sourceClass = [EzSample2ViewController class];
	
	Method newMethod = class_getInstanceMethod(sourceClass, @selector(replaceMethod));
	IMP newImplementation = method_getImplementation(newMethod);
	const char* newTypes = method_getTypeEncoding(newMethod);
	
	class_replaceMethod(targetClass, targetSelector, newImplementation, newTypes);
}

+ (void)test
{
	NSLog(@"TEST 2");
}

- (void)superTest:(id)sender
{
	[super superTest:sender];

	[super originalMethod];
}

- (void)originalMethod
{
	NSLog(@"2 %s", __FUNCTION__);
	self.label2.text = @"Original Method 2 was called.";

	[super originalMethod];
}

- (void)replaceMethod
{
	NSLog(@"2 %s", __FUNCTION__);
	self.label2.text = @"Replace Method 2 was called.";

	[super replaceMethod];
}

@end
