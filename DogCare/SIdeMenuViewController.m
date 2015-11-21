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
    
//    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"leftMenu.jpg"]]];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"rightMenu.jpg"]]];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    self.tableView.separatorColor = [UIColor lightGrayColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rightMenu.jpg"]];
    self.tableView.backgroundView = imageView;
}

#pragma mark - UITableView Delegate & Datasrouce -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
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
            break;
        case 1:
            cell.textLabel.text = @"Remove";
            break;
            
        case 2:
            cell.textLabel.text = @"Settings";
            break;
            
        case 3:
            cell.textLabel.text = @"Online Backup";
            break;
            
        case 4:
            cell.textLabel.text = @"Backup/Restore";
            break;
            
        case 5:
            cell.textLabel.text = @"Promo Code";
            break;
            
        case 6:
            cell.textLabel.text = @"Info";
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
//            [[SlideNavigationController sharedInstance] presentViewController:vc animated:YES completion:nil];
            [[SlideNavigationController sharedInstance] pushViewController:vc animated:YES];
            break;
            
        case 1:
            
            NSLog(@"%@", [defaults objectForKey:@"dogsID"]);
            [dbManager removeDogDetails:(int)[defaults objectForKey:@"dogsID"]];
            [dbManager removeVaccinationDetails:(int)[defaults objectForKey:@"dogsID"]];
            [dbManager removeAntiparasiticsDetails:(int)[defaults objectForKey:@"dogsID"]];
            [dbManager removeMedAdminDetails:(int)[defaults objectForKey:@"dogsID"]];
            [dbManager removeVisitsSurgDetails:(int)[defaults objectForKey:@"dogsID"]];
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
            
    }
    
}

@end
