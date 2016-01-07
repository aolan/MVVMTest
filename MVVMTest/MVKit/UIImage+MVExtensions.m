//
//  UIImage+MVExtensions.m
//  MVVMTest
//
//  Created by lawn on 16/1/7.
//  Copyright © 2016年 lawn. All rights reserved.
//

#import "UIImage+MVExtensions.h"

@implementation UIImage (MVExtensions)

+ (UIImage *)imageWithColor:(UIColor *)color{
    
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
