//
//  MVViewController.h
//  MVVMTest
//
//  Created by lawn on 16/1/4.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MVViewController : UIViewController

@property (nonatomic, strong, readonly) MVViewModel *viewModel;
@property (nonatomic, strong, readonly) RACSubject *willDisappearSignal;
@property (nonatomic, strong, readonly) UIPercentDrivenInteractiveTransition *interactivePopTransition;
@property (nonatomic, strong) UIView *snapshot;


- (instancetype)initWithViewModel:(MVViewModel *)viewModel;

- (void)bindViewModel;

@end
