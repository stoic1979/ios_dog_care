//
//  AddMedicineAdminDetailsViewController.h
//  DogCare
//
//  Created by wb27 on 11/18/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddMedicineAdminDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *medScrollView;
@property (weak, nonatomic) IBOutlet UITextField *medicationNameTF;
@property (weak, nonatomic) IBOutlet UITextField *firstAdmistrtnDateTF;
@property (weak, nonatomic) IBOutlet UITextField *lastAdmistrtnDateTF;
@property (weak, nonatomic) IBOutlet UITextField *medicineFreqncyTF;
@property (weak, nonatomic) IBOutlet UITextField *medicineDoseTF;
@property (weak, nonatomic) IBOutlet UITextField *medicineVeternrianTF;
@property (weak, nonatomic) IBOutlet UITextView *medicineNotesTV;

@property UIBarButtonItem *doneRtBarBtn;

@end
