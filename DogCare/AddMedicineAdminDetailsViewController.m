//
//  AddMedicineAdminDetailsViewController.m
//  DogCare
//
//  Created by wb27 on 11/18/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import "AddMedicineAdminDetailsViewController.h"
#import "DBManager.h"

@interface AddMedicineAdminDetailsViewController ()

@end

@implementation AddMedicineAdminDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.medAdmitrnAry = [[NSMutableArray alloc]init];
    
    self.medScrollView.showsVerticalScrollIndicator = YES;
    self.medScrollView.showsHorizontalScrollIndicator = YES;
    self.medScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 800);
    [self.view addSubview:self.medScrollView];
    
    self.medicationNameTF.delegate = self;
    self.medicineDoseTF.delegate = self;
    self.medicineFreqncyTF.delegate =self;
    self.medicineVeternrianTF.delegate = self;
    self.firstAdmistrtnDateTF.delegate = self;
    self.lastAdmistrtnDateTF.delegate = self;

    
    self.doneRtBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneAction)];
    self.navigationItem.rightBarButtonItem = self.doneRtBarBtn;
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    DBManager *dbManager = [[DBManager alloc]init];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *actionString = [defaults objectForKey:@"MedAction"];
    
    if([actionString isEqualToString:@"medEdit"])
    {
        self.medAdmitrnAry = [dbManager fetchMedAdminDetails:[defaults integerForKey:@"dogInfoId"]];
        
        self.medicationNameTF.text = [self.medAdmitrnAry objectAtIndex:0];
        self.firstAdmistrtnDateTF.text = [self.medAdmitrnAry objectAtIndex:1];
        self.lastAdmistrtnDateTF.text = [self.medAdmitrnAry objectAtIndex:2];
        self.medicineFreqncyTF.text = [self.medAdmitrnAry objectAtIndex:3];
        self.medicineDoseTF.text = [self.medAdmitrnAry objectAtIndex:4];
        self.medicineVeternrianTF.text = [self.medAdmitrnAry objectAtIndex:5];
        self.medicineNotesTV.text = [self.medAdmitrnAry objectAtIndex:6];
    }
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)doneAction
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    DBManager *dbManager = [[DBManager alloc]init];
    [dbManager createMedAdminDetailsTable];
    [dbManager saveMedAdminDetails:self.medicationNameTF.text :self.firstAdmistrtnDateTF.text :self.lastAdmistrtnDateTF.text :self.medicineFreqncyTF.text :self.medicineDoseTF.text :self.medicineVeternrianTF.text :self.medicineNotesTV.text :[defaults integerForKey:@"dogInfoId"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)calnderBtnAction:(id)sender
{
    
}


- (IBAction)dateSelectBtnAction:(id)sender
{
    
}




@end
