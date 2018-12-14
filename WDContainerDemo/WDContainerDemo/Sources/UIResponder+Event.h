//
//  UIResponder+Event.h
//  MiGuKit
//
//  Created by zhgz on 2018/3/31.
//  Copyright © 2018年 Migu Video Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MG_EVENT_KEY(name) static NSString *const name = @#name;

typedef void (^EventBlock)(__nullable id info);

@interface UIResponder (Event)

/**
 向 父视图/父控制器 发送事件
 */
- (void)routerEvent:(nonnull NSString *)eventName info:(nullable id)info;


/**
 接受来自 子视图/子控制器 发送过来的事件
 */
- (void)registerEvent:(nonnull NSString *)eventName block:(nullable EventBlock)block next:(BOOL)needNext;

@end
