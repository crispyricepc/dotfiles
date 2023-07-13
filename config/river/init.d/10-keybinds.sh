# Directional key variables
D_LEFT=H
D_DOWN=J
D_UP=K
D_RIGHT=L

riverctl map normal Super Return spawn $TERM_PROGRAM # Spawn terminal
riverctl map normal Super Space spawn 'wofi --show drun' # Spawn menu

riverctl map normal Super Q close # Close focused view
riverctl map normal Super+Shift E exit # Exit river

riverctl map normal Super+Shift Space toggle-float # Toggle float
riverctl map normal Super F toggle-fullscreen # Toggle fullscreen

riverctl map normal Super $D_LEFT move left 100 # Move view left
riverctl map normal Super $D_DOWN move down 100 # Move view down
riverctl map normal Super $D_UP move up 100 # Move view up
riverctl map normal Super $D_RIGHT move right 100 # Move view right

riverctl map normal Super+Shift $D_LEFT snap left # Snap view left
riverctl map normal Super+Shift $D_DOWN snap down # Snap view down
riverctl map normal Super+Shift $D_UP snap up # Snap view up
riverctl map normal Super+Shift $D_RIGHT snap right # Snap view right

riverctl map normal Super H send-layout-cmd rivertile "main-ratio -0.05"
riverctl map normal Super L send-layout-cmd rivertile "main-ratio +0.05"

for mode in normal locked
do
  # Eject the optical drive (well if you still have one that is)
  riverctl map $mode None XF86Eject spawn 'eject -T'

  # Control pulse audio volume with pamixer (https://github.com/cdemoulins/pamixer)
  riverctl map $mode None XF86AudioRaiseVolume  spawn 'pamixer -i 5'
  riverctl map $mode None XF86AudioLowerVolume  spawn 'pamixer -d 5'
  riverctl map $mode None XF86AudioMute         spawn 'pamixer --toggle-mute'

  # Control MPRIS aware media players with playerctl (https://github.com/altdesktop/playerctl)
  riverctl map $mode None XF86AudioMedia spawn 'playerctl play-pause'
  riverctl map $mode None XF86AudioPlay  spawn 'playerctl play-pause'
  riverctl map $mode None XF86AudioPrev  spawn 'playerctl previous'
  riverctl map $mode None XF86AudioNext  spawn 'playerctl next'

  # Control screen backlight brighness with light (https://github.com/haikarainen/light)
  riverctl map $mode None XF86MonBrightnessUp   spawn 'light -A 5'
  riverctl map $mode None XF86MonBrightnessDown spawn 'light -U 5'
done

riverctl map-pointer normal Super BTN_LEFT move-view # Move with the mouse buttons
riverctl map-pointer normal Super BTN_RIGHT resize-view # Resize with the mouse buttons
