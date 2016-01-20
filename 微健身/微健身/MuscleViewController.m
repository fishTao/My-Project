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
#import <AVFoundation/AVFoundation.h>
#import "Masonry.h"




@interface MuscleViewController ()<UIScrollViewDelegate>

@property (nonatomic ,strong) UIView *uiView;
@property (nonatomic ,strong) AVPlayerLayer *playerLayer;
@property (nonatomic ,strong) UILabel *lab1;
@property (nonatomic ,strong) UILabel *lab2;


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


   ////设置标题栏
    self.title = model.title;
   

#pragma mark ========文本框==========
    //创建一个文本框，用来陈述图片的锻炼方法。
    _lab1 = [[UILabel alloc]initWithFrame:CGRectMake(25, 250, 325, 120)];

   _lab1.text = model.string;
     //文本居中
    _lab1.textAlignment = YES;
    //文本自适应大小
    _lab1.adjustsFontSizeToFitWidth = YES;
     //文本最多行数。
    _lab1.numberOfLines = 10;
   
    _lab1.textColor = [UIColor brownColor];
    //设置文本框为透明。
    _lab1.backgroundColor = [UIColor clearColor];

    [self.view addSubview:_lab1];
   
   //Label 2
   _lab2 = [[UILabel alloc]initWithFrame:CGRectMake(25, 400, 325, 120)];
   
   _lab2.text = model.method;
   
   _lab2.textAlignment = YES;
   
   _lab2.adjustsFontSizeToFitWidth = YES;
   
   _lab2.numberOfLines = 10;


   _lab2.textColor = [UIColor brownColor];
   
   _lab2.backgroundColor = [UIColor clearColor];
   
   [self.view addSubview:_lab2];
   

   
   
   
   
//
   _uiView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 211)];
   [self.view addSubview:_uiView];
   
   
   NSString *path = [[NSBundle mainBundle]pathForResource:model.mp4 ofType:@"mp4"];

   NSURL *url = [NSURL fileURLWithPath:path];
   AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];

   AVPlayer *player = [[AVPlayer alloc]initWithPlayerItem:item];
   
   //生成layer
   _playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
   
   _playerLayer.frame = CGRectMake(0, 0,self.uiView.frame.size.width, _uiView.frame.size.height);

   //设置屏幕填充
   _playerLayer.videoGravity=AVLayerVideoGravityResizeAspect;
   
   [self.uiView.layer addSublayer:_playerLayer];
   
   [player play];

   
   
 }

- (void)updateViewConstraints{
   
  [_uiView mas_makeConstraints:^(MASConstraintMaker *make) {

     make.top.equalTo(self.view);
     make.centerX.equalTo(self.view);
     make.width.equalTo(self.view);
     make.height.equalTo(@211);
     
  }];
   
   
   [_lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
      
      make.top.equalTo(_uiView.mas_bottom).with.offset(10);
      make.left.equalTo(self.view).with.offset(35);
      make.right.equalTo(self.view).with.offset(-35);
      make.bottom.equalTo(_lab2.mas_top).with.offset(-20);
   }];
   
   [_lab2 mas_makeConstraints:^(MASConstraintMaker *make) {

      make.bottom.equalTo(self.view).with.offset(-10);
      make.left.equalTo(self.view).with.offset(35);
      make.right.equalTo(self.view).with.offset(-35);
      
      make.height.equalTo(_lab1);

   }];
   
   [super updateViewConstraints];
   
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
