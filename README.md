HypGA
=============================
A Google Analytics native extension for NME
-----------------------------

This NME native extension allows you to integrate Google Analytics ( v2 Beta 4 ) into your NME application.
The supported compilation targets are [iOS](https://developers.google.com/analytics/devguides/collection/ios/v2/) & [Android](https://developers.google.com/analytics/devguides/collection/android/v2/)

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

For iOS you need to link the Google Analytics class package to your XCode project.
Just drag & drop on your project the HypGA folder. ( [your_export_folder]/ios/[ProjectName]/HypGA )

Basic reference
---------------

First start the session via :
```
HypGA.startSession( "YOUR-UA-CODE" );
```
Tracking a page view :
```
HypGA.trackPageView( "your-page-code");
```
Tracking an event :
```
HypGA.trackEvent( "event-cat" , "event-action","event-label",1);
```

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
