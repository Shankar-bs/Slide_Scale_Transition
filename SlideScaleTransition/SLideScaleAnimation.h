//
//  SLideScaleAnimation.h
//  SSTransitionDemo
//
//  Created by Shankar B S on 16/08/15.
//  Copyright (c) 2015 SliCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum
{
    CustomAnimationTypePush,
    CustomAnimationTypePop
} SLideScaleAnimationType;

@interface SLideScaleAnimation : NSObject<UIViewControllerAnimatedTransitioning>
{
    
}
@property (nonatomic, assign) CGRect cellFrame;
@property (nonatomic, retain) UIImageView *startImageView;
@property (nonatomic, assign) SLideScaleAnimationType  cutomAnimationType;
@end
