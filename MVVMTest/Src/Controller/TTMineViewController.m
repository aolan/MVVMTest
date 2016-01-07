//
//  TTMineViewController.m
//  MVVMTest
//
//  Created by lawn on 16/1/5.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import "TTMineViewController.h"

@interface TTMineViewController ()

@end

@implementation TTMineViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
}

- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    if ([TTUserCenter center].isLogined) {
        
        //code
    }
}

@end
