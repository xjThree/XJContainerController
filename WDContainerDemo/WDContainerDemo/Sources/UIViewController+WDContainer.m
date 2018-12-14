//
//  UIViewController+WDContainer.m
//  WDContainerDemo
//
//  Created by WonderTek on 2018/12/12.
//  Copyright © 2018年 WonderTek. All rights reserved.
//

#import "UIViewController+WDContainer.h"
#import <objc/Runtime.h>

// 判断是否是ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

// 判断iPhoneX
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPHoneXR
#define IS_IPHONE_XR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhoneXS
#define IS_IPHONE_XS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhoneXS MAX
#define IS_IPHONE_XSMAX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhone X系列(X,XR,XS,XS MAX)
#define IS_IPHONE_Xseries (IS_IPHONE_X == YES || IS_IPHONE_XR == YES || IS_IPHONE_XS == YES || IS_IPHONE_XSMAX == YES)?YES:NO
//iPhone X系列适配底部
#define SafeBottomHeight  (IS_IPHONE_Xseries == YES) ? 34 : 0
//iPhone X系列导航栏
#define SafeNavigationHeight  (IS_IPHONE_Xseries == YES) ? 88 : 64
#define SafeStatusHeight      (IS_IPHONE_Xseries == YES) ? 44 : 0

@implementation UIViewController (WDContainer)

static NSString *marginTopKey = @"marginTopKey";
static NSString *marginBottomKey = @"marginBottomKey";
static NSString *marginMainKey = @"marginMainKey";
static NSString *marginMoreKey = @"marginMoreKey";
static NSString *topHeightKey = @"topHeightKey";
static NSString *bottomHeightKey = @"bottomHeightKey";
static NSString *showMoreHeightKey = @"showMoreHeightKey";


- (void)layoutSubView{
    UIViewController *containVC = nil;

    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 200)];
    bottomView.backgroundColor = [UIColor redColor];
    bottomView.center = self.view.center;
    
    containVC = [UIViewController new];
    containVC.marginBottom = bottomView;
    
}

- (void)setMarginTop:(id)marginTop{
    objc_setAssociatedObject(self, &marginTopKey, marginTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.marginTop) {
//        [self addChildViewController:self.marginTop];
        UIView *showTopView = [self getShowView:self.marginTop];
        showTopView.frame = CGRectMake(0, SafeStatusHeight, self.view.frame.size.width, self.topHeight);
        [self.view addSubview:showTopView];
    }
}

-(id)marginTop{
    return objc_getAssociatedObject(self, &marginTopKey);
}

- (void)setMarginMain:(id)marginMain{
    objc_setAssociatedObject(self, &marginMainKey, marginMain, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.marginMain) {
        UIView *showMainView = [self getShowView:marginMain];
        showMainView.frame = CGRectMake(0, (self.marginTop?self.topHeight:0)+(SafeStatusHeight), self.view.frame.size.width, self.view.frame.size.height-(self.marginTop?self.topHeight:0)-(self.marginBottom?self.bottomHeight:0)-(SafeStatusHeight)-(SafeBottomHeight));
        [self.view addSubview:showMainView];
    }
}

-(id)marginMain{
    return objc_getAssociatedObject(self, &marginMainKey);
}

- (void)setMarginBottom:(id)marginBottom{
    objc_setAssociatedObject(self, &marginBottomKey, marginBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.marginBottom) {
       UIView *showBottomView = [self getShowView:self.marginBottom];
        NSLog(@"%f",self.view.frame.size.height);
        showBottomView.frame = CGRectMake(0, self.view.frame.size.height-self.bottomHeight-(SafeBottomHeight), self.view.frame.size.width, self.bottomHeight);
//        [self addChildViewController:(UIViewController *)self.marginBottom];
        UIView *safeBottomView = [UIView new];
        safeBottomView.frame = CGRectMake(0, showBottomView.frame.origin.y+showBottomView.frame.size.height, self.view.frame.size.width, SafeBottomHeight);
        safeBottomView.backgroundColor = showBottomView.backgroundColor;
        safeBottomView.tag = 1000;
        [self.view addSubview:showBottomView];
        [self.view addSubview:safeBottomView];
    }
}

-(id)marginBottom{
    return objc_getAssociatedObject(self, &marginBottomKey);
}

-(void)setMarginMore:(id)marginMore{
    objc_setAssociatedObject(self, &marginMoreKey, marginMore, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    NSLog(@"self.marginMore == %@",self.marginMore);
}

-(id)marginMore{
    return objc_getAssociatedObject(self, &marginMoreKey);
}

- (void)setTopHeight:(CGFloat)topHeight{
    objc_setAssociatedObject(self, &topHeightKey, @(topHeight), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)topHeight{
    NSNumber *topHeight = objc_getAssociatedObject(self, &topHeightKey);
    return [topHeight floatValue];
}

- (void)setBottomHeight:(CGFloat)bottomHeight{
    objc_setAssociatedObject(self, &bottomHeightKey, @(bottomHeight), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)bottomHeight{
    NSNumber *bottomH = objc_getAssociatedObject(self, &bottomHeightKey);
    return [bottomH floatValue];
}

- (void)setShowMoreToMaxHeight:(CGFloat)showMoreToMaxHeight{
    objc_setAssociatedObject(self, &showMoreHeightKey, @(showMoreToMaxHeight), OBJC_ASSOCIATION_ASSIGN);
    
}

- (CGFloat)showMoreToMaxHeight{
    NSNumber *showMoreH = objc_getAssociatedObject(self, &showMoreHeightKey);
    return [showMoreH floatValue];
}

- (UIView *)getShowView:(id)marginView{
    if ([marginView isKindOfClass:[UIView class]]) {
        return marginView;
    }
    if ([marginView isKindOfClass:[UIViewController class]]) {
        UIViewController *bottomVC = marginView;
        return bottomVC.view;
    }
    return nil;
}

- (void)WDShowMorePageWithTarget:(id)targetPage showHeight:(CGFloat)showHeight{
    if (self.marginMore) {
        UIView *nowMarginMoreView = [self getShowView:self.marginMore];
        [nowMarginMoreView removeFromSuperview];
    }
        UIView *presentView = [self getShowView:targetPage];
        self.marginMore = [UIView new];
        self.marginMore = targetPage;
        CGRect frame = presentView.frame ;
        frame.origin.y = [UIScreen mainScreen].bounds.size.height;
        presentView.frame = frame;
        NSLog(@"%f",self.view.frame.size.height);
        [[UIApplication sharedApplication].keyWindow addSubview:presentView];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"dismissIcon"] forState:UIControlStateNormal];
        btn.frame = CGRectMake(self.view.frame.size.width-30, 10, 20, 20);
        [btn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [presentView addSubview:btn];
    
        CGFloat presentH = [self getFatherTopViewHeight];
        NSLog(@"presentH === %f",presentH);
    
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = presentView.frame;
            frame.origin.y = (showHeight>0)?([UIScreen mainScreen].bounds.size.height - showHeight):presentH;
            frame.size.height = (showHeight>0)?showHeight:([UIScreen mainScreen].bounds.size.height - presentH);
            presentView.frame = frame;
            NSLog(@"presentViewH === %f",presentView.frame.size.height);
        }];
}

- (void)dismiss{
    NSLog(@"self.marginMore == %@",self.marginMore);
    if (self.marginMore) {
        UIView *view = [self getShowView:self.marginMore];
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = view.frame;
            frame.origin.y = [UIScreen mainScreen].bounds.size.height;
            view.frame = frame;
        } completion:^(BOOL finished) {
            self.marginMore = nil;
        }];
    }
}

- (CGFloat)getFatherTopViewHeight{
    UIResponder *responder = [self nextResponder];
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            UIViewController *fatherVC = (UIViewController *)responder;
            if (fatherVC.marginTop) {
                return [self getShowView:fatherVC.marginTop].frame.size.height+(SafeStatusHeight);
            }
            if (fatherVC.marginMain) {
                return [self getShowView:self.marginMain].frame.origin.y+(SafeStatusHeight);
            }
            if (fatherVC.marginBottom) {
                return SafeStatusHeight;
            }
        }
        responder = [responder nextResponder];
    }
    return 0;
}


@end
