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

`cellFrame` with is used to hold the frame of the collection view cell,
`startImageView` image view we are using for animation,
`cutomAnimationType` we are specifying which animation we are going to perform weather we are pushing or popping.

all other details of the project is described in the below blog, 

http://slicode.com/custom-transition-collection-view-ios/


final result of the project is like below

http://i1.wp.com/slicode.com/wp-content/uploads/2015/10/Upload_Result.gif

# Usage 

just add the `SlideScaleTransition` file to your project and follow the demo project which is well explined in the blog 






