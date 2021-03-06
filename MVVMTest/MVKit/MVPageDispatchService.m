//
//  MVPageDispatchService.m
//  MVVMTest
//
//  Created by lawn on 16/1/5.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import "MVPageDispatchService.h"

@implementation MVPageDispatchService

#pragma mark - Interface Methods

+ (UIViewController *)visibleViewController{
    return [self visibleViewController:MVSharedAppDelegate.window.rootViewController];
}


+ (UIViewController *)pushViewModel:(MVViewModel *)viewModel animated:(BOOL)animated{
    
    UIViewController *controller = [[MVRouter router] viewControllerForViewModel:viewModel];
    [[self visibleViewController].navigationController pushViewController:controller animated:animated];
    return controller;
}


+ (UIViewController *)popViewModelAnimated:(BOOL)animated{
    
   return [[self visibleViewController].navigationController popViewControllerAnimated:animated];
}


+ (UIViewController *)popToRootViewModelAnimated:(BOOL)animated{
    
    [[self visibleViewController].navigationController popToRootViewControllerAnimated:animated];
    return [self visibleViewController];
}


+ (UIViewController *)presentViewModel:(MVViewModel *)viewModel animated:(BOOL)animated completion:(void (^)())complete{
    
    UIViewController *controller = [[MVRouter router] viewControllerForViewModel:viewModel];
    MVNavigationController *navigationController = [[MVNavigationController alloc] initWithRootViewController:controller];
    [[self visibleViewController] presentViewController:navigationController animated:animated completion:complete];
    return controller;
}


+ (void)dismissViewModelAnimated:(BOOL)animated completion:(void (^)())complete{
    
    [[self visibleViewController] dismissViewControllerAnimated:animated completion:complete];;
}


+ (UIViewController *)resetRootViewModel:(MVViewModel *)viewModel{
    
    if ([viewModel isKindOfClass:[MVTabBarViewModel class]]) {
        
        MVTabBarViewModel *tabBarViewModel = (MVTabBarViewModel *)viewModel;
        MVTabBarViewController *controller = [[MVTabBarViewController alloc] initWithViewModel:tabBarViewModel];
        MVSharedAppDelegate.window.rootViewController = controller;
        return controller;
        
    }else{
        
        UIViewController *controller = [[MVRouter router] viewControllerForViewModel:viewModel];
        MVNavigationController *rootViewController = [[MVNavigationController alloc] initWithRootViewController:controller];
        MVSharedAppDelegate.window.rootViewController = rootViewController;
        return controller;
    }
}

#pragma mark - Private Methods

+ (UIViewController *)visibleViewController:(UIViewController *)parentViewController{
    
    UIViewController *visibleViewController = nil;
    
    if ([parentViewController isKindOfClass:[UINavigationController class]]) {
        
        UINavigationController *nvc = (UINavigationController *)parentViewController;
        visibleViewController = [self visibleViewController:nvc.visibleViewController];
        
    }else if ([parentViewController isKindOfClass:[MVTabBarViewController class]]) {
        
        MVTabBarViewController *tabBarController = (MVTabBarViewController *)parentViewController;
        visibleViewController = [self visibleViewController:tabBarController.selectedViewController];
        
    }else if (parentViewController.presentedViewController) {
     
        visibleViewController = [self visibleViewController:parentViewController.presentedViewController];
        
    }else {
        
        visibleViewController = parentViewController;
    }
    
    return visibleViewController;
}


@end
