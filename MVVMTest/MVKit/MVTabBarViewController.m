//
//  MVTabBarViewController.m
//  MVVMTest
//
//  Created by lawn on 16/1/5.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import "MVTabBarViewController.h"
#import "MVTabBarViewModel.h"

@interface MVTabBarViewController ()

@property (nonatomic, strong, readwrite) RDVTabBarController *tabBarController;

@end


@implementation MVTabBarViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    
}

- (void)bindViewModel{
    
    [super bindViewModel];
    
    @weakify(self)
    [[self.viewModel rac_signalForSelector:@selector(setupViewModels)] subscribeNext:^(id x) {
        @strongify(self)
        if ([self.viewModel isKindOfClass:[MVTabBarViewModel class]]) {
            MVTabBarViewModel *barViewModel = (MVTabBarViewModel *)self.viewModel;
            self.tabBarController.viewControllers = barViewModel.viewModels;
        }
    }];
}

#pragma mark - Property Methods

- (RDVTabBarController *)tabBarController{
    
    if (_tabBarController == nil) {
        _tabBarController = [[RDVTabBarController alloc] init];
        _tabBarController.delegate = self;
    }
    return _tabBarController;
}


@end
