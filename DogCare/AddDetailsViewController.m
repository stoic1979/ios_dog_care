//
//  AddDetailsViewController.m
//  DogCare
//
//  Created by Weave Bytes Infotech on 13/11/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import "AddDetailsViewController.h"
#import "DBManager.h"

@interface AddDetailsViewController ()

@end

@implementation AddDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"rightMenu.jpg"]]];
    
    self.doneRtBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(detailsSaveAction)];
    self.navigationItem.rightBarButtonItem = self.doneRtBarBtn;

    
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

-(void)detailsSaveAction
{
    DBManager *dbManager = [[DBManager alloc]init];
    NSMutableArray *array = [dbManager fetchDogsTitles];
    
    int duplicateCount = 0;
    NSString *string = self.nameTF.text;
    for (int i = 0; i < array.count; ++i)
    {
        if ([string isEqualToString:[array objectAtIndex:i]])
        {
            NSLog(@"Duplicate");
            duplicateCount++;
        }
        
    }
    if(duplicateCount == 0)
    {
        [dbManager createDogDetailsTable];
        [dbManager saveDogDetails:self.nameTF.text :self.birthDateTF.text :self.weightTF.text :self.withersTF.text :self.breedTF.text :self.chipTF.text :self.genderTF.text];
    }
    else{
        NSLog(@"Duplicate is there cannot saved");
    }

    
    
    
    
}









@end
