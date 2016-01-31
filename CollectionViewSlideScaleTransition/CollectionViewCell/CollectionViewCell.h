//
//  CollectionViewCell.h
//  SSTransitionDemo
//
//  Created by Shankar B S on 15/08/15.
//  Copyright (c) 2015 SliCode. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CellDelegate;
@interface CollectionViewCell : UICollectionViewCell
@property (retain, nonatomic) IBOutlet UIImageView *aImageView;
@property (assign,nonatomic)  id<CellDelegate> cellDelegate;

+ (CollectionViewCell *)cell;
@end

@protocol CellDelegate <NSObject>
- (void)collectionViewCell:(CollectionViewCell *)cell selectTheImage:(UIImageView *)imageView;
@end

