//
//  AddViewController.m
//  微健身
//
//  Created by qingyun on 15/12/23.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@property (nonatomic ,strong)UITextView *textView;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景色
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    img.image = [UIImage imageNamed:@"背景1"];
    img.alpha = 0.8;
    [self.view addSubview:img];
    
    //设置导航栏
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(clickBack:)];
    
    UIBarButtonItem *btn2 = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:(UIBarButtonItemStyleDone) target:self action:@selector(clickSave:)];
    self.navigationItem.leftBarButtonItem = btn;
    self.navigationItem.rightBarButtonItem = btn2;
   
    self.navigationItem.title = @"请在下面添加记录";
    
    //设置时间的lable
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(38, 160, 50, 20)];
    [lab setText:@"事件:"];
    lab.font = [UIFont systemFontOfSize:22];
    lab.textColor = [UIColor blackColor];
       //设置居中
    lab.textAlignment = NSTextAlignmentCenter;
    

    [self.view addSubview:lab];

    //创建一个textfield 来添加记录。
   _textView
    = [[UITextView alloc] initWithFrame:CGRectMake(45, 193, 285, 160)];
    _textView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //设置字体大小
    _textView.font = [UIFont systemFontOfSize:18];
    //设置字体颜色
    _textView.textColor = [UIColor blackColor];
    //设置textView透明度
    _textView.alpha = 0.7;
    //设置圆角，边框属性
    self.textView.layer.cornerRadius = 8.0f;
    self.textView.layer.borderWidth = 2;

 
    [self.view addSubview:_textView
     ];
    [_textView setText:@"日期 :\n事件 :"];
 

    
    // Do any additional setup after loading the view.
}
//返回
-(void)clickBack:(UIBarButtonItem *)sender{
    
    [self dismissViewControllerAnimated:YES completion:^{
    

    }];
}
//保存记录
-(void)clickSave:(UIBarButtonItem *)sender{
    
        _addLabelValue(_textView.text);


    [self dismissViewControllerAnimated:YES completion:^{

        
    }];

}
//取消响应
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);

    //父视图结束编辑，子视图失去第一响应
    [self.view endEditing:YES];

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
