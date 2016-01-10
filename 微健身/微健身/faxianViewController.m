//
//  faxianViewController.m
//  微健身
//
//  Created by qingyun on 16/1/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "faxianViewController.h"

@interface faxianViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong) UITableView *myTable;
@end

@implementation faxianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem = btn;
    
    
    _myTable = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _myTable.delegate = self;
    _myTable.dataSource = self;
    
    [self.view addSubview:_myTable];
    
    
    
    // Do any additional setup after loading the view from its nib.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indertfile = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indertfile];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indertfile];
    }
    
    return cell;
}

-(void)back:(UIBarButtonItem *)sander{
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
