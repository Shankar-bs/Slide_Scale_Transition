
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
