//
//  jihuaViewController.m
//  微健身
//
//  Created by qingyun on 15/12/14.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "jihuaViewController.h"
#import "jihua1ViewController.h"

@interface jihuaViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong) UITableView *myTable;
@property (nonatomic ,strong) NSArray *array;

@end

@implementation jihuaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _array = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    
    
    //设置背景色
    self.view.backgroundColor = [UIColor whiteColor];
    //添加按钮
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(click:)];
    self.navigationItem.leftBarButtonItem = btn;
    self.navigationItem.title = @"健身计划";
    
#pragma mark  ===========创建TanleView===============
    
    _myTable = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _myTable.delegate = self;
    _myTable.dataSource = self;
    _myTable.rowHeight = 70;
    
    [self.view addSubview:_myTable];

    
    // Do any additional setup after loading the view.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *idenfile = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idenfile];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenfile];

        cell.textLabel.text = _array[indexPath.row];
        
    }
    return cell;
    
}
// ====添加删除表格
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{

    UITableViewRowAction *rowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"加入计划" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {

    }];

    return @[rowAction];
}

//跳转至播放页面
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    jihua1ViewController *vc = [[jihua1ViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
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
