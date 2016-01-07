//
//  TTLoginViewModel.h
//  MVVMTest
//
//  Created by lawn on 16/1/5.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import "MVViewModel.h"

@interface TTLoginViewModel : MVViewModel

@property (nonatomic, strong, readonly) RACSignal *validLoginSignal;
@property (nonatomic, strong, readonly) RACCommand *loginCommand;
@property (nonatomic, copy  ) NSString *username;
@property (nonatomic, copy  ) NSString *password;

@end
