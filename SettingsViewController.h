//
//  SettingsViewController.h
//  DogCare
//
//  Created by Weave Bytes Infotech on 28/11/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@property (weak, nonatomic) IBOutlet UILabel *lenghtLabel;

@property UIView *weightView;
@property UIView *lenghtView;
@property UIButton *wghtGramBtn;
@property UIButton *wghtPoundBtn;
@property UIButton *lngthMtrBtn;
@property UIButton *lngthInchBtn;

- (IBAction)weightBtnAction:(id)sender;
- (IBAction)lengthBtnAction:(id)sender;

@end
