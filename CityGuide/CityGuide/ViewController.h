//
//  ViewController.h
//  CityGuide
//
//  Created by Rodrigo Fernandes Bulgarelli on 2/13/16.
//  Copyright © 2016 Rodrigo Fernandes Bulgarelli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray *cities;
    NSInteger selectedIndex;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

