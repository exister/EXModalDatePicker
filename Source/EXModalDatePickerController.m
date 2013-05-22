#import "EXModalDatePickerController.h"

@implementation EXModalDatePickerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
	self.coverView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.coverView.userInteractionEnabled = YES;
    self.view.userInteractionEnabled = YES;

	self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

	self.coverView.backgroundColor = UIColor.blackColor;
	self.coverView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.datePicker.date = [NSDate date];
    
	for (UIView *subview in self.datePicker.subviews) {
		subview.frame = self.datePicker.bounds;
	}    
}

- (void)viewDidUnload {
	self.coverView = nil;
    self.datePicker = nil;
	self.delegate = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (IBAction)onDateEditCancelClicked:(id)sender {
    DDLogInfo(@"onDateEditCancelClicked");
    
    if([self.delegate respondsToSelector:@selector(datePickerCancel:)]) {
		[self.delegate datePickerCancel:self];
	}
}

- (IBAction)onDateEditSaveClicked:(id)sender {
    DDLogInfo(@"onDateEditSaveClicked");
    
    if([self.delegate respondsToSelector:@selector(datePickerSetDate:)]) {
		[self.delegate datePickerSetDate:self];
	}
}

@end
