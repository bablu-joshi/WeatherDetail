//
//  BJEachCityDetailViewController.h
//  WeatherDetail
//
//  Created by Bablu Joshi on 02/06/14.
//  Copyright (c) 2014 BJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BJEachCityDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property(nonatomic,strong)NSArray *cityDeatiledWeatherData;

@property (weak, nonatomic) IBOutlet UILabel *cloudsLabel;

@property (weak, nonatomic) IBOutlet UILabel *degreeLevel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLevel;
@property (weak, nonatomic) IBOutlet UILabel *pressureLabel;
@property (weak, nonatomic) IBOutlet UILabel *rainLabel;
@property (weak, nonatomic) IBOutlet UILabel *speedlabel;
@property (weak, nonatomic) IBOutlet UILabel *daylabel;
@property (weak, nonatomic) IBOutlet UILabel *morningLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxLabel;
@property (weak, nonatomic) IBOutlet UILabel *minLabel;
@property (weak, nonatomic) IBOutlet UILabel *eveningLabel;

@property (weak, nonatomic) IBOutlet UILabel *nightLabel;

@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end
