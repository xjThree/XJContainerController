//
//  SecondViewController.m
//  WDContainerDemo
//
//  Created by WonderTek on 2018/12/19.
//  Copyright © 2018年 WonderTek. All rights reserved.
//

#import "SecondViewController.h"
#import "UIResponder+Event.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerEvent:@"helloRuntime" block:^(id  _Nullable info) {
        [self.navigationController popViewControllerAnimated:YES];
    } next:YES];
    // Do any additional setup after loading the view.
}

- (void)dealloc
{
    NSLog(@"SecondViewController我释放了");
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
