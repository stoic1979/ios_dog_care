//
//  AddAntiparasiticsViewController.m
//  DogCare
//
//  Created by wb27 on 11/18/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import "AddAntiparasiticsViewController.h"
#import "DBManager.h"

@interface AddAntiparasiticsViewController ()

@end

@implementation AddAntiparasiticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.antprstDtlsAry = [[NSMutableArray alloc]init];
    
    self.antiparasiticsScrollView.showsVerticalScrollIndicator = YES;
    self.antiparasiticsScrollView.showsHorizontalScrollIndicator = YES;
    self.antiparasiticsScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 850);
    [self.view addSubview:self.antiparasiticsScrollView];
    
    self.antiprsitcsTreatmntNameTF.delegate = self;
    self.antiprsitcsTreatmntTypeTF.delegate = self;
    self.antiprsitcsFirstAdminstrtnTF.delegate =self;
    self.antiprsitcsLastAdminstrtnTF.delegate = self;
    self.antiprsitcsFreqncyTF.delegate = self;
    self.antiprsitcsDoseTF.delegate = self;
    self.antiprsitcsVeternrianTF.delegate =self;
    
    self.doneRtBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneAction)];
    self.navigationItem.rightBarButtonItem = self.doneRtBarBtn;
    
    self.antiprsitcsNotesTV.layer.cornerRadius = 5.0f;
    self.antiprsitcsNotesTV.layer.borderWidth = 1.0f;
    self.antiprsitcsNotesTV.layer.borderColor = [[UIColor lightGrayColor] CGColor];

    
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
        NSMutableArray *resltsAry = [dbManager fetchAntiparasiticsDetails:[defaults integerForKey:@"dogInfoId"]];
        
        self.antprstDtlsAry = [resltsAry objectAtIndex:[defaults integerForKey:@"indexNumber"]];
        
        self.antiprsitcsTreatmntNameTF.text = [self.antprstDtlsAry objectAtIndex:1];
        self.antiprsitcsTreatmntTypeTF.text = [self.antprstDtlsAry objectAtIndex:2];
        self.antiprsitcsFirstAdminstrtnTF.text = [self.antprstDtlsAry objectAtIndex:3];
        self.antiprsitcsLastAdminstrtnTF.text = [self.antprstDtlsAry objectAtIndex:4];
        self.antiprsitcsFreqncyTF.text = [self.antprstDtlsAry objectAtIndex:5];
        self.antiprsitcsDoseTF.text = [self.antprstDtlsAry objectAtIndex:6];
        self.antiprsitcsVeternrianTF.text = [self.antprstDtlsAry objectAtIndex:7];
        self.antiprsitcsNotesTV.text = [self.antprstDtlsAry objectAtIndex:8];
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
    
    if([self.antiprsitcsTreatmntTypeTF.text isEqualToString:@""] ||
       [self.antiprsitcsTreatmntNameTF.text isEqualToString:@""] ||
       [self.antiprsitcsFirstAdminstrtnTF.text isEqualToString:@""] ||
       [self.antiprsitcsLastAdminstrtnTF.text isEqualToString:@""] ||
       [self.antiprsitcsFreqncyTF.text isEqualToString:@""] ||
       [self.antiprsitcsDoseTF.text isEqualToString:@""] ||
       [self.antiprsitcsVeternrianTF.text isEqualToString:@""] ||
       [self.antiprsitcsNotesTV.text isEqualToString:@""])
    {
        UIAlertView *alrtView = [[UIAlertView alloc]initWithTitle:@"Enter Antiparasitics Details" message:@"Please enter all the fields properly" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alrtView show];
    }
    else
    {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        DBManager *dbManager = [[DBManager alloc]init];
        
        if([[defaults objectForKey:@"MedAction"] isEqualToString:@"medAdd"])
        {

            [dbManager createAntiparasiticsDetailsTable];
            [dbManager saveAntiparasiticsDetails:self.antiprsitcsTreatmntNameTF.text :self.antiprsitcsTreatmntTypeTF.text :self.antiprsitcsFirstAdminstrtnTF.text :self.antiprsitcsLastAdminstrtnTF.text :self.antiprsitcsFreqncyTF.text :self.antiprsitcsDoseTF.text :self.antiprsitcsVeternrianTF.text :self.antiprsitcsNotesTV.text :[defaults integerForKey:@"dogInfoId"]];
        }
        else
        {
            [dbManager updateAntiparasiticsDetails:self.antiprsitcsTreatmntNameTF.text :self.antiprsitcsTreatmntTypeTF.text :self.antiprsitcsFirstAdminstrtnTF.text :self.antiprsitcsLastAdminstrtnTF.text :self.antiprsitcsFreqncyTF.text :self.antiprsitcsDoseTF.text :self.antiprsitcsVeternrianTF.text :self.antiprsitcsNotesTV.text :[(NSNumber*)[self.antprstDtlsAry objectAtIndex:0] intValue]];
        }
    }
}


#pragma mark - DatePicker for Date selection

-(void)selectedDateAction
{
    
    self.dateFormater = [[NSDateFormatter alloc] init];
    [self.dateFormater setDateFormat:@"dd-MM-yyyy"];
    NSString *formatedDate = [self.dateFormater stringFromDate:self.datePicker.date];
    if(self.dateResult == 1)
    {
        self.antiprsitcsFirstAdminstrtnTF.text = formatedDate;
    }
    else if(self.dateResult == 2)
    {
        self.antiprsitcsLastAdminstrtnTF.text = formatedDate;
    }
    
}



- (IBAction)calnderBtnAction:(id)sender
{
    
    if(sender == self.frstAdmntrnDateCalndr)
    {
        self.datesView.frame = CGRectMake(20, 165, 375, 200);
        self.dateResult = 1;
    }
    else if(sender == self.lastAdmntrnDateCalndr)
    {
        self.datesView.frame = CGRectMake(20, 210, 375, 200);
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




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
