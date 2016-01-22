//
//  AddViewController.m
//  微健身
//
//  Created by qingyun on 15/12/23.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "AddViewController.h"
#import "jiluViewController.h"
#import "Masonry.h"
#define fileName @"WJS.plist"

@interface AddViewController ()

@property (nonatomic ,strong) UIImageView *img;
@property (nonatomic ,strong)UILabel *label;
@property (nonatomic ,strong)UITextView *textView;

@property(nonatomic,strong) NSString *filePath;
@property (nonatomic ,strong)NSArray *data;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //设置背景色
    self.view.backgroundColor = [UIColor whiteColor];
    
    _img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    _img.image = [UIImage imageNamed:@"背景1"];
    _img.alpha = 0.8;
    [self.view addSubview:_img];
    
    //设置导航栏
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(clickBack:)];
    
    UIBarButtonItem *btn2 = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:(UIBarButtonItemStyleDone) target:self action:@selector(clickSave:)];
    self.navigationItem.leftBarButtonItem = btn;
    self.navigationItem.rightBarButtonItem = btn2;
   
    self.navigationItem.title = @"请在下面添加记录";
    
    //设置时间的lable
    _label = [[UILabel alloc] initWithFrame:CGRectMake(38, 160, 50, 20)];
    [_label setText:@"事件:"];
    _label.font = [UIFont systemFontOfSize:22];
    _label.textColor = [UIColor blackColor];
       //设置居中
    _label.textAlignment = NSTextAlignmentCenter;
    

    [self.view addSubview:_label];

    //创建一个textfield 来添加记录。
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(45, 193, 285, 160)];
    _textView.backgroundColor = [UIColor groupTableViewBackgroundColor];

    _textView.font = [UIFont systemFontOfSize:18];

    _textView.textColor = [UIColor blackColor];

    _textView.alpha = 0.7;
    //设置圆角，边框属性
    self.textView.layer.cornerRadius = 8.0f;
    self.textView.layer.borderWidth = 2;

 
    [self.view addSubview:_textView
     ];
    [_textView setText:@"日期 :\n事件 :"];
    
    
    
    [self upsave];
    // Do any additional setup after loading the view.
}


// 将数据保存至plist文件
-(void)save{

    NSString *docPath =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [docPath stringByAppendingPathComponent:@"WJS.plist"];
    NSLog(@"%@",filePath);
    
     _data = @[_textView.text];
     [_data writeToFile:filePath atomically:YES];

}




//设置自动布局
-(void)upsave{
    [_img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
        
    }];

    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(30);
        make.right.equalTo(self.view.mas_right).with.offset(-30);
        make.top.equalTo(self.view.mas_top).with.offset(150);
        make.height.equalTo(@300);
    }];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_textView.mas_top).with.offset(-5);
        make.left.equalTo(self.view.mas_left).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(50, 20));
    }];

}


//返回
-(void)clickBack:(UIBarButtonItem *)sender{
    
    [self dismissViewControllerAnimated:YES completion:^{
    

    }];
}
//保存记录
-(void)clickSave:(UIBarButtonItem *)sender{
    
        [self save];
        _addLabelValue(_textView.text);
 

    
    [self dismissViewControllerAnimated:YES completion:^{

    }];

}


//取消响应
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    NSLog(@"%s",__func__);

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
