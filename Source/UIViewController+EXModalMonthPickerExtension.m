//
//  UIViewController+EXModalMonthPickerExtension.m
//  EXModalDatePickerDemo
//
//  Created by Mikhail Kuznetsov on 18.06.14.
//  Copyright (c) 2014 mkuznetsov. All rights reserved.
//

#import "UIViewController+EXModalMonthPickerExtension.h"
#import <objc/runtime.h>

static char kEXModalMonthPickerControllerObjectKey;

@implementation UIViewController (EXModalMonthPickerExtension)

- (void)setExMonthPickerController:(EXModalMonthPickerController *)controller
{
    objc_setAssociatedObject(self, &kEXModalMonthPickerControllerObjectKey, controller, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (EXModalMonthPickerController *)exMonthPickerController
{
    return objc_getAssociatedObject(self, &kEXModalMonthPickerControllerObjectKey);
}

- (void)showModalMonthPicker {
    self.exMonthPickerController = [[EXModalMonthPickerController alloc] initWithNibName:@"EXModalMonthPickerController" bundle:nil];
    self.exMonthPickerController.delegate = (id <EXModalMonthPickerControllerDelegate>) self;
    [self showModalMonthPicker:self.exMonthPickerController];
}

- (void)showModalMonthPicker:(EXModalMonthPickerController *)controller {
    [self showModalMonthPicker:controller inView:UIApplication.sharedApplication.delegate.window.rootViewController.view];
}

- (void)showModalMonthPicker:(EXModalMonthPickerController *)controller inView:(UIView *)rootView {
    
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

- (void)hideModalMonthPicker {
    [self hideModalMonthPicker:self.exMonthPickerController];
}

- (void)hideModalMonthPicker:(EXModalMonthPickerController *)controller {
	double animationDelay = 0.7;
	
    UIView *modalView = controller.view;
	UIView *coverView = controller.coverView;
    
	[UIView beginAnimations:nil context:(__bridge void *)(modalView)];
	[UIView setAnimationDuration:animationDelay];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(hideModalMonthPickerStopped:finished:context:)];
	
    //slide out
    modalView.center = self.offScreenCenter;
	coverView.alpha = 0.0f;
    
	[UIView commitAnimations];
    
	[coverView performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:animationDelay];
    
}

- (void)hideModalMonthPickerStopped:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
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
