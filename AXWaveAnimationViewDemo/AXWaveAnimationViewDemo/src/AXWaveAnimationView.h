//
//  AXWaveAnimationView.h
//
//  Created by arnoldxiao on 8/22/16.
//  Copyright © 2016 arnoldxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AXWaveAnimationView : UIView
/**
 *  动画是否正在进行
 */
@property (nonatomic, assign, readonly, getter=isAnimating) BOOL animating;

/**
 初始化View

 @param frame frame
 @param backgroundColor 背景颜色
 @param fillColor 填充颜色
 @param autoPlay 是否自动播放
 */
- (instancetype)initWithFrame:(CGRect)frame
              backgroundColor:(UIColor *)backgroundColor
                    fillColor:(UIColor *)fillColor
                    autoPlay:(BOOL)autoPlay;

/**
 *  开始动画
 */
- (void)startWaveAnimation;

/**
 *  暂停动画，继续动画时不会归零offsetX
 */
- (void)pauseWaveAnimation;

/**
 *  移除动画，下次开始动画时将归零offsetX
 */
- (void)removeWaveAnimation;
@end

NS_ASSUME_NONNULL_END
