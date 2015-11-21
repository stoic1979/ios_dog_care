//
//  AddAntiparasiticsViewController.h
//  DogCare
//
//  Created by wb27 on 11/18/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddAntiparasiticsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *antiparasiticsScrollView;
@property (weak, nonatomic) IBOutlet UITextField *antiprsitcsTreatmntNameTF;
@property (weak, nonatomic) IBOutlet UITextField *antiprsitcsTreatmntTypeTF;
@property (weak, nonatomic) IBOutlet UITextField *antiprsitcsFirstAdminstrtnTF;
@property (weak, nonatomic) IBOutlet UITextField *antiprsitcsLastAdminstrtnTF;
@property (weak, nonatomic) IBOutlet UITextField *antiprsitcsFreqncyTF;
@property (weak, nonatomic) IBOutlet UITextField *antiprsitcsDoseTF;
@property (weak, nonatomic) IBOutlet UITextField *antiprsitcsVeternrianTF;
@property (weak, nonatomic) IBOutlet UITextView *antiprsitcsNotesTV;

@property UIBarButtonItem *doneRtBarBtn;

@end
