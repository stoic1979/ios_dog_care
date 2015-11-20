//
//  AddAntiparasiticsViewController.m
//  DogCare
//
//  Created by wb27 on 11/18/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import "AddAntiparasiticsViewController.h"

@interface AddAntiparasiticsViewController ()

@end

@implementation AddAntiparasiticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"rightMenu.jpg"]]];
    
    self.antiparasiticsScrollView.showsVerticalScrollIndicator = YES;
    self.antiparasiticsScrollView.showsHorizontalScrollIndicator = YES;
    self.antiparasiticsScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 800);
    [self.view addSubview:self.antiparasiticsScrollView];
    
    self.doneRtBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneAction)];
    self.navigationItem.rightBarButtonItem = self.doneRtBarBtn;
    // Do any additional setup after loading the view.
}

-(void)doneAction
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
