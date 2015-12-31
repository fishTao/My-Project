//
//  gongnengViewController.m
//  微健身
//
//  Created by qingyun on 15/12/14.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "meituViewController.h"

@interface meituViewController ()<UIScrollViewDelegate>

@end

@implementation meituViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(click2:)];
    self.navigationItem.leftBarButtonItem = btn;
    
    
  
     

    //创建一个ScrollView
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 375, 675)];
    [self.view addSubview:scrollView];
    
    //设置contentsize
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * 2, 0);
    //分页
    scrollView.pagingEnabled = YES;
    //设置代理
    scrollView.delegate = self;
    
    //设置背景
    scrollView.backgroundColor = [UIColor blackColor];
    
    for (int i = 0;i < 2; i++ ) {
        UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(375 * i,0, 375, 667 )];
        [scrollView addSubview:scroll];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
        
        [scroll addSubview:imageView];
        
        //设置scroll的图片
        NSString *imageName = [NSString stringWithFormat:@"11_%d.jpg",i + 1];
        imageView.image = [UIImage imageNamed:imageName];
        
    }

    
}
-(void)click2:(UIBarButtonItem *)sender{
    [self.navigationController popViewControllerAnimated:YES];

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
