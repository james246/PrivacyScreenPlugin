/**
 * PrivacyScreenPlugin.m
 * Created by Tommy-Carlos Williams on 18/07/2014
 * Copyright (c) 2014 Tommy-Carlos Williams. All rights reserved.
 * MIT Licensed
 */
#import "PrivacyScreenPlugin.h"

static UIImageView *imageView;

@implementation PrivacyScreenPlugin

- (void)pluginInitialize
{
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onAppDidBecomeActive:)
                                               name:UIApplicationDidBecomeActiveNotification object:nil];

  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onAppWillResignActive:)
                                               name:UIApplicationWillResignActiveNotification object:nil];
}

- (void)onAppDidBecomeActive:(UIApplication *)application
{
  [imageView removeFromSuperview];
}

- (void)onAppWillResignActive:(UIApplication *)application
{
  imageView = [[UIImageView alloc]initWithFrame:[self.viewController.view bounds]];
  imageView.backgroundColor = [UIColor blackColor];

  #ifdef __CORDOVA_4_0_0
      [[UIApplication sharedApplication].keyWindow addSubview:imageView];
  #else
      [self.viewController.view addSubview:imageView];
  #endif
}

@end
