#ifndef Device
#define Device

namespace hypga{
	void startNewSession( const char *sUID , int iPeriod );
	void sendView( const char *sPage );
	void sendEvent( const char *sCat , const char *sAction,const char *sLabel , int iValue );
	void sendSocial( const char *sSocial_network , const char *sAction , const char *sTarget );
	void setCustom_dimension( int iIndex , const char *sValue );
	void setCustom_metric( int iIndex , int iMetric );
	void sendTiming( const char *sCat , int iInterval , const char *sName , const char *sLabel );
	void stopSession( );
}

#endif