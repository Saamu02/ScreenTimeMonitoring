# ScreenTimeMonitoring

Reference Links:
https://www.folio3.com/mobile/blog/screentime-api-ios/

https://crunchybagel.com/monitoring-app-usage-using-the-screen-time-api/

Apple released the ScreenTime API for iOS. Although the ScreenTime feature has been there since the release of iOS 13, from iOS 15, Apple has introduced ScreenTime API for developers to allow them to develop apps for their user base with customized UI for an enhanced experience for parental controls. It mostly provides features for parental controls such as allowing parents to add restrictions to apps and websites to their child’s device, enabling parents to set time limits on their child’s usage of the device, and sharing usage of the child’s device with parents.

ScreenTime API comprises 3 frameworks:

Managed Settings
Family Controls
Device Activity

# Managed Settings Framework:
- Shield apps and websites with custom UI
- Provides web content filtering
- Set restrictions on devices and keep them in place
- Provides multiple options for restrictions on AppStore, Media, Safari, Game Center, etc.

# Family Controls Framework
- Authorizes access to Screen Time API on child’s device
- Prevents removal/deletion of your app by the child
- Requires parent’s authorization to remove your app
- Provides FamilyActivityPicker to choose apps and websites to restrict

# Device Activity Framework
- Monitors schedules defined by the user and execute code accordingly.
- Monitors usage thresholds defined and execute code when threshold reached
- The type and time of usage can be defined.
- Provides Device Activity extension that executes the code on respective schedules and events without even the child opening the app.

# About the project
This project is basically for parental conrtol. You can restrict apps(selected with family picker) for the child and make them available for
certain amount of time with the help of Screen Monitoring.
First of all you'll need to give permission to monitor the apps and add the parent email at the start of the app.

# Code Explanation
# TimeLimitModel
initiateMonitoring() func will start the monitoring of apps and make the available for certain amout of time.
stopMonitoring() func will add the restrictions to the apps again
You can set the time which is declared in PublicVariable.swift and add the seconds for timeLimit variable.
After setting the secoonds in timeLimit var you can run the app and tap start monitoring.
the selcted apps will be available for the amount of seconds set in timelimit variable

# ManagedSettingsStoreHelper
In code, shielding work is being done by the ManagedSettingsStoreHelper, which is singleton.
startApplicationsShielding() func will add the shielding effect on top of the selected apps which we will select from familyActivityPicker
stopApplicationsShielding() func will remove the shielding effect from apps.

In this class created another function restrictDefaultFunctionalities and made it private + commented out the functionalities.
This function restricts the default behaviours as well, like you can't change date and time, can't access siri etc.

# DeviceActivityMonitorExtension
This extension is basically for monitoring the amount of time the apps were used.
After a certain amount of time you can restrict the selected apps
intervalDidStart() will remove the shielding effect and make the apps available to use
eventDidReachThreshold() will restrict the apps after the threshold time (used in TimeLimitModel) is reached.



