//
//  UIViewController+MVExtensions.m
//  MVVMTest
//
//  Created by lawn on 16/1/6.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import "UIViewController+MVExtensions.h"

typedef NS_ENUM(NSUInteger, MVNavigationItemType) {
    MVNavigationItemType_Left = 0,
    MVNavigationItemType_Right,
};

@implementation UIViewController (MVExtensions)


#pragma mark - Interface Methods

- (void)mv_addLeftBarButtonWithTarget:(id)target action:(SEL)action title:(NSString *)title needsClear:(BOOL)needsClear{
    
    [self addBarButtonWithType:MVNavigationItemType_Left target:target action:action title:title needsClear:needsClear];
}

- (void)mv_addRightBarButtonWithTarget:(id)target action:(SEL)action title:(NSString *)title needsClear:(BOOL)needsClear{
    
    [self addBarButtonWithType:MVNavigationItemType_Right target:target action:action title:title needsClear:needsClear];
}

#pragma mark - Private Methods

- (void)addBarButtonWithType:(MVNavigationItemType)type target:(id)target action:(SEL)action title:(NSString *)title needsClear:(BOOL)needsClear{
    
    [self handleCurrentNavigationItem:needsClear type:type];
    
    UIBarButtonItem *barButtonItem = [self createBarButtonItemWithTarget:target action:action title:title];

    if (type == MVNavigationItemType_Left) {
        
        NSMutableArray *leftBarButtonItems = [self.navigationItem.leftBarButtonItems mutableCopy];
        [leftBarButtonItems addObject:barButtonItem];
        self.navigationItem.leftBarButtonItems = leftBarButtonItems;
        
    }else{
        
        NSMutableArray *rightBarButtonItems = [self.navigationItem.rightBarButtonItems mutableCopy];
        [rightBarButtonItems addObject:barButtonItem];
        self.navigationItem.rightBarButtonItems = rightBarButtonItems;
    }
}

- (void)handleCurrentNavigationItem:(BOOL)needsClear type:(MVNavigationItemType)type{
    
    if (needsClear) {
        if (type == MVNavigationItemType_Left) {
            self.navigationItem.leftBarButtonItems = @[];
        }else{
            self.navigationItem.rightBarButtonItems = @[];
        }
    }
}

- (UIBarButtonItem *)createBarButtonItemWithTarget:(id)target action:(SEL)action title:(NSString *)title{
    
    CGFloat buttonWH = self.navigationController.navigationBar.frame.size.height;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, buttonWH, buttonWH);
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:MVNaviagtionBarButtonTitleNormalColor forState:UIControlStateNormal];
    [button setTitleColor:MVNaviagtionBarButtonTitleHighlightedColor forState:UIControlStateHighlighted];
    button.titleLabel.font = MVNaviagtionBarButtonFont;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    return barButtonItem;
}

@end
