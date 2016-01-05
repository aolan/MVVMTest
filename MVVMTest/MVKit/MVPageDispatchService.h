//
//  MVPageDispatchService.h
//  MVVMTest
//
//  Created by lawn on 16/1/5.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MVPageDispatchService : NSObject

/**
 *  Return modal view controller if it exists. Otherwise the top view controller.
 *  In a word, this function will return visiable view controller.
 *
 *  @return visiable controller
 */
+ (UIViewController *)visibleViewController;

/**
 *  Pushes the corresponding view controller.
 *
 *  Uses a horizontal slide transition.
 *  Has no effect if the corresponding view controller is already in the stack.
 *
 *  @param viewModel - the view model
 *  @param animated  - use animation or not
 *
 *  @return The corresponding view controller.
 */
+ (UIViewController *)pushViewModel:(MVViewModel *)viewModel animated:(BOOL)animated;


/**
 *  Pops the top view controller in current view controller stack.
 *
 *  @param animated - use animation or not
 *
 *  @return The popped controller.
 */
+ (UIViewController *)popViewModelAnimated:(BOOL)animated;


/**
 *  Pops until there's only a single view controller left on the stack.
 *
 *  @param animated - use animation or not
 *
 *  @return The popped controller.
 */
+ (UIViewController *)popToRootViewModelAnimated:(BOOL)animated;


/**
 *  Presents the corresponding view controller.
 *
 *  @param viewModel - the view model
 *  @param animated  - use animation or not
 *  @param complete  - The completion handler, if provided, will be invoked after the presented controllers viewDidAppear: callback is invoked.
 *
 *  @return The corresponding view controller.
 */
+ (UIViewController *)presentViewModel:(MVViewModel *)viewModel animated:(BOOL)animated completion:(void (^)())complete;


/**
 *  Dissmisses the visiable view controller.
 *
 *  @param animated - use animation or not
 *  @param complete - The completion handler, if provided, will be invoked after the dismissed controller's viewDidDisappear: callback is invoked.
 */
+ (void)dismissViewModelAnimated:(BOOL)animated completion:(void (^)())complete;


/**
 *  Resets the corresponding view controller as the root view controller of the application's window.
 *
 *  @param viewModel - the view model
 *
 *  @return The corresponding view controller.
 */
+ (UIViewController *)resetRootViewModel:(MVViewModel *)viewModel;


@end
