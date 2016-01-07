//
//  TTLoginViewModel.m
//  MVVMTest
//
//  Created by lawn on 16/1/5.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import "TTLoginViewModel.h"

@interface TTLoginViewModel()

@property (nonatomic, strong, readwrite) RACSignal *validLoginSignal;
@property (nonatomic, strong, readwrite) RACCommand *loginCommand;

@end

@implementation TTLoginViewModel

- (void)initialize{
    
    [super initialize];
    
    self.validLoginSignal = [[RACSignal
                              combineLatest:@[ RACObserve(self, username), RACObserve(self, password) ]
                              reduce:^(NSString *username, NSString *password) {
                                  return @(username.length > 0 && password.length > 0);
                              }]
                             distinctUntilChanged];

    self.loginCommand = [[RACCommand alloc] initWithSignalBlock:^(id sender) {
        NSLog(@"==========登录按钮被点击");
        [TTUserCenter center].token = @"11";
        [TTUserCenter center].username = self.username;
        [TTUserCenter center].mobile = @"123";
        return [RACSignal empty];
    }];
    
    
   
}


@end
