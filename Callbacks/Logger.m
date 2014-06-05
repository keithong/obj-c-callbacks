//
//  Logger.m
//  Callbacks
//
//  Created by Keith Samson on 6/5/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "Logger.h"

@implementation Logger
-(void)sayOuch:(NSTimer *)t
{
    NSLog(@"Ouch!");
}

//This is called each time a chunk of data arrives
-(void)connection: (NSURLConnection *)connection
    didReceiveData:(NSData *)data
{
    NSLog(@"Received %lu bytes", [data length]);
    
    //Create a mutable data if it doesn't already exist
    if (!incomingData){
        incomingData = [[NSMutableData alloc] init];
    }
    
    [incomingData appendData:data];
}

//Called when the last chunk has been processed
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Got it all!");
    NSString *string =[[NSString alloc]initWithData:incomingData
                                           encoding:NSUTF8StringEncoding];
    
    incomingData = nil;
    NSLog(@"String has %lu characters", [string length]);
    
    NSLog(@"The whole string is %@", string);
}

//Called if fetch fails
-(void)connection:(NSURLConnection *)connection
    didFailWithError:(NSError *)error
{
    NSLog(@"Connection failed: %@",[error localizedDescription]);
    incomingData = nil;
}

-(void)zoneChange:(NSNotification *)note
{
    NSLog(@"The system time zone has changed!");
}
@end
