//
//  UIViewController+XJContainer.h
//  XJContainerDemo
//
//  Created by xjThree on 2018/12/12.
//  Copyright © 2018年 xjThree. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (XJContainer)

/**
 顶部视图
 */
@property (nonatomic,strong,nullable) id wdMarginTop;
/**
 底部视图
 */
@property (nonatomic,strong,nullable) id wdMarginBottom;
/**
 主视图（内容视图）
 */
@property (nonatomic,strong,nullable) id wdMarginMain;
/**
 弹出框视图
 */
@property (nonatomic,strong,nullable) id wdMarginMore;


/**
 底部视图高度
 */
@property (nonatomic,assign) CGFloat wdBottomHeight;
/**
 顶部视图高度
 */
@property (nonatomic,assign) CGFloat wdTopHeight;

- (void)wdShowMorePageWithTarget:(id)targetPage showHeight:(CGFloat)showHeight;

/**
 @param isFromStatus  是否从状态栏开始 （YES：是   NO：否（默认））
 */
-(void)wdShowFromStatusBar:(BOOL)isFromStatus;

@end


NS_ASSUME_NONNULL_END
