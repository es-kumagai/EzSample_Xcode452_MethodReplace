//
//  EzSampleAppDelegate.m
//  EzSample_Xcode452_MethodReplace
//
//  Created by 熊谷 友宏 on H.24/11/28.
//  Copyright (c) 平成24年 Tomohiro Kumagai. All rights reserved.
//

#import "EzSampleAppDelegate.h"
#import "EzSampleViewController.h"
#import <objc/runtime.h>

@implementation EzSampleAppDelegate

- (NSString*)dummy
{
	NSLog(@"DUMMY");
	return @"DUMMY";
}

- (void)replaceStringMethod
{
	NSLog(@"Replace string");
	
	Class targetClass = [UILabel class];
	SEL targetSelector = @selector(text);
	
	Class sourceClass = [EzSampleAppDelegate class];
	
	Method newMethod = class_getInstanceMethod(sourceClass, @selector(dummy));
	IMP newImplementation = method_getImplementation(newMethod);
	const char* newTypes = method_getTypeEncoding(newMethod);
	
	class_replaceMethod(targetClass, targetSelector, newImplementation, newTypes);
}
	
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//	[self replaceStringMethod];
	
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
