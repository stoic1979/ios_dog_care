//
//  AddVaccinDetailsViewController.m
//  DogCare
//
//  Created by wb27 on 11/18/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import "AddVaccinDetailsViewController.h"
#import "DBManager.h"

@interface AddVaccinDetailsViewController ()

@end

@implementation AddVaccinDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"rightMenu.jpg"]]];
    
    self.vaccinScrollView.showsVerticalScrollIndicator = YES;
    self.vaccinScrollView.showsHorizontalScrollIndicator = YES;
    self.vaccinScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 700);
    [self.view addSubview:self.vaccinScrollView];
    
    self.doneRtBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneAction)];
    self.navigationItem.rightBarButtonItem = self.doneRtBarBtn;
    // Do any additional setup after loading the view.
}

-(void)doneAction
{
    DBManager *dbManager = [[DBManager alloc]init];
    [dbManager createVaccinationDetailsTable];
    [dbManager saveVaccinationDetails:self.vaccinDateTF.text :self.vaccinNameTypeTF.text :self.vaccinVeternrianTF.text :self.vaccinReminderDateTF.text :self.vaccinNotesTV.text :1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
