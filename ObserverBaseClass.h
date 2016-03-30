//
//  ObserverBaseClass.h
//  JSQMessages
//
//  Created by Quinto Technologies Pvt. Ltd. on 29/03/16.
//  Copyright © 2016 Hexed Bits. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <SocketIOClientSwift/SocketIOClientSwift-Swift.h>
@interface ObserverBaseClass : UIViewController
- (void) updateWithEvent:(SocketAnyEvent *)event;
@end
