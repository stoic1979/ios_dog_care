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
    self.medScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 850);
    [self.view addSubview:self.medScrollView];
    
    self.medicationNameTF.delegate = self;
    self.medicineDoseTF.delegate = self;
    self.medicineFreqncyTF.delegate =self;
    self.medicineVeternrianTF.delegate = self;
    self.firstAdmistrtnDateTF.delegate = self;
    self.lastAdmistrtnDateTF.delegate = self;

    
    self.doneRtBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneAction)];
    self.navigationItem.rightBarButtonItem = self.doneRtBarBtn;
    
    self.medicineNotesTV.layer.cornerRadius = 5.0f;
    self.medicineNotesTV.layer.borderWidth = 1.0f;
    self.medicineNotesTV.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    self.dateResult = 0;
    
    self.datesView = [[UIView alloc]init];
    self.datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    DBManager *dbManager = [[DBManager alloc]init];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *actionString = [defaults objectForKey:@"MedAction"];
    
    if([actionString isEqualToString:@"medEdit"])
    {
        NSMutableArray *resltsAry = [dbManager fetchMedAdminDetails:[defaults integerForKey:@"dogInfoId"]];
        
        self.medAdmitrnAry = [resltsAry objectAtIndex:[defaults integerForKey:@"indexNumber"]];
        
        self.medicationNameTF.text = [self.medAdmitrnAry objectAtIndex:1];
        self.firstAdmistrtnDateTF.text = [self.medAdmitrnAry objectAtIndex:2];
        self.lastAdmistrtnDateTF.text = [self.medAdmitrnAry objectAtIndex:3];
        self.medicineFreqncyTF.text = [self.medAdmitrnAry objectAtIndex:4];
        self.medicineDoseTF.text = [self.medAdmitrnAry objectAtIndex:5];
        self.medicineVeternrianTF.text = [self.medAdmitrnAry objectAtIndex:6];
        self.medicineNotesTV.text = [self.medAdmitrnAry objectAtIndex:7];
    }
    
}



#pragma mark - HIDING KEYBOARD

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)dismissKeyboard
{
    for (UIView *view in self.view.subviews)
        [view resignFirstResponder];
    [self.view endEditing:YES];
}


#pragma mark - NavigationBar button to Save or Update

-(void)doneAction
{
    
    if([self.medicationNameTF.text isEqualToString:@""] ||
       [self.firstAdmistrtnDateTF.text isEqualToString:@""] ||
       [self.lastAdmistrtnDateTF.text isEqualToString:@""] ||
       [self.medicineFreqncyTF.text isEqualToString:@""] ||
       [self.medicineDoseTF.text isEqualToString:@""] ||
       [self.medicineVeternrianTF.text isEqualToString:@""] ||
       [self.medicineNotesTV.text isEqualToString:@""])
    {
        UIAlertView *alrtView = [[UIAlertView alloc]initWithTitle:@"Enter Medical Details" message:@"Please enter all the fields properly" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alrtView show];
    }
    else
    {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        DBManager *dbManager = [[DBManager alloc]init];
        
        if([[defaults objectForKey:@"MedAction"] isEqualToString:@"medAdd"])
        {

            [dbManager createMedAdminDetailsTable];
            [dbManager saveMedAdminDetails:self.medicationNameTF.text :self.firstAdmistrtnDateTF.text :self.lastAdmistrtnDateTF.text :self.medicineFreqncyTF.text :self.medicineDoseTF.text :self.medicineVeternrianTF.text :self.medicineNotesTV.text :[defaults integerForKey:@"dogInfoId"]];
        }
        else
        {
            [dbManager updateMedAdminDetails:self.medicationNameTF.text :self.firstAdmistrtnDateTF.text :self.lastAdmistrtnDateTF.text :self.medicineFreqncyTF.text :self.medicineDoseTF.text :self.medicineVeternrianTF.text :self.medicineNotesTV.text :[(NSNumber*)[self.medAdmitrnAry objectAtIndex:0] intValue]];
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - DatePicker for Date selection

-(void)selectedDateAction
{
    
    self.dateFormater = [[NSDateFormatter alloc] init];
    [self.dateFormater setDateFormat:@"dd-MM-yyyy"];
    NSString *formatedDate = [self.dateFormater stringFromDate:self.datePicker.date];
    if(self.dateResult == 1)
    {
        self.firstAdmistrtnDateTF.text = formatedDate;
    }
    else if(self.dateResult == 2)
    {
        self.lastAdmistrtnDateTF.text = formatedDate;
    }
    
}



- (IBAction)calnderBtnAction:(id)sender
{
    
    if(sender == self.frstAdmntrnDateCalndr)
    {
        self.datesView.frame = CGRectMake(20, 120, 375, 200);
        self.dateResult = 1;
    }
    else if(sender == self.lastAdmntrnDateCalndr)
    {
        self.datesView.frame = CGRectMake(20, 160, 375, 200);
        self.dateResult = 2;
    }
    
    self.datePicker.hidden = NO;
    self.datesView.hidden = NO;
    
    [self.datesView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:self.datesView];
    
    [self.datePicker addTarget:self action:@selector(selectedDateAction) forControlEvents:UIControlEventValueChanged];
    [self.datesView addSubview:self.datePicker];
    
}

- (IBAction)dateSelectBtnAction:(id)sender
{
    
    self.datePicker.hidden = YES;
    self.datesView.hidden = YES;
}





@end
