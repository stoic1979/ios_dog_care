//
//  MedicalRecordsViewController.h
//  DogCare
//
//  Created by Weave Bytes Infotech on 14/11/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MedicalRecordsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *medicalTableView;
@property (weak, nonatomic) IBOutlet UIImageView *dogPicImgeView;

@end
