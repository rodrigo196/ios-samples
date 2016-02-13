//
//  City.h
//  CityGuide
//
//  Created by Rodrigo Fernandes Bulgarelli on 2/13/16.
//  Copyright © 2016 Rodrigo Fernandes Bulgarelli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface City : NSObject

@property (nonatomic, strong) NSString *cityName;
@property (nonatomic, strong) NSString *cityDescription;
@property (nonatomic, strong) UIImage *cityPicture;

@end
