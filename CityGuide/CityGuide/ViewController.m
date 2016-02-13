//
//  ViewController.m
//  CityGuide
//
//  Created by Rodrigo Fernandes Bulgarelli on 2/13/16.
//  Copyright © 2016 Rodrigo Fernandes Bulgarelli. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "City.h"
#import "CityController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    cities = delegate.cities;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource methods

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if ( nil == cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    City *city = [cities objectAtIndex:indexPath.row];
    cell.textLabel.text = city.cityName;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [cities count];
}

#pragma mark UITableViewDataDelegate methods

-(void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    selectedIndex = indexPath.row;
    [self performSegueWithIdentifier:@"SegueToDetailPage" sender:self];
    [tv deselectRowAtIndexPath:indexPath animated: YES];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SegueToDetailPage"]){
        CityController *cityController = (CityController *) segue.destinationViewController;
        cityController.city = [cities objectAtIndex:selectedIndex];
    }
}


@end
