//
//  TTHomeViewController.m
//  MVVMTest
//
//  Created by lawn on 16/1/5.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import "TTHomeViewController.h"
#import "TTHomeViewModel.h"

@interface TTHomeViewController()

@property (nonatomic, strong) UIButton *button;

@end

@implementation TTHomeViewController


- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.backgroundColor = [UIColor grayColor];
    [_button setTitle:@"Test" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(goToMinePage) forControlEvents:UIControlEventTouchUpInside];
    _button.frame = CGRectMake(0, 10, self.view.bounds.size.width, 200);
    [self.view addSubview:_button];
}

- (void)goToMinePage{

    TTHomeViewModel *mineModel = [[TTHomeViewModel alloc] initWithTitle:@"个人中心" parameter:nil];
    [MVPageDispatchService pushViewModel:mineModel animated:YES];
}

- (void)bindViewModel{
    
    [super bindViewModel];
    
}

@end
