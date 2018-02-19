//
//  ViewController.m
//  WaterFlowLayoutCollectionView
//
//  Created by veer_chauhan on 19/02/18.
//  Copyright © 2018 veer_chauhan. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewFile.h"
#import "viewControllerNext.h"


@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSString *asa;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewLayout;

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   asa = @"dasdasd";

    self.collectionViewLayout.contentInset = UIEdgeInsetsMake(8, 8, 8, 8);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewFile *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewFile" forIndexPath:indexPath];
    return cell;
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    viewControllerNext *vc  = [self.storyboard instantiateViewControllerWithIdentifier:@"viewControllerNext"];
    [self.navigationController pushViewController:vc animated:YES];
   

}





@end
