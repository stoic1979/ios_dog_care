//
//  MedicalRecordsViewController.m
//  DogCare
//
//  Created by Weave Bytes Infotech on 14/11/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import "MedicalRecordsViewController.h"
#import "NotesViewController.h"
#import "AddMedicalRecordsTableViewController.h"

@interface MedicalRecordsViewController ()

@end

@implementation MedicalRecordsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.medicalTableView.delegate = self;
    self.medicalTableView.dataSource = self;
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegate and DataSource methods -

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
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
            cell.textLabel.text = @"VACCINATIONS";
            cell.imageView.image = [UIImage imageNamed:@"vaccination-image.png"];
            break;
            
        case 1:
            cell.textLabel.text = @"ANTIPARASITICS";
            cell.imageView.image = [UIImage imageNamed:@"antiparastic-image.png"];
            break;
            
        case 2:
            cell.textLabel.text = @"MEDICINE/ADMINISTRATIONS";
            cell.imageView.image = [UIImage imageNamed:@"medicine-image.png"];
            break;
            
        case 3:
            cell.textLabel.text = @"VISITS AND SURGERIES";
            cell.imageView.image = [UIImage imageNamed:@"visits-image.png"];
            break;
        case 4:
            cell.textLabel.text = @"NOTES";
            cell.imageView.image = [UIImage imageNamed:@"notes-image.png"];
            break;
            
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    AddMedicalRecordsTableViewController *addMedRcrdsVC = [storyboard instantiateViewControllerWithIdentifier:@"AddMedicalRecordsTableViewControler"];
    
    if(indexPath.row == 0)
    {
        [defaults setObject:@"vaccination" forKey:@"MedRecrds"];
        [self.navigationController pushViewController:addMedRcrdsVC animated:YES];
    }
    else if (indexPath.row == 1)
    {
        [defaults setObject:@"antiprstics" forKey:@"MedRecrds"];
        [self.navigationController pushViewController:addMedRcrdsVC animated:YES];
    }
    else if (indexPath.row == 2)
    {
        [defaults setObject:@"medcneAdmintrtn" forKey:@"MedRecrds"];
        [self.navigationController pushViewController:addMedRcrdsVC animated:YES];
    }
    else if (indexPath.row == 3)
    {
        [defaults setObject:@"visitsSurgries" forKey:@"MedRecrds"];
        [self.navigationController pushViewController:addMedRcrdsVC animated:YES];
    }
    else if (indexPath.row == 4)
    {
        [defaults setObject:@"notesAdd" forKey:@"NotesWork"];
        NotesViewController *notesVC = [storyboard instantiateViewControllerWithIdentifier:@"NotesViewControler"];
        [self.navigationController pushViewController:notesVC animated:YES];
    }

}


@end
