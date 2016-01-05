//
//  MVTabBarViewModel.m
//  MVVMTest
//
//  Created by lawn on 16/1/5.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import "MVTabBarViewModel.h"

@interface MVTabBarViewModel()

@property (nonatomic, strong) NSMutableArray *viewControllers;

@end

@implementation MVTabBarViewModel

- (void)initialize{
    
    @weakify(self)
    [RACObserve(self, viewModels) subscribeNext:^(id x) {
        @strongify(self)
        [self setupViewModels];
    }];
}

- (void)setupViewModels{
    
    _viewControllers = [[NSMutableArray alloc] initWithCapacity:self.viewModels.count];
    
    for (NSString *viewModelString in self.viewModels) {

        NSAssert([viewModelString isKindOfClass:[NSString class]], @"viewModels应当存放字符串类型");
        
        MVViewModel *viewModel = [[NSClassFromString(viewModelString) alloc] initWithTitle:nil parameter:nil];
        MVViewController *viewController = [[MVRouter router] viewControllerForViewModel:viewModel];
        [_viewControllers addObject:viewController];
    }
}

@end
