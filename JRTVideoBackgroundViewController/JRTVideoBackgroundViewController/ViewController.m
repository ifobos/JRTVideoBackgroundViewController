//
//  ViewController.m
//  JRTVideoBackgroundViewController
//
//  Created by Juan Garcia on 5/26/16.
//  Copyright © 2016 jerti. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *test = [[NSBundle mainBundle] pathForResource:@"Video" ofType:@"mp4"];
    self.videoPath = test;
    [self play];
}

- (IBAction)pauseAction:(id)sender {
    [self pause];
}

- (IBAction)playAction:(id)sender {
    [self play];
}

@end
