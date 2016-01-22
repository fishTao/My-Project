//
//  zijihuaViewController.m
//  微健身
//
//  Created by qingyun on 16/1/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "zijihuaViewController.h"
#import "Masonry.h"
#import "Header.h"
#import "DataModels.h"

@interface zijihuaViewController ()<UIScrollViewDelegate>

@property (nonatomic) NSInteger index;

@property (nonatomic, strong) UIScrollView *scroll;
@property (nonatomic ,strong) NSArray *datas;

@property(nonatomic ,strong) UIView *myView;
@property (nonatomic, strong) UIButton *btn1;
@property (nonatomic, strong) UIButton *btn2;

@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, strong) UILabel *label3;
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
    _myView = [UIView new];
    _myView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_myView];
   
    
//    //设置导航栏为不透明
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    
#pragma mark =====ScrollView=====
    int count = 9;
    _scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-80, 210)];
    [_myView addSubview:_scroll];
    //设置contentsize
    _scroll.contentSize = CGSizeMake((self.view.frame.size.width-80) * count, 210);
    //设置分页
    _scroll.pagingEnabled = YES;
    //设置代理
    _scroll.delegate = self;
    //取消滚动条
    _scroll.showsHorizontalScrollIndicator = NO;
    
   _scroll.backgroundColor = [UIColor blackColor];

   
    for (int i = 0;i < count; i++ ) {

        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-80) * i, 0, self.view.frame.size.width-80,210)];
        [_scroll addSubview:imageView];
        
        //设置scroll的图片
  
        NSString *imageName = [NSString stringWithFormat: @"肌肉_%d.jpg",i+1];
        
        imageView.image = [UIImage imageNamed:imageName];
        
    }
    
    //设置左右翻页按钮
    
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

    _label1 = [[UILabel alloc] initWithFrame:CGRectMake(11, 330, 85, 21)];
    _label2 = [[UILabel alloc] initWithFrame:CGRectMake(11, 380, 85, 21)];
    _label3 = [[UILabel alloc] initWithFrame:CGRectMake(11, 430, 85, 21)];

    _label1.text = @"健身部位";
    _label2.text = @"方法器材";
    _label3.text = @"锻炼注意";

    _label4 = [[UILabel alloc] initWithFrame:CGRectMake(100, 330, 250, 21)];
    _label5 = [[UILabel alloc] initWithFrame:CGRectMake(100, 360, 250, 60)];
    _label6 = [[UILabel alloc] initWithFrame:CGRectMake(30, 400, 315, 250)];


    [self.view addSubview:_label1];
    [self.view addSubview:_label2];
    [self.view addSubview:_label3];
    [self.view addSubview:_label4];
    [self.view addSubview:_label5];
    [self.view addSubview:_label6];
    
    //设置index值等于刚进来的row顺序的值。
    
    self.index = _inter;
    
    //======   //调用自动布局
    
    [self update];
        


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
    _label6.numberOfLines = 10;

    //让scrollView随左右按钮偏移
    self.scroll.contentOffset = CGPointMake((index) * _myView.frame.size.width, 0);
    
   
}

-(void)next:(UIButton *)sander{

    self.index  = _index+ 1;

}
-(void)upPage:(UIButton *)secder{

    self.index = _index - 1;

}


//////////  添加约束
-(void)update{
    
    [_myView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left).with.offset(40);
        make.right.equalTo(self.view.mas_right).with.offset(-40);
        make.height.equalTo(@210);
    }];
    
    [_scroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_myView.mas_top);
        make.bottom.equalTo(_myView.mas_bottom);
        make.left.equalTo(_myView.mas_left);
        make.right.equalTo(_myView.mas_right);
        
    }];
    [_btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
            make.left.equalTo(self.view.mas_left).with.offset(5);

            make.centerY.equalTo(@[_btn2,_btn1,_myView]);
            make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [_btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_myView.mas_right).with.offset(5);
            make.right.equalTo(self.view.mas_right).with.offset(-5);
            make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
        
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_myView.mas_bottom).with.offset(10);
            make.left.equalTo(self.view.mas_left).with.offset(10);
            make.size.mas_equalTo(CGSizeMake(85, 21));
            make.right.equalTo(_label4.mas_left).with.offset(-15);
            make.centerY.equalTo(@[_label1,_label4]);
    }];
        
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_myView.mas_right).with.offset(-20);
            make.height.equalTo(@21);
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_label1.mas_bottom).with.offset(40);
            make.left.equalTo(self.view.mas_left).with.offset(10);
            make.size.mas_equalTo(CGSizeMake(85, 21));
            make.right.equalTo(_label5.mas_left).with.offset(-15);
            make.centerY.equalTo(@[_label2,_label5]);

    }];
    
    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {

            make.right.equalTo(self.view.mas_right).with.offset(-20);
            make.height.equalTo(@42);
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_label2.mas_bottom).with.offset(40);
            make.left.equalTo(self.view.mas_left).with.offset(10);
            make.size.mas_equalTo(CGSizeMake(85, 21));
    }];
    
    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_label3.mas_bottom).with.offset(10);
        make.left.equalTo(self.view.mas_left).with.offset(20);
        make.right.equalTo(self.view.mas_right).with.offset(-20);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-10);

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
