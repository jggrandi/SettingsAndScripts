# Remove the screen tearing from the main monitor  

## Steps:  

0. Create a file in /etc/profile.d/  
1. Edit with the following code:  
  ```  
  export __GL_SYNC_TO_VBLANK=1  
  export __GL_SYNC_DISPLAY_DEVICE=HDMI-0  
  export __VDPAU_NVIDIA_SYNC_DISPLAY_DEVICE=HDMI-0  
  ```
  *** Change HDMI-0 to your main monitor device.  
2. Reboot the system.  
