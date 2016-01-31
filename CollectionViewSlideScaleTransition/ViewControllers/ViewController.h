//
//  ViewController.h
//  CollectionViewSlideScaleTransition
//
//  Created by Shankar B S on 17/10/15.
//  Copyright (c) 2015 SliCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"
#import "SLideScaleAnimation.h"
#import "DetailViewController.h"

@interface ViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate,CellDelegate,UINavigationControllerDelegate,UICollectionViewDelegateFlowLayout>
{
    SLideScaleAnimation *slideScaleAnimator;
    CollectionViewCell  *selectedCell;
}
@property (retain, nonatomic) IBOutlet UICollectionView *aCollectionView;
@end


