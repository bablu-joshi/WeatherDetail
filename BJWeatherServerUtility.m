//
//  BJWeatherServerUtility.m
//  WeatherDetail
//
//  Created by Bablu Joshi on 30/05/14.
//  Copyright (c) 2014 BJ. All rights reserved.
//

#import "BJWeatherServerUtility.h"
#define API_KEY @"285e127d48b524bf6faca7db9527480b"
#define SEARCH_BY_CITY_BASE_URL @"http://api.openweathermap.org/data/2.5/forecast/daily?q="

@implementation BJWeatherServerUtility
-(void)getDetailForCity :(NSString *)cityName completion:(BJWeatherWebHandler)handler{
    
    NSString *urlString =[NSString stringWithFormat:@"%@%@&cnt=14&APPID=%@",SEARCH_BY_CITY_BASE_URL,cityName,API_KEY];
    
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         
         
         
         if (error)
         {
             handler(error,nil);
         }
         else
         {
             NSError *error;
             NSArray * responseJson = [NSJSONSerialization
                                       JSONObjectWithData:data options:kNilOptions error:&error
                                       ];
             
             handler(nil,responseJson);
             
         }
     }];
}




-(void)getDetailForCoordinate:(CLLocationCoordinate2D )coordinateForCurrentCity   completion:(BJWeatherWebHandler)handler{
    
    
    
    NSString *urlString =[NSString stringWithFormat:@"%@lat=%f&lon=%fcnt=14&modejson",SEARCH_BY_CITY_BASE_URL,coordinateForCurrentCity.latitude, coordinateForCurrentCity.longitude];
    
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         
         if (error)
         {
             handler(error,nil);
         }
         else
         {
             NSError *error;
             NSArray * responseJson = [NSJSONSerialization
                                       JSONObjectWithData:data options:kNilOptions error:&error
                                       ];
             
             handler(nil,responseJson);
         }
     }];
    
}




@end
