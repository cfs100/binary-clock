#import "BinaryClock.h"
#import <WebKit/WebKit.h>

@implementation WSView

- (id) initWithFrame: (NSRect) frame isPreview: (BOOL) isPreview {
  if (!(self = [super initWithFrame:frame isPreview:isPreview])) return nil;

  NSURL* url = [NSURL URLWithString:[[[NSURL fileURLWithPath:[[NSBundle bundleForClass:self.class].resourcePath stringByAppendingString:@"/index.html"] isDirectory:NO] description] stringByAppendingFormat:@""]];

  WebView* view = [[WebView alloc] initWithFrame:NSMakeRect(0, 0, frame.size.width, frame.size.height)];
  view.drawsBackground = NO;
  [view.mainFrame loadRequest:[NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0]];
  [self addSubview:view];
  
  return self;
}

#pragma mark - ScreenSaverView

- (void) animateOneFrame { [self stopAnimation]; }
- (BOOL) hasConfigureSheet { return NO; }

#pragma mark - WebFrameLoadDelegate

- (void) webView: (WebView *) sender didFailLoadWithError: (NSError *) error forFrame: (WebFrame *) frame {
  NSLog(@"%@ error=%@", NSStringFromSelector(_cmd), error);
}

#pragma mark Focus Overrides

- (NSView *) hitTest:(NSPoint) aPoint { return self; }
- (void) keyDown:(NSEvent *) theEvent { return; }
- (void) keyUp:(NSEvent *) theEvent { return; }
- (void) mouseDown:(NSEvent *) theEvent { return; }
- (void) mouseUp:(NSEvent *) theEvent { return; }
- (void) mouseDragged:(NSEvent *) theEvent { return; }
- (void) mouseEntered:(NSEvent *) theEvent { return; }
- (void) mouseExited:(NSEvent *) theEvent { return; }
- (BOOL) acceptsFirstResponder { return YES; }
- (BOOL) resignFirstResponder { return NO; }

@end
