

#ifndef IPHONE
#define IMPLEMENT_API
#endif

#include <hx/CFFI.h>
#include "HypGA.h"
#include <stdio.h>

using namespace hyperfiction;
extern "C"{

	int HypGA_register_prims(){
		printf("HypGA: register_prims()\n");
		return 0;
	}
}
#ifdef IPHONE

	static value HypGA_startNewSession( value sUA_code , value iPeriod ){
		startNewSession( val_string( sUA_code ) , val_int( iPeriod ) );
		return alloc_null( );
	}
	DEFINE_PRIM( HypGA_startNewSession , 2 );

	static value HypGA_sendView( value sPage ){
		sendView( val_string( sPage ) );
		return alloc_null( );
	}
	DEFINE_PRIM( HypGA_sendView , 1 );

	static value HypGA_sendEvent( value sCat , value sAction , value sLabel , value iValue ){
		sendEvent(
					val_string( sCat ),
					val_string( sAction ),
					val_string( sLabel ),
					val_int( iValue )
				);
		return alloc_null( );
	}
	DEFINE_PRIM( HypGA_sendEvent , 4 );

	static value HypGA_setCustom_dimension( value iIndex , value sValue ){
		setCustom_dimension( val_int( iIndex ) , val_string( sValue ) );
		return alloc_null( );
	}
	DEFINE_PRIM( HypGA_setCustom_dimension , 2 );

	static value HypGA_setCustom_metric( value iIndex , value iMetric ){
		setCustom_metric( val_int( iIndex ) , val_int( iMetric ) );
		return alloc_null( );
	}
	DEFINE_PRIM( HypGA_setCustom_metric , 2 );

	static value HypGA_sendTiming( value sCat , value interval , value name , value label ){
		sendTiming( val_string( sCat ) , val_int( interval ) , val_string( name ) , val_string( label ) );
		return alloc_null( );
	}
	DEFINE_PRIM( HypGA_sendTiming , 4 );

	static value HypGA_stopSession( ){
		stopSession( );
		return alloc_null( );
	}
	DEFINE_PRIM( HypGA_stopSession , 0 );

	static value HypGA_sendSocial( value sNetwork , value sAction , value sTarget ){
		sendSocial( val_string( sNetwork ) , val_string( sAction ) , val_string( sTarget ) );
		return alloc_null( );
	}
	DEFINE_PRIM( HypGA_sendSocial , 3 );

#endif
