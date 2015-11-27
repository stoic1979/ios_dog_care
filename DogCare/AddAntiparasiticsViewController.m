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
    self.antiparasiticsScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 800);
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
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    DBManager *dbManager = [[DBManager alloc]init];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *actionString = [defaults objectForKey:@"MedAction"];
    
    if([actionString isEqualToString:@"medEdit"])
    {
        self.antprstDtlsAry = [dbManager fetchAntiparasiticsDetails:[defaults integerForKey:@"dogInfoId"]];
        
        self.antiprsitcsTreatmntNameTF.text = [self.antprstDtlsAry objectAtIndex:0];
        self.antiprsitcsTreatmntTypeTF.text = [self.antprstDtlsAry objectAtIndex:1];
        self.antiprsitcsFirstAdminstrtnTF.text = [self.antprstDtlsAry objectAtIndex:2];
        self.antiprsitcsLastAdminstrtnTF.text = [self.antprstDtlsAry objectAtIndex:3];
        self.antiprsitcsFreqncyTF.text = [self.antprstDtlsAry objectAtIndex:4];
        self.antiprsitcsDoseTF.text = [self.antprstDtlsAry objectAtIndex:5];
        self.antiprsitcsVeternrianTF.text = [self.antprstDtlsAry objectAtIndex:6];
        self.antiprsitcsNotesTV.text = [self.antprstDtlsAry objectAtIndex:7];
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
    [dbManager createAntiparasiticsDetailsTable];
    [dbManager saveAntiparasiticsDetails:self.antiprsitcsTreatmntNameTF.text :self.antiprsitcsTreatmntTypeTF.text :self.antiprsitcsFirstAdminstrtnTF.text :self.antiprsitcsLastAdminstrtnTF.text :self.antiprsitcsFreqncyTF.text :self.antiprsitcsDoseTF.text :self.antiprsitcsVeternrianTF.text :self.antiprsitcsNotesTV.text :[defaults integerForKey:@"dogInfoId"]];
}


- (IBAction)calnderBtnAction:(id)sender
{
    
}



- (IBAction)dateSelectBtnAction:(id)sender
{
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
