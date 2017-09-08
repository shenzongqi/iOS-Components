//
//  NSString+Sh.h
//  LeeMall
//
//  Created by guest on 16/6/2.
//  Copyright © 2016年 MaxWellPro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Sh)

+ (id)stringToArrayOrNSDictionary:(NSString *)json;

+(NSString *)arrOrDicToJSON:(id)theData;

@end
