//
//  FirstViewController.m
//  ErectAnimation
//
//  Created by LTMAC on 2018/6/12.
//  Copyright © 2018年 LTMAC. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "TransitionNavigationDelegate.h"

@interface FirstViewController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, strong) TransitionNavigationDelegate *transitionDelegate;

@end

@implementation FirstViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.transitionDelegate = nil;
    self.navigationController.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    self.navigationController.navigationBarHidden = YES;
    
    // 导航栏隐藏之后，需要设置该代理来恢复手势返回功能
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    self.navigationController.delegate = self;
    
    [self.view addSubview:self.iconImgView];
    self.iconImgView.frame = CGRectMake(100, 100, 80, 120);
    self.iconImgView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnIconImageView)];
    [self.iconImgView addGestureRecognizer:tap];
}

- (void)tapOnIconImageView {
    NSLog(@"点击");
    
    self.transitionDelegate = nil;
    self.navigationController.delegate = self.transitionDelegate;
    
    
    UIImage *contentImage = [UIImage imageNamed:@"002"];
    [self.transitionDelegate setFlipImg:contentImage];
    
    
    [self.transitionDelegate setTransitionBeforeImgFrame:self.iconImgView.frame];
    [self.transitionDelegate setTransitionImg:self.iconImgView.image];
    
    
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
    
    
}

- (UIImageView *)iconImgView {
    if (_iconImgView == nil) {
        _iconImgView = [[UIImageView alloc] init];
        _iconImgView.image = [UIImage imageNamed:@"001"];
    }
    return _iconImgView;
}

- (TransitionNavigationDelegate *)transitionDelegate {
    if (_transitionDelegate == nil) {
        _transitionDelegate = [[TransitionNavigationDelegate alloc] init];
    }
    return _transitionDelegate;
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
