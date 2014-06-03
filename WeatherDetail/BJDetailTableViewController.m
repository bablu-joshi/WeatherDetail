//
//  BJDetailTableViewController.m
//  WeatherDetail
//
//  Created by Bablu Joshi on 30/05/14.
//  Copyright (c) 2014 BJ. All rights reserved.
//

#import "BJDetailTableViewController.h"

@interface BJDetailTableViewController ()
{
    NSArray *list;;
}
@end

@implementation BJDetailTableViewController
@synthesize data=_data;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.title=[[_data valueForKey:@"city"] valueForKey:@"name"];
    list=[_data valueForKey:@"list"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [list count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell"];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DetailCell"];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    

    
    cell.textLabel.text=[NSString stringWithFormat:@"Date :%@",[self getDateFromUnixTimeStamp:[[list objectAtIndex:indexPath.row] valueForKey:@"dt"]]];
    
    
    
    return cell;
}




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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //required in prepare for segue
    BJEachCityDetailViewController *eachCityDetail=[self.storyboard instantiateViewControllerWithIdentifier:@"eachCityDetailViewController"];
    
    // Pass any objects to the view controller here, like...
    [eachCityDetail setCityDeatiledWeatherData:[list objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:eachCityDetail animated:YES];
}


@end
