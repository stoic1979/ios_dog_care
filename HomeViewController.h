//
//  HomeViewController.h
//  DogCare
//
//  Created by Weave Bytes Infotech on 13/11/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"

@interface HomeViewController : UIViewController<SlideNavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource>
- (IBAction)addDetailsAction:(id)sender;
- (IBAction)showDogDtlsAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *homeTableView;

@property (weak, nonatomic) IBOutlet UILabel *dogNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dogBithDateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *dogPicImgView;


@end
