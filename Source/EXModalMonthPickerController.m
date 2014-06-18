//
//  EXModalMonthPickerController.m
//  EXModalDatePickerDemo
//
//  Created by Mikhail Kuznetsov on 18.06.14.
//  Copyright (c) 2014 mkuznetsov. All rights reserved.
//

#import "EXModalMonthPickerController.h"
#import "NTMonthYearPicker.h"

@interface EXModalMonthPickerController ()
@property (weak, nonatomic) IBOutlet UIView *pickerContainer;

@end

@implementation EXModalMonthPickerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.datePicker = [[NTMonthYearPicker alloc] init];
//    [self.datePicker addTarget:self action:@selector(onDatePicked:) forControlEvents:UIControlEventValueChanged];
    self.datePicker.datePickerMode = NTMonthYearPickerModeMonthAndYear;
    
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

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.datePicker.frame = self.pickerContainer.bounds;
    [self.pickerContainer addSubview:self.datePicker];
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (IBAction)onDateEditCancelClicked:(id)sender {
    if([self.delegate respondsToSelector:@selector(monthPickerCancel:)]) {
		[self.delegate monthPickerCancel:self];
	}
}

- (IBAction)onDateEditSaveClicked:(id)sender {
    if([self.delegate respondsToSelector:@selector(monthPickerSetDate:)]) {
		[self.delegate monthPickerSetDate:self];
	}
}

@end
