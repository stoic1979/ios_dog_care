//
//  AddDetailsViewController.m
//  DogCare
//
//  Created by Weave Bytes Infotech on 13/11/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import "AddDetailsViewController.h"

@interface AddDetailsViewController ()

@end

@implementation AddDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.scrollView.showsVerticalScrollIndicator = YES;
    self.scrollView.showsHorizontalScrollIndicator = YES;
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 700);
    [self.view addSubview:self.scrollView];
    
    self.nameTF.delegate = self;
    self.birthDateTF.delegate = self;
    self.weightTF.delegate = self;
    self.withersTF.delegate = self;
    self.breedTF.delegate = self;
    self.chipTF.delegate = self;
    self.genderTF.delegate = self;
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"rightMenu.jpg"]]];
    
    self.datesView = [[UIView alloc]initWithFrame:CGRectMake(20, 200, 375, 200)];
    self.datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    
    // Do any additional setup after loading the view.
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)selectedDateAction
{
    
    self.dateFormater = [[NSDateFormatter alloc] init];
    [self.dateFormater setDateFormat:@"dd-MM-yyyy"];
    NSString *formatedDate = [self.dateFormater stringFromDate:self.datePicker.date];
    self.birthDateTF.text = formatedDate;
    
}


- (IBAction)birthDateAction:(id)sender {
    
    self.datePicker.hidden = NO;
    self.datesView.hidden = NO;
    
    [self.datesView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:self.datesView];
    
    [self.datePicker addTarget:self action:@selector(selectedDateAction) forControlEvents:UIControlEventValueChanged];
    [self.datesView addSubview:self.datePicker];
    
}

- (IBAction)dateSectedAction:(id)sender {
    
    self.datePicker.hidden = YES;
    self.datesView.hidden = YES;
}










@end
