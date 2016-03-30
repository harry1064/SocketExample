//
//  ChatSessionObserver.m
//  JSQMessages
//
//  Created by Quinto Technologies Pvt. Ltd. on 29/03/16.
//  Copyright © 2016 Hexed Bits. All rights reserved.
//

#import "ChatSessionObserver.h"
#import "SocketSingelton.h"
#define ROOMID @"12-1"
#define USERID @"12"
@implementation ChatSessionObserver

-(void) updateWithEvent:(SocketAnyEvent *)event {
    NSLog(@"Method called in %@ for event ============= %@",self.class,event.description);
    SocketSingelton *manager = [SocketSingelton sharedManager];
    if ([event.event isEqualToString:@"16"]) {
        [manager emit:@"13" withItems:@[@{@"userid" : USERID}]];
    }
    if ([event.event isEqualToString:@"14"]) {
        [manager emit:@"17" withItems:@[@{@"userid" : USERID,
                                                                  @"roomid" : ROOMID,
                                                                  @"users" : @[@"13",@"14"]}]];
    }

    if ([event.event isEqualToString:@"18"]) {
        [manager emit:@"1" withItems:@[@{@"roomid" : ROOMID,
                                         @"userid" : USERID,
                                         @"message" : @"Hello Socket"}]];
        NSLog(@"%@", event.description);
    }

    if ([event.event isEqualToString:@"1"]) {
        [manager emit:@"1" withItems:@[@{@"roomid" : ROOMID,
                                         @"userid" : USERID,
                                         @"message" : @"Hello Socket from clint"}]];
    }

}
@end
