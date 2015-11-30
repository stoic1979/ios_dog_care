//
//  MemoViewController.m
//  DogCare
//
//  Created by Weave Bytes Infotech on 14/11/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import "MemoViewController.h"
#import "NotesViewController.h"
#import "DBManager.h"

@interface MemoViewController ()

@end

@implementation MemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.memoTableView.delegate = self;
    self.memoTableView.dataSource = self;
                           
    self.notesArray = [[NSMutableArray alloc]init];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    DBManager *dbManager = [[DBManager alloc]init];
    self.notesArray = [dbManager fetchNotesList:[defaults integerForKey:@"dogInfoId"]];
    
    [self.memoTableView reloadData];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegate and DataSource methods -

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.notesArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [self.notesArray objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"notesEdit" forKey:@"NotesWork"];
    [defaults setInteger:indexPath.row forKey:@"indexNumber"];
        
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NotesViewController *notesVC = [storyboard instantiateViewControllerWithIdentifier:@"NotesViewControler"];
    [self.navigationController pushViewController:notesVC animated:YES];
}


@end
