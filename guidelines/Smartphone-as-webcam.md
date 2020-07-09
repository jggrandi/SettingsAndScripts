# Using an old smartphone as a webcam for a computer.
A solution for those who do not have a webcam or want to have a better image quality. Generally, the image quality of smartphone cameras is superior to webcams. 
This is particularly useful for any kind of virtual meeting (Zoom, Skype, Hangouts).  

## Basic Steps
We will use the app Droidcam. It is composed of two apps one that runs in the **smartphone** and the other that runs in the **computer**. 
The app is pretty much straightforward to setup and to get it working.   
Make sure that both devices are connected to the same network. Follow the app instructions.

**Smartphone:** Install Droidcam app

**Computer:** Install Droidcam client

## Advanced steps
The goal here is to automate the steps to start the app on the smartphone. The idea is to make the Droidcam app run automatically without touching the smartphone. 
This is useful when the phone mounted in a tripod and it is already in a perfect position.

> Droidcam v6.3.0 added an option to auto-lauch the Android app. It only works in USB mode. Still, the steps below are a good source of information.

### Smartphone Steps (via USB cable) ###
The USB connection makes the phone always changed and facilitates the automation process.
Since we are using an old smartphone, the chances are that its battery is already degraded. So, keep it always charging is not a bad idea. 
Regardless, the wireless connection will be provided as well.
 
0. Connect the phone to the computer via USB
1. Enable developer mode
2. Allow **USB debugging** and check the option "Always allow for this computer"

Optional step: Uninstall/disable all the apps that are not necessary.

### Computer Steps ###
1. Download the **Android Platform Tools**: [https://developer.android.com/studio/releases/platform-tools](https://developer.android.com/studio/releases/platform-tools)
2. Unpack it to a folder
3. Add the **Android Platform Tools** folder to the system PATH variable in the "System Environment Variables", e.g. `C:\Program Files\platform-tools_r30.0.3-windows\platform-tools`.
This will allow the Android tools to be integrated into the system and to be executable from anywhere in the terminal.
4. In the terminal, check if **ADB** is working and if the phone is correctly connected to the computer with `adb devices`. The list of devices attached should contain on element.
5. Script to start the camera (add one command per line and save it as a .bat)
  * `adb shell input keyevent 26` -- Issue a lock button press
  * `adb shell input touchscreen swipe 930 880 930 380` -- Mimics a swipe up
  * `adb shell input text <PASSCODE>` -- Inputs the passcode into the device (optional, used if the device is protected with a passcode)
  * `adb shell input keyevent 66` -- Issue a press on the Enter key
  * `adb shell am start -n com.dev47apps.droidcam/.DroidCam` -- Runs the Droidcam app on the phone. See Misc commands for instructions on how to get the app information. 
  * `start "" "C:\Program Files (x86)\DroidCam\DroidCamApp.exe"` -- Start the Droidcam client on the computer
6. Script to stop the camera app (add one command per line and save it as a .bat)
  * `adb shell am force-stop com.dev47apps.droidcam` -- Closes the app on the phone
  * `adb shell input keyevent 26` -- Locks the phone
  * `taskkill /IM "DroidCamApp.exe" /F` -- Closes the app on the computer
  
### Misc commands ###
1. List apps installed: `adb shell "pm list packages | grep cam"`
2. Find the Android app activity: `adb shell "pm dump com.dev47apps.droidcam | grep -A 1 MAIN"`
