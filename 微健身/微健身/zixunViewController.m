//
//  zixunViewController.m
//  微健身
//
//  Created by qingyun on 16/1/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "zixunViewController.h"
#import "faxianViewController.h"
#import "DataModels.h"
#import "AFNetworking.h"
#import "Header.h"
#import "Masonry.h"
#import "WEBViewController.h"

@interface zixunViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property (nonatomic ,strong) UIPageControl *page;
@property (nonatomic ,strong) UITableView *myTable;
@property (nonatomic ,strong) NSMutableArray *array;
@property (nonatomic ,strong) UIView *myView;
@property (nonatomic ,strong) UIButton *btn1;
@property (nonatomic ,strong) UIButton *btn2;
@property (nonatomic ,strong) UIButton *btn3;
@property (nonatomic ,strong) UIButton *btn4;

@end

@implementation zixunViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateViewConstraints];
    //设置导航栏为不透明
    self.navigationController.navigationBar.translucent = NO;
    //设置标题栏
    self.title = @"资讯";


    
    
#pragma mark  ==========创建TableVi============
    _myTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _myTable.delegate = self;
    _myTable.dataSource = self;
    
    _myTable.rowHeight = 80;

    
    [self.view addSubview:_myTable];
    
    
    _myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,100)];
    _myView.backgroundColor = [UIColor grayColor];
    
    _myTable.tableHeaderView = _myView;
    //设置View透明度
    _myView.alpha = 0.7;
    
    //调用自动布局
    [self upsave];

#pragma mark     ========设置四个按钮========


   //1、饮食按钮。
  _btn1 = [[UIButton alloc] initWithFrame:CGRectMake(30, 30, 60, 60)];
    //_btn1 = [UIButton new];
    //设置为圆
    _btn1.layer.cornerRadius = 60/2.0;
    _btn1.layer.masksToBounds = 60/2.0;
    //设置边框颜色
    _btn1.layer.borderColor = [UIColor blackColor].CGColor;
    //边框宽度
    _btn1.layer.borderWidth = 1.5;
    //字体颜色
    [_btn1 setTintColor:[UIColor whiteColor]];
    //字体阴影颜色
    [_btn1 setTitleShadowColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    [_btn1 setTitle:@"饮食" forState:UIControlStateNormal];
    [_btn1 setBackgroundImage:[UIImage imageNamed:@"功能"] forState:UIControlStateHighlighted];

    //设置跳转
    [_btn1 addTarget:self action:@selector(yinshi:) forControlEvents:UIControlEventTouchDown];
    
    [_myView addSubview:_btn1];
    
    //2、问答按钮
    _btn2 = [[UIButton alloc] initWithFrame:CGRectMake(115, 30, 60, 60)];
    //_btn2 = [UIButton new];
    _btn2.layer.cornerRadius = 60/2.0;
    _btn2.layer.masksToBounds = 60/2.0;
    
    _btn2.layer.borderColor = [UIColor blackColor].CGColor;
    _btn2.layer.borderWidth = 1.5;
    
    [_btn2 setTitle:@"问答" forState:UIControlStateNormal];
    [_btn2 setBackgroundImage:[UIImage imageNamed:@"功能"] forState:UIControlStateHighlighted];

    [_btn2 setTintColor:[UIColor whiteColor]];
    [_btn2 setTitleShadowColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    [_btn2 addTarget:self action:@selector(wenda:) forControlEvents:UIControlEventTouchDown];
    
    [_myView addSubview:_btn2];
    //3、励志按钮
    _btn3 = [[UIButton alloc] initWithFrame:CGRectMake(200, 30, 60, 60)];
    //_btn3 = [UIButton new];
    _btn3.layer.cornerRadius = 60/2.0;
    _btn3.layer.masksToBounds = 60/2.0;
    
    _btn3.layer.borderColor = [UIColor blackColor].CGColor;
    _btn3.layer.borderWidth = 1.5;
    
    [_btn3 setTitle:@"励志" forState:UIControlStateNormal];

    [_btn3 setBackgroundImage:[UIImage imageNamed:@"功能"] forState:UIControlStateHighlighted];

    [_btn3 setTintColor:[UIColor whiteColor]];
    [_btn3 setTitleShadowColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    [_btn3 addTarget:self action:@selector(lizhi:) forControlEvents:UIControlEventTouchDown];
    
    
    [_myView addSubview:_btn3];

    //4、技巧按钮
    _btn4 = [[UIButton alloc] initWithFrame:CGRectMake(285, 30, 60, 60)];
    //_btn4 = [UIButton new];
    _btn4.layer.cornerRadius = 60/2.0;
    _btn4.layer.masksToBounds = 60/2.0;
    
    _btn4.layer.borderColor = [UIColor blackColor].CGColor;
    _btn4.layer.borderWidth = 1.5;
    

    [_btn4 setTitle:@"技巧" forState:UIControlStateNormal];
    [_btn4 setBackgroundImage:[UIImage imageNamed:@"功能"] forState:UIControlStateHighlighted];


    [_btn4 setTintColor:[UIColor whiteColor]];
    
    [_btn4 setTitleShadowColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_btn4 addTarget:self action:@selector(jiqiao:) forControlEvents:UIControlEventTouchDown];
    
    
    [_myView addSubview:_btn4];

#pragma mark ========文本框==========

    [self upsave2];
    
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
    WEBViewController *view4 = [[WEBViewController alloc] init];
    
    UINavigationController *navi4 = [[UINavigationController alloc] initWithRootViewController:view4];
    [self presentViewController:navi4 animated:YES completion:^{
    
    }];
    
}

//返回键
-(void)back:(UIBarButtonItem *)sender{
    
    [self dismissViewControllerAnimated:YES completion:^{
    
    }];
}






-(void)upsave{
    
    [_myTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);

    }];


}
-(void)upsave2{

    [_btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_myView.mas_top).with.offset(20);
        make.left.equalTo(_myView.mas_left).with.offset(20);
        make.bottom.equalTo(_myView.mas_bottom).with.offset(-20);
        make.size.mas_equalTo(CGSizeMake(60, 60));
        make.centerY.equalTo(@[_btn1,_btn2,_btn3,_btn4]);
        make.width.equalTo(@[_btn1,_btn2,_btn3,_btn4]);
        make.height.equalTo(@[_btn1,_btn2,_btn3,_btn4]);
    }];
    
    [_btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(_btn1).with.offset((self.view.frame.size.width - 100)/3);
    }];
    
    [_btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.centerX.equalTo(_btn2).with.offset((self.view.frame.size.width - 100)/3);

    }];
    
    [_btn4 mas_makeConstraints:^(MASConstraintMaker *make) {

        make.right.equalTo(self.view.mas_right).with.offset(-20);
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
