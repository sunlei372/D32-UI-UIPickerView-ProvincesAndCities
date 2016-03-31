//
//  ProvinceModel.m
//  D32-UI-UIPickerView-ProvincesAndCities
//
//  Created by 孙磊 on 16/3/31.
//  Copyright © 2016年 sunlei. All rights reserved.
//

#import "ProvinceModel.h"

@implementation ProvinceModel
-(instancetype)initWithDict:(NSDictionary *)dic
{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+(instancetype)ProvinceModelWithDic:(NSDictionary *)dic
{
    return [[self alloc]initWithDict:dic];
}

@end
