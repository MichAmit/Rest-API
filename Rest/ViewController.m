//
//  ViewController.m
//  Rest
//
//  Created by Amit Gawai on 04/01/18.
//  Copyright © 2018 Amit Gawai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchGreeting];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)fetchGreeting{
    [[[NSURLSession sharedSession]dataTaskWithURL:[NSURL URLWithString:@"http://rest-service.guides.spring.io/greeting"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data.length > 0 && error == nil) {
            NSDictionary *greeting = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            self.greetingId.text=[[greeting objectForKey:@"id"]stringValue];
            self.greetingContent.text=[greeting objectForKey:@"content"];
        }
    }]resume];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
