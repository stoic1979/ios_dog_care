//
//  AddVaccinDetailsViewController.h
//  DogCare
//
//  Created by wb27 on 11/18/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddVaccinDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *vaccinScrollView;
@property (weak, nonatomic) IBOutlet UITextField *vaccinDateTF;
@property (weak, nonatomic) IBOutlet UITextField *vaccinNameTypeTF;
@property (weak, nonatomic) IBOutlet UITextField *vaccinVeternrianTF;
@property (weak, nonatomic) IBOutlet UITextField *vaccinReminderDateTF;
@property (weak, nonatomic) IBOutlet UITextView *vaccinNotesTV;

@property UIBarButtonItem *doneRtBarBtn;

@end
