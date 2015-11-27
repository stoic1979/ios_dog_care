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
    self.visitsScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 650);
    [self.view addSubview:self.visitsScrollView];

    
    self.visitDateTF.delegate = self;
    self.visitVeternrianTF.delegate = self;
    self.nextInspectionTF.delegate = self;
    
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
        self.vstSurgriesAry = [dbManager fetchVisitsSurgDetails:[defaults integerForKey:@"dogInfoId"]];
        
        self.visitDateTF.text = [self.vstSurgriesAry objectAtIndex:0];
        self.visitVeternrianTF.text = [self.vstSurgriesAry objectAtIndex:1];
        self.nextInspectionTF.text = [self.vstSurgriesAry objectAtIndex:2];
        self.visitsDescriptionTV.text = [self.vstSurgriesAry objectAtIndex:3];
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
    [dbManager createVisitsSurgDetailsTable];
    [dbManager saveVisitsSurgDetails:self.visitDateTF.text :self.visitVeternrianTF.text :self.nextInspectionTF.text :self.visitsDescriptionTV.text :[defaults integerForKey:@"dogInfoId"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)calenderBtnAction:(id)sender
{
    
}



- (IBAction)dateSelectAction:(id)sender
{
    
}







@end
