//
//  NSString+Sh.m
//  LeeMall
//
//  Created by guest on 16/6/2.
//  Copyright © 2016年 zongqi.shen. All rights reserved.
//

#import "NSString+Sh.h"

@implementation NSString (Sh)

+ (id)stringToArrayOrNSDictionary:(NSString *)json{
    
    NSString *strEncode=[json stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    NSData *data=[strEncode dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                    options:NSJSONReadingAllowFragments
                                                      error:&error];
    
    if (jsonObject != nil && error == nil){
        
        return jsonObject;
    }else{
        NSLog(@"error=%@",[error localizedDescription]);
        // 解析错误
        return nil;
    }
    
}

+(NSString *)arrOrDicToJSON:(id)theData
{
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:theData
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    if ( error == nil){
        
        
        NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                     encoding:NSUTF8StringEncoding];
        jsonString =[jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        jsonString =[jsonString stringByReplacingOccurrencesOfString:@"\\\"" withString:@"\""];
        return jsonString;
    }else{
        return nil;
    }
}
@end
