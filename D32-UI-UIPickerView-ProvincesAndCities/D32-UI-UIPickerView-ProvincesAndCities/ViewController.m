//
//  ViewController.m
//  D32-UI-UIPickerView-ProvincesAndCities
//
//  Created by 孙磊 on 16/3/31.
//  Copyright © 2016年 sunlei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *pickeView;

@property(nonatomic,strong)NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置代理
    self.pickeView.dataSource=self;
    self.pickeView.delegate=self;
}

#pragma mark- 组
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.dataArray.count;
}


#pragma mark- 行




#pragma mark- 懒加载
-(NSArray *)dataArray
{
   
    if (_dataArray==nil) {
        NSArray *tempArray=[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"02cities.plist" ofType:nil]];
        
    }
    return _dataArray;
}
@end
