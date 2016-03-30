//
//  ChatSessionObserver.m
//  JSQMessages
//
//  Created by Quinto Technologies Pvt. Ltd. on 29/03/16.
//  Copyright © 2016 Hexed Bits. All rights reserved.
//

#import "ChatSessionObserver.h"

@implementation ChatSessionObserver

-(void) updateWithEvent:(SocketAnyEvent *)event {
    NSLog(@"Method called in %@ for event ============= %@",self.class,event.description);
}
@end
