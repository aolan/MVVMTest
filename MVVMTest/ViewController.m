//
//  ViewController.m
//  MVVMTest
//
//  Created by lawn on 16/1/4.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, copy  ) NSString *name;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) RACSignal *validNameSignal;
@property (nonatomic, strong) UILabel *inputLabel;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.textField];
    [self.view addSubview:self.inputLabel];
    
    RAC(self, name) = self.textField.rac_textSignal;
    RAC(self.inputLabel, text) = [RACObserve(self, name) map:^(NSString *name) {
        return name;
    }];
}


- (UITextField *)textField{
    
    if (_textField == nil) {
        _textField = [[UITextField alloc] init];
        _textField.frame = CGRectMake(10, 64, self.view.bounds.size.width-20, 44);
        _textField.placeholder = @"请输入用户名";
        _textField.backgroundColor = [UIColor grayColor];
    }
    return _textField;
}

- (UILabel *)inputLabel{
    
    if (_inputLabel == nil) {
        _inputLabel = [[UILabel alloc] init];
        _inputLabel.frame = CGRectMake(10, 150, self.view.bounds.size.width-20, 44);
        _inputLabel.backgroundColor = [UIColor grayColor];
    }
    return _inputLabel;
}

@end
