//
//  MVTabBarController.m
//  MVVMTest
//
//  Created by lawn on 16/1/5.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import "MVTabBarController.h"

@interface MVTabBarController ()

@property (nonatomic, strong, readwrite) UITabBarController *tabBarController;

@end

@implementation MVTabBarController

- (void)viewDidLoad {
    
    [super viewDidLoad];

}

#pragma mark - Property Methods

- (UITabBarController *)tabBarController{
    
    if (_tabBarController == nil) {
        _tabBarController = [[UITabBarController alloc] init];
    }
    return _tabBarController;
}


@end
