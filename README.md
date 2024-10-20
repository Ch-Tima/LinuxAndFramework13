# Manjaro KDE Framework 13 Setting

### First Start&Proplems:
  - Windows and Icons Too Small:
    soutions: System Setting -> Display&Monitore -> Globale scale
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


    TODO

