//
//  CityController.h
//  CityGuide
//
//  Created by Rodrigo Fernandes Bulgarelli on 2/13/16.
//  Copyright © 2016 Rodrigo Fernandes Bulgarelli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@interface CityController : UIViewController{
    __weak IBOutlet UIImageView *picture;
    __weak IBOutlet UITextView *descriptionView;
}

@property(strong, nonatomic)City *city;
@end
