if [ -z "$DISPLAY" ]; then
  case "$(tty)" in
    /dev/tty1)
      # Kill existing sway session or compositor if needed (if any)
      pkill sway
      exec sway
      ;;
    /dev/tty2)
      # Kill X server if running on display :0
      pkill Xorg
      exec startx
      ;;
  esac
fi

