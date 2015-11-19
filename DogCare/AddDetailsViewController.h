//
//  AddDetailsViewController.h
//  DogCare
//
//  Created by Weave Bytes Infotech on 13/11/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AddDetailsViewController : UIViewController<UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *birthDateTF;
@property (weak, nonatomic) IBOutlet UITextField *weightTF;
@property (weak, nonatomic) IBOutlet UITextField *withersTF;
@property (weak, nonatomic) IBOutlet UITextField *breedTF;
@property (weak, nonatomic) IBOutlet UITextField *chipTF;
@property (weak, nonatomic) IBOutlet UITextField *genderTF;
- (IBAction)birthDateAction:(id)sender;
- (IBAction)dateSectedAction:(id)sender;


@property UIView *datesView;
@property UIDatePicker *datePicker;
@property NSDateFormatter *dateFormater;
@property NSString *dateString;

@end
