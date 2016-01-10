//
//  zijihuaViewController.m
//  微健身
//
//  Created by qingyun on 16/1/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "zijihuaViewController.h"
#import "DataModels.h"
@interface zijihuaViewController ()<UIScrollViewDelegate>

@end

@implementation zijihuaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    //设置导航栏为不透明
    self.navigationController.navigationBar.translucent = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    int count = 9;
    UIScrollView *scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(50, 50, 275, 185)];
    
      [self.view addSubview:scrollview];
    //设置contentsize
    scrollview.contentSize = CGSizeMake(275 * count, 185);
    //设置分页
    scrollview.pagingEnabled = YES;
    //设置代理
    scrollview.delegate = self;
   scrollview.backgroundColor = [UIColor brownColor];

    
    for (int i = 0;i < count; i++ ) {
        UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(275 * i,0, 275, 185 )];
        
        [scrollview addSubview:scroll];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 275, 185)];
        [scroll addSubview:imageView];
        
        //设置scroll的图片
  
        NSString *imageName = [NSString stringWithFormat:@"11_%d.jpg",i + 1];
        imageView.image = [UIImage imageNamed:imageName];
        
        
      

    }
    
    
                                
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 130, 30, 30)];
    [btn1 setImage:[UIImage imageNamed:@"左"] forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"左高亮"] forState:UIControlStateHighlighted];
    [self.view addSubview:btn1];
    
    
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(335, 130, 30, 30)];
    [btn2 setImage:[UIImage imageNamed:@"右"] forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"右高亮"] forState:UIControlStateHighlighted];
    [self.view addSubview:btn2];

    
    UILabel *lab1 = [[UILabel alloc] initWithFrame:CGRectMake(11, 285, 85, 21)];
    UILabel *lab2 = [[UILabel alloc] initWithFrame:CGRectMake(11, 325, 85, 21)];
    UILabel *lab3 = [[UILabel alloc] initWithFrame:CGRectMake(11, 380, 85, 21)];
    
    lab1.text = @"健身部位";
    lab2.text = @"适应器材";
    lab3.text = @"锻炼方法";
    
    [self.view addSubview:lab1];
    [self.view addSubview:lab2];
    [self.view addSubview:lab3];
    
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}



//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [self.view endEditing:YES];
//}
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
