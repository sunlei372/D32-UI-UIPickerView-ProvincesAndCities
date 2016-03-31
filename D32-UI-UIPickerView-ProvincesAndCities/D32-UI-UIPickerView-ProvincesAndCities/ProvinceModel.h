//
//  ProvinceModel.h
//  D32-UI-UIPickerView-ProvincesAndCities
//
//  Created by 孙磊 on 16/3/31.
//  Copyright © 2016年 sunlei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProvinceModel : NSObject
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSArray *cities;

-(instancetype)initWithDict:(NSDictionary *)dic;

+(instancetype)ProvinceModelWithDic:(NSDictionary*)dic;

@end
