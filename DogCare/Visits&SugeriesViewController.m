//
//  Visits&SugeriesViewController.m
//  DogCare
//
//  Created by Weave Bytes Infotech on 16/11/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import "Visits&SugeriesViewController.h"
#import "AddVisitsSurgeriesDetailsViewController.h"

@interface Visits_SugeriesViewController ()

@end

@implementation Visits_SugeriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.visitsSurgTableView.delegate = self;
    self.visitsSurgTableView.dataSource = self;
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"rightMenu.jpg"]]];
    
    self.visitsSurgeriesRghtBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addVisitsSurgeriesDetailsAction)];
    self.navigationItem.rightBarButtonItem = self.visitsSurgeriesRghtBarButton;
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

-(void)addVisitsSurgeriesDetailsAction
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    AddVisitsSurgeriesDetailsViewController *addVisitsSurgrsDtlsVC = [storyboard instantiateViewControllerWithIdentifier:@"AddVisitsSurgeriesDetailsViewControler"];
    [self.navigationController pushViewController:addVisitsSurgrsDtlsVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
