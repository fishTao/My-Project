//
//  ViewController1.m
//  
//
//  Created by qingyun on 15/11/25.
//
//

#import "CartoonViewController.h"
#import "MuscleViewController.h"
@interface CartoonViewController ()

@end

@implementation CartoonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
////动画页的返回键
//- (IBAction)back:(UIBarButtonItem *)sender {
//    [self dismissViewControllerAnimated:YES completion:nil];
//
//}


#pragma mark ----跳转向子视图----
//跳转至三头肌的视图
- (IBAction)goto1:(UIButton *)sender {
    MuscleViewController *vc1 = [[MuscleViewController alloc]init];
    vc1.flag = 101;
    vc1.arr1= [NSArray arrayWithArray:self.arr];
    //[self presentViewController:vc1 animated:YES completion:nil];
    [self.navigationController pushViewController:vc1 animated:YES];
}
//跳转至二头肌的视图
- (IBAction)goto2:(UIButton *)sender {
    MuscleViewController *vc2 = [[MuscleViewController alloc]init];
     vc2.flag = 102;
    vc2.arr1 = _arr;
    //[self presentViewController:vc2 animated:YES completion:nil];
    [self.navigationController pushViewController:vc2 animated:YES];
}
//跳转至背部的视图
- (IBAction)goto3:(UIButton *)sender {
    MuscleViewController *vc3 = [[MuscleViewController alloc]init];
     vc3.flag = 103;
    vc3.arr1 = _arr;
    //[self presentViewController:vc3 animated:YES completion:nil];
    [self.navigationController pushViewController:vc3 animated:YES];
}
//跳转至小腿的视图
- (IBAction)goto4:(UIButton *)sender {
    MuscleViewController *vc4 = [[MuscleViewController alloc]init];
    vc4.flag = 104;
    vc4.arr1 = _arr;
    //[self presentViewController:vc4 animated:YES completion:nil];
    [self.navigationController pushViewController:vc4 animated:YES];
}
//跳转至肩部的视图
- (IBAction)goto5:(UIButton *)sender {
    MuscleViewController *vc5 = [[MuscleViewController alloc]init];
    vc5.flag = 105;
    vc5.arr1 = _arr;
    //[self presentViewController:vc5 animated:YES completion:nil];
    [self.navigationController pushViewController:vc5 animated:YES];

}
//跳转至胸肌的视图
- (IBAction)goto6:(UIButton *)sender {
    MuscleViewController *vc6 = [[MuscleViewController alloc]init];
    vc6.flag = 106;
    vc6.arr1 = _arr;
    //[self presentViewController:vc6 animated:YES completion:nil];
    [self.navigationController pushViewController:vc6 animated:YES];

}
//跳转至前臂的视图
- (IBAction)goto7:(UIButton *)sender {
    MuscleViewController *vc7 = [[MuscleViewController alloc]init];
    vc7.flag = 107;
    vc7.arr1 = _arr;
    //[self presentViewController:vc7 animated:YES completion:nil];
    [self.navigationController pushViewController:vc7 animated:YES];
}
//跳转至腰腹的视图
- (IBAction)goto8:(UIButton *)sender {
    MuscleViewController *vc8 = [[MuscleViewController alloc]init];
    vc8.flag = 108;
    vc8.arr1 = _arr;
    //[self presentViewController:vc8 animated:YES completion:nil];
    [self.navigationController pushViewController:vc8 animated:YES];

}
//跳转至大腿的视图
- (IBAction)goto9:(UIButton *)sender {
    MuscleViewController *vc9 = [[MuscleViewController alloc]init];
    vc9.flag = 109;
    vc9.arr1 = _arr;
////进去后没有导航栏的跳转方法    [self presentViewController:vc9 animated:YES completion:nil];
    
    //进去后有导航栏的t跳转方法
    [self.navigationController pushViewController:vc9 animated:YES];
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
