#import "GPSAdPlayer.h"


static NSString *AD_URL = @"http://blog.stackoverflow.com/audio/stackoverflow-podcast-002.mp3";

@implementation GPSAdPlayer

@synthesize locationManager = _locationManager;
@synthesize player = _player;

- (id) init {
    if (self = [super init])
    {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        
        
        
        self.player = [AVPlayer playerWithURL:[NSURL URLWithString:AD_URL]];
    }
    
    return self;
}

- (void) run
{
    [self.locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    NSLog(@"%@", newLocation);
	
    [self.locationManager stopUpdatingLocation];
    [self.player play];
}
@end
