//
//  MVTabBarViewController.h
//  MVVMTest
//
//  Created by lawn on 16/1/5.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import "RDVTabBarController.h"


@interface MVTabBarViewController : RDVTabBarController

@property (nonatomic, strong, readonly) MVTabBarViewModel *viewModel;

- (instancetype)initWithViewModel:(MVTabBarViewModel *)viewModel;

- (void)bindViewModel;

@end
