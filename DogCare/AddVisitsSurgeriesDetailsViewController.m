//
//  AddVisitsSurgeriesDetailsViewController.m
//  DogCare
//
//  Created by wb27 on 11/18/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import "AddVisitsSurgeriesDetailsViewController.h"
#import "DBManager.h"

@interface AddVisitsSurgeriesDetailsViewController ()

@end

@implementation AddVisitsSurgeriesDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.vstSurgriesAry = [[NSMutableArray alloc]init];
    
    self.visitsScrollView.showsVerticalScrollIndicator = YES;
    self.visitsScrollView.showsHorizontalScrollIndicator = YES;
    self.visitsScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 700);
    [self.view addSubview:self.visitsScrollView];

    
    self.visitDateTF.delegate = self;
    self.visitVeternrianTF.delegate = self;
    self.nextInspectionTF.delegate = self;
    
    self.visitsDescriptionTV.text = @"Enter Description";
    self.visitsDescriptionTV.textColor = [UIColor lightGrayColor];
    self.visitsDescriptionTV.delegate = self;
    
    self.doneRtBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneAction)];
    self.navigationItem.rightBarButtonItem = self.doneRtBarBtn;
    
    
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
        self.vstSurgriesAry = [dbManager fetchVisitsSurgDetails:[defaults integerForKey:@"dogInfoId"]];
        
        self.visitDateTF.text = [self.vstSurgriesAry objectAtIndex:0];
        self.visitVeternrianTF.text = [self.vstSurgriesAry objectAtIndex:1];
        self.nextInspectionTF.text = [self.vstSurgriesAry objectAtIndex:2];
        self.visitsDescriptionTV.text = [self.vstSurgriesAry objectAtIndex:3];
    }
    
}


#pragma mark - Adding Place Holder for TextView

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    self.visitsDescriptionTV.text = @"";
    self.visitsDescriptionTV.textColor = [UIColor blackColor];
    return YES;
}

- (BOOL) textViewShouldEndEditing:(UITextView *)textView
{
    if(self.visitsDescriptionTV.text.length == 0){
        self.visitsDescriptionTV.textColor = [UIColor lightGrayColor];
        self.visitsDescriptionTV.text = @"Enter Description";
        [self.visitsDescriptionTV resignFirstResponder];
    }
    return YES;
}

-(void) textViewDidChange:(UITextView *)textView
{
    
    if(self.visitsDescriptionTV.text.length == 0){
        self.visitsDescriptionTV.textColor = [UIColor lightGrayColor];
        self.visitsDescriptionTV.text = @"Enter Description";
        [self.visitsDescriptionTV resignFirstResponder];
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
    
    if([self.visitDateTF.text isEqualToString:@""] ||
       [self.visitsDescriptionTV.text isEqualToString:@""] ||
       [self.visitVeternrianTF.text isEqualToString:@""] ||
       [self.nextInspectionTF.text isEqualToString:@""])
    {
        UIAlertView *alrtView = [[UIAlertView alloc]initWithTitle:@"Enter Visits Details" message:@"Please enter all the fields properly" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alrtView show];
    }
    else
    {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        DBManager *dbManager = [[DBManager alloc]init];
        [dbManager createVisitsSurgDetailsTable];
        [dbManager saveVisitsSurgDetails:self.visitDateTF.text :self.visitVeternrianTF.text :self.nextInspectionTF.text :self.visitsDescriptionTV.text :[defaults integerForKey:@"dogInfoId"]];
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
        self.visitDateTF.text = formatedDate;
    }
    else if(self.dateResult == 2)
    {
        self.nextInspectionTF.text = formatedDate;
    }
    
}



- (IBAction)calenderBtnAction:(id)sender
{
    
    if(sender == self.visitDatecalnder)
    {
        self.datesView.frame = CGRectMake(20, 80, 375, 200);
        self.dateResult = 1;
    }
    else if(sender == self.inspctinDateCalndr)
    {
        self.datesView.frame = CGRectMake(20, 165, 375, 200);
        self.dateResult = 2;
    }
    
    self.datePicker.hidden = NO;
    self.datesView.hidden = NO;
    
    [self.datesView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:self.datesView];
    
    [self.datePicker addTarget:self action:@selector(selectedDateAction) forControlEvents:UIControlEventValueChanged];
    [self.datesView addSubview:self.datePicker];
    
}

- (IBAction)dateSelectAction:(id)sender
{
    
    self.datePicker.hidden = YES;
    self.datesView.hidden = YES;
}







@end
