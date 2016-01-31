//
//  ViewController.m
//  CollectionViewSlideScaleTransition
//
//  Created by Shankar B S on 17/10/15.
//  Copyright (c) 2015 SliCode. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Custom Transition";
    self.navigationController.delegate = self;
    slideScaleAnimator = [[SLideScaleAnimation alloc]init];
    [self.aCollectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"CELL"];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing  = 12.0f;
    layout.minimumLineSpacing       = 10.0f;
    layout.itemSize                 = CGSizeMake(120.0f, 160.0f);
    self.aCollectionView.collectionViewLayout = layout;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 17;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    if(cell == nil)
    {
        cell = [CollectionViewCell cell];
    }
    cell.aImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"cell_%ld.jpg",(long)indexPath.row]];
    cell.cellDelegate = self;
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
  return  UIEdgeInsetsMake(20, 20, 20, 20);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(150, 170);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 30.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 30.0f;
}

- (void)collectionViewCell:(CollectionViewCell *)cell selectTheImage:(UIImageView *)imageView
{
    NSIndexPath *selectedIndexPath = [self.aCollectionView indexPathForCell:cell];
    UIImageView *selectedImageView = [[UIImageView alloc]initWithImage:imageView.image];
    imageView.hidden = NO;
    CGRect cellRect = [self.aCollectionView convertRect:cell.frame toView:self.navigationController.view];
    slideScaleAnimator.cellFrame  = cellRect;
    slideScaleAnimator.startImageView = selectedImageView;
    selectedCell = cell;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailViewController *detailController = (DetailViewController *)[storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    detailController.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"image_%ld.jpg",(long)selectedIndexPath.row]];
    [self.navigationController pushViewController:detailController animated:YES];
}

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    switch (operation)
    {
        case UINavigationControllerOperationPush:
            slideScaleAnimator.cutomAnimationType = CustomAnimationTypePush;
            return  slideScaleAnimator;
        case UINavigationControllerOperationPop:
            slideScaleAnimator.cutomAnimationType = CustomAnimationTypePop;
            return slideScaleAnimator;
        default: return nil;
    }
}
@end
