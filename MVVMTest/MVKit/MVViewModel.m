//
//  MVViewModel.m
//  MVVMTest
//
//  Created by lawn on 16/1/4.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import "MVViewModel.h"

@interface MVViewModel()

@property (nonatomic, strong, readwrite) RACSubject *willDisappearSignal;
@property (nonatomic, strong, readwrite) id parameter;

@end


@implementation MVViewModel

- (instancetype)initWithTitle:(NSString *)title parameter:(id)parameter{
    
    self = [super init];
    if (self) {
        _parameter = parameter;
        _title = title;
    }
    return self;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    
    MVViewModel *viewModel = [super allocWithZone:zone];
    
    @weakify(viewModel)
    [[viewModel
      rac_signalForSelector:@selector(initWithTitle:parameter:)]
    	subscribeNext:^(id x) {
            @strongify(viewModel)
            [viewModel initialize];
        }];
    
    return viewModel;
}

- (void)initialize{
    // Override by subClass
}

@end
