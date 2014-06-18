//
//  UIViewController+EXModalMonthPickerExtension.h
//  EXModalDatePickerDemo
//
//  Created by Mikhail Kuznetsov on 18.06.14.
//  Copyright (c) 2014 mkuznetsov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EXModalMonthPickerController.h"

@interface UIViewController (EXModalMonthPickerExtension)

@property (nonatomic, strong) EXModalMonthPickerController *exMonthPickerController;

- (void)showModalMonthPicker;
- (void)hideModalMonthPicker;


@end
