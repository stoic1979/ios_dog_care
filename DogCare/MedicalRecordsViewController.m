//
//  MedicalRecordsViewController.m
//  DogCare
//
//  Created by Weave Bytes Infotech on 14/11/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import "MedicalRecordsViewController.h"
#import "VaccinationsViewController.h"
#import "AntiparasiticsViewController.h"
#import "Medicine&AdminViewController.h"
#import "Visits&SugeriesViewController.h"
#import "NotesViewController.h"

@interface MedicalRecordsViewController ()

@end

@implementation MedicalRecordsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"rightMenu.jpg"]]];
    
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
            cell.imageView.image = [UIImage imageNamed:@"vaccination-images.jpg"];
            break;
            
        case 1:
            cell.textLabel.text = @"ANTIPARASITICS";
            cell.imageView.image = [UIImage imageNamed:@"antiparacitics-images.jpg"];
            break;
            
        case 2:
            cell.textLabel.text = @"VISITS AND SURGERIES";
            cell.imageView.image = [UIImage imageNamed:@"visits:surgery-images.jpg"];
            break;
            
        case 3:
            cell.textLabel.text = @"MEDICINE/ADMINISTRATIONS";
            cell.imageView.image = [UIImage imageNamed:@"medical admistration-images.jpg"];
            break;
        case 4:
            cell.textLabel.text = @"NOTES";
            cell.imageView.image = [UIImage imageNamed:@"notes-images.jpg"];
            break;
            
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    
    if(indexPath.row == 0)
    {
        VaccinationsViewController *memoVC = [storyboard instantiateViewControllerWithIdentifier:@"VaccinationsViewControler"];
        [self.navigationController pushViewController:memoVC animated:YES];
    }
    else if (indexPath.row == 1)
    {
        AntiparasiticsViewController *antiparasiticsVC = [storyboard instantiateViewControllerWithIdentifier:@"AntiparasiticsViewControler"];
        [self.navigationController pushViewController:antiparasiticsVC animated:YES];
    }
    else if (indexPath.row == 2)
    {
        Medicine_AdminViewController *medicineAdminstrationVC = [storyboard instantiateViewControllerWithIdentifier:@"Medicine_AdminViewControler"];
        [self.navigationController pushViewController:medicineAdminstrationVC animated:YES];
    }
    else if (indexPath.row == 3)
    {
        Visits_SugeriesViewController *visitsSurgeriesVC = [storyboard instantiateViewControllerWithIdentifier:@"Visits_SugeriesViewControler"];
        [self.navigationController pushViewController:visitsSurgeriesVC animated:YES];
    }
    else if (indexPath.row == 4)
    {
        NotesViewController *notesVC = [storyboard instantiateViewControllerWithIdentifier:@"NotesViewControler"];
        [self.navigationController pushViewController:notesVC animated:YES];
    }

}


@end
