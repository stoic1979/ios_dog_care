//
//  SIdeMenuViewController.m
//  DogCare
//
//  Created by Weave Bytes Infotech on 13/11/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import "SIdeMenuViewController.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"
#import "DogsTableViewController.h"
#import "DBManager.h"

@interface SIdeMenuViewController ()

@end

@implementation SIdeMenuViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self.slideOutAnimationEnabled = YES;
    
    return [super initWithCoder:aDecoder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
//    [[SlideNavigationController sharedInstance].navigationBar.barTintColor];
    
//    self.tableView.separatorColor = [UIColor lightGrayColor];
//    
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rightMenu.jpg"]];
//    self.tableView.backgroundView = imageView;
}

#pragma mark - UITableView Delegate & Datasrouce -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 20)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    switch (indexPath.row)
    {
        case 0:
            cell.textLabel.text = @"Dogs";
            cell.imageView.image = [UIImage imageNamed:@"dog47.png"];
            break;
        case 1:
            cell.textLabel.text = @"Remove";
            cell.imageView.image = [UIImage imageNamed:@"remove7.png"];
            break;
            
        case 2:
            cell.textLabel.text = @"Settings";
            cell.imageView.image = [UIImage imageNamed:@"settings39.png"];
            break;
            
        case 3:
            cell.textLabel.text = @"Online Backup";
            cell.imageView.image = [UIImage imageNamed:@"backup.png"];
            break;
            
        case 4:
            cell.textLabel.text = @"Backup/Restore";
            cell.imageView.image = [UIImage imageNamed:@"restore174.png"];
            break;
            
        case 5:
            cell.textLabel.text = @"Promo Code";
            cell.imageView.image = [UIImage imageNamed:@"promocode70.png"];
            break;
            
        case 6:
            cell.textLabel.text = @"Info";
            cell.imageView.image = [UIImage imageNamed:@"info44.png"];
            break;
    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    
    DogsTableViewController *vc;
    DBManager *dbManager = [[DBManager alloc]init];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    switch (indexPath.row)
    {
        case 0:
            vc = [storyboard instantiateViewControllerWithIdentifier: @"DogsTableViewControler"];
            [[SlideNavigationController sharedInstance] pushViewController:vc animated:YES];
            break;
            
        case 1:
            
            NSLog(@"%d",[defaults integerForKey:@"dogInfoId"]);
            
            int dogId = [defaults integerForKey:@"dogInfoId"];
            
            [dbManager removeDogDetails:dogId];
            [dbManager removeVaccinationDetails:dogId];
            [dbManager removeAntiparasiticsDetails:dogId];
            [dbManager removeMedAdminDetails:dogId];
            [dbManager removeVisitsSurgDetails:dogId];
            break;
            
        case 2:
            NSLog(@"Settings");
            break;
            
        case 3:
            NSLog(@"Online Backup");
            break;
            
        case 4:
            NSLog(@"Backup/Restore");
            break;
            
        case 5:
            NSLog(@"Promo Code");
            break;
            
        case 6:
            NSLog(@"Info");
            break;
            
    }
    
}

@end
