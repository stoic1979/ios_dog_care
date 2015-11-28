//
//  AddVaccinDetailsViewController.h
//  DogCare
//
//  Created by wb27 on 11/18/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddVaccinDetailsViewController : UIViewController<UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *vaccinScrollView;
@property (weak, nonatomic) IBOutlet UITextField *vaccinDateTF;
@property (weak, nonatomic) IBOutlet UITextField *vaccinNameTypeTF;
@property (weak, nonatomic) IBOutlet UITextField *vaccinVeternrianTF;
@property (weak, nonatomic) IBOutlet UITextField *vaccinReminderDateTF;
@property (weak, nonatomic) IBOutlet UITextView *vaccinNotesTV;

@property UIBarButtonItem *doneRtBarBtn;

@property NSMutableArray *vaccinDtlsAry;

@property (weak, nonatomic) IBOutlet UIButton *vaccintnDateCalndr;
@property (weak, nonatomic) IBOutlet UIButton *remndrDateCalndr;
@property (weak, nonatomic) IBOutlet UIButton *vaccintnDateSelctn;
@property (weak, nonatomic) IBOutlet UIButton *remndrDateSelctn;


- (IBAction)calnderBtnAction:(id)sender;
- (IBAction)dateSelectBtnAction:(id)sender;


@property UIView *datesView;
@property UIDatePicker *datePicker;
@property NSDateFormatter *dateFormater;
@property NSString *dateString;

@property int dateResult;


@end
