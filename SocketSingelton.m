//
//  SocketSingelton.m
//  JSQMessages
//
//  Created by Quinto Technologies Pvt. Ltd. on 29/03/16.
//  Copyright © 2016 Hexed Bits. All rights reserved.
//

#import "SocketSingelton.h"

@implementation SocketSingelton

+ (instancetype)sharedManager {
    static SocketSingelton *sharedSocket = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSocket = [[self alloc] init];
    });
    return sharedSocket;
}

- (id) init {
    self = [super init];
    if (self) {
        self.observers = [[NSMutableArray alloc] init];
    }
    return self;
}


- (void) initializeSocketWithOptions:(NSDictionary *)options {
    NSURL *url = [NSURL URLWithString:self.serverUrl];
    self.socket = [[SocketIOClient alloc] initWithSocketURL:url options:options];
    [self.socket onAny:^(SocketAnyEvent * anyEvent) {
        [self notifyObserver:anyEvent];
    }];
}
- (void) connect {
    if (self.socket) {
          [self.socket connect];
    }else{
        NSLog(@"%@: Socket is not initialized. call initializeSocketWithOptions: first then connect",self.class);
    }
  
}

- (void) addObserver:(ObserverBaseClass *)observer {
    [self.observers addObject:observer];
}

- (void) notifyObserver:(SocketAnyEvent *)event {
    for (ObserverBaseClass * o in self.observers) {
        [o updateWithEvent:event];
    }
}

- (void) removeObserver:(ObserverBaseClass *)observer {
    NSArray * array = [self.observers copy];
    for (ObserverBaseClass * o in array) {
        if ([o isEqual:observer]) {
            [self.observers removeObject:o];
        }
    }
    
}
@end
