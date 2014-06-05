//
//  main.m
//  Callbacks
//
//  Created by Keith Samson on 6/5/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Logger.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Logger *logger = [[Logger alloc]init];
        
        NSURL *url = [NSURL URLWithString:@"http://upload.wikimedia.org/wikipedia/commons/2/22/Turkish_Van_Cat.jpg"];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        __unused NSURLConnection *fetchConn = [[NSURLConnection alloc]
                                               initWithRequest:request
                                               delegate:logger
                                               startImmediately:YES];
        
        
        __unused NSTimer *timer = [NSTimer
                          scheduledTimerWithTimeInterval:2.0
                          target:logger
                          selector:@selector(sayOuch:)
                          userInfo:nil
                          repeats:YES];
        
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}

