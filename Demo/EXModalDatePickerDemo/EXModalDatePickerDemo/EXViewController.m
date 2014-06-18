//
//  EXViewController.m
//  EXModalDatePickerDemo
//
//  Created by Mikhail Kuznetsov on 18.06.14.
//  Copyright (c) 2014 mkuznetsov. All rights reserved.
//

#import "EXViewController.h"
#import "UIViewController+EXModalDatePickerExtension.h"
#import "UIViewController+EXModalMonthPickerExtension.h"
#import "NTMonthYearPicker.h"

@interface EXViewController () <EXModalDatePickerControllerDelegate, EXModalMonthPickerControllerDelegate>

@end

@implementation EXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showDatePicker:(id)sender {
    [self showModalDatePicker];
}

- (IBAction)showMonthPicker:(id)sender {
    [self showModalMonthPicker];
}

#pragma mark - EXModalDatePickerControllerDelegate

- (void)datePickerSetDate:(EXModalDatePickerController *)viewController {
    [self hideModalDatePicker];
}

- (void)datePickerCancel:(EXModalDatePickerController *)viewController {
    [self hideModalDatePicker];
}

#pragma mark - EXModalMonthPickerControllerDelegate

- (void)monthPickerSetDate:(EXModalMonthPickerController *)viewController {
    [self hideModalMonthPicker];
}

- (void)monthPickerCancel:(EXModalMonthPickerController *)viewController {
    [self hideModalMonthPicker];
}


@end
