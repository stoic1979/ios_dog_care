//
//  ShowDetailsViewController.m
//  DogCare
//
//  Created by Weave Bytes Infotech on 26/11/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import "ShowDetailsViewController.h"
#import "AddDetailsViewController.h"

@interface ShowDetailsViewController ()

@end

@implementation ShowDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    self.nameLabel.text = [defaults objectForKey:@"dogTitle"];
    self.weightLabel.text = [NSString stringWithFormat:@"%@ kg",[defaults objectForKey:@"dogWeight"]];
    self.heightLabel.text = [NSString stringWithFormat:@"%@ cm",[defaults objectForKey:@"dogWither"]];
    self.birthDateLabel.text = [defaults objectForKey:@"dogDOB"];
    self.chipCodeLabel.text = [defaults objectForKey:@"dogChipCode"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)editDtlsBtn:(id)sender
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"edit" forKey:@"AddOrUpdate"];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AddDetailsViewController *addDtlsVC = [storyboard instantiateViewControllerWithIdentifier:@"AddDetailsViewController"];
    [self.navigationController pushViewController:addDtlsVC animated:YES];
}






@end
