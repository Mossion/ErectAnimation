//
//  ErectAnimationPop.m
//  ErectAnimation
//
//  Created by LTMAC on 2018/6/12.
//  Copyright © 2018年 LTMAC. All rights reserved.
//

#import "ErectAnimationPop.h"

@implementation ErectAnimationPop

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    
    // 转场过去的容器view
    UIView *container = transitionContext.containerView;
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *toView = toVC.view;
    [container addSubview:toView];
    
    
    UIView *imgBgWhiteView = [[UIView alloc] initWithFrame:self.transitionBeforeImgFrame];
    imgBgWhiteView.backgroundColor = [UIColor whiteColor];
    [container addSubview:imgBgWhiteView];
    
    // 渐变黑色背景
    UIView *bgView = [[UIView alloc] initWithFrame:container.bounds];
    bgView.backgroundColor = [UIColor blackColor];
    bgView.alpha = 1;
    [container addSubview:bgView];
    
    // 过渡的图片
    UIImageView *transitionImgView = [[UIImageView alloc] initWithImage:self.flipImg];
    transitionImgView.frame = container.bounds;
    [container addSubview:transitionImgView];
    
    UIImageView *flipView = [[UIImageView alloc] initWithImage:self.transitioImg];
    [container addSubview:flipView];
    flipView.layer.anchorPoint = CGPointMake(0, 0.5);
    flipView.layer.transform = [self getTransForm3DWithAngle:-M_PI_2 - M_PI_4 / 2];
    flipView.frame = CGRectMake(0, 0, container.frame.size.width * 0.7, container.frame.size.height);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        transitionImgView.frame = self.transitionBeforeImgFrame;
        flipView.layer.transform = [self getTransForm3DWithAngle:0];
        flipView.frame = self.transitionBeforeImgFrame;
        bgView.alpha = 0;
        
    } completion:^(BOOL finished) {
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        
        [imgBgWhiteView removeFromSuperview];
        [bgView removeFromSuperview];
        [transitionImgView removeFromSuperview];
        
        [transitionContext completeTransition:!wasCancelled];
        
    }];
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.7;
}

- (CATransform3D)getTransForm3DWithAngle:(CGFloat)angle {
    // 获取一个标准默认的CATransform3D仿射变换矩阵
    CATransform3D transform = CATransform3DIdentity;
    
    // 透视效果
    transform.m34 = 4.5 / -2000;
    
    // 获取旋转angle角度后的rotation矩阵
    transform = CATransform3DRotate(transform, angle, 0, 1, 0);
    
    return transform;
    
    
}

@end
