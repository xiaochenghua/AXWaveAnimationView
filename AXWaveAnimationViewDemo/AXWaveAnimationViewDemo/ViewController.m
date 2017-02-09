//
//  ViewController.m
//  AXWaveAnimationViewDemo
//
//  Created by arnoldxiao on 2017/2/9.
//  Copyright © 2017年 arnoldxiao. All rights reserved.
//

#import "ViewController.h"
#import "AXWaveAnimationView.h"

@interface ViewController ()

@property (nonatomic, strong) AXWaveAnimationView *animationView;

@property (nonatomic, strong) UIButton *playButton;
@property (nonatomic, strong) UIButton *pauseButton;
@property (nonatomic, strong) UIButton *removeButton;

@end

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.animationView];
    [self.view addSubview:self.playButton];
    [self.view addSubview:self.pauseButton];
    [self.view addSubview:self.removeButton];
}

- (void)playButtonClick:(UIButton *)button {
    [self.animationView startWaveAnimation];
}

- (void)pauseButtonClick:(UIButton *)button {
    [self.animationView pauseWaveAnimation];
}

- (void)removeButtonClick:(UIButton *)button {
    [self.animationView removeWaveAnimation];
}

- (AXWaveAnimationView *)animationView {
    if (!_animationView) {
        _animationView = [[AXWaveAnimationView alloc] initWithFrame:CGRectMake(0, 100, kScreenWidth, 300)
                                                    backgroundColor:[UIColor lightGrayColor]
                                                          fillColor:[UIColor redColor]
                                                           autoPlay:YES];
    }
    return _animationView;
}

- (UIButton *)playButton {
    if (!_playButton) {
        _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _playButton.frame = CGRectMake(0, 420, (kScreenWidth - 2 * 20) / 3, 30);
        [_playButton setTitle:@"Play" forState:UIControlStateNormal];
        _playButton.backgroundColor = [UIColor lightGrayColor];
        [_playButton addTarget:self action:@selector(playButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _playButton;
}
- (UIButton *)pauseButton {
    if (!_pauseButton) {
        _pauseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _pauseButton.frame = CGRectMake((kScreenWidth - 2 * 20) / 3 + 20, 420, (kScreenWidth - 2 * 20) / 3, 30);
        [_pauseButton setTitle:@"Pause" forState:UIControlStateNormal];
        _pauseButton.backgroundColor = [UIColor lightGrayColor];
        [_pauseButton addTarget:self action:@selector(pauseButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pauseButton;
}
- (UIButton *)removeButton {
    if (!_removeButton) {
        _removeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _removeButton.frame = CGRectMake(((kScreenWidth - 2 * 20) / 3 + 20) * 2, 420, (kScreenWidth - 2 * 20) / 3, 30);
        [_removeButton setTitle:@"Remove" forState:UIControlStateNormal];
        _removeButton.backgroundColor = [UIColor lightGrayColor];
        [_removeButton addTarget:self action:@selector(removeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _removeButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
