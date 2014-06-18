//
//  EXModalMonthPickerController.h
//  EXModalDatePickerDemo
//
//  Created by Mikhail Kuznetsov on 18.06.14.
//  Copyright (c) 2014 mkuznetsov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol EXModalMonthPickerControllerDelegate;
@class NTMonthYearPicker;

@interface EXModalMonthPickerController : UIViewController

@property (nonatomic, weak) IBOutlet id<EXModalMonthPickerControllerDelegate> delegate;
@property (nonatomic, strong) NTMonthYearPicker *datePicker;
@property (nonatomic, strong) UIView *coverView;

- (IBAction)onDateEditCancelClicked:(id)sender;
- (IBAction)onDateEditSaveClicked:(id)sender;

@end


@protocol EXModalMonthPickerControllerDelegate <NSObject>
- (void)monthPickerSetDate:(EXModalMonthPickerController *)viewController;
- (void)monthPickerCancel:(EXModalMonthPickerController *)viewController;
@end