//
//  TransitionNavigationDelegate.m
//  ErectAnimation
//
//  Created by LTMAC on 2018/6/12.
//  Copyright © 2018年 LTMAC. All rights reserved.
//

#import "TransitionNavigationDelegate.h"
#import "ErectAnimationPush.h"
#import "ErectAnimationPop.h"

@interface TransitionNavigationDelegate ()

@property (nonatomic, strong) ErectAnimationPush *customPush;
@property (nonatomic, strong) ErectAnimationPop *customPop;

@end

@implementation TransitionNavigationDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    if (operation == UINavigationControllerOperationPush) {
        return self.customPush;
    }
    else if (operation == UINavigationControllerOperationPop) {
        return self.customPop;
    }
    else {
        return nil;        
    }
    
}

/** 转场过渡的图片 */
- (void)setTransitionImg:(UIImage *)transitionImg{
    self.customPush.transitionImg = transitionImg;
    self.customPop.transitioImg = transitionImg;
    
}
- (void)setFlipImg:(UIImage *)flipImg{
    self.customPush.flipImg = flipImg;
    self.customPop.flipImg = flipImg;
    
}
/** 转场前的图片frame */
- (void)setTransitionBeforeImgFrame:(CGRect)frame{
    
    self.customPush.transitionBeforeImgFrame = frame;
    
    self.customPop.transitionBeforeImgFrame = frame;
}

/** 转场后的图片frame */
- (void)setTransitionAfterImgFrame:(CGRect)frame{
    self.customPush.transitionAfterImgFrame = frame;
    self.customPop.transitionAfterImgFrame = frame;
    
}

- (ErectAnimationPush *)customPush {
    if (_customPush == nil) {
        _customPush = [[ErectAnimationPush alloc] init];
    }
    return _customPush;
}

- (ErectAnimationPop *)customPop {
    if (_customPop == nil) {
        _customPop = [[ErectAnimationPop alloc] init];
    }
    return _customPop;
}

@end
