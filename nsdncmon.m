// nsdncmon.m

#import <Foundation/NSObject.h>
#import <Foundation/NSNotification.h>
#import <Foundation/NSString.h>
#import <Foundation/NSDistributedNotificationCenter.h>
#import <Foundation/NSRunLoop.h>
#import <stdio.h>

@interface nsdncmon: NSObject {}
-(id) init;
-(void) receive: (NSNotification*) notification;
@end

@implementation nsdncmon
-(id) init {
  NSDistributedNotificationCenter * center
    = [NSDistributedNotificationCenter defaultCenter];

  [center addObserver: self
          selector:    @selector(receive:)
          name:        @"com.apple.screensaver.didstart"
          object:      nil
  ];
  [center addObserver: self
          selector:    @selector(receive:)
          name:        @"com.apple.screensaver.didstop"
          object:      nil
  ];
  [center addObserver: self
          selector:    @selector(receive:)
          name:        @"com.apple.shieldWindowRaised"
          object:      nil
  ];
  [center addObserver: self
          selector:    @selector(receive:)
          name:        @"com.apple.shieldWindowLowered"
          object:      nil
  ];
  [center addObserver: self
          selector:    @selector(receive:)
          name:        @"com.apple.screenIsLocked"
          object:      nil
  ];
  [center addObserver: self
          selector:    @selector(receive:)
          name:        @"com.apple.screenIsUnlocked"
          object:      nil
  ];
  [center addObserver: self
          selector:    @selector(receive:)
          name:        @"com.apple.sessionDidMoveOffConsole"
          object:      nil
  ];
  [center addObserver: self
          selector:    @selector(receive:)
          name:        @"com.apple.sessionDidMoveOnConsole"
          object:      nil
  ];
  fprintf(stderr,"Listening...\n");
  [[NSRunLoop currentRunLoop] run];
  fprintf(stderr,"Stopping...\n");
  return self;
}
-(void) receive: (NSNotification*) notification {
  fprintf(stderr,"%s\n", [[notification name] UTF8String] );
}
@end


int main( int argc, char ** argv) {
  [[nsdncmon alloc] init];
  return 0;
}

// build: gcc -Wall nsdncmon.m -o nsdncmon -lobjc -framework Foundation
// run: ./nsdncmon
