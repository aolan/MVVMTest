//
//  TTLoginViewController.m
//  MVVMTest
//
//  Created by lawn on 16/1/5.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import "TTLoginViewController.h"

@implementation TTLoginViewController


- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self mv_addLeftBarButtonWithTarget:self action:@selector(dismissAction) title:@"取消" needsClear:YES];
}

- (void)dismissAction{
    
    [MVPageDispatchService dismissViewModelAnimated:YES completion:NULL];
}

@end
