//
//  zixunViewController.m
//  微健身
//
//  Created by qingyun on 16/1/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "zixunViewController.h"
#import "zixunTableViewCell.h"
#import "faxianViewController.h"
#import "DataModels.h"

@interface zixunViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property (nonatomic ,strong) UIPageControl *page;
@property (nonatomic ,strong) UITableView *myTable;
@property (nonatomic ,strong) NSMutableArray *array;
@end

@implementation zixunViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏为不透明
    self.navigationController.navigationBar.translucent = NO;
    //设置标题栏
    self.title = @"资讯";
    
//    _array = @[@"1234",@"qwer",@"1qw12344",@"wdfgh"];

    
    
#pragma mark  ==========创建TableVi============
    _myTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 667) style:UITableViewStylePlain];
    _myTable.delegate = self;
    _myTable.dataSource = self;
    
    _myTable.rowHeight = 80;

    
    [self.view addSubview:_myTable];
    
    
    UIView *views = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 300)];
    _myTable.tableHeaderView = views;
    
#pragma mark  =========设置scrollerView==========
    UIScrollView *scrollerview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 375, 300)];
    
    [views addSubview:scrollerview];

    //设置contenSize
    scrollerview.contentSize = CGSizeMake(scrollerview.frame.size.width *6 , 300);
    //设置分页
    scrollerview.pagingEnabled = self;
    //设置代理
    scrollerview.delegate = self;
    //取消滚动条
    scrollerview.showsHorizontalScrollIndicator = NO;
    //设置背景色
    scrollerview.backgroundColor = [UIColor brownColor];
    
    
    for (int i = 0;i < 6;i++) {
        UIScrollView *scroll1 = [[UIScrollView alloc]initWithFrame:CGRectMake(375 * i, 0, 375, 300)];
        [scrollerview addSubview:scroll1];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 300)];
        [scroll1 addSubview:imageView];
        //设置scrollView的图片
        NSString *imageName = [NSString stringWithFormat:@"11_%d.jpg",i + 1];
        imageView.image = [UIImage imageNamed:imageName];
        

        
    }
    
    //设置pageController
    _page = [[UIPageControl alloc] initWithFrame:CGRectMake(167, 200, 40, 25)];
    self.page.numberOfPages = 6;

    [views addSubview:_page];
#pragma mark     ========设置scrollerView上面的View以及四个按钮========
    //设置scrollerView上面的按钮。
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 220, 375, 80)];
    view.backgroundColor = [UIColor grayColor];
    //设置View透明度
    view.alpha = 0.8;
    
    [views addSubview:view];

   //1、饮食按钮。
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(30, 230, 60, 60)];
    //设置为圆
    btn1.layer.cornerRadius = 60/2.0;
    btn1.layer.masksToBounds = 60/2.0;
    //设置边框颜色
    btn1.layer.borderColor = [UIColor whiteColor].CGColor;
    //边框宽度
    btn1.layer.borderWidth = 1.5;
    //字体颜色
    [btn1 setTintColor:[UIColor whiteColor]];
    //字体阴影颜色
    [btn1 setTitleShadowColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    [btn1 setTitle:@"饮食" forState:UIControlStateNormal];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"功能"] forState:UIControlStateHighlighted];
//    [btn1 setImage:[UIImage imageNamed:@"功能"]forState:UIControlStateHighlighted];
    //设置跳转
    [btn1 addTarget:self action:@selector(yinshi:) forControlEvents:UIControlEventTouchDown];
    
    [views addSubview:btn1];
    
    //2、问答按钮
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(115, 230, 60, 60)];
    
    btn2.layer.cornerRadius = 60/2.0;
    btn2.layer.masksToBounds = 60/2.0;
    
    btn2.layer.borderColor = [UIColor whiteColor].CGColor;
    btn2.layer.borderWidth = 1.5;
    
    [btn2 setTitle:@"问答" forState:UIControlStateNormal];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"功能"] forState:UIControlStateHighlighted];
//    [btn2 setImage:[UIImage imageNamed:@"功能"]forState:UIControlStateHighlighted];
    [btn2 setTintColor:[UIColor whiteColor]];
    [btn2 setTitleShadowColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    [btn2 addTarget:self action:@selector(wenda:) forControlEvents:UIControlEventTouchDown];
    
    [views addSubview:btn2];
    //3、励志按钮
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(200, 230, 60, 60)];
    
    btn3.layer.cornerRadius = 60/2.0;
    btn3.layer.masksToBounds = 60/2.0;
    
    btn3.layer.borderColor = [UIColor whiteColor].CGColor;
    btn3.layer.borderWidth = 1.5;
    
    [btn3 setTitle:@"励志" forState:UIControlStateNormal];
    [btn3 setBackgroundImage:[UIImage imageNamed:@"功能"] forState:UIControlStateHighlighted];
//    [btn3 setImage:[UIImage imageNamed:@"功能"]forState:UIControlStateHighlighted];
    [btn3 setTintColor:[UIColor whiteColor]];
    [btn3 setTitleShadowColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    [btn3 addTarget:self action:@selector(lizhi:) forControlEvents:UIControlEventTouchDown];
    
    
    [views addSubview:btn3];

    //4、技巧按钮
    UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(285, 230, 60, 60)];
    
    btn4.layer.cornerRadius = 60/2.0;
    btn4.layer.masksToBounds = 60/2.0;
    
    btn4.layer.borderColor = [UIColor whiteColor].CGColor;
    btn4.layer.borderWidth = 1.5;
    

    [btn4 setTitle:@"技巧" forState:UIControlStateNormal];
    [btn4 setBackgroundImage:[UIImage imageNamed:@"功能"] forState:UIControlStateHighlighted];
//    [btn4 setImage:[UIImage imageNamed:@"功能"]forState:UIControlStateHighlighted];

    [btn4 setTintColor:[UIColor whiteColor]];
    
    [btn4 setTitleShadowColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(jiqiao:) forControlEvents:UIControlEventTouchDown];
    
    
    [views addSubview:btn4];

    
    
    
    
    
    
    
#pragma mark ========文本框==========

    
    
    //添加返回键
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(back:)];
    
    self.navigationItem.leftBarButtonItem = btn;

    

    // Do any additional setup after loading the view from its nib.
}

#pragma mark      ====tableView  DataSource====
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identfile = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identfile];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identfile];
    }
    cell.textLabel.text = self.array[indexPath.row];
    return cell;

}

// 让pagecontroller跟随scroller移动

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page1 = (scrollView.contentOffset.x + scrollView.frame.size.width / 2) / scrollView.frame.size.width;
    self.page.currentPage = page1;
}


//跳转至饮食视图
-(void)yinshi:(UIButton *)sander{
    
    //新建并跳转至ViewController
    faxianViewController *View = [[faxianViewController alloc] init];
    
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:View];

    
    [self presentViewController:navi animated:YES completion:^{
    }];
    

    
}
//跳转至问答视图
-(void)wenda:(UIButton *)sander{
    
    //新建并跳转至ViewController
    faxianViewController *View1 = [[faxianViewController alloc] init];
    
    UINavigationController *navi1 = [[UINavigationController alloc] initWithRootViewController:View1];
    
    
    [self presentViewController:navi1 animated:YES completion:^{
    }];
    


    
}
//跳转至励志视图
-(void)lizhi:(UIButton *)sander{
    
    
}
//跳转至技巧4视图
-(void)jiqiao:(UIButton *)sander{
    
    
}

//返回键
-(void)back:(UIBarButtonItem *)sender{
    
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
