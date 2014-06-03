//
//  BJViewController.h
//  WeatherDetail
//
//  Created by Bablu Joshi on 30/05/14.
//  Copyright (c) 2014 BJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "BJWeatherServerUtility.h"
#import "BJDetailTableViewController.h"

@interface BJViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
- (IBAction)getCityForcastButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIButton *getForecastButton;
@property (weak, nonatomic) IBOutlet UIButton *myLocationButton;
- (IBAction)getMyLoactionForecast:(id)sender;

@end
