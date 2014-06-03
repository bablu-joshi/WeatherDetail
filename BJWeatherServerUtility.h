//
//  BJWeatherServerUtility.h
//  WeatherDetail
//
//  Created by Bablu Joshi on 30/05/14.
//  Copyright (c) 2014 BJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface BJWeatherServerUtility : NSObject  
typedef void (^BJWeatherWebHandler)(NSError *error, id data);


/*!
 Gets city detail from WebService.
 \param cityName A string containing name of city
 \return A json with desired response
 */
-(void)getDetailForCity :(NSString *)cityName completion:(BJWeatherWebHandler)handler;


/*!
 Gets city detail from WebService for current GPS location.
 \param CLLocationCoordinate2D current location of user(latitude,longitude)
 \return A json with desired response
 */
-(void)getDetailForCoordinate:(CLLocationCoordinate2D )coordinate   completion:(BJWeatherWebHandler)handler;
@end
