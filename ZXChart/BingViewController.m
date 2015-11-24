//
//  BingViewController.m
//  ZXChart
//
//  Created by Bizapper VM MacOS  on 15/11/23.
//  Copyright (c) 2015年 Bizapper VM MacOS. All rights reserved.
//

#define UISCREEN    [UIScreen mainScreen].bounds


#import "BingViewController.h"
#import "PCPieChart.h"

@interface BingViewController ()

@end

@implementation BingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor colorWithWhite:1 alpha:1]];
    
    
    int height = [self.view bounds].size.width/3*2.; // 220;
    int width = [self.view bounds].size.width; //320;
    PCPieChart *pieChart = [[PCPieChart alloc] initWithFrame:CGRectMake(([self.view bounds].size.width-width)/2,([self.view bounds].size.height-height)/2,width,height)];
    [pieChart setShowArrow:NO];
    [pieChart setSameColorLabel:NO];
    [pieChart setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin];
    [pieChart setDiameter:width / 2];
    [self.view addSubview:pieChart];
    
    
    NSString *sampleFile = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"sample_piechart_data.plist"];
    NSDictionary *sampleInfo = [NSDictionary dictionaryWithContentsOfFile:sampleFile];
    NSMutableArray *components = [NSMutableArray array];
    for (int i=0; i<[[sampleInfo objectForKey:@"data"] count]; i++)
    {
        NSDictionary *item = [[sampleInfo objectForKey:@"data"] objectAtIndex:i];
        PCPieComponent *component = [PCPieComponent pieComponentWithTitle:nil value:[[item objectForKey:@"value"] floatValue]];
        [components addObject:component];
        
        if (i==0)
        {
            [component setColour:[UIColor redColor]];
            _zongjianLab.text = [[item objectForKey:@"value"] stringValue];
            CGFloat value = [[item objectForKey:@"value"]floatValue] *150 / 100;
            CGRect rect = _zongjianView.frame;
            rect.size.width = value;
            _zongjianView.frame = rect;
        }
        else if (i==1)
        {
            [component setColour:[UIColor blueColor]];
            _jingyouLab.text = [[item objectForKey:@"value"] stringValue];
            CGFloat value = [[item objectForKey:@"value"]floatValue] *150 / 100;
            CGRect rect = _jingyouView.frame;
            rect.size.width = value;
            _jingyouView.frame = rect;
        }
        else if (i==2)
        {
            [component setColour:[UIColor greenColor]];
            _qitaLab.text = [[item objectForKey:@"value"] stringValue];
            CGFloat value = [[item objectForKey:@"value"]floatValue] *150 / 100;
            CGRect rect = _qitaView.frame;
            rect.size.width = value;
            _qitaView.frame = rect;
        }
//        else if (i==3)
//        {
//            [component setColour:PCColorRed];
//        }
//        else if (i==4)
//        {
//            [component setColour:PCColorBlue];
//        }
    }
    [pieChart setComponents:components];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
