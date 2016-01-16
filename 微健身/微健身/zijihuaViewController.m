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

@property (nonatomic) NSInteger index;

@property (nonatomic, strong) UIScrollView *scroll;
@property (nonatomic ,strong) NSArray *datas;

@property (nonatomic, strong) UIButton *btn1;
@property (nonatomic, strong) UIButton *btn2;
@property (nonatomic, strong) UILabel *label4;
@property (nonatomic, strong) UILabel *label5;
@property (nonatomic, strong) UILabel *label6;


@end

@implementation zijihuaViewController


//懒加载，添加数据。
-(NSArray *)datas
{
    if (_datas ==nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"123" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            DataModels *image = [DataModels datasWithDictionary:dict];
            [models addObject:image];
        }
        _datas = models;
        
    }
    return _datas;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self datas];
    
    
//    //设置导航栏为不透明
    self.navigationController.navigationBar.translucent = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    int count = 9;
    _scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(50, 50, 275, 205)];
    
      [self.view addSubview:_scroll];
    //设置contentsize
    _scroll.contentSize = CGSizeMake(275 * count, 205);
    //设置分页
    _scroll.pagingEnabled = YES;
    //设置代理
    _scroll.delegate = self;
    //取消滚动条
    _scroll.showsHorizontalScrollIndicator = NO;
    
   _scroll.backgroundColor = [UIColor blackColor];

   
    for (int i = 0;i < count; i++ ) {
        UIScrollView *scroll1 = [[UIScrollView alloc] initWithFrame:CGRectMake(275 * i,0, 275, 205 )];
        
        [_scroll addSubview:scroll1];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 275, 205)];
        [scroll1 addSubview:imageView];
        
        //设置scroll的图片
  
        NSString *imageName = [NSString stringWithFormat: @"肌肉_%d.jpg",i+1];
        
        imageView.image = [UIImage imageNamed:imageName];
        
    }
    
    
    
    _btn1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 150, 30, 30)];
    

    [_btn1 setImage:[UIImage imageNamed:@"左"] forState:UIControlStateNormal];
    [_btn1 addTarget:self action:@selector(upPage:) forControlEvents:UIControlEventTouchDown];
    [_btn1 setImage:[UIImage imageNamed:@"左高亮"] forState:UIControlStateHighlighted];
    
    [self.view addSubview:_btn1];
    
  
    _btn2 = [[UIButton alloc] initWithFrame:CGRectMake(335, 150, 30, 30)];
    [_btn2 setImage:[UIImage imageNamed:@"右"] forState:UIControlStateNormal];
    [_btn2 addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchDown];
    [_btn2 setImage:[UIImage imageNamed:@"右高亮"] forState:UIControlStateHighlighted];
    [self.view addSubview:_btn2];

 UILabel *lab1 = [[UILabel alloc] initWithFrame:CGRectMake(11, 280, 85, 21)];
    UILabel *lab2 = [[UILabel alloc] initWithFrame:CGRectMake(11, 330, 85, 21)];
    UILabel *lab3 = [[UILabel alloc] initWithFrame:CGRectMake(11, 380, 85, 21)];

    lab1.text = @"健身部位";
    lab2.text = @"方法器材";
    lab3.text = @"锻炼注意";

    _label4 = [[UILabel alloc] initWithFrame:CGRectMake(100, 280, 250, 21)];
    _label5 = [[UILabel alloc] initWithFrame:CGRectMake(100, 310, 250, 60)];
    _label6 = [[UILabel alloc] initWithFrame:CGRectMake(30, 350, 315, 250)];


    [self.view addSubview:lab1];
    [self.view addSubview:lab2];
    [self.view addSubview:lab3];
    [self.view addSubview:_label4];
    [self.view addSubview:_label5];
    [self.view addSubview:_label6];
    
    //设置index值等于刚进来的row顺序的值。
    
    self.index = _inter;
    
    // Do any additional setup after loading the view from its nib.
}

//设置让scrollerview的值随着inde改变
- (void)setIndex:(NSInteger)index{
    if (index < 0) {
        index = 8;
    }
    if (index > 8) {
        index = 0;
    }
    _index = index;
    DataModels *model = self.datas[index];
    self.label4.text = model.title;
    self.label5.text = model.tool;
    _label4.textColor = [UIColor brownColor];
    _label5.textColor = [UIColor brownColor];
    //文本自适应大小
    _label5.adjustsFontSizeToFitWidth = YES;
    _label5.numberOfLines = 3;
    
    self.label6.text = model.method;
    _label6.textColor = [UIColor brownColor];
    _label6.adjustsFontSizeToFitWidth = YES;
    _label6.numberOfLines = 6;

    self.scroll.contentOffset = CGPointMake((index)*275, 0);
    
   
}




-(void)next:(UIButton *)sander{

    self.index  = _index+ 1;

}
-(void)upPage:(UIButton *)secder{

    self.index = _index - 1;

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
