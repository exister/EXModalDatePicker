#import <Foundation/Foundation.h>

@protocol EXModalDatePickerControllerDelegate;


@interface EXModalDatePickerController : UIViewController

@property (nonatomic, weak) IBOutlet id<EXModalDatePickerControllerDelegate> delegate;
@property (nonatomic, strong) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, strong) UIView *coverView;

- (IBAction)onDateEditCancelClicked:(id)sender;
- (IBAction)onDateEditSaveClicked:(id)sender;

@end


@protocol EXModalDatePickerControllerDelegate <NSObject>
- (void)datePickerSetDate:(EXModalDatePickerController *)viewController;
- (void)datePickerCancel:(EXModalDatePickerController *)viewController;
@end