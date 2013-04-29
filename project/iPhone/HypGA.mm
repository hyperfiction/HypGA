#include <HypGA.h>

#import <UIKit/UIKit.h>
#import "GAI.h"
#import "GAITracker.h"

namespace hypga {

	static id<GAITracker> tracker;

	void startNewSession( const char *sUID , int iPeriod ){
		NSString *NSUID = [NSString stringWithUTF8String:sUID];
		NSLog( @"startNewSession %@" , NSUID );
		tracker = [[GAI sharedInstance] trackerWithTrackingId:NSUID];
		//tracker.debug = YES;
	}

	void sendView( const char *sPage ){
		NSString *NSPage = [[NSString alloc] initWithUTF8String:sPage];
		NSLog( @"sendView %@" , NSPage );
		[tracker sendView:NSPage];
	}

	void sendEvent( const char *sCat , const char *sAction , const char *sLabel , int iValue ){
		NSString *NS_Cat = [ [NSString alloc] initWithUTF8String:sCat];
		NSString *NS_Act = [ [NSString alloc] initWithUTF8String:sAction];
		NSString *NS_Lab = [ [NSString alloc] initWithUTF8String:sLabel];
		NSLog( @"SendEvent cat:%@ act:%@ label:%@ val%i" , NS_Cat , NS_Act , NS_Lab , iValue );
		[tracker sendEventWithCategory:NS_Cat withAction:NS_Act withLabel:NS_Lab withValue:[NSNumber numberWithInt:iValue]];
	}

	void setCustom_dimension( int iIndex , const char *sValue ){
		NSString *NS_Val = [[NSString alloc] initWithUTF8String:sValue];
		NSLog( @"setCustom_dimension index:%i value:%s" , iIndex , sValue );
		[tracker setCustom:iIndex dimension:NS_Val];
	}

	void setCustom_metric( int iIndex , int iMetric ){
		NSLog( @"setCustom_metric index:%i metrid:%i",iIndex,iMetric);
		[tracker setCustom:iIndex metric:[NSNumber numberWithInt:iMetric]];
	}

	void sendTiming( const char *sCat , int iInterval , const char *sName , const char *sLabel ){
		NSString *NS_Cat  	= [ [NSString alloc] initWithUTF8String:sCat];
		NSString *NS_Name 	= [ [NSString alloc] initWithUTF8String:sName];
		NSString *NS_Label	= [ [NSString alloc] initWithUTF8String:sLabel];
		[tracker sendTimingWithCategory:NS_Cat withValue:iInterval withName:NS_Name withLabel:NS_Label];
	}

	void sendSocial( const char *sSocial_network , const char *sAction , const char *sTarget ){
		NSString *NS_Net = [ [NSString alloc] initWithUTF8String:sSocial_network];
		NSString *NS_Act = [ [NSString alloc] initWithUTF8String:sAction];
		NSString *NS_Tgt = [ [NSString alloc] initWithUTF8String:sTarget];
		[tracker sendSocial:NS_Net withAction:NS_Act withTarget:NS_Tgt];
	}

	void stopSession( ){
		//[[GANTracker sharedTracker] stopTracker];
	}

}
