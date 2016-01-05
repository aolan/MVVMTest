//
//  MVViewController.m
//  MVVMTest
//
//  Created by lawn on 16/1/4.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import "MVViewController.h"

@interface MVViewController ()

@end

@implementation MVViewController

#pragma mark - Interface Methods

- (MVViewController *)initWithViewModel:(MVViewModel *)viewModel{
    
    self = [super init];
    if (self) {
        _viewModel = viewModel;
    }
    return self;
}

#pragma mark - Lifycycle Methods

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    
    MVViewController *viewController = [super allocWithZone:zone];
    
    @weakify(viewController);
    [[viewController rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
        @strongify(viewController);
        [viewController bindViewModel];
    }];
    
    return viewController;
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
//    [self.viewModel.willDisappearSignal sendNext:nil];
    
    // Being popped, take a snapshot
    if ([self isMovingFromParentViewController]) {
        self.snapshot = [self.navigationController.view snapshotViewAfterScreenUpdates:NO];
    }
}

#pragma mark - Private Methods

- (void)bindViewModel{
    
    RAC(self.navigationItem, title) = RACObserve(self.viewModel, title);
}








@end