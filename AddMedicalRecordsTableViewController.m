//
//  AddMedicalRecordsTableViewController.m
//  DogCare
//
//  Created by wb27 on 11/24/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import "AddMedicalRecordsTableViewController.h"
#import "AddVaccinDetailsViewController.h"
#import "AddAntiparasiticsViewController.h"
#import "AddMedicineAdminDetailsViewController.h"
#import "AddVisitsSurgeriesDetailsViewController.h"
#import "DBManager.h"


@interface AddMedicalRecordsTableViewController ()

@end

@implementation AddMedicalRecordsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.vaccintnArray = [[NSMutableArray alloc]init];
    self.antprsticsArray = [[NSMutableArray alloc]init];
    self.medAdmintrtnArray = [[NSMutableArray alloc]init];
    self.visitsSurgiesArray = [[NSMutableArray alloc]init];
    
    self.addMedRecrdsTableView.delegate = self;
    self.addMedRecrdsTableView.dataSource = self;
    
    self.medclRcrdsRgtBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addMediclRecrdsDetailsAction)];
    self.navigationItem.rightBarButtonItem = self.medclRcrdsRgtBarBtn;

    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:@"medAdd" forKey:@"MedAction"];
    
    NSString *medRecrd = [defaults objectForKey:@"MedRecrds"];
    
    DBManager *dbManager = [[DBManager alloc]init];
    
    self.medclRecrdsArray = [[NSMutableArray alloc]init];
    
    if([medRecrd isEqualToString:@"vaccination"])
    {
        self.medclRecrdsArray = [dbManager fetchVaccinationTitles:[defaults integerForKey:@"dogInfoId"]];
    }
    else if ([medRecrd isEqualToString:@"antiprstics"])
    {
        self.medclRecrdsArray = [dbManager fetchAntiprsticsTitles:[defaults integerForKey:@"dogInfoId"]];
    }
    else if ([medRecrd isEqualToString:@"medcneAdmintrtn"])
    {
        self.medclRecrdsArray = [dbManager fetchMedicineAdminTitles:[defaults integerForKey:@"dogInfoId"]];
    }
    else if ([medRecrd isEqualToString:@"visitsSurgries"])
    {
        self.medclRecrdsArray = [dbManager fetchVisitsSurgriesDates:[defaults integerForKey:@"dogInfoId"]];
    }
    
    [self.addMedRecrdsTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addMediclRecrdsDetailsAction
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *medRecrd = [defaults objectForKey:@"MedRecrds"];
    
    [defaults setObject:@"medAdd" forKey:@"MedAction"];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    if([medRecrd isEqualToString:@"vaccination"])
    {
        AddVaccinDetailsViewController *vaccinDtlsVC = [storyboard instantiateViewControllerWithIdentifier:@"AddVaccinDetailsViewControler"];
        [self.navigationController pushViewController:vaccinDtlsVC animated:YES];
    }
    else if ([medRecrd isEqualToString:@"antiprstics"])
    {
        AddAntiparasiticsViewController *antprsticDtlsVC = [storyboard instantiateViewControllerWithIdentifier:@"AddAntiparasiticsViewControler"];
        [self.navigationController pushViewController:antprsticDtlsVC animated:YES];
    }
    else if ([medRecrd isEqualToString:@"medcneAdmintrtn"])
    {
        AddMedicineAdminDetailsViewController *medAdmnDtlsVC = [storyboard instantiateViewControllerWithIdentifier:@"AddMedicineAdminDetailsViewControler"];
        [self.navigationController pushViewController:medAdmnDtlsVC animated:YES];
    }
    else if ([medRecrd isEqualToString:@"visitsSurgries"])
    {
        AddVisitsSurgeriesDetailsViewController *vstSurgsDtlsVC = [storyboard instantiateViewControllerWithIdentifier:@"AddVisitsSurgeriesDetailsViewControler"];
        [self.navigationController pushViewController:vstSurgsDtlsVC animated:YES];
    }

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.medclRecrdsArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [self.medclRecrdsArray objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *medRecrd = [defaults objectForKey:@"MedRecrds"];
    
    [defaults setObject:@"medEdit" forKey:@"MedAction"];
    
    [defaults setInteger:indexPath.row forKey:@"indexNumber"];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    if([medRecrd isEqualToString:@"vaccination"])
    {
        AddVaccinDetailsViewController *vaccinDtlsVC = [storyboard instantiateViewControllerWithIdentifier:@"AddVaccinDetailsViewControler"];
        [self.navigationController pushViewController:vaccinDtlsVC animated:YES];
    }
    else if ([medRecrd isEqualToString:@"antiprstics"])
    {
        AddAntiparasiticsViewController *antprsticDtlsVC = [storyboard instantiateViewControllerWithIdentifier:@"AddAntiparasiticsViewControler"];
        [self.navigationController pushViewController:antprsticDtlsVC animated:YES];
    }
    else if ([medRecrd isEqualToString:@"medcneAdmintrtn"])
    {
        AddMedicineAdminDetailsViewController *medAdmnDtlsVC = [storyboard instantiateViewControllerWithIdentifier:@"AddMedicineAdminDetailsViewControler"];
        [self.navigationController pushViewController:medAdmnDtlsVC animated:YES];
    }
    else if ([medRecrd isEqualToString:@"visitsSurgries"])
    {
        AddVisitsSurgeriesDetailsViewController *vstSurgsDtlsVC = [storyboard instantiateViewControllerWithIdentifier:@"AddVisitsSurgeriesDetailsViewControler"];
        [self.navigationController pushViewController:vstSurgsDtlsVC animated:YES];
    }

    
}


@end
