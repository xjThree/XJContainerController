//
//  TestVC1.m
//  WDContainerDemo
//
//  Created by WonderTek on 2018/12/12.
//  Copyright © 2018年 WonderTek. All rights reserved.
//

#import "TestVC1.h"
#import "UIViewController+WDContainer.h"

@interface TestVC1 ()

@end

@implementation TestVC1

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"-viewWillAppear-");
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"-viewDidAppear-");
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"-viewWillDisappear-");
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"-viewDidDisappear-");
}

//- (void)loadView{
//    [super loadView];
//    NSLog(@"-loadView-");
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"-viewDidLoad-");
    UIView *view = [UIView new];
    self.title = @"我是testVC1";
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(0, 0, 200, 50);
    [self.view addSubview:view];
    self.view.backgroundColor = [UIColor greenColor];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
