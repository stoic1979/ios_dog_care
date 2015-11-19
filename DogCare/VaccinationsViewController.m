//
//  VaccinationsViewController.m
//  DogCare
//
//  Created by Weave Bytes Infotech on 16/11/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import "VaccinationsViewController.h"
#import "AddVaccinDetailsViewController.h"

@interface VaccinationsViewController ()

@end

@implementation VaccinationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.vaccinationTableView.delegate = self;
    self.vaccinationTableView.dataSource = self;
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"rightMenu.jpg"]]];
    
    self.vaccntionRgtBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addVaccinationDetailsAction)];
    self.navigationItem.rightBarButtonItem = self.vaccntionRgtBarBtn;
    // Do any additional setup after loading the view.
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
    return cell;
}

-(void)addVaccinationDetailsAction
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    AddVaccinDetailsViewController *addVaccinVC = [storyboard instantiateViewControllerWithIdentifier:@"AddVaccinDetailsViewControler"];
    [self.navigationController pushViewController:addVaccinVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
