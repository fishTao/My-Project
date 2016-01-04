//
//  ViewController.m
//  微健身
//
//  Created by qingyun on 15/11/24.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "DataModels.h"
#import "CartoonViewController.h"
#import "jihuaViewController.h"
#import "jiluViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;


@property(nonatomic ,strong) NSArray *datas;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self addScrollView];
    [self page];

    // Do any additional setup after loading the view, typically from a nib.
}
//懒加载，添加数据。
-(NSArray *)datas
{
    if (_datas ==nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"123" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            DataModels *image = [DataModels datasWithDictionary:dict];
            [models addObject:image];
        }
        _datas = models;

    }
    return _datas;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    CartoonViewController *vc = segue.destinationViewController;
    vc.arr= [NSArray arrayWithArray:self.datas];
    
}
#pragma mark   ---------计划---------
// 计划。
//初始化storyboard（Main），找到要用的storyboard的ID，用新建的类调用找到的storyboard的ID
- (IBAction)jihua:(UIButton *)sender {
    jihuaViewController *jihuaView = [[jihuaViewController alloc] init];
    UINavigationController *navig = [[UINavigationController alloc] initWithRootViewController:jihuaView];
    [self presentViewController:navig animated:YES completion:^{
    }];
    
}

#pragma mark  ----------记录-----------
- (IBAction)jilu:(UIButton *)sender {
    jiluViewController *jiluView = [[jiluViewController alloc]init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:jiluView];
    [self presentViewController:navi animated:YES completion:^{
    }];
}



#pragma mark  --------右上角弹出弹窗--------
- (IBAction)set:(UIBarButtonItem *)sender {
    //创建右上角退出弹窗
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"是否退出 ? " delegate:self cancelButtonTitle:@"再看看" otherButtonTitles:@"退出", nil];
    //设置弹窗的风格
    alertView.alertViewStyle = UIAlertViewStyleDefault ;
    //弹出alertView
    [alertView show];
}

#pragma mark  --------设置咨询弹窗--------
//设置登录咨询弹窗
- (IBAction)login:(UIButton *)sender {
    //创建alertController
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"请登录" preferredStyle:UIAlertControllerStyleAlert];
    
    //创建action
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        NSLog(@"取消");
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"前往" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        
        NSLog(@"前往，登陆");
    }];
    
    //添加
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    //显示alertController
    [self presentViewController:alertController animated:YES completion:^{
    
    }];

}
#pragma mark    ---------添加SclollView----------

//添加用于滚动的scrollView
-(void)addScrollView{
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 63, 375, 160)];
    [self.view addSubview:scrollView];
    
    //设置contentsize
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * 2, 160);
    //分页
    scrollView.pagingEnabled = YES;
    //设置代理
    scrollView.delegate = self;
      
    //设置背景
    scrollView.backgroundColor = [UIColor blackColor];
    
    for (int i = 0;i < 2; i++ ) {
        UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(375 * i,0, 370, 160 )];
        [scrollView addSubview:scroll];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 370, 150)];
        [scroll addSubview:imageView];
        
    //设置scroll的图片
        NSString *imageName = [NSString stringWithFormat:@"11_%d.jpg",i + 1];
        imageView.image = [UIImage imageNamed:imageName];
        
    }
}
#pragma mark   ---添加PageControl---
-(void)page {
    UIPageControl *page = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 190, 375, 37)];
    //page.backgroundColor = [UIColor brownColor];
    page.numberOfPages = 2;
    page.currentPageIndicatorTintColor = [UIColor grayColor];
    page.pageIndicatorTintColor = [UIColor blackColor];
    [self.view addSubview:page];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
