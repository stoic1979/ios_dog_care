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
    
    self.vaccinDtlsAry = [[NSMutableArray alloc]init];
    
    self.vaccinScrollView.showsVerticalScrollIndicator = YES;
    self.vaccinScrollView.showsHorizontalScrollIndicator = YES;
    self.vaccinScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 700);
    [self.view addSubview:self.vaccinScrollView];
    
    self.vaccinDateTF.delegate = self;
    self.vaccinNameTypeTF.delegate = self;
    self.vaccinVeternrianTF.delegate = self;
    self.vaccinReminderDateTF.delegate = self;
    
    self.doneRtBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneAction)];
    self.navigationItem.rightBarButtonItem = self.doneRtBarBtn;
    
    
    self.datesView = [[UIView alloc]initWithFrame:CGRectMake(20, 200, 375, 200)];
    self.datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    DBManager *dbManager = [[DBManager alloc]init];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *actionString = [defaults objectForKey:@"MedAction"];
    
    if([actionString isEqualToString:@"medEdit"])
    {
        self.vaccinDtlsAry = [dbManager fetchVaccinationDetails:[defaults integerForKey:@"dogInfoId"]];
        
        self.vaccinDateTF.text = [self.vaccinDtlsAry objectAtIndex:0];
        self.vaccinNameTypeTF.text = [self.vaccinDtlsAry objectAtIndex:1];
        self.vaccinVeternrianTF.text = [self.vaccinDtlsAry objectAtIndex:2];
        self.vaccinReminderDateTF.text = [self.vaccinDtlsAry objectAtIndex:3];
        self.vaccinNotesTV.text = [self.vaccinDtlsAry objectAtIndex:4];
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
    [dbManager createVaccinationDetailsTable];
    [dbManager saveVaccinationDetails:self.vaccinDateTF.text :self.vaccinNameTypeTF.text :self.vaccinVeternrianTF.text :self.vaccinReminderDateTF.text :self.vaccinNotesTV.text :[defaults integerForKey:@"dogInfoId"]];
}



-(void)selectedDateAction
{
    
    self.dateFormater = [[NSDateFormatter alloc] init];
    [self.dateFormater setDateFormat:@"dd-MM-yyyy"];
    NSString *formatedDate = [self.dateFormater stringFromDate:self.datePicker.date];
    self.vaccinDateTF.text = formatedDate;
    self.vaccinReminderDateTF.text = formatedDate;
    
}



- (IBAction)calnderBtnAction:(id)sender
{
    
    if(sender == self.vaccintnDateCalndr)
    {
        self.datesView.frame = CGRectMake(20, 200, 375, 200);
    }
    else if(sender == self.remndrDateCalndr)
    {
        self.datesView.frame = CGRectMake(20, 200, 375, 200);
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
