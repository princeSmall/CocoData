//
//  Data+CoreDataProperties.h
//  simpleCocoData
//
//  Created by tongle on 16/4/14.
//  Copyright © 2016年 tongle. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Data.h"

NS_ASSUME_NONNULL_BEGIN

@interface Data (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;

@end

NS_ASSUME_NONNULL_END
