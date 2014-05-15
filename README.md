HypGA
=============================
A Google Analytics native extension for NME
-----------------------------

This OpenFL native extension allows you to integrate Google Analytics into your OpenFL application.
The supported compilation targets are 
* [iOS](https://developers.google.com/analytics/devguides/collection/ios/v3/) 
* [Android](https://developers.google.com/analytics/devguides/collection/android/v2/)

Installation
------------
There is an [include.nmml]() file and [ndll]() are compiled for:
* ios armv6
* ios armv7
* ios simulator
* android armv6

Recompiling
-----------
For recompiling the native extensions just use the sh files contained in the project folder.

Usage
-----
Just call the public methods on the HypGA class.

For iOS, put the following libs (from GA v3 SDK) into projects/iPhone/libs:
* libAdIdAccess.a
* libGoogleAnalyticsServices.a

Basic reference
---------------

First start the session via :
<pre><code>HypGA.startSession( "YOUR-UA-CODE" );<code></pre>

Tracking a page view :
<pre><code>HypGA.trackPageView( "your-page-code");<code></pre>

Tracking an event :
<pre><code>HypGA.trackEvent( "event-cat" , "event-action","event-label",1);<code></pre>

For more advance methods just take a look a the HypGA class.
All the Google Analytics V2 methods are supported( timing, metric , social , dimension... )

Made at Hyperfiction
--------------------
[hyperfiction.fr](http://hyperfiction.fr)

Developed by : 
Johann Martinache 
[@shoe_box](https://twitter.com/shoe_box)

License
-------
This work is under BSD simplified License.
