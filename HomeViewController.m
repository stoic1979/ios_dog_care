//
//  HomeViewController.m
//  DogCare
//
//  Created by Weave Bytes Infotech on 13/11/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import "HomeViewController.h"
#import "SIdeMenuViewController.h"
#import "AddDetailsViewController.h"
#import "MemoViewController.h"
#import "MedicalRecordsViewController.h"
#import "VeterinariesViewController.h"
#import "ShowDetailsViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.homeTableView.delegate = self;
    self.homeTableView.dataSource = self;
    
}

-(void)viewWillAppear:(BOOL)animated
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:@"add" forKey:@"AddOrUpdate"];
    
    self.dogNameLabel.text = [defaults objectForKey:@"dogTitle"];
    self.dogBithDateLabel.text = [defaults objectForKey:@"dogDOB"];
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegate and DataSource methods -

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    switch (indexPath.row)
    {
        case 0:
            cell.textLabel.text = @"MEMO";
            cell.imageView.image = [UIImage imageNamed:@"memmo-image.png"];
            break;
            
        case 1:
            cell.textLabel.text = @"MEDICAL RECORDS";
            cell.imageView.image = [UIImage imageNamed:@"medicalrec-image.png"];
            break;
            
        case 2:
            cell.textLabel.text = @"VETERINARIES";
            cell.imageView.image = [UIImage imageNamed:@"vetrenary-image.png"];
            break;
            
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    
    if(indexPath.row == 0)
    {
        MemoViewController *memoVC = [storyboard instantiateViewControllerWithIdentifier:@"MemoViewControler"];
        [self.navigationController pushViewController:memoVC animated:YES];
    }
    else if (indexPath.row == 1)
    {
        MedicalRecordsViewController *medicalRecordsVC = [storyboard instantiateViewControllerWithIdentifier:@"MedicalRecordsViewControler"];
        [self.navigationController pushViewController:medicalRecordsVC animated:YES];
    }
    else if (indexPath.row == 2)
    {
        VeterinariesViewController *veterinariesVC = [storyboard instantiateViewControllerWithIdentifier:@"VeterinariesViewControler"];
        [self.navigationController pushViewController:veterinariesVC animated:YES];
    }
        
}


- (IBAction)addDetailsAction:(id)sender {
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    AddDetailsViewController *addDetailsVC = [storyboard instantiateViewControllerWithIdentifier:@"AddDetailsViewController"];
    [self.navigationController pushViewController:addDetailsVC animated:YES];
    
}

- (IBAction)showDogDtlsAction:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"add" forKey:@"AddOrUpdate"];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ShowDetailsViewController *dogDetailsVC = [storyboard instantiateViewControllerWithIdentifier:@"ShowDetailsViewControler"];
    [self.navigationController pushViewController:dogDetailsVC animated:YES];
    
}






@end
