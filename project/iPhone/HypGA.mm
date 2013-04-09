#include <HypGA.h>

#import <UIKit/UIKit.h>
#import "GAI.h"
#import "GAITracker.h"

namespace hyperfiction {

	static id<GAITracker> tracker;

	void startNewSession( const char *sUID , int iPeriod ){
		NSString *NSUID = [NSString stringWithUTF8String:sUID];
		NSLog( @"startNewSession %d" , NSUID );
		tracker = [[GAI sharedInstance] trackerWithTrackingId:NSUID];
		//tracker.debug = YES;
	}

	void sendView( const char *sPage ){
		NSString *NSPage = [[[NSString alloc] initWithUTF8String:sPage] autorelease];
		NSLog( @"sendView %@" , NSPage );
		[tracker sendView:NSPage];
	}

	void sendEvent( const char *sCat , const char *sAction , const char *sLabel , int iValue ){
		NSString *NS_Cat = [[NSString stringWithUTF8String:sCat] autorelease];
		NSString *NS_Act = [[NSString stringWithUTF8String:sAction] autorelease];
		NSString *NS_Lab = [[NSString stringWithUTF8String:sLabel] autorelease];
		NSLog( @"SendEvent cat:%@ act:%@ label:%@ val%i" , NS_Cat , NS_Act , NS_Lab , iValue );
		[tracker sendEventWithCategory:NS_Cat withAction:NS_Act withLabel:NS_Lab withValue:[NSNumber numberWithInt:iValue]];
	}

	void setCustom_dimension( int iIndex , const char *sValue ){
		NSString *NS_Val = [[[NSString alloc] initWithUTF8String:sValue] autorelease];
		NSLog( @"setCustom_dimension index:%i value:%@" , iIndex , sValue );
		[tracker setCustom:iIndex dimension:NS_Val];
	}

	void setCustom_metric( int iIndex , int iMetric ){
		NSLog( @"setCustom_metric index:%i metrid:%i");
		[tracker setCustom:iIndex metric:[NSNumber numberWithInt:iMetric]];
	}

	void sendTiming( const char *sCat , int iInterval , const char *sName , const char *sLabel ){
		NSString *NS_Cat	= [[[NSString alloc] initWithUTF8String:sCat] autorelease];
		NSString *NS_Name	= [[[NSString alloc] initWithUTF8String:sName] autorelease];
		NSString *NS_Label	= [[[NSString alloc] initWithUTF8String:sLabel] autorelease];
		[tracker sendTimingWithCategory:NS_Cat withValue:iInterval withName:NS_Name withLabel:NS_Label];
	}

	void sendSocial( const char *sSocial_network , const char *sAction , const char *sTarget ){
		NSString *NS_Net = [[NSString stringWithUTF8String:sSocial_network] autorelease];
		NSString *NS_Act = [[NSString stringWithUTF8String:sAction] autorelease];
		NSString *NS_Tgt = [[NSString stringWithUTF8String:sTarget] autorelease];
		[tracker sendSocial:NS_Net withAction:NS_Act withTarget:NS_Tgt];
	}

	void stopSession( ){
		//[[GANTracker sharedTracker] stopTracker];
	}

}
