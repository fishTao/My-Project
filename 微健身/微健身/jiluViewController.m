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
@property (nonatomic ,strong) NSMutableArray *datas;
@property (nonatomic ,strong) UITableView *myTable;



@end

@implementation jiluViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self saveload];

    
    //读取plist文件 =====字典
    NSString *dopath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filepath = [dopath stringByAppendingPathComponent:@"WJS.plist"];

    NSMutableArray *arr = [NSMutableArray arrayWithContentsOfFile:filepath];

    _datas = arr;


    //设置背景色
    self.view.backgroundColor = [UIColor whiteColor];
    //添加左右按钮
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(click1:)];
    
    UIBarButtonItem *btn1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addjilu:)];
    
    self.navigationItem.leftBarButtonItem = btn;
    self.navigationItem.rightBarButtonItem = btn1;
    
    self.navigationItem.title = @"记录";
    
#pragma mark     ----------UITableView------
    
    _myTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 667) style:UITableViewStylePlain];
    
    //设置代理
    _myTable.delegate = self;
    _myTable.dataSource = self;
    _myTable.rowHeight = 100;
    
    [self.view addSubview:_myTable];
    

    // Do any additional setup after loading the view.
}
-(void)saveload{
    //读取plist文件 =====字典
    NSString *dopath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filepath = [dopath stringByAppendingPathComponent:@"WJS.plist"];
    
    NSMutableArray *arr = [NSMutableArray arrayWithContentsOfFile:filepath];
    
    _datas = arr;


}


#pragma mark      ----------tableView DataSource-------
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datas.count;
}

#pragma mark  =======设置删除======
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //移除数据源的数据
    [self.datas removeObjectAtIndex:indexPath.row];
    //移除tableView中的数据
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identfier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identfier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identfier];
    }
    //显示多行
    cell.textLabel.numberOfLines = 0;
    //文字自适应大小
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    

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
    View.addLabelValue = ^(NSString *string){
       
        [_datas addObject:string];
        [self saveload];
        [self.myTable reloadData];
    };

    
    [self presentViewController:navi animated:YES completion:^{
    }];
    
}








#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
  
    

}


@end
