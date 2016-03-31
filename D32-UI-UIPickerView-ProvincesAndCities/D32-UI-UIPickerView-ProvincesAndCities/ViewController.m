//
//  ViewController.m
//  D32-UI-UIPickerView-ProvincesAndCities
//
//  Created by 孙磊 on 16/3/31.
//  Copyright © 2016年 sunlei. All rights reserved.
//

#import "ViewController.h"
#import "ProvinceModel.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *pickeView;

@property(nonatomic,strong)NSArray *dataArray;

@property(nonatomic,strong)NSArray *cityArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置代理
    self.pickeView.dataSource=self;
    self.pickeView.delegate=self;
    
    //加载页面时显示0组0列
    [self pickerView:self.pickeView didSelectRow:0 inComponent:0];
}

#pragma mark- 实现选中的代理方法
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
   //如果滚动第0组,则刷新第1组数据
    if (component==0) {
        [self.pickeView reloadComponent:1];
        [self.pickeView selectRow:0 inComponent:1 animated:YES];
    }
}

#pragma mark- 组
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}


#pragma mark- 行
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //如果是第0组
    if(component==0)
    {
        return self.dataArray.count;
    }else{
        //根据省的下标获取城市的行数
        NSInteger proComponent=[self.pickeView selectedRowInComponent:0];
        
        ProvinceModel *cityArray=self.dataArray[proComponent];
        self.cityArray=cityArray.cities;
        
        return self.cityArray.count;
    }
    
}

#pragma mark- 内容
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    //第0组返回的数据
    if (component==0) {
        ProvinceModel *proModel=self.dataArray[row];
        return proModel.name;
    }else
    {
        
        return self.cityArray[row];
    }
}



#pragma mark- 懒加载
-(NSArray *)dataArray
{
   
    if (_dataArray==nil) {
        NSString *strPath=[[NSBundle mainBundle]pathForResource:@"02cities.plist" ofType:nil];
        
        NSArray *tempArray=[NSArray arrayWithContentsOfFile:strPath];
        NSMutableArray *muArray=[NSMutableArray arrayWithCapacity:tempArray.count];
        
        [tempArray enumerateObjectsUsingBlock:^(NSDictionary*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            ProvinceModel *proModel=[ProvinceModel ProvinceModelWithDic:obj];
            [muArray addObject:proModel];
        }];
        _dataArray=muArray;
    }
    return _dataArray;
}
@end
