//
//  ErectAnimationPop.h
//  ErectAnimation
//
//  Created by LTMAC on 2018/6/12.
//  Copyright © 2018年 LTMAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ErectAnimationPop : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, strong) UIImage *transitioImg;

@property (nonatomic, strong) UIImage *flipImg;

@property (nonatomic, assign) CGRect transitionBeforeImgFrame;

@property (nonatomic, assign) CGRect transitionAfterImgFrame;


@end
