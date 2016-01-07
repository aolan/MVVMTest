//
//  TTLoginViewController.m
//  MVVMTest
//
//  Created by lawn on 16/1/5.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import "TTLoginViewController.h"

@interface TTLoginViewController()

@property (nonatomic, strong) UITextField *usernameTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong, readonly) TTLoginViewModel *viewModel;

@end


@implementation TTLoginViewController

@dynamic viewModel;

#pragma mark - Lifycycle Methods

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self.view addSubview:self.usernameTextField];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.loginButton];
    [self.view setNeedsUpdateConstraints];
    
    [self mv_addLeftBarButtonWithTarget:self action:@selector(dismissAction) title:@"取消" needsClear:YES];
}

#pragma mark - Override Methods

- (void)bindViewModel{
    
    [super bindViewModel];
 
    RAC(self.viewModel, username) = self.usernameTextField.rac_textSignal;
    RAC(self.viewModel, password) = self.passwordTextField.rac_textSignal;
    RAC(self.loginButton, enabled) = self.viewModel.validLoginSignal;

    @weakify(self)
    [[self.loginButton
      rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id x) {
         @strongify(self)
         [self.viewModel.loginCommand execute:nil];
     }];
    
    [[self rac_signalForSelector:@selector(viewWillDisappear:)] subscribeNext:^(RACTuple *tuple) {
        [self.view endEditing: YES];
    }];
}

- (void)updateViewConstraints{
    
    [super updateViewConstraints];
    
    [_usernameTextField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.view.mas_leading).offset(20.0f);
        make.trailing.mas_equalTo(self.view.mas_trailing).offset(-20.0f);
        make.top.mas_equalTo(self.view.mas_top).offset(20.0f);
        make.height.mas_equalTo(50.0f);
    }];
    
    [_passwordTextField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.view.mas_leading).offset(20.0f);
        make.trailing.mas_equalTo(self.view.mas_trailing).offset(-20.0f);
        make.top.mas_equalTo(self.usernameTextField.mas_bottom).offset(20.0f);
        make.height.mas_equalTo(50.0f);
    }];
    
    [_loginButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.view.mas_leading).offset(20.0f);
        make.trailing.mas_equalTo(self.view.mas_trailing).offset(-20.0f);
        make.top.mas_equalTo(self.passwordTextField.mas_bottom).offset(20.0f);
        make.height.mas_equalTo(50.0f);
    }];
}

#pragma mark - Private Methods

- (void)dismissAction{
    
    [MVPageDispatchService dismissViewModelAnimated:YES completion:NULL];
}

#pragma mark - Property Methods

- (UITextField *)usernameTextField{
    
    if (_usernameTextField == nil) {
        _usernameTextField = [[UITextField alloc] init];
        _usernameTextField.placeholder = @"请输入用户名";
        _usernameTextField.backgroundColor = [UIColor lightGrayColor];
    }
    return _usernameTextField;
}

- (UITextField *)passwordTextField{
    
    if (_passwordTextField == nil) {
        _passwordTextField = [[UITextField alloc] init];
        _passwordTextField.placeholder = @"请输入密码";
        _passwordTextField.backgroundColor = [UIColor lightGrayColor];
    }
    return _passwordTextField;
}

- (UIButton *)loginButton{
    
    if (_loginButton == nil) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButton setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forState:UIControlStateNormal];
        [_loginButton setBackgroundImage:[UIImage imageWithColor:[UIColor grayColor]] forState:UIControlStateDisabled];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    }
    return _loginButton;
}

@end
