//
//  CustomLayoutCollection.h
//  GoSell
//
//  Created by veer_chauhan on 19/02/18.
//  Copyright © 2018 veer_chauhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomLayoutCollection : UICollectionViewLayout


@property (nonatomic, readonly) NSInteger totalItemsInSection;
@property (nonatomic, readonly) UIEdgeInsets contentInsets;

@property (nonatomic, assign) NSInteger totalColumns;
@property (nonatomic, assign) CGFloat interItemsSpacing;

//These methods should be overriden by inheritor
- (NSInteger)columnIndexForItemAtIndexPath:(NSIndexPath *)indexPath;
- (CGRect)calculateItemFrameAtIndexPath:(NSIndexPath *)indexPath columnIndex:(NSInteger)columnIndex columnYoffset:(CGFloat)columnYoffset;
- (void)calculateItemsSize;
@end
