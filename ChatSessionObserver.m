//
//  ChatSessionObserver.m
//  JSQMessages
//
//  Created by Quinto Technologies Pvt. Ltd. on 29/03/16.
//  Copyright © 2016 Hexed Bits. All rights reserved.
//

#import "ChatSessionObserver.h"
#import "SocketSingelton.h"
@implementation ChatSessionObserver

-(void) updateWithEvent:(SocketAnyEvent *)event {
    NSLog(@"Method called in %@ for event ============= %@",self.class,event.description);
    if ([event.event isEqualToString:@"16"]) {
        [[SocketSingelton sharedManager] emit:@"13" withItems:@[@{@"userid" : @"12"}]];
    }
    if ([event.event isEqualToString:@"14"]) {
        [[SocketSingelton sharedManager] emit:@"17" withItems:@[@{@"userid" : @"12",
                                                                  @"roomid" : @"12-1",
                                                                  @"users" : @[@"13",@"14"]}]];
    }
    
    if ([event.event isEqualToString:@"18"]) {
        NSLog(@"%@", event.description);
    }

}
@end
