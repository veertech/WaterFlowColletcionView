//
//  viewControllerNext.m
//  WaterFlowLayoutCollectionView
//
//  Created by veer_chauhan on 19/02/18.
//  Copyright © 2018 veer_chauhan. All rights reserved.
//

#import "viewControllerNext.h"
#import "collectionViewNextlayout.h"


@interface viewControllerNext ()<UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewnew;
- (IBAction)Back:(UIButton *)sender;

@end

@implementation viewControllerNext

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.collectionViewnew.contentInset = UIEdgeInsetsMake(10,10, 10, 10);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  20;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    collectionViewNextlayout *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewNextlayout" forIndexPath:indexPath];
    return cell;
    
}

- (IBAction)Back:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewdidNotLoad : (NSString *)idstr{
    if ([idstr isEqualToString:@"dasdasd"]) {
        NSLog(@"skshadhks %@",idstr);
    }
}
@end
