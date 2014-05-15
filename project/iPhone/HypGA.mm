#include <HypGA.h>

#import <UIKit/UIKit.h>
#import "GAI.h"
#import "GAIDictionaryBuilder.h"
#import "GAIFields.h"
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
        [tracker set:kGAIScreenName value:NSPage];
        [tracker send:[[GAIDictionaryBuilder createAppView]  build]];
	}

	void sendEvent( const char *sCat , const char *sAction , const char *sLabel , int iValue ){
		NSString *NS_Cat = [ [NSString alloc] initWithUTF8String:sCat];
		NSString *NS_Act = [ [NSString alloc] initWithUTF8String:sAction];
		NSString *NS_Lab = [ [NSString alloc] initWithUTF8String:sLabel];
		NSLog( @"SendEvent cat:%@ act:%@ label:%@ val%i" , NS_Cat , NS_Act , NS_Lab , iValue );
		[tracker send:[[GAIDictionaryBuilder createEventWithCategory:NS_Cat 
                                            action:NS_Act 
                                            label:NS_Lab 
                                            value:[NSNumber numberWithInt:iValue]] 
                                            build]];
	}

	void setCustom_dimension( int iIndex , const char *sValue ){
		NSString *NS_Val = [[NSString alloc] initWithUTF8String:sValue];
		NSLog( @"setCustom_dimension index:%i value:%s" , iIndex , sValue );
        [tracker set:[GAIFields customDimensionForIndex:iIndex] value:NS_Val];
	}

	void setCustom_metric( int iIndex , int iMetric ){
		NSLog( @"setCustom_metric index:%i metrid:%i",iIndex,iMetric);
        [tracker set:[GAIFields customMetricForIndex:iIndex] value:[NSString stringWithFormat:@"%d", iMetric]];		
	}

	void sendTiming( const char *sCat , int iInterval , const char *sName , const char *sLabel ){
		NSString *NS_Cat  	= [ [NSString alloc] initWithUTF8String:sCat];
		NSString *NS_Name 	= [ [NSString alloc] initWithUTF8String:sName];
		NSString *NS_Label	= [ [NSString alloc] initWithUTF8String:sLabel];
        [tracker send:[[GAIDictionaryBuilder createTimingWithCategory:NS_Cat 
                                            interval:[NSNumber numberWithInt:iInterval]
                                            name:NS_Name 
                                            label:NS_Label]
                                            build]];
	}

	void sendSocial( const char *sSocial_network , const char *sAction , const char *sTarget ){
		NSString *NS_Net = [ [NSString alloc] initWithUTF8String:sSocial_network];
		NSString *NS_Act = [ [NSString alloc] initWithUTF8String:sAction];
		NSString *NS_Tgt = [ [NSString alloc] initWithUTF8String:sTarget];
        [tracker send:[[GAIDictionaryBuilder createSocialWithNetwork:NS_Net 
                                            action:NS_Act 
                                            target:NS_Tgt]
                                            build]];
	}

	void stopSession( ){
		//[[GANTracker sharedTracker] stopTracker];
	}

}
