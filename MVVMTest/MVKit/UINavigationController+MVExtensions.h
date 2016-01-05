//
//  UINavigationController+MVExtensions.h
//  MVVMTest
//
//  Created by lawn on 16/1/4.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (MVExtensions)

- (void)pushViewModel:(MVViewModel *)viewModel animated:(BOOL)animated;


@end
