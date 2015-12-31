//
//  jihuaViewController.m
//  微健身
//
//  Created by qingyun on 15/12/14.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "jihuaViewController.h"

@interface jihuaViewController ()

@end

@implementation jihuaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景色
    self.view.backgroundColor = [UIColor whiteColor];
    //添加按钮
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(click:)];
    self.navigationItem.leftBarButtonItem = btn;
    self.navigationItem.title = @"计划";
    

    
    


    
    // Do any additional setup after loading the view.
}
//给按钮添加一个返回的方法
- (void)click:(UIBarButtonItem *)sender{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
