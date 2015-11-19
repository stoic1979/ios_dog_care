//
//  Medicine&AdminViewController.m
//  DogCare
//
//  Created by Weave Bytes Infotech on 16/11/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import "Medicine&AdminViewController.h"
#import "AddMedicineAdminDetailsViewController.h"

@interface Medicine_AdminViewController ()

@end

@implementation Medicine_AdminViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.medicinesTableView.delegate = self;
    self.medicinesTableView.dataSource = self;
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"rightMenu.jpg"]]];
    
    self.medcneAdminRghtBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addMedicneAdminDetailsAction)];
    self.navigationItem.rightBarButtonItem = self.medcneAdminRghtBarButton;
    // Do any additional setup after loading the view.
}

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

-(void)addMedicneAdminDetailsAction
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    AddMedicineAdminDetailsViewController *addMedicneDetailsVC = [storyboard instantiateViewControllerWithIdentifier:@"AddMedicineAdminDetailsViewControler"];
    [self.navigationController pushViewController:addMedicneDetailsVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
