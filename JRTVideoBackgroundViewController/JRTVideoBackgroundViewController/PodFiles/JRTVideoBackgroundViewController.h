//
//  JRTVideoBackgroundViewController.h
//  EKVideoControllerExample
//
//  Created by Juan Garcia on 5/25/16.
//  Copyright © 2016 Ekhoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JRTVideoBackgroundViewController : UIViewController

/*!
 VideoPath can be a local file path or an URL.
 When it's setted, the view controller initialize and add the video to the view.
 */
@property(nonatomic, strong) NSString *videoPath;

/*!
 Determine how the view controller repeats the playback of the video.
 Default value is YES.
 */
@property(nonatomic, assign) BOOL repeat;

/*!
 Determine the speed of the video.
 Default value is 1.0f;
 */
@property(nonatomic, assign) CGFloat videoSpeed;

/*!
 Determine the mask color.
 Default value is [UIColor clearColor].
 */
@property(nonatomic, strong) UIColor *maskTintColor;

/*!
 Determine the transparency of the mask.
 Default value is 0.0f.
 */
@property(nonatomic, assign) CGFloat maskAlpha;

/*!
 Play the video.
 */
- (void)play;

/*!
 Stop the video.
 */
- (void)stop;

/*!
 Pause the video.
 */
- (void)pause;

@end
