package fr.hyperfiction.googleanalytics;

import com.google.analytics.tracking.android.EasyTracker;
import com.google.analytics.tracking.android.Fields;
import com.google.analytics.tracking.android.GAServiceManager;
import com.google.analytics.tracking.android.GoogleAnalytics;
import com.google.analytics.tracking.android.Logger.LogLevel;
import com.google.analytics.tracking.android.Logger;
import com.google.analytics.tracking.android.MapBuilder;
import com.google.analytics.tracking.android.Tracker;

import android.util.Log;
import org.haxe.extension.Extension;

/**
 * ...
 * @author shoe[box]
 */
public class HypGA extends Extension{

	/*
 	public static AssetManager assetManager;
    public static Handler callbackHandler;
    public static Activity mainActivity;
    public static Context mainContext;
	*/

	private static Tracker _gaTracker;

	// -------o constructor

		/**
		* constructor
		*
		* @param
		* @return	void
		*/
		public HypGA( ){
			trace("constructor");
		}

	// -------o public

		/**
		*
		*
		* @public
		* @return	void
		*/
		static public void setDry_run( boolean b ){
			GoogleAnalytics.getInstance( mainContext ).setDryRun( b );
		}

		/**
		*
		*
		* @public
		* @return	void
		*/
		static public void setOpt_out( boolean b ){
			GoogleAnalytics.getInstance( mainContext ).setAppOptOut( b );
		}

		/**
		*
		*
		* @public
		* @return	void
		*/
		@Override
		public void onStart( ){
			trace("onStart");
			EasyTracker.getInstance( mainContext ).activityStart( mainActivity );
			GoogleAnalytics.getInstance( mainContext ).getLogger( ).setLogLevel( LogLevel.VERBOSE );
		}

		/**
		*
		*
		* @public
		* @return	void
		*/
		@Override
		public void onStop( ){
			trace("onStop");
			EasyTracker.getInstance( mainContext ).activityStop( mainActivity );
		}

		/**
		*
		*
		* @public
		* @return	void
		*/
		static public void startSession( String sUA_code , int iPeriod ) {
			trace("startSession ::: "+sUA_code+" - "+iPeriod);
			_gaTracker = GoogleAnalytics.getInstance( mainContext ).getTracker( sUA_code );
			setDispatch_period( iPeriod );
		}

		/**
		*
		*
		* @public
		* @return	void
		*/
		static public void setDispatch_period( int iPeriod ) {
			GAServiceManager.getInstance().setLocalDispatchPeriod(15);
		}

		/**
		*
		*
		* @public
		* @return	void
		*/
		static public void dispatch( ){
			GAServiceManager.getInstance().dispatchLocalHits( );
		}

		/**
		*
		*
		* @public
		* @return	void
		*/
		static public void trackPage_view( String sPage ){
			trace("trackPageView ::: "+sPage);
			_gaTracker.send( MapBuilder.createAppView( ).set( Fields.SCREEN_NAME , sPage ).build( ) );

		}

		/**
		*
		*
		* @public
		* @return	void
		*/
		static public void trackEvent( String sCat , String sAction , String sLabel , int iVal ){
			_gaTracker.send( MapBuilder.createEvent( sCat , sAction , sLabel , Long.valueOf( iVal ) ).build( ) );
		}

		/**
		*
		*
		* @public
		* @return	void
		*/
		static public void trackSocial( String sSocial_network , String sAction , String sTarget ){
			_gaTracker.send( MapBuilder.createSocial( sSocial_network , sAction , sTarget ).build( ) );
		}

		/**
		*
		*
		* @public
		* @return	void
		*/
		static public void sendTiming( String sCat , int iInterval , String sName , String sLabel ){
			_gaTracker.send( MapBuilder.createTiming( sCat , Long.valueOf( iInterval ) , sName , sLabel ).build( ) );
		}

	// -------o protected



	// -------o misc

		/*
		*
		*
		* @private
		* @return	void
		*/
		public static void trace( String s ){
			Log.i( TAG, s );
		}
		private static String TAG = "HypGA";
}