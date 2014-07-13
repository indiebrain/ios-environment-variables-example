//
//  Environment.h
//  MyAppIOS
//
//  Created by Aaron Kuehler on 7/13/14.
//  Copyright (c) 2014 Aaron Kuehler. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Environment : NSObject
+ (Environment*) sharedInstance;
- (id) fetch:(NSString*)key;
@end
