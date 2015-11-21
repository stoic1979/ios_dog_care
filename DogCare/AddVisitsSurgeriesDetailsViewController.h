//
//  AddVisitsSurgeriesDetailsViewController.h
//  DogCare
//
//  Created by wb27 on 11/18/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddVisitsSurgeriesDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *visitsScrollView;
@property (weak, nonatomic) IBOutlet UITextField *visitDateTF;
@property (weak, nonatomic) IBOutlet UITextField *visitVeternrianTF;
@property (weak, nonatomic) IBOutlet UITextField *nextInspectionTF;
@property (weak, nonatomic) IBOutlet UITextView *visitsDescriptionTV;

@property UIBarButtonItem *doneRtBarBtn;

@end
