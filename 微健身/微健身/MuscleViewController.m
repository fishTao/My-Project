//
//  ViewController1_1.m
//  
//
//  Created by qingyun on 15/11/25.
//
//

#import "MuscleViewController.h"
#import "ViewController.h"
#import "DataModels.h"

@interface MuscleViewController ()<UIScrollViewDelegate>
@property (nonatomic ,strong) NSArray *image;

@end

@implementation MuscleViewController




- (void)viewDidLoad {
    [super viewDidLoad];
   

   //进来后将导航栏设置取消透明（即显示）
   self.navigationController.navigationBar.translucent = NO;
    //设置背景颜色为白色
     self.view.backgroundColor = [UIColor whiteColor];
   //接收arr的数据
   DataModels *model = _arr1[_flag-101];

   
   
   //设置标题栏
    self.title = [NSString stringWithFormat:model.title];
   

   //创建scrollView
   UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(50, 30, 275, 400)];
   [self.view addSubview:scrollview];
   
   //设置contenSize
   scrollview.contentSize = CGSizeMake(scrollview.frame.size.width *10 , 400);
   //分页
   scrollview.pagingEnabled = YES;
   //设置代理
   scrollview.delegate = self;
   //设置背景
   scrollview.backgroundColor = [UIColor blackColor];
   
   for (int i = 0;i < 10;i++) {
      UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(275 * i, 0, 272, 397)];
      [scrollview addSubview:scroll];
      UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(3, 3, 272, 397)];
      [scroll addSubview:imageView];
   //设置scrollView的图片
      NSString *imageName = [NSString stringWithFormat:@"%ld_%d",_flag-100,i + 1];
      imageView.image = [UIImage imageNamed:imageName];
   
   }

    //创建一个文本框，用来陈述图片的锻炼方法。
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(40, 440, 300, 80)];
    label.backgroundColor = [UIColor grayColor];

   label.text = [NSString stringWithFormat:model.string];
    label.font = [UIFont fontWithName:@"Arial" size:18];
     //文本居中
    //label.textAlignment = YES;
    //文本自适应大小
    label.adjustsFontSizeToFitWidth = YES;
     //文本最多行数。
    label.numberOfLines = 4;
   
    label.textColor = [UIColor orangeColor];
    //设置文本框为透明。
    label.backgroundColor = [UIColor clearColor];
    [self.view addSubview:label];


    // Do any additional setup after loading the view.
}

//给按钮添加一个返回的方法
- (void)click:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:^{
   }];
}
//将要离开此界面时候让导航栏变透明。
- (void)viewWillDisappear:(BOOL)animated{
   [super viewWillDisappear:YES];
   self.navigationController.navigationBar.translucent = YES;
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
