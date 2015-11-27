//
//  AddMedicalRecordsTableViewController.h
//  DogCare
//
//  Created by wb27 on 11/24/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddMedicalRecordsTableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *addMedRecrdsTableView;
@property UIBarButtonItem *medclRcrdsRgtBarBtn;

-(void)addMediclRecrdsDetailsAction;

@property NSMutableArray *medclRecrdsArray;

@property NSMutableArray *vaccintnArray;
@property NSMutableArray *antprsticsArray;
@property NSMutableArray *medAdmintrtnArray;
@property NSMutableArray *visitsSurgiesArray;

@end
