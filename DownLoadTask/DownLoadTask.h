//
//  DownLoadTask.h
//  DownLoadTask
//
//  Created by yucquan on 2017/4/13.
//  Copyright © 2017年 applemusic.cc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DownLoadTask : NSObject<NSURLSessionDownloadDelegate>

@property (nonatomic, strong) NSURLSessionDownloadTask *task;
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSData *resumeData;

- (void)downLoadTaskWithUrl:(NSURL *)url;
- (void)resume;
- (void)pause;


@end
