//
//  TestVC3.m
//  XJContainerDemo
//
//  Created by xjThree on 2018/12/12.
//  Copyright © 2018年 xjThree. All rights reserved.
//

#import "TestVC3.h"
#import "UIViewController+XJContainer.h"
#import <Masonry/Masonry.h>
#import "UIResponder+Event.h"

@interface TestVC3 ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation TestVC3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    // Do any additional setup after loading the view.
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma mark Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"section = %ld row = %ld",indexPath.section,indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self routerEvent:@"helloRuntime" info:@{@"name":@"hello"}];
    [self.navigationController popViewControllerAnimated:YES];
    
//    UIView *showView = [[UIView alloc] initWithFrame:CGRectMake(0, 280, self.view.frame.size.width, 20)];
//    showView.backgroundColor = [UIColor grayColor];
    UIViewController *vc = [[UIViewController alloc] init];
//    [vc.view addSubview:showView];
    vc.view.backgroundColor = [UIColor redColor];
    [self wdShowMorePageWithTarget:vc showHeight:0];
//    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc
{
    NSLog(@"我释放了！！！");
}

//- (void)viewDidLayoutSubviews{
//    [super viewDidLayoutSubviews];
//    self.tableView.bounds = self.view.bounds;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
