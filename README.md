# Slide_Scale_Transition
Custom Transition using collection view 

In this we are using the custom transitions introduced in iOS7, by using the `UINavigationControllerDelegate` that is 

`-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController 
animationControllerForOperation:(UINavigationControllerOperation)operation
fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC`

so in the code we are dfining the enu specify for push or pop the view controller

`typedef enum {
  CustomAnimationTypePush,
  CustomAnimationTypePop
  } SLideScaleAnimationType;`
  
  in the transition we are tracking the following the information of the cell
  
  
