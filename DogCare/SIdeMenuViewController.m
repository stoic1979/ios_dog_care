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
//    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
//                                                             bundle: nil];
//    
//    UIViewController *vc ;
//    
//    switch (indexPath.row)
//    {
//        case 0:
//            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"HomeViewController"];
//            break;
//            
//        case 1:
//            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"ProfileViewController"];
//            break;
//            
//        case 2:
//            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"FriendsViewController"];
//            break;
//            
//        case 3:
//            [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
//            [[SlideNavigationController sharedInstance] popToRootViewControllerAnimated:YES];
//            return;
//            break;
//            
//    }
//    
//    [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc
//                                                             withSlideOutAnimation:self.slideOutAnimationEnabled
//                                                                     andCompletion:nil];
}

@end
