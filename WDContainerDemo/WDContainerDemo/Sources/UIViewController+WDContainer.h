//
//  UIViewController+WDContainer.h
//  WDContainerDemo
//
//  Created by WonderTek on 2018/12/12.
//  Copyright © 2018年 WonderTek. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (WDContainer)

@property (nonatomic,strong,nullable) id wdMarginTop;
@property (nonatomic,strong,nullable) id wdMarginBottom;
@property (nonatomic,strong,nullable) id wdMarginMain;
@property (nonatomic,strong,nullable) id wdMarginMore;

@property (nonatomic,assign) CGFloat wdBottomHeight;
@property (nonatomic,assign) CGFloat wdTopHeight;

- (void)wdShowMorePageWithTarget:(id)targetPage showHeight:(CGFloat)showHeight;

@end


NS_ASSUME_NONNULL_END
