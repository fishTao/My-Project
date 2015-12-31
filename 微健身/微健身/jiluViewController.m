//
//  jiluViewController.m
//  微健身
//
//  Created by qingyun on 15/12/23.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "jiluViewController.h"
#import "AddViewController.h"

@interface jiluViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong) NSArray *datas;
@end

@implementation jiluViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      

    //设置背景色
    self.view.backgroundColor = [UIColor whiteColor];
    //添加左右按钮
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(click1:)];
    
    UIBarButtonItem *btn1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addjilu:)];
    
    self.navigationItem.leftBarButtonItem = btn;
    self.navigationItem.rightBarButtonItem = btn1;
    
    self.navigationItem.title = @"记录";
    
#pragma mark     ----------UITableView------
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 667) style:UITableViewStylePlain];
    
    //设置代理
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.rowHeight = 100;
    [self.view addSubview:tableview];
    
 
    // Do any additional setup after loading the view.
}

#pragma mark      ----------tableView DataSource-------
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identfier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identfier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identfier];
    }
    cell.textLabel.text = _datas[indexPath.row];
  
    return cell;
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//给左按钮添加的方法
-(void)click1:(UIBarButtonItem *)sender{
    
    [self dismissViewControllerAnimated:YES completion:^{
    }];;
}

//给右按钮添加方法
-(void)addjilu:(UIBarButtonItem *)sender{
    
    //新建并跳转至ViewController
    AddViewController *View = [[AddViewController alloc] init];
    
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:View];
    
    [self presentViewController:navi animated:YES completion:^{
    }];
    
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
