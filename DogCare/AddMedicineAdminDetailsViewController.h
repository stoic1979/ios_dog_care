//
//  AddMedicineAdminDetailsViewController.h
//  DogCare
//
//  Created by wb27 on 11/18/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddMedicineAdminDetailsViewController : UIViewController<UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *medScrollView;
@property (weak, nonatomic) IBOutlet UITextField *medicationNameTF;
@property (weak, nonatomic) IBOutlet UITextField *firstAdmistrtnDateTF;
@property (weak, nonatomic) IBOutlet UITextField *lastAdmistrtnDateTF;
@property (weak, nonatomic) IBOutlet UITextField *medicineFreqncyTF;
@property (weak, nonatomic) IBOutlet UITextField *medicineDoseTF;
@property (weak, nonatomic) IBOutlet UITextField *medicineVeternrianTF;
@property (weak, nonatomic) IBOutlet UITextView *medicineNotesTV;

@property UIBarButtonItem *doneRtBarBtn;

@property NSMutableArray *medAdmitrnAry;

@property (weak, nonatomic) IBOutlet UIButton *frstAdmntrnDateCalndr;
@property (weak, nonatomic) IBOutlet UIButton *lastAdmntrnDateCalndr;
@property (weak, nonatomic) IBOutlet UIButton *frstAdmntrnDateSelctn;
@property (weak, nonatomic) IBOutlet UIButton *lastAdmntrnDateSelctn;


- (IBAction)calnderBtnAction:(id)sender;
- (IBAction)dateSelectBtnAction:(id)sender;

@property UIView *datesView;
@property UIDatePicker *datePicker;
@property NSDateFormatter *dateFormater;
@property NSString *dateString;

@property int dateResult;



@end
