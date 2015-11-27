//
//  AddVisitsSurgeriesDetailsViewController.h
//  DogCare
//
//  Created by wb27 on 11/18/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddVisitsSurgeriesDetailsViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *visitsScrollView;
@property (weak, nonatomic) IBOutlet UITextField *visitDateTF;
@property (weak, nonatomic) IBOutlet UITextField *visitVeternrianTF;
@property (weak, nonatomic) IBOutlet UITextField *nextInspectionTF;
@property (weak, nonatomic) IBOutlet UITextView *visitsDescriptionTV;

@property UIBarButtonItem *doneRtBarBtn;

@property NSMutableArray *vstSurgriesAry;

@property (weak, nonatomic) IBOutlet UIButton *visitDatecalnder;
@property (weak, nonatomic) IBOutlet UIButton *inspctinDateCalndr;
@property (weak, nonatomic) IBOutlet UIButton *visitDateSelctn;
@property (weak, nonatomic) IBOutlet UIButton *inspctnDateSelctn;

- (IBAction)calenderBtnAction:(id)sender;
- (IBAction)dateSelectAction:(id)sender;

@end
