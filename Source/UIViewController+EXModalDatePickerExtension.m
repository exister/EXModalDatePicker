#import "UIViewController+EXModalDatePickerExtension.h"
#import <objc/runtime.h>

static char kEXModalDatePickerControllerObjectKey;

//@interface UIViewController ()
//- (void)showModalDatePicker:(EXModalDatePickerController *)controller;
//
//- (void)showModalDatePicker:(EXModalDatePickerController *)controller inView:(UIView *)rootView;
//
//- (void)hideModalDatePicker:(EXModalDatePickerController *)controller;
//
//- (void)hideModalDatePickerStopped:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context;
//
//- (CGPoint)offScreenCenter;
//@end

@implementation UIViewController (EXModalDatePickerExtension)

- (void)setExDatePickerController:(EXModalDatePickerController *)controller
{
    objc_setAssociatedObject(self, &kEXModalDatePickerControllerObjectKey, controller, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (EXModalDatePickerController *)exDatePickerController
{
    return objc_getAssociatedObject(self, &kEXModalDatePickerControllerObjectKey);
}

- (void)showModalDatePicker {
    self.exDatePickerController = [[EXModalDatePickerController alloc] initWithNibName:@"EXModalDatePickerController" bundle:nil];
    self.exDatePickerController.delegate = (id <EXModalDatePickerControllerDelegate>) self;
    [self showModalDatePicker:self.exDatePickerController];
}

- (void)showModalDatePicker:(EXModalDatePickerController *)controller {
    [self showModalDatePicker:controller inView:UIApplication.sharedApplication.delegate.window.rootViewController.view];
}

- (void)showModalDatePicker:(EXModalDatePickerController *)controller inView:(UIView *)rootView {

	UIView *modalView = controller.view;
	UIView *coverView = controller.coverView;
    
	coverView.frame = rootView.bounds;
    coverView.alpha = 0.0f;
    
    modalView.frame = rootView.bounds;
    //place view beyond screen to perform slide in animation
	modalView.center = self.offScreenCenter;
	
	[rootView addSubview:coverView];
	[rootView addSubview:modalView];
	
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.6];
	
    //slide in
	modalView.frame = CGRectMake(0, 0, modalView.frame.size.width, modalView.frame.size.height);
	coverView.alpha = 0.5;
    
	[UIView commitAnimations];
}

- (void)hideModalDatePicker {
    [self hideModalDatePicker:self.exDatePickerController];
}

- (void)hideModalDatePicker:(EXModalDatePickerController *)controller {
	double animationDelay = 0.7;
	
    UIView *modalView = controller.view;
	UIView *coverView = controller.coverView;

	[UIView beginAnimations:nil context:(__bridge void *)(modalView)];
	[UIView setAnimationDuration:animationDelay];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(hideModalDatePickerStopped:finished:context:)];
	
    //slide out
    modalView.center = self.offScreenCenter;
	coverView.alpha = 0.0f;

	[UIView commitAnimations];

	[coverView performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:animationDelay];

}

- (void)hideModalDatePickerStopped:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
	UIView *modalView = (__bridge UIView *)context;
	[modalView removeFromSuperview];
}

- (CGPoint)offScreenCenter {
    CGPoint offScreenCenter = CGPointZero;
    
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    CGSize offSize = UIScreen.mainScreen.bounds.size;
    
	if (orientation == UIDeviceOrientationLandscapeLeft || orientation == UIDeviceOrientationLandscapeRight) {
		offScreenCenter = CGPointMake(offSize.height / 2.0, offSize.width * 1.5);
	}
    else {
		offScreenCenter = CGPointMake(offSize.width / 2.0, offSize.height * 1.5);
	}
    
    return offScreenCenter;
}

@end
