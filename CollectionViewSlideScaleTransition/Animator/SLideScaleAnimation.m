//
//  Copyright (c) 2015 SliCode. All rights reserved.
/*
 The MIT License (MIT)
 
 Copyright (c) 2015 Slicode.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */


#import "SLideScaleAnimation.h"

@implementation SLideScaleAnimation
static UIView *backGroundView = nil;
- (instancetype)init
{
    self = [super init];
    if(self)
    {
    }
    return self;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //get the container view
    UIView *containerView = [transitionContext containerView];
    
    //get the reference to FromViewController and ToViewControllerKey
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromControllerView = nil;
    UIView *toControllerView   = nil;
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) //for iOS 8
    {
        fromControllerView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toControllerView = [transitionContext viewForKey:UITransitionContextToViewKey];
    }
    else //for iOS 7
    {
        fromControllerView = fromViewController.view;
        toControllerView = toViewController.view;
    }
    
    //suppose we pushign the controller
    if (self.cutomAnimationType == CustomAnimationTypePush)
    {
        if(backGroundView == nil)
        {
            backGroundView = [[UIView alloc]initWithFrame:containerView.bounds];
            backGroundView.backgroundColor = [UIColor colorWithWhite:0.6 alpha:0.6];
        }
        
        [containerView addSubview:backGroundView];
        _startImageView.frame = self.cellFrame;
        [containerView addSubview:_startImageView];
        [UIView animateWithDuration:0.3 animations:^{
            _startImageView.center = containerView.center; //first moving that cell's image view to center
        } completion:^(BOOL finished) {
            //after completion we are making the this imageview to zoom and also we are stting its alpha to aero
            [UIView animateWithDuration:0.2 animations:^{
                _startImageView.frame = containerView.bounds;
                _startImageView.alpha = 0.0f;
            } completion:^(BOOL finished) {
                [_startImageView removeFromSuperview]; //after completion remove it from super view
                [backGroundView removeFromSuperview]; //after completion remove it from super view
                [containerView addSubview:toControllerView]; //add the toControllerView to container
                [transitionContext completeTransition:YES]; //this is to indicate transition is complete
            }];
        }];
    }
    else //suppose we are poppingt the view controller
    {
        [containerView addSubview:backGroundView]; //add the background view
        [containerView addSubview:_startImageView]; //add the _startImageView which is currently frame is same as full screen
        [UIView animateWithDuration:0.3 animations:^{
            _startImageView.frame = self.cellFrame; //animate it back to collection view cell frame
            _startImageView.alpha = 1.0f; //set its alpha to 1.0f
            
        } completion:^(BOOL finished) {
            [backGroundView removeFromSuperview];   //afer completion remove it from super view
            [containerView addSubview:toControllerView]; //add the container to toControllerView
            [transitionContext completeTransition:YES]; //this is to indicate transition is complete
        }];
    }
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.4;
}

@end
