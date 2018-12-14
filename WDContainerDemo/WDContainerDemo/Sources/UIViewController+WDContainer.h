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

@property (nonatomic,strong,nullable) id marginTop;
@property (nonatomic,strong,nullable) id marginBottom;
@property (nonatomic,strong,nullable) id marginMain;
@property (nonatomic,strong,nullable) id marginMore;

@property (nonatomic,assign) CGFloat bottomHeight;
@property (nonatomic,assign) CGFloat topHeight;

- (void)WDShowMorePageWithTarget:(id)targetPage showHeight:(CGFloat)showHeight;

@end


NS_ASSUME_NONNULL_END
