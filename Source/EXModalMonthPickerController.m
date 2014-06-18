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
    [self.pickerContainer addSubview:self.datePicker];
    
	self.coverView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.coverView.userInteractionEnabled = YES;
    self.view.userInteractionEnabled = YES;
    
	self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
	self.coverView.backgroundColor = UIColor.blackColor;
	self.coverView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.datePicker.date = [NSDate date];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.datePicker.frame = self.pickerContainer.bounds;
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
