//
//  ChatSessionObserver.h
//  JSQMessages
//
//  Created by Quinto Technologies Pvt. Ltd. on 29/03/16.
//  Copyright © 2016 Hexed Bits. All rights reserved.
//

#import "ObserverBaseClass.h"

@interface ChatSessionObserver : ObserverBaseClass

- (void) updateWithEvent:(SocketAnyEvent *)event;
@end
