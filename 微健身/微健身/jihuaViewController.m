//
//  jihuaViewController.m
//  微健身
//
//  Created by qingyun on 15/12/14.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "jihuaViewController.h"

#import "zijihuaViewController.h"
#import "Masonry.h"


@interface jihuaViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong) UITableView *myTable;
@property (nonatomic ,strong) NSArray *array;
@property (nonatomic ,strong) NSArray *images;

@end

@implementation jihuaViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    _array = @[@"肱二头肌",@"肱三头肌",@"背部",@"小腿",@"肩部",@"胸肌",@"前臂",@"腹肌",@"大腿"];
    _images =@[@"肱 三头肌",@"肱 二头肌",@"背 部",@"小 腿",@"肩 部",@"胸 肌",@"前 臂",@"腹 肌",@"大 腿"];


    
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
    _myTable.rowHeight = 67;
    
    //让分割线从0开始显示
    _myTable.separatorInset=UIEdgeInsetsMake(0, 0, 0,0);
    
    [self.view addSubview:_myTable];

//    UIImageView *img = [[UIImageView alloc] initWithFrame:self.view.bounds];
//    img.image = [UIImage imageNamed:@"背景1"];
//    img.alpha = 0.7;
//    _myTable.backgroundView = img;
    
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
        cell.imageView.image = [UIImage imageNamed:_images[indexPath.row]];

    }
    return cell;
    
}



-(void)updateViewConstraints{

    [_myTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
    
    [super updateViewConstraints];

}





//跳转至播放页面
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    zijihuaViewController *vc = [[zijihuaViewController alloc]init];
    vc.inter = indexPath.row;
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
