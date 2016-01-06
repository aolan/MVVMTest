//
//  TTUserCenter.m
//  MVVMTest
//
//  Created by lawn on 16/1/6.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import "TTUserCenter.h"

static NSString *const kTTUserCenter_Username_Key = @"kTTUserCenter_Username_Key";
static NSString *const kTTUserCenter_Mobile_Key = @"kTTUserCenter_Mobile_Key";
static NSString *const kTTUserCenter_Token_Key = @"kTTUserCenter_Token_Key";
static TTUserCenter *shareInstance = nil;


@implementation TTUserCenter

#pragma mark - Share Instance Methods

+ (instancetype)center{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[[self class] alloc] init];
        [shareInstance listenPropertiesAction];
    });
    return shareInstance;
}

#pragma mark - Lifycycle Methods

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    
    @synchronized(self) {
        if (shareInstance == nil) {
            shareInstance = [super allocWithZone:zone];
            return shareInstance;
        }
    }
    return nil;
}

#pragma mark - Private Methods

- (void)listenPropertiesAction{
    
    [RACObserve(self, username) subscribeNext:^(NSString *username) {
        [[NSUserDefaults standardUserDefaults] setObject:username forKey:kTTUserCenter_Username_Key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }];
    
    [RACObserve(self, mobile) subscribeNext:^(NSString *mobile) {
        [[NSUserDefaults standardUserDefaults] setObject:mobile forKey:kTTUserCenter_Mobile_Key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }];
    
    [RACObserve(self, token) subscribeNext:^(NSString *token) {
        [[NSUserDefaults standardUserDefaults] setObject:token forKey:kTTUserCenter_Token_Key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }];
    
    [[self rac_signalForSelector:@selector(isLogined)] subscribeNext:^(RACTuple *tuple) {
        if (![tuple.first boolValue]) {
            TTLoginViewModel *loginViewModel = [[TTLoginViewModel alloc] initWithTitle:@"登录" parameter:nil];
            [MVPageDispatchService presentViewModel:loginViewModel animated:YES completion:NULL];
        }
    }];
}

#pragma mark - Property Methods

- (NSString *)username{
    return [[NSUserDefaults standardUserDefaults] stringForKey:kTTUserCenter_Username_Key];
}

- (NSString *)mobile{
    return [[NSUserDefaults standardUserDefaults] stringForKey:kTTUserCenter_Mobile_Key];
}

- (NSString *)token{
    return [[NSUserDefaults standardUserDefaults] stringForKey:kTTUserCenter_Token_Key];
}

- (BOOL)isLogined{
    return (self.token && self.token.length > 0);
}

@end
