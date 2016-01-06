//
//  MVTabBarViewModel.h
//  MVVMTest
//
//  Created by lawn on 16/1/5.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import "MVViewModel.h"

@interface MVTabBarViewModel : MVViewModel

@property (nonatomic, strong, readonly) NSArray *titles;
@property (nonatomic, strong, readonly) NSArray *viewModels;
@property (nonatomic, strong, readonly) NSArray *tabBarNormalImages;
@property (nonatomic, strong, readonly) NSArray *tabBarSelectedImages;
@property (nonatomic, strong, readonly) UIImage *tabBarNormalBackgroundImage;
@property (nonatomic, strong, readonly) UIImage *tabBarSelectedBackgroundImage;

@end
