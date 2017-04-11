//
//  FJProgressView.m
//  FJMaskImageView
//
//  Created by fujin on 17/3/24.
//  Copyright © 2017年 fujin. All rights reserved.
//

#import "FJProgressView.h"
@interface FJProgressView ()

@property (nonatomic, strong) UIImageView *emptyImageView;

@property (nonatomic, strong) UIImageView *fullImageView;

@end

@implementation FJProgressView
#pragma init
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configImageView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self configImageView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self refreshProgress];
}

- (void)configImageView
{
    _emptyImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    
    _fullImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    
    [self addSubview:_emptyImageView];
    
    [self addSubview:_fullImageView];
    
    UIEdgeInsets padding = UIEdgeInsetsMake(0, 0, 0, 0);

    [self addConstraints:@[
                           [NSLayoutConstraint constraintWithItem:_emptyImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:padding.top],
                           [NSLayoutConstraint constraintWithItem:_emptyImageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:padding.top],
                           [NSLayoutConstraint constraintWithItem:_emptyImageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:padding.top],
                           [NSLayoutConstraint constraintWithItem:_emptyImageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:padding.top],
                           
                           [NSLayoutConstraint constraintWithItem:_fullImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:padding.top],
                           [NSLayoutConstraint constraintWithItem:_fullImageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:padding.top],
                           [NSLayoutConstraint constraintWithItem:_fullImageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:padding.top],
                           [NSLayoutConstraint constraintWithItem:_fullImageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:padding.top],
                           ]];
}

#pragma mark -refreshProgress
- (void)refreshProgress
{
    if (_progress >0 && _progress<1) {
        CALayer *maskLayer = [CALayer layer];
        maskLayer.frame = CGRectMake(0, CGRectGetHeight(_fullImageView.frame)*(1-_progress), CGRectGetWidth(_fullImageView.frame), CGRectGetHeight(_fullImageView.frame)*_progress);
        maskLayer.backgroundColor = [UIColor blackColor].CGColor;
        _fullImageView.layer.mask = maskLayer;
        _fullImageView.hidden = NO;
    } else if (_progress > 1) {
        _fullImageView.layer.mask = nil;
        _fullImageView.hidden = NO;
    } else {
        _fullImageView.layer.mask = nil;
        _fullImageView.hidden = YES;
    }
}

#pragma mark -set
- (void)setEmptySelectedImage:(UIImage *)emptySelectedImage
{
    if (_emptySelectedImage != emptySelectedImage) {
        _emptySelectedImage = emptySelectedImage;
        _emptyImageView.image = emptySelectedImage;
    }
}

- (void)setFullSelectedImage:(UIImage *)fullSelectedImage
{
    if (_fullSelectedImage != fullSelectedImage) {
        _fullSelectedImage = fullSelectedImage;
        _fullImageView.image = fullSelectedImage;
    }
}

- (void)setProgress:(CGFloat)progress
{
    if (_progress != progress) {
        _progress = progress;
        [self refreshProgress];
    }
}

@end
