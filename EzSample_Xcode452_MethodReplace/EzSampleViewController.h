//
//  EzSampleViewController.h
//  EzSample_Xcode452_MethodReplace
//
//  Created by 熊谷 友宏 on H.24/11/28.
//  Copyright (c) 平成24年 Tomohiro Kumagai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EzSampleViewController : UIViewController

@property (nonatomic,readonly,weak) IBOutlet UILabel* label1;
@property (nonatomic,readonly,weak) IBOutlet UILabel* label2;

- (void)originalMethod;
- (void)replaceMethod;

- (IBAction)update:(id)sender;
- (IBAction)superTest:(id)sender;

+ (void)test;

@end
