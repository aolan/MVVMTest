//
//  MVTabBarController.h
//  MVVMTest
//
//  Created by lawn on 16/1/5.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import "MVViewController.h"

@interface MVTabBarController : MVViewController<UITabBarControllerDelegate>

@property (nonatomic, strong, readonly) UITabBarController *tabBarController;

@end
