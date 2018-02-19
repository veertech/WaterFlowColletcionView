//
//  GalleryLayout2.m
//  GoSell
//
//  Created by veer_chauhan on 19/02/18.
//  Copyright © 2018 veer_chauhan. All rights reserved.
//

#import "GalleryLayout2.h"


static const NSInteger kReducedHeightColumnIndex = 1;
static const CGFloat kItemHeightAspect = 1.5;

@implementation GalleryLayout2
{
    CGSize _itemSize;
    NSMutableArray<NSNumber *> *_columnsXoffset;
}

#pragma mark Init

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        self.totalColumns = 2;
    }
    
    return self;
}

#pragma mark Override Abstract methods

- (NSInteger)columnIndexForItemAtIndexPath:(NSIndexPath *)indexPath {
    //If last item is single in row, we move it to reduced column, to make it looks nice
    NSInteger columnIndex = indexPath.item % self.totalColumns;
    return [self isLastItemSingleInRowForIndexPath:indexPath] ? kReducedHeightColumnIndex : columnIndex;
}

- (CGRect)calculateItemFrameAtIndexPath:(NSIndexPath *)indexPath columnIndex:(NSInteger)columnIndex columnYoffset:(CGFloat)columnYoffset {
    NSInteger rowIndex = indexPath.item / self.totalColumns;
    CGFloat halfItemHeight = (_itemSize.height - self.interItemsSpacing) / 2;
    
    //Resolving Item height
    CGFloat itemHeight = _itemSize.height;
    
    // By our logic, first and last items in reduced height column have height divided by 2.
    if ((rowIndex == 0 && columnIndex == kReducedHeightColumnIndex) || [self isLastItemSingleInRowForIndexPath:indexPath]) {
        itemHeight = halfItemHeight;
    }
    
    return CGRectMake(_columnsXoffset[columnIndex].floatValue, columnYoffset, _itemSize.width, itemHeight);
}

- (void)calculateItemsSize {
    CGFloat contentWidthWithoutIndents = self.collectionView.bounds.size.width - self.contentInsets.left - self.contentInsets.right;
    CGFloat itemWidth = (contentWidthWithoutIndents - (self.totalColumns - 1) * self.interItemsSpacing) / self.totalColumns;
    CGFloat itemHeight = itemWidth * kItemHeightAspect;
    
    _itemSize = CGSizeMake(itemWidth, itemHeight);
    
    // Calculating offsets by X for each column
    _columnsXoffset = [NSMutableArray new];
    
    for (int columnIndex = 0; columnIndex < self.totalColumns; columnIndex++) {
        [_columnsXoffset addObject:@(columnIndex * (_itemSize.width + self.interItemsSpacing))];
    }
}

- (NSString *)description {
    return @"Layout v1";
}

#pragma mark Private methdos

- (BOOL)isLastItemSingleInRowForIndexPath:(NSIndexPath *)indexPath {
    return indexPath.item == (self.totalItemsInSection - 1) && indexPath.item % self.totalColumns == 0;
}
@end
