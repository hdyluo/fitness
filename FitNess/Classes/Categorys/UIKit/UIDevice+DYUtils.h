//
//  UIDevice+DYUtils.h
//  FitNess
//
//  Created by 黄德玉 on 2017/7/3.
//  Copyright © 2017年 none. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (DYUtils)

/**
 获取当前版本号
 
 @return 版本
 */
+ (double)yg_systemVersion;

/// Whether the device is iPad/iPad mini.
@property (nonatomic, readonly) BOOL yg_isPad;

/// Whether the device is a simulator.
@property (nonatomic, readonly) BOOL yg_isSimulator;

/// Wherher the device can make phone calls.
@property (nonatomic, readonly) BOOL yg_canMakePhoneCalls NS_EXTENSION_UNAVAILABLE_IOS("");

/// The device's machine model.  e.g. "iPhone6,1" "iPad4,6"
/// @see http://theiphonewiki.com/wiki/Models
@property (nullable, nonatomic, readonly) NSString * yg_machineModel;

/// The device's machine model name. e.g. "iPhone 5s" "iPad mini 2"
/// @see http://theiphonewiki.com/wiki/Models
@property (nullable, nonatomic, readonly) NSString * yg_machineModelName;



#pragma mark - Network Information

/// WIFI IP address of this device (can be nil). e.g. @"192.168.1.111"
@property (nullable, nonatomic, readonly) NSString *yg_ipAddressWIFI;

/// Cell IP address of this device (can be nil). e.g. @"10.2.2.222"
@property (nullable, nonatomic, readonly) NSString *yg_ipAddressCell;



#pragma mark - Disk Space


/// Total disk space in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t yg_diskSpace;

/// Free disk space in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t yg_diskSpaceFree;

/// Used disk space in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t yg_diskSpaceUsed;


#pragma mark - Memory Information


/// Total physical memory in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t yg_memoryTotal;

/// Used (active + inactive + wired) memory in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t yg_memoryUsed;

/// Free memory in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t yg_memoryFree;

/// Acvite memory in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t yg_memoryActive;

/// Inactive memory in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t yg_memoryInactive;

/// Wired memory in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t yg_memoryWired;

/// Purgable memory in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t yg_memoryPurgable;

#pragma mark - CPU Information

/// Avaliable CPU processor count.
@property (nonatomic, readonly) NSUInteger yg_cpuCount;

/// Current CPU usage, 1.0 means 100%. (-1 when error occurs)
@property (nonatomic, readonly) float yg_cpuUsage;

/// Current CPU usage per processor (array of NSNumber), 1.0 means 100%. (nil when error occurs)
@property (nullable, nonatomic, readonly) NSArray<NSNumber *> * yg_cpuUsagePerProcessor;

@end
