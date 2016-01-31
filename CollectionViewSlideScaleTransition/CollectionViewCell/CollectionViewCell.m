//
//  CollectionViewCell.m
//  SSTransitionDemo
//
//  Created by Shankar B S on 15/08/15.
//  Copyright (c) 2015 SliCode. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

+ (CollectionViewCell *)cell
{
    NSArray *resultantNibs = [[NSBundle mainBundle] loadNibNamed:@"CollectionViewCell" owner:nil options:nil];
        
    if ([resultantNibs count] < 1) {
        return nil;
    }
    if (![[resultantNibs objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
        return nil;
    }
    return [resultantNibs objectAtIndex:0]; //ARC
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self = [CollectionViewCell cell];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageTapped)];
        self.aImageView.userInteractionEnabled = YES;
        [self.aImageView addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
    self.aImageView.hidden = NO;
}

- (void)imageTapped
{
    if ([self.cellDelegate respondsToSelector:@selector(collectionViewCell:selectTheImage:)])
    {
        [self.cellDelegate collectionViewCell:self selectTheImage:self.aImageView];
    }
}


@end
