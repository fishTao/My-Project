//
//  zijihuaViewController.m
//  微健身
//
//  Created by qingyun on 16/1/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "zijihuaViewController.h"
#import "DataModels.h"
@interface zijihuaViewController ()<UIScrollViewDelegate>
@property (nonatomic ,strong) NSArray *datas;

@end

@implementation zijihuaViewController


////懒加载，添加数据。
//-(NSArray *)datas
//{
//    if (_datas == nil) {
//        NSString *path = [[NSBundle mainBundle]pathForResource:@"123" ofType:@"plist"];
//        NSArray *array = [NSArray arrayWithContentsOfFile:path];
//        NSMutableArray *models = [NSMutableArray array];
//        for (NSDictionary *dict in array) {
//            DataModels *data = [DataModels datasWithDictionary:dict];
//            [models addObject:data];
//        }
//        _datas = models;
//        
//    }
//    return _datas;
//}




- (void)viewDidLoad {
    [super viewDidLoad];
    [self datas];
    

    
//    //设置导航栏为不透明
    self.navigationController.navigationBar.translucent = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    int count = 9;
    UIScrollView *scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(50, 50, 275, 205)];
    
      [self.view addSubview:scrollview];
    //设置contentsize
    scrollview.contentSize = CGSizeMake(275 * count, 205);
    //设置分页
    scrollview.pagingEnabled = YES;
    //设置代理
    scrollview.delegate = self;
    //取消滚动条
    scrollview.showsHorizontalScrollIndicator = NO;
    
   scrollview.backgroundColor = [UIColor brownColor];  

    
    for (int i = 0;i < count; i++ ) {
        UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(275 * i,0, 275, 205 )];
        
        [scrollview addSubview:scroll];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 275, 205)];
        [scroll addSubview:imageView];
        
        //设置scroll的图片
  
        NSString *imageName = [NSString stringWithFormat:@"肌肉_%d.jpg",i + 1];
        
        imageView.image = [UIImage imageNamed:imageName];
        
        
      

    }
    
    
                                
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 150, 30, 30)];
    [btn1 setImage:[UIImage imageNamed:@"左"] forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"左高亮"] forState:UIControlStateHighlighted];
    
    
    [self.view addSubview:btn1];
    
    
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(335, 150, 30, 30)];
    [btn2 setImage:[UIImage imageNamed:@"右"] forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"右高亮"] forState:UIControlStateHighlighted];
    [self.view addSubview:btn2];

    
    UILabel *lab1 = [[UILabel alloc] initWithFrame:CGRectMake(11, 280, 85, 21)];
    UILabel *lab2 = [[UILabel alloc] initWithFrame:CGRectMake(11, 330, 85, 21)];
    UILabel *lab3 = [[UILabel alloc] initWithFrame:CGRectMake(11, 380, 85, 21)];
    
    UILabel *lab4 = [[UILabel alloc] initWithFrame:CGRectMake(100, 280, 250, 21)];
    UILabel *lab5 = [[UILabel alloc] initWithFrame:CGRectMake(100, 320, 250, 60)];
    UILabel *lab6 = [[UILabel alloc] initWithFrame:CGRectMake(11, 405, 250, 200)];
    
    lab1.text = @"健身部位";
    lab2.text = @"适应器材";
    lab3.text = @"锻炼方法";
    
//    lab4.text = _datas[1];
    lab5.text = @"12    qertqertweq    qertwrtqwetr    wewqe34";
    lab6.text = @"234";
   
    
    lab5.adjustsFontSizeToFitWidth = YES;
    lab5.numberOfLines = 3;
    
    [self.view addSubview:lab1];
    [self.view addSubview:lab2];
    [self.view addSubview:lab3];
    [self.view addSubview:lab4];
    [self.view addSubview:lab5];
    [self.view addSubview:lab6];
    
    
    // Do any additional setup after loading the view from its nib.
}



//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [self.view endEditing:YES];
//}
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
