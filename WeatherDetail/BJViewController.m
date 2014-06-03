//
//  BJViewController.m
//  WeatherDetail
//
//  Created by Bablu Joshi on 30/05/14.
//  Copyright (c) 2014 BJ. All rights reserved.
//

#import "BJViewController.h"


/*!
 Private declaration.
 */
@interface BJViewController ()
{
    CLLocationManager *locationManager;
    BJWeatherServerUtility *serverUtility;
}
@end

@implementation BJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    [locationManager startUpdatingLocation];
    [self.activityIndicator setHidden:YES];
    serverUtility=[[BJWeatherServerUtility alloc]init];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}


/*!
 Gets city detail for given city from WebService.
 */
- (IBAction)getCityForcastButton:(UIButton *)sender {
    
    [self.cityTextField resignFirstResponder];
    [self.activityIndicator setHidden:NO];
    [self.activityIndicator startAnimating];
    
    
    
    if (self.cityTextField.text!=nil) {
        
        [self.getForecastButton setEnabled:NO];
        [serverUtility getDetailForCity:self.cityTextField.text completion:^(NSError *error, id data) {
            
            if ([[data valueForKey:@"cod"]isEqualToString:@"404"]) {
                
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message: [data valueForKey:@"cod"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            else
            {
                if (data!=nil) {
                    [self.activityIndicator setHidden:YES];
                    [self.activityIndicator stopAnimating];
                    
                    BJDetailTableViewController *detailVC=[self.storyboard instantiateViewControllerWithIdentifier:@"DetailTableView"];
                    [detailVC setData:data];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.cityTextField setText:@""];
                        [self.navigationController pushViewController:detailVC animated:YES];
                    });
                    
                    
                }
            }
            
        }];
        
        
    }
    
}


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self.activityIndicator setHidden:YES];
    [self.activityIndicator stopAnimating];
    [self.getForecastButton setEnabled:YES];
    
    textField.returnKeyType = UIReturnKeyGo;
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
    
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    //Allow search for non empty textfield.
    if (textField.text.length>0) {
        [self getCityForcastButton:nil];
    }
    [textField resignFirstResponder];
    return YES;
    
}

- (IBAction)backgroundTouch {
    
    [self.cityTextField resignFirstResponder];
}

/*!
 Gets current location detail from WebService.
 */
- (IBAction)getMyLoactionForecast:(id)sender {
    
    [self.view endEditing:YES];
    [self.activityIndicator setHidden:NO];
    [self.activityIndicator startAnimating];
    
    int latitude = (int)locationManager.location.coordinate.latitude;
    int longitude = (int)locationManager.location.coordinate.longitude;
    
    CLLocationCoordinate2D currentLocationCoordinate=CLLocationCoordinate2DMake(latitude, longitude);
    
    [serverUtility getDetailForCoordinate:currentLocationCoordinate completion:^(NSError *error, id data) {
        
        if (data!=nil) {
            
            BJDetailTableViewController *detailVC=[self.storyboard instantiateViewControllerWithIdentifier:@"DetailTableView"];
            [detailVC setData:data];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.cityTextField setText:@""];
                [self.activityIndicator setHidden:YES];
                [self.activityIndicator stopAnimating];
                
                [self.navigationController pushViewController:detailVC animated:YES];
            });
            
            
        }
        
    }];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
