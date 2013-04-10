/*
Copyright (c) 2013, Hyperfiction
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

package fr.hyperfiction;

/**
 * ...
 * @author shoe[box]
 */
@:build( org.shoebox.utils.NativeMirror.build( ) )
class HypGA{

	// -------o constructor

		/**
		* constructor
		*
		* @param
		* @return	void
		*/
		private function new( ){}

	// -------o public

		/**
		* Start the Ga tracking session
		*
		* @public
		* @param sUA : GA UA code ( String )
		* @param iPeriod ( Int )
		* @return	void
		*/
		#if android
		@JNI
		#end
		#if ios
		@CPP("HypGA","HypGA_startNewSession")
		#end
		static public function startSession( sUA : String , iPeriod : Int ) : Void {
		}

		/**
		* Stop the GA tracking session
		*
		* @public
		* @return	void
		*/
		#if android
		@JNI
		#end
		#if ios
		@CPP("HypGA","HypGA_stopSession")
		#end
		static public function stopSession( ) : Void {
		}

		/**
		* Track a page view
		*
		* @public
		* @param 	sPage : Code of the page to be tracked ( String )
		* @return	void
		*/
		#if android
		@JNI
		#end
		#if ios
		@CPP("HypGA","HypGA_sendView")
		#end
		static public function trackPageView( sPage : String ) : Void {
		}

		/**
		* Track a event
		*
		* @public
		* @param	sCat		: Event category 	( String )
		* @param	sCat		: Action 			( String )
		* @param	sLabel	: Event label 		( String )
		* @param	value	: Event value 		( Int )
		* @return	void
		*/
		#if android
		@JNI
		#end
		#if ios
		@CPP("HypGA","HypGA_sendEvent")
		#end
		static public function trackEvent( sCat : String , sAction : String , sLabel : String , value : Int ) : Void {
		}

		/**
		*
		*
		* @public
		* @param	sCat		: Event category 	( String )
		* @param	iInterval	: Timing interval 	( Int )
		* @param	sName	: Timing name 		( String )
		* @param	sLabel	: Label 			( String )
		* @return	void
		*/
		#if android
		@JNI
		#end
		#if ios
		@CPP("HypGA","HypGA_sendTiming")
		#end
		static public function sendTiming( sCat : String , iInterval : Int , sName : String , sLabel : String ) : Void {
		}

		/**
		* Set a custom dimension value
		*
		* @public
		* @param	iIndex : Index of the dimension 	( Int )
		* @param	sValue : Dimension value 		( String )
		* @return	void
		*/
		#if android
		@JNI
		#end
		#if ios
		@CPP("HypGA","HypGA_setCustom_dimension")
		#end
		static public function setCustom_dimension( iIndex : Int , sValue : String ) : Void{
		}

		/**
		* Set a custom metric value
		*
		* @public
		* @param	iIndex : Index of the metric 	( Int )
		* @param	sValue : Metric value 		( String )
		* @return	void
		*/
		#if android
		@JNI
		#end
		#if ios
		@CPP("HypGA","HypGA_setCustom_metric")
		#end
		static public function setCustom_metric( iIndex : Int , iValue : Int ) : Void {
		}

		/**
		* Track a social event
		*
		* @public
		* @param 	sSocial_network :Targetted social network ( String )
		* @param 	sAction : Action ( String )
		* @return	void
		*/
		#if android
		@JNI
		#end
		#if ios
		@CPP("HypGA","HypGA_setCustom_metric")
		#end
		static public function sendSocial( sSocial_network : String , sAction : String , sTarget : String ) : Void {
		}

		#if android

		/**
		* Set the period delay between two dispatch
		*
		* @public
		* @param 	i : Delay ( Int )
		* @return	void
		*/
		@JNI
		static public function setDispatch_period( i : Int ) : Void {
		}

		#end

	// -------o protected

	// -------o misc


}