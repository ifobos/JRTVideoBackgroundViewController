//
//  JRTVideoBackgroundViewController.m
//  EKVideoControllerExample
//
//  Created by Juan Garcia on 5/25/16.
//  Copyright © 2016 Ekhoo. All rights reserved.
//

@import MediaPlayer;

#import "JRTVideoBackgroundViewController.h"

@interface JRTVideoBackgroundViewController ()
@property(nonatomic, strong) MPMoviePlayerController *moviePlayer;
@property(nonatomic, strong) UIView                  *moviePlayerMask;

@end

@implementation JRTVideoBackgroundViewController

@synthesize videoSpeed = _videoSpeed;
@synthesize maskTintColor = _maskTintColor;
@synthesize repeat =_repeat;

#pragma mark - Getters

- (CGFloat)videoSpeed {
    if (_videoSpeed == 0) {
        _videoSpeed = 1;
    }
    return _videoSpeed;
}

- (UIColor *)maskTintColor {
    if (!_maskTintColor) {
        _maskTintColor = [UIColor clearColor];
    }
    return _maskTintColor;
}

- (BOOL)repeat {
    
    if (self.videoPath == nil) {
        _repeat = YES;
    }
    return _repeat;
}

#pragma mark - Setters

- (void)setVideoPath:(NSString *)videoPath {
    NSParameterAssert(videoPath);
    [self buildMoviePlayerWithVideoPath:videoPath];
    _videoPath = videoPath;
}

- (void)setRepeat:(BOOL)repeat {
    NSParameterAssert(self.moviePlayer);
    
    _repeat = repeat;
    
    _moviePlayer.repeatMode = repeat ? MPMovieRepeatModeOne : MPMovieRepeatModeNone;
}

- (void)setVideoSpeed:(CGFloat)videoSpeed {
    NSParameterAssert(self.moviePlayer);
    
    _videoSpeed                          = videoSpeed;
    self.moviePlayer.currentPlaybackRate = _videoSpeed;
}

- (void)setMaskTintColor:(UIColor *)maskTintColor {
    _maskTintColor = maskTintColor;
    
    _moviePlayerMask.backgroundColor = _maskTintColor;
}

- (void)setMaskAlpha:(CGFloat)maskAlpha {
    _maskAlpha = maskAlpha;
    
    _moviePlayerMask.alpha = _maskAlpha;
}

#pragma mark - Helpers

- (void)buildMoviePlayerWithVideoPath:(NSString *)videoPath {
    
    if (self.moviePlayer) {
        [self.moviePlayer stop];
        [self.moviePlayer.view removeFromSuperview];
        self.moviePlayer = nil;
    }

    self.moviePlayer                     = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:videoPath]];
    self.moviePlayer.view.frame          = [[UIScreen mainScreen] bounds];
    self.moviePlayer.fullscreen          = YES;
    self.moviePlayer.controlStyle        = MPMovieControlStyleNone;
    self.moviePlayer.scalingMode         = MPMovieScalingModeAspectFill;
    self.moviePlayer.repeatMode          = self.repeat ? MPMovieRepeatModeOne : MPMovieRepeatModeNone;
    self.moviePlayer.currentPlaybackRate = self.videoSpeed;
    
    if (self.moviePlayerMask) {
        [self.moviePlayerMask removeFromSuperview];
        self.moviePlayerMask = nil;
    }
    
    self.moviePlayerMask                 = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.moviePlayerMask.alpha           = self.maskAlpha;
    self.moviePlayerMask.backgroundColor = self.maskTintColor;
    
    [self.view addSubview:self.moviePlayer.view];
    [self.view addSubview:self.moviePlayerMask];
    [self.view sendSubviewToBack:self.moviePlayerMask];
    [self.view sendSubviewToBack:self.moviePlayer.view];
}


#pragma mark - Video controls

- (void)play {
    NSParameterAssert(self.moviePlayer);
    [self.moviePlayer play];
}

- (void)stop {
    NSParameterAssert(self.moviePlayer);
    [self.moviePlayer stop];
}

- (void)pause {
    NSParameterAssert(self.moviePlayer);
    [self.moviePlayer pause];
}

#pragma mark - View Controller

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        self.moviePlayer.view.frame = [[UIScreen mainScreen] bounds];
        self.moviePlayerMask.frame = [[UIScreen mainScreen] bounds];
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
    }];
}

@end
