//
//  JLDataSource.h
//  iOS-架构模式
//
//  Created by 李国卿 on 2018/11/28.
//  Copyright © 2018年 Jazzfly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

typedef void(^cellConfigureBefore)(id cell,id model, NSIndexPath *indexPath);
typedef void(^selectCell)(NSIndexPath *indexPath);
typedef void(^reloadData)(NSMutableArray *array);

@interface JLDataSource : NSObject
<UITableViewDelegate,
UITableViewDataSource,
UICollectionViewDelegate,
UICollectionViewDataSource>

// 自定义
- (id)initWithIdentifier:(NSString *)identifier configureBlock:(cellConfigureBefore)beforeBlock selectBlock:(selectCell)selectBlock reloadData:(reloadData)reloadDataBlock;

@property (nonatomic,strong) NSMutableArray *dataArray;

- (void)addDataSource:(NSArray *)array;

- (id)modelsAtIndexPath:(NSIndexPath *)indexPath;



@end

NS_ASSUME_NONNULL_END
