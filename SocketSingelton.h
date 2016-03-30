//
//  SocketSingelton.h
//  JSQMessages
//
//  Created by Quinto Technologies Pvt. Ltd. on 29/03/16.
//  Copyright © 2016 Hexed Bits. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SocketIOClientSwift/SocketIOClientSwift-Swift.h>
#import "ObserverBaseClass.h"
@interface SocketSingelton : NSObject
/*!
 * @brief This string repersents the server url to which client connect via socket.
 */
@property (nonatomic, strong) NSString *serverUrl;
/*!
 * @brief This repersents the socket through which client connects to server.
 */
@property (nonatomic, strong) SocketIOClient *socket;
/*!
 * @brief This is list of observers listening.
 */
@property (nonatomic, strong) NSMutableArray *observers;

+ (instancetype)sharedManager;

/*!
 * @brief Connect the socket to the server.In this method we call [socket connect]; .
 */
- (void) connect;
/*!
 * @brief This method initialize the socket
 */
- (void) initializeSocketWithOptions:(NSDictionary *)options;
/*!
 * @brief This method add observers
 */
- (void) addObserver:(ObserverBaseClass *)observer;
/*!
 * @brief This method remove observer from the observers list.
 */
- (void) removeObserver:(ObserverBaseClass *)observer;
/*!
 * @brief This method notify the observer with the event recieved
 */
- (void) notifyObserver:(SocketAnyEvent *)event;

@end
