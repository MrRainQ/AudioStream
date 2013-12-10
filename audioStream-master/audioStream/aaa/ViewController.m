//
//  ViewController.m
//  aaa
//
//  Created by qiupeng on 13-10-18.
//  Copyright (c) 2013年 qiupeng. All rights reserved.
//

#import "ViewController.h"
#import "AudioStreamer.h"

@interface ViewController ()

@property (strong,nonatomic) AudioStreamer *streamer;

// 测试属性，无用，可删除
@property (strong,nonatomic) NSString *rain;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self createStreamer];
    [self.streamer start];
    
}


- (void)destroyStreamer
{
	if (self.streamer)
	{
		[[NSNotificationCenter defaultCenter]
         removeObserver:self
         name:ASStatusChangedNotification
         object:self.streamer];
		 [self.streamer stop];
		 self.streamer = nil;
	 }
}


- (void)createStreamer
{
	if (self.streamer)
	{
		return;
	}
    
//    NSString *string = @"http://a.libdd.com/farm1/51/0943A78E42A7F54D65B7677CBE970B33.mp3";
    
   // NSString = @"http://www.5288z.com/bg.mp3";
    
//    NSString *string = @"http://121.18.238.167/file/MDAwMDAwMDEPv35T1KNz_0jR-XC8KRzurIKBiVGkOygabnv_h_NaAw../57d4a6a8b20fca8b15c07361940842d516b5fc5/x15256957.mp3?key=AAABQFJyHURG_H5H&p=&a=0-6fc0f531-48049-0/010165&mode=download";
    
    NSString *string = @"http://a.libdd.com/farm1/186/8863E4C8F81AC3C217B39F768B9266BA.mp3";
    
	NSURL *url = [NSURL URLWithString:string];
	self.streamer = [[AudioStreamer alloc] initWithURL:url];
    [self.streamer start];
    
	[[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(playbackStateChanged)
     name:ASStatusChangedNotification
     object:self.streamer];
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
        
}

- (void)playbackStateChanged
{
    
}



@end
