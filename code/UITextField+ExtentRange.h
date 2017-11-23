//
//  UITextField+ExtentRange.h
//  Imora
//
//  Created by blithe.pan on 2017/8/17.
//  Copyright © 2017年 Oradt. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <UIKit/UIKit.h>
@interface UITextField(ExtentRange)
//获取焦点的位置
-(NSRange)selectedRange;
//设置焦点的位置
-(void)setSelectedRange:(NSRange)range;
@end
