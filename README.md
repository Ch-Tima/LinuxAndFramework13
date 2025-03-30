# ArchLinxu Framework 13 Setting

### First Start&Proplems:
  - Windows and Icons Too Small:

      soutions: __System Setting -> Display&Monitore -> Globale scale__
    
  - Small login form

    
      soutions:

         sudo nano /etc/sddm.conf

    Add&Edite next line:

        [General]
        GreeterEnvironment=QT_SCREEN_SCALE_FACTORS=2,QT_FONT_DPI=120 // <- add this line & set dpi


        [Wayland]
        EnableHiDPI=true // <- set true
    
        [X11]
        EnableHiDPI=true // <- set true
        ServerArguments=-nolisten tcp -dpi 120 // <- set dpi

    CTRL+O -> Enter -> CTRL+X

        sudo systemctl restart sddm

  ### Smart gestures for touchpad:
  - Insatll [touchegg](https://github.com/JoseExposito/touchegg)
    
        $ sudo pacman -Syu touchegg
        $ sudo systemctl enable touchegg.service
        $ sudo systemctl start touchegg
    
  - Insatll [touche](https://github.com/JoseExposito/touche)

        $ sudo pacman -Syu touche

  - Installing the script:

        Place gesture_srcipt.sh in /home/$USER/.config/touchegg/
        Don't forget to set your `$USER` in the script path.

        $ sudo pacman -S xdotool
        $ sudo chmod +x  /home/$USER/.config/touchegg/gesture_srcipt.sh #optional


  
  ### NTFS
      An error occurred while accessing 'K256', the system responded: 
      The requested operation has failed: 
      Error mounting /dev/sda1 at /run/media/tim/K256: 
      wrong fs type, bad option, bad superblock on /dev/sda1, 
      missing codepage or helper program, or other error.

- Check Disk Information
      
      $ lsblk
      NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
      sda           8:0    0 238.5G  0 disk 
      └─sda1        8:1    0 238.5G  0 part 
      nvme0n1     259:0    0 931.5G  0 disk 
      ├─nvme0n1p1 259:1    0   512M  0 part /boot/efi
      └─nvme0n1p2 259:2    0   931G  0 part /

      $ sudo blkid /dev/sda1
      /dev/sda1: LABEL="K256" BLOCK_SIZE="512" UUID="0488E02C88E01DC4" TYPE="ntfs" PARTUUID="228d4d16-01"
- Install NTFS-3G

      sudo pacman -S ntfs-3g
- Fix

      sudo ntfsfix /dev/sda1
- Try Mounting Manually

      sudo mount -t ntfs-3g /dev/sda1 /mnt
- Check Kernel Logs for Errors

      sudo dmesg | tail -n 20


### Features
 - **Four-Finger Swipe Gestures**:
      - **Swipe Left/Right**: Show the next virtual desktop on the horizontal axis. (`Ctrl + Super + Right/Left`)
      - **Swipe Up/Down**: Show the next virtual desktop on the vertical axis. (`Ctrl + Super + Up/Down`)

 - **Three-Finger Swipe Gestures**:              
      - **Swipe Up**: Show the virtual desktop overview. 
      - **Swipe Down**: Close the virtual desktop overview and open the dashboard.          
 - **Pinch Gestures**:               
      - Pinch out to zoom in (`Super + =`)       
      - Pinch in to zoom out (`Super + -`)


### Install .tar.gz ([AndroidStudio](https://developer.android.com/studio))
  - Extract

        sudo tar -xvzf android-studio-*.tar.gz -C /opt

  - To start the application (*android-studio/bin/studio.sh*)

        ./studio.sh

 - PATH .zshrc

       nano ~/.zshrc
   
     Add to the last line -> **export PATH=$PATH:/opt/android-studio/bin**

- Icon

      nano ~/.local/share/application/android-studio.desktop

    Insert:
  
        [Desktop Entry]
        Version=1.0
        Type=Application
        Name=Android Studio
        Exec=/opt/android-studio/bin/studio.sh
        Icon=/opt/android-studio/bin/studio.png
        Terminal=false
        Categories=Development;IDE;
        StartupNotify=true
  
    Last:
  
      chmod +x ~/.local/share/applications/android-studio.desktop

        


