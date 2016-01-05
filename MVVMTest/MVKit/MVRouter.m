//
//  MVRouter.m
//  MVVMTest
//
//  Created by lawn on 16/1/4.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import "MVRouter.h"

@implementation MVRouter

#pragma mark - Interface Methods

+ (instancetype)router{
    
    static MVRouter *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[self alloc] init];
    });
    return shareInstance;
}

- (MVViewController *)viewControllerForViewModel:(MVViewModel *)viewModel{
    
    NSString *viewModelString = NSStringFromClass(viewModel.class);
    NSString *viewControllerString = [viewModelString stringByReplacingOccurrencesOfString:@"Model" withString:@"Controller"];
    
    NSString *errorMsg = @"\n\n====================error====================\n1.您还没有创建viewModel对应的viewController;\n2.创建的viewController没有继承自MVViewController.\n=============================================\n\n";
    
    NSAssert([NSClassFromString(viewControllerString) isSubclassOfClass:[MVViewController class]], errorMsg);
    NSAssert([NSClassFromString(viewControllerString) instancesRespondToSelector:@selector(initWithViewModel:)], errorMsg);
    
    return [[NSClassFromString(viewControllerString) alloc] initWithViewModel:viewModel];
}

@end
