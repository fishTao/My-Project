//
//  AddViewController.m
//  微健身
//
//  Created by qingyun on 15/12/23.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景色
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    img.image = [UIImage imageNamed:@"背景1"];
    img.alpha = 0.8;
    [self.view addSubview:img];
    
    //设置导航栏
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(clickBack:)];
    
    UIBarButtonItem *btn2 = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:(UIBarButtonItemStyleDone) target:self action:@selector(clickSave:)];
    self.navigationItem.leftBarButtonItem = btn;
    self.navigationItem.rightBarButtonItem = btn2;
   
    self.navigationItem.title = @"请在下面添加记录";
    
//    //设置提示的lable
//    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, 375, 60)];
//    [lab setText:@"请在下面添加记录"];
//    //设置居中
//    lab.textAlignment = NSTextAlignmentCenter;
//    lab.textColor = [UIColor redColor];
//
//    [self.view addSubview:lab];
    
    
    //创建一个textfield 来添加记录。
    UITextView *textview = [[UITextView alloc] initWithFrame:CGRectMake(40, 200, 295, 200)];
    textview.backgroundColor = [UIColor groupTableViewBackgroundColor];
    textview.font = [UIFont systemFontOfSize:22];
    textview.textColor = [UIColor blackColor];
    textview.alpha = 0.8;

 
    [self.view addSubview:textview];
    
    
    // Do any additional setup after loading the view.
}
//返回
-(void)clickBack:(UIBarButtonItem *)sender{
    
    [self dismissViewControllerAnimated:YES completion:^{
    

    }];
}
//保存记录
-(void)clickSave:(UIBarButtonItem *)sender{
    
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
