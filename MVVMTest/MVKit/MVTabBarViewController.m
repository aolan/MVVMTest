//
//  MVTabBarViewController.m
//  MVVMTest
//
//  Created by lawn on 16/1/5.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import "MVTabBarViewController.h"
#import "MVTabBarViewModel.h"

@implementation MVTabBarViewController

#pragma mark - Interface Methods

- (MVTabBarViewController *)initWithViewModel:(MVTabBarViewModel *)viewModel{
    
    self = [super init];
    if (self) {
        _viewModel = viewModel;
    }
    return self;
}

#pragma mark - Lifycycle Methods

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    
    MVTabBarViewController *tabBarViewController = [super allocWithZone:zone];
    
    @weakify(tabBarViewController);
    [[tabBarViewController rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
        @strongify(tabBarViewController);
        [tabBarViewController bindViewModel];
    }];
    
    return tabBarViewController;
}

#pragma mark - Override Methods

- (void)bindViewModel{
    
    @weakify(self)
    [RACObserve(self.viewModel, viewModels) subscribeNext:^(id x) {
        @strongify(self)
        [self setupViewControllers];
    }];
}

#pragma mark - Private Methods

- (void)setupViewControllers{
    
    NSMutableArray *controllers = [[NSMutableArray alloc] initWithCapacity:self.viewModel.viewModels.count];
    
    [self.viewModel.viewModels enumerateObjectsUsingBlock:^(NSString *viewModelString, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSAssert([viewModelString isKindOfClass:[NSString class]], @"viewModels应当存放字符串类型");
        NSString *viewModelTitle = [self.viewModel.titles objectAtIndex:idx];
        
        MVViewModel *viewModel = [[NSClassFromString(viewModelString) alloc] initWithTitle:viewModelTitle parameter:nil];
        MVViewController *viewController = [[MVRouter router] viewControllerForViewModel:viewModel];
        MVNavigationController *navController = [[MVNavigationController alloc] initWithRootViewController:viewController];
        [controllers addObject:navController];
    }];
    
    self.viewControllers = controllers;
    
    [self settingTabBar];
    [self settingNavigationBar];
}

- (void)settingTabBar{
    
    [self.tabBar.items enumerateObjectsUsingBlock:^(RDVTabBarItem *item, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *normalImageString = [self.viewModel.tabBarNormalImages objectAtIndex:idx];
        NSString *selectedImageString = [self.viewModel.tabBarSelectedImages objectAtIndex:idx];
        
        UIImage *normalImage = [UIImage imageNamed:normalImageString];
        UIImage *selectedImage = [UIImage imageNamed:selectedImageString];
        
        [item setFinishedSelectedImage:selectedImage withFinishedUnselectedImage:normalImage];
        [item setBackgroundSelectedImage:self.viewModel.tabBarSelectedBackgroundImage withUnselectedImage:self.viewModel.tabBarNormalBackgroundImage];

    }];
}

- (void)settingNavigationBar {
    
    NSDictionary *titleAttributes = @{NSFontAttributeName: MVNaviagtionBarTitleFont,
                                      NSForegroundColorAttributeName: MVNaviagtionBarTitleColor};
    
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    [navigationBarAppearance setBackgroundColor:MVNaviagtionBarBackgroundColor];
    [navigationBarAppearance setTitleTextAttributes:titleAttributes];
    [navigationBarAppearance setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
}

@end
