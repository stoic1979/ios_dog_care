//
//  SettingsViewController.m
//  DogCare
//
//  Created by Weave Bytes Infotech on 28/11/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.weightView = [[UIView alloc]init];
    self.weightView.frame = CGRectMake(130, 90, 180, 80);
    [self.view addSubview:self.weightView];
    [self.weightView.layer setCornerRadius:5.0f];
    // border
    [self.weightView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.weightView.layer setBorderWidth:1.5f];
    // drop shadow
    [self.weightView.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.weightView.layer setShadowOpacity:0.8];
    [self.weightView.layer setShadowRadius:3.0];
    [self.weightView.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    
    self.lenghtView = [[UIView alloc]init];
    self.lenghtView.frame = CGRectMake(130, 220, 180, 80);
    [self.view addSubview:self.lenghtView];
    [self.lenghtView.layer setCornerRadius:5.0f];
    // border
    [self.lenghtView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.lenghtView.layer setBorderWidth:1.5f];
    // drop shadow
    [self.lenghtView.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.lenghtView.layer setShadowOpacity:0.8];
    [self.lenghtView.layer setShadowRadius:3.0];
    [self.lenghtView.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    
    
    self.wghtGramBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.wghtGramBtn addTarget:self
                         action:@selector(buttonSelectedAction:)
               forControlEvents:UIControlEventTouchUpInside];
    [self.wghtGramBtn setTitle:@"Grams" forState:UIControlStateNormal];
    self.wghtGramBtn.frame = CGRectMake(8, 5, 80, 30);
    [self.wghtGramBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.weightView addSubview:self.wghtGramBtn];
    
    self.wghtPoundBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.wghtPoundBtn addTarget:self
                          action:@selector(buttonSelectedAction:)
                forControlEvents:UIControlEventTouchUpInside];
    [self.wghtPoundBtn setTitle:@"Pounds" forState:UIControlStateNormal];
    self.wghtPoundBtn.frame = CGRectMake(8, 45, 80, 30);
    [self.wghtPoundBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.weightView addSubview:self.wghtPoundBtn];
    
    
    self.lngthMtrBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.lngthMtrBtn addTarget:self
                         action:@selector(buttonSelectedAction:)
               forControlEvents:UIControlEventTouchUpInside];
    [self.lngthMtrBtn setTitle:@"Meters" forState:UIControlStateNormal];
    self.lngthMtrBtn.frame = CGRectMake(8, 5, 80, 30);
    [self.lngthMtrBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.lenghtView addSubview:self.lngthMtrBtn];
    
    
    self.lngthInchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.lngthInchBtn addTarget:self
                          action:@selector(buttonSelectedAction:)
                forControlEvents:UIControlEventTouchUpInside];
    [self.lngthInchBtn setTitle:@"Inches" forState:UIControlStateNormal];
    self.lngthInchBtn.frame = CGRectMake(8, 45, 80, 30);
    [self.lngthInchBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.lenghtView addSubview:self.lngthInchBtn];
    
    
    self.weightView.hidden = YES;
    self.lenghtView.hidden = YES;
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.weightLabel.text = [defaults objectForKey:@"weight"];
    self.lenghtLabel.text = [defaults objectForKey:@"length"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)weightBtnAction:(id)sender
{
    self.weightView.hidden = NO;
    self.lenghtView.hidden = YES;
    
}


-(void)buttonSelectedAction:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if(sender == self.wghtGramBtn)
    {
        [defaults setObject:@"Grams" forKey:@"weight"];
        self.weightLabel.text = [defaults objectForKey:@"weight"];
    }
    else if (sender == self.wghtPoundBtn)
    {
        [defaults setObject:@"Pounds" forKey:@"weight"];
        self.weightLabel.text = [defaults objectForKey:@"weight"];
    }
    else if(sender == self.lngthMtrBtn)
    {
        [defaults setObject:@"Meters" forKey:@"length"];
        self.lenghtLabel.text = [defaults objectForKey:@"length"];
    }
    else if (sender == self.lngthInchBtn)
    {
        [defaults setObject:@"Inches" forKey:@"length"];
        self.lenghtLabel.text = [defaults objectForKey:@"length"];
    }
    
    self.weightView.hidden = YES;
    self.lenghtView.hidden = YES;
}

- (IBAction)lengthBtnAction:(id)sender
{
    self.lenghtView.hidden = NO;
    self.weightView.hidden = YES;
}





@end
