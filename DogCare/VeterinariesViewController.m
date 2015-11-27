//
//  VeterinariesViewController.m
//  DogCare
//
//  Created by Weave Bytes Infotech on 14/11/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import "VeterinariesViewController.h"

@interface VeterinariesViewController ()

@end

@implementation VeterinariesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.veterinariesTableView.delegate = self;
    self.veterinariesTableView.dataSource = self;

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegate and DataSource methods -

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.imageView.image = [UIImage imageNamed:@"vetrenary-image.png"];
    
    switch (indexPath.row)
    {
        case 0:
            cell.textLabel.text = @"Dr.Abc";
            break;
            
        case 1:
            cell.textLabel.text = @"Dr.Abcd";
            break;
            
        case 2:
            cell.textLabel.text = @"Dr.Abcde";
            break;
            
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
