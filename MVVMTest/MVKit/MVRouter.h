//
//  MVRouter.h
//  MVVMTest
//
//  Created by lawn on 16/1/4.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MVRouter : NSObject

/**
 *  Retrieves the shared router instance.
 *
 *  @return shared router instance.
 */
+ (instancetype)router;


/**
 *  Retrieves the view corresponding to the given view model.
 *
 *  @param viewModel - The view model.
 *
 *  @return Returns the view corresponding to the given view model.
 */
- (MVViewController *)viewControllerForViewModel:(MVViewModel *)viewModel;

@end
