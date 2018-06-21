//
//  TransitionNavigationDelegate.h
//  ErectAnimation
//
//  Created by LTMAC on 2018/6/12.
//  Copyright © 2018年 LTMAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TransitionNavigationDelegate : NSObject<UINavigationControllerDelegate>

/** 转场过渡的图片 */
- (void)setTransitionImg:(UIImage *)transitionImg;
/** 转场过渡的图片 */
- (void)setFlipImg:(UIImage *)flipImg;

/** 转场前的图片frame */
- (void)setTransitionBeforeImgFrame:(CGRect)frame;
/** 转场后的图片frame */
- (void)setTransitionAfterImgFrame:(CGRect)frame;


@end
