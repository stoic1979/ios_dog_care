//
//  Medicine&AdminViewController.h
//  DogCare
//
//  Created by Weave Bytes Infotech on 16/11/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Medicine_AdminViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *medicinesTableView;
@property UIBarButtonItem *medcneAdminRghtBarButton;

-(void)addMedicneAdminDetailsAction;

@end
