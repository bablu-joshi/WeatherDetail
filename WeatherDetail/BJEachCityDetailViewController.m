//
//  BJEachCityDetailViewController.m
//  WeatherDetail
//
//  Created by Bablu Joshi on 02/06/14.
//  Copyright (c) 2014 BJ. All rights reserved.
//

#import "BJEachCityDetailViewController.h"
#define KELVIN_CONSTANT 273.15

@interface BJEachCityDetailViewController ()

@end

@implementation BJEachCityDetailViewController
@synthesize cityDeatiledWeatherData=_cityDeatiledWeatherData;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (!(NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_6_1)) {
        self.navigationController.navigationBar.translucent = NO;
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title=@"Weather Detail";
    [_cloudsLabel setText:[NSString stringWithFormat:@"%@",[_cityDeatiledWeatherData valueForKey:@"clouds"]]];
    [_degreeLevel setText:[NSString stringWithFormat:@"%@",[_cityDeatiledWeatherData valueForKey:@"deg"]]];
    NSNumber *date=[NSNumber numberWithInt:[[_cityDeatiledWeatherData valueForKey:@"dt"] intValue]];
    [_dateLabel setText:[self getDateFromUnixTimeStamp:date]];
    [_humidityLevel setText:[NSString stringWithFormat:@"%@",[_cityDeatiledWeatherData valueForKey:@"humidity"]]];
    [_pressureLabel setText:[NSString stringWithFormat:@"%.2f",[[_cityDeatiledWeatherData valueForKey:@"pressure"] doubleValue]]];
    [_rainLabel setText:[NSString stringWithFormat:@"%@",[_cityDeatiledWeatherData valueForKey:@"rain"]]];
    [_speedlabel setText:[NSString stringWithFormat:@"%@",[_cityDeatiledWeatherData valueForKey:@"speed"]]];
    [_daylabel setText:[NSString stringWithFormat:@"%@",[[_cityDeatiledWeatherData valueForKey:@"temp"] valueForKey:@"day"]]] ;
    [_maxLabel setText:[NSString stringWithFormat:@"%@",[[_cityDeatiledWeatherData valueForKey:@"temp"] valueForKey:@"max"]]] ;
    [_minLabel setText:[NSString stringWithFormat:@"%@",[[_cityDeatiledWeatherData valueForKey:@"temp"] valueForKey:@"min"]]] ;
    [_morningLabel setText: [NSString stringWithFormat:@"%.2f", [[[_cityDeatiledWeatherData valueForKey:@"temp"] valueForKey:@"morn"] doubleValue]]] ;
    [_eveningLabel setText: [NSString stringWithFormat:@"%.2f", [[[_cityDeatiledWeatherData valueForKey:@"temp"] valueForKey:@"eve"] doubleValue]]] ;
    [_nightLabel setText: [NSString stringWithFormat:@"%.2f", [[[_cityDeatiledWeatherData valueForKey:@"temp"] valueForKey:@"night"] doubleValue]]] ;
    [_descriptionLabel setText:[[[_cityDeatiledWeatherData valueForKey:@"weather"] objectAtIndex:0] valueForKey:@"description"]];
    
}




/*!
 Gets date in dd.mm.yyy format from unix timestamp 
 \param timeStamp A nsnumber containing unixTimestamp
 \return A string date.
 */
-(NSString *)getDateFromUnixTimeStamp:(NSNumber *)timeStamp
{
    
    double unixTimeStamp =[timeStamp doubleValue];
    NSTimeInterval _interval=unixTimeStamp;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    NSDateFormatter *_formatter=[[NSDateFormatter alloc]init];
    [_formatter setLocale:[NSLocale currentLocale]];
    [_formatter setDateFormat:@"dd.MM.yyyy"];
    NSString *_date=[_formatter stringFromDate:date];
    return _date;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
