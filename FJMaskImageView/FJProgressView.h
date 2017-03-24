//
//  FJProgressView.h
//  FJMaskImageView
//
//  Created by fujin on 17/3/24.
//  Copyright © 2017年 fujin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FJProgressView : UIView

@property (nonatomic ,strong) UIImage *emptySelectedImage;

@property (nonatomic ,strong) UIImage *fullSelectedImage;

// 0.0 ~ 1.0
@property (nonatomic, assign) CGFloat progress;

@end
