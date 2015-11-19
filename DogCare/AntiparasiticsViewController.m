//
//  AntiparasiticsViewController.m
//  DogCare
//
//  Created by Weave Bytes Infotech on 16/11/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import "AntiparasiticsViewController.h"
#import "AddAntiparasiticsViewController.h"

@interface AntiparasiticsViewController ()

@end

@implementation AntiparasiticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.antiparasiticsTableView.delegate = self;
    self.antiparasiticsTableView.dataSource = self;
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"rightMenu.jpg"]]];
    
    self.antiprsticsRtBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAntiparasiticsDetailsAction)];
    self.navigationItem.rightBarButtonItem = self.antiprsticsRtBarBtn;
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

-(void)addAntiparasiticsDetailsAction
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    AddAntiparasiticsViewController *addAntiprsiticsVC = [storyboard instantiateViewControllerWithIdentifier:@"AddAntiparasiticsViewControler"];
    [self.navigationController pushViewController:addAntiprsiticsVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
