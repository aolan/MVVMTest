//
//  UIViewController+MVExtensions.h
//  MVVMTest
//
//  Created by lawn on 16/1/6.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (MVExtensions)

- (void)mv_addLeftBarButtonWithTarget:(id)target action:(SEL)action title:(NSString *)title needsClear:(BOOL)needsClear;
- (void)mv_addRightBarButtonWithTarget:(id)target action:(SEL)action title:(NSString *)title needsClear:(BOOL)needsClear;

@end
