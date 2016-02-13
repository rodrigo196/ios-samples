//
//  CityController.m
//  CityGuide
//
//  Created by Rodrigo Fernandes Bulgarelli on 2/13/16.
//  Copyright © 2016 Rodrigo Fernandes Bulgarelli. All rights reserved.
//

#import "CityController.h"

@interface CityController ()

@end

@implementation CityController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (nil != self.city){
        self.navigationItem.title = self.city.cityName;
        descriptionView.text = self.city.cityDescription;
        descriptionView.editable = NO;
        picture.image = self.city.cityPicture;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
