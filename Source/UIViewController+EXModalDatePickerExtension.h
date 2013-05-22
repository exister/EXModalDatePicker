#import <Foundation/Foundation.h>
#import "EXModalDatePickerController.h"

@interface UIViewController (EXModalDatePickerExtension)

@property (nonatomic, strong) EXModalDatePickerController *exDatePickerController;

- (void)showModalDatePicker;
- (void)hideModalDatePicker;

@end
