//
//  MVTabBarViewController.h
//  MVVMTest
//
//  Created by lawn on 16/1/5.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import "MVViewController.h"

@interface MVTabBarViewController : MVViewController<RDVTabBarControllerDelegate>

@property (nonatomic, strong, readonly) RDVTabBarController *tabBarController;

@end
