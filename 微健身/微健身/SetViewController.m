//
//  SetViewController.m
//  微健身
//
//  Created by qingyun on 16/1/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "SetViewController.h"
#import "fankuiView.h"
#import "KaifazheView.h"
#import "Masonry.h"
@interface SetViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *myTable;
@property (nonatomic ,strong) NSArray *array;
@property (nonatomic ,strong) NSArray *arr;
@end

@implementation SetViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    _array = @[@"开发者信息",@"建议反馈",@"更新",@""];
    _arr = @[@"开发者",@"反馈",@"更新",@""];
    _myTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    _myTable.delegate = self;
    _myTable.dataSource = self;
    _myTable.rowHeight = 50;
    //让分割线从0开始显示
    _myTable.separatorInset=UIEdgeInsetsMake(0, 0, 0,0);
    
    [self.view addSubview:_myTable];
    
    
    //设置背景色
    self.view.backgroundColor = [UIColor whiteColor];
    //添加按钮
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem = btn;
    
    self.navigationItem.title = @"设置";

    [self upsave];
    // Do any additional setup after loading the view from its nib.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *idenfile = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idenfile];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenfile];
        cell.imageView.image = [UIImage imageNamed:_arr[indexPath.row]];
        cell.textLabel.text = _array[indexPath.row];

    }
    return cell;
    

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        KaifazheView *view = [[KaifazheView alloc] init];
        
        [self.navigationController pushViewController:view animated:YES];

    }if (indexPath.row == 1) {

        fankuiView *vc = [[fankuiView alloc] init];
        
        [self.navigationController pushViewController:vc animated:YES];

    }if (indexPath.row == 2) {
        UIAlertView *send = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"已经是最新版本了~" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        //设置弹窗的风格
        send.alertViewStyle = UIAlertViewStyleDefault;
        //弹出alertView
        [send show];
    }
}



//设置自动布局
-(void)upsave{
    
    [_myTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
        
    }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//给按钮添加一个返回的方法
- (void)back:(UIBarButtonItem *)sender{
    [self dismissViewControllerAnimated:YES completion:^{
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
