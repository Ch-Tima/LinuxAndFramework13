# Manjaro KDE Framework 13 Setting

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

        


