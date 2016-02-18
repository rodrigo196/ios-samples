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
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    
    if (indexPath.row < cities.count){
        City *city = [cities objectAtIndex:indexPath.row];
        cell.textLabel.text = city.cityName;
    }else{
        cell.textLabel.text = @"Adicionar nova cidade...";
        cell.textLabel.textColor = [UIColor lightGrayColor];
        cell.editingAccessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = [cities count];
    
    if (self.editing){
        count = count + 1;
    }
    
    return count;
}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated{
    if (editing != self.editing){
        [super setEditing:editing animated:animated];
        [self.tableView setEditing:editing animated:animated];
        NSArray *indexies = [NSArray arrayWithObject: [NSIndexPath indexPathForRow:cities.count inSection:0]];
        if (editing == YES){
            [self.tableView insertRowsAtIndexPaths:indexies withRowAnimation:UITableViewRowAnimationLeft];
        }else{
            [self.tableView deleteRowsAtIndexPaths:indexies withRowAnimation:UITableViewRowAnimationLeft];
        }
    }
}

#pragma mark UITableViewDataDelegate methods

-(void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    selectedIndex = indexPath.row;
    [self performSegueWithIdentifier:@"SegueToDetailPage" sender:self];
    [tv deselectRowAtIndexPath:indexPath animated: YES];
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row < cities.count){
        return UITableViewCellEditingStyleDelete;
    }else{
        return UITableViewCellEditingStyleInsert;
    }
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete){
        [cities removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SegueToDetailPage"]){
        CityController *cityController = (CityController *) segue.destinationViewController;
        cityController.city = [cities objectAtIndex:selectedIndex];
    }
}


@end
