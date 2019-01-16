//
//  ViewController.m
//  WDContainerDemo
//
//  Created by WonderTek on 2018/12/12.
//  Copyright © 2018年 WonderTek. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+WDContainer.h"
#import <objc/runtime.h>
#import "TestVC1.h"
#import "TestVC2.h"
#import "TestVC3.h"
#import "UIResponder+Event.h"
#import "SecondViewController.h"
//#import <mas>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation ViewController

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

- (void)loadView{
    [super loadView];
    NSLog(@"-loadView-");
}

- (void)viewDidLayoutSubviews{
    NSLog(@"bottom == %f",self.view.safeAreaInsets.bottom);
    NSLog(@"top == %f",self.view.safeAreaInsets.top);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"-viewDidLoad-");
    NSString *str = @"helloworld";
    NSString *copyStr = [str copy];
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    NSLog(@"status == %f",rectStatus.size.height);
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view, typically from a nib.
}


-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma mark -Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    id top,main,bottom;
    switch (indexPath.row) {
        case 0:
        {
            top = [TestVC1 new];
            bottom = [TestVC2 new];
            main = [TestVC3 new];
        }
            break;
        case 1:
        {
            top = [TestVC3 new];
            main = [TestVC1 new];
            bottom = [TestVC2 new];
        }
            break;
        case 2:
        {
            top = nil;
            bottom = nil;
            main = [TestVC3 new];
        }
            break;
        case 3:
        {
            top = nil;
            bottom = [TestVC2 new];
            main = nil;
        }
            break;
        case 4:
        {
            bottom = nil;
            top = [TestVC3 new];
            main = [TestVC2 new];
        }
            break;
        case 5:
        {
            main = nil;
            top = [TestVC3 new];
            bottom = [TestVC2 new];
        }
            break;
        case 6:
        {
            
        }
           break;
        case 7:
        {
            
        }
            break;
        case 8:
        {
            
        }
            break;
        default:
            break;
    }
    
    UIViewController *containVC = [SecondViewController new];
    
    
    
    [containVC registerEvent:@"helloRuntime" block:^(id  _Nullable info) {
        NSLog(@"老子处理了");
    } next:YES];
    
    containVC.view.backgroundColor = [UIColor whiteColor];
    
    containVC.wdBottomHeight = 100;
    containVC.wdTopHeight = 88;
    containVC.wdMarginTop = top;
    containVC.wdMarginBottom = bottom;
    containVC.wdMarginMain = main;
    [containVC wdShowFromStatusBar:YES];
    
    self.navigationController.navigationBar.hidden = YES;
    
    [self.navigationController pushViewController:containVC animated:YES];
    
}

@end
