//
//  DownLoadTask.m
//  DownLoadTask
//
//  Created by yucquan on 2017/4/13.
//  Copyright © 2017年 applemusic.cc. All rights reserved.
//

#import "DownLoadTask.h"

@implementation DownLoadTask

- (void)downLoadTaskWithUrl:(NSURL *)url
{
    self.task = [self.session downloadTaskWithURL:url];
    [self.task resume];
}

- (NSURLSession *)session
{
    if (!_session)
    {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    }
    return _session;
}

// pause
- (void)pause{
    __weak typeof (self) aa = self;
    [self.task cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        aa.resumeData = resumeData;
    }];
}

// continue
- (void)resume{
    self.task = [self.session downloadTaskWithResumeData:_resumeData];
    [self.task resume];
}

#pragma mark - NSURLSessionDownLoadDelegate

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location
{
    NSLog(@"DownLoad Finished!");
}


- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    NSLog(@"%f",(float)totalBytesWritten/totalBytesExpectedToWrite);
}

@end
