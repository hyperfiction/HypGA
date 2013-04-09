package fr.hyperfiction;

import android.util.Log;
import com.google.analytics.tracking.android.EasyTracker;
import com.google.analytics.tracking.android.GAServiceManager;
import com.google.analytics.tracking.android.GoogleAnalytics;
import com.google.analytics.tracking.android.Tracker;
import org.haxe.nme.GameActivity;

/**
 * ...
 * @author shoe[box]
 */
public class HypGA{

	private static String TAG = "HypGA";

	private static Tracker _gaTracker;

	// -------o constructor

		/**
		* constructor
		*
		* @param
		* @return	void
		*/
		private void HypGA() {
			Log.i( TAG, " constructor" );
		}

	// -------o public

		/**
		*
		*
		* @public
		* @return	void
		*/
		static public void startSession( String sUA_code , int iPeriod ){
			Log.i( TAG, " startNewSession : "+sUA_code );
			_gaTracker = GoogleAnalytics.getInstance( GameActivity.getContext( ) ).getTracker( sUA_code );
			GoogleAnalytics.getInstance( GameActivity.getContext( ) ).setDebug( true );
			setDispatch_period( iPeriod );
		}

		/**
		*
		*
		* @public
		* @return	void
		*/
		static public void stopSession( ){
			Log.i( TAG, "stopSession");
			GoogleAnalytics.getInstance( GameActivity.getContext( ) ).closeTracker( _gaTracker );
		}

		/**
		*
		*
		* @public
		* @return	void
		*/
		static public void setDispatch_period( int iPeriod ) {
			Log.i( TAG, "setDispatch_period : "+iPeriod );
			GAServiceManager.getInstance( ).setDispatchPeriod( iPeriod );
		}

		/**
		*
		*
		* @public
		* @return	void
		*/
		static public void dispatch( ){
			Log.i( TAG, "Force dispatch" );
		}

		/**
		*
		*
		* @public
		* @return	void
		*/
		static public void trackEvent( String sCat , String sAction , String sLabel , int iVal ){
			Log.i( TAG, "trackEvent : cat "+sCat+" || action : "+sAction+" || label : "+sLabel+" || iVal : "+iVal );
			_gaTracker.sendEvent( sCat , sAction , sLabel , (long) iVal );
		}

		/**
		*
		*
		* @public
		* @return	void
		*/
		static public void trackPageView( String sPage ){
			Log.i( TAG, "trackPageView : "+sPage );
			//GoogleAnalyticsTracker.getInstance( ).trackPageView( sPage );
			_gaTracker.sendView( sPage );
		}

		/**
		*
		*
		* @public
		* @return	void
		*/
		static public void sendTiming(
									String sCat,
									int iInterval,
									String sName,
									String sLabel
								 ){

			_gaTracker.sendTiming( sCat , iInterval , sName , sLabel );
		}

		/**
		*
		*
		* @public
		* @return	void
		*/
		static public void sendSocial(
									String sSocial_network,
									String sAction,
									String sTarget
								){

			_gaTracker.sendSocial( sSocial_network , sAction , sTarget );
		}

		/**
		*
		*
		* @public
		* @return	void
		*/
		static public void setCustom_dimension( int iIndex , String sValue ){
			_gaTracker.setCustomDimension( iIndex , sValue );
		}

		/**
		*
		*
		* @public
		* @return	void
		*/
		static public void setCustom_metric( int iIndex , int iValue ){
			_gaTracker.setCustomMetric( iIndex , (long) iValue );
		}

	// -------o protected

	// -------o misc


}