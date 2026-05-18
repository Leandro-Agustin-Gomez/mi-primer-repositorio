@echo off


:menu
cls
echo
echo ----------------------------------------------------
echo
echo 1) Verificar el Bucle Local.
echo
echo 2) Obtener IP de la placa.
echo
echo 3) Prueba de Conectividad Estandar.
echo
echo 4) Monitoreo Continuo (Parimetro -t).
echo
echo 5) Definir Cantidad de Paquetes.
echo
echo 6) Prueba de Carga (Paquetes de 1000 bytes).
echo
echo 7) Resolucion de nombres.
echo
echo 8) Salir.
echo
echo 9) Nslookup.
echo
echo 10) Tracert.
echo ----------------------------------------------------
set /p opcion=Seleccione una opcion (1-10): 

if %opcion%==1 goto loopback
if %opcion%==2 goto ipconfig
if %opcion%==3 goto estandar
if %opcion%==4 goto continuo
if %opcion%==5 goto cantidad
if %opcion%==6 goto carga
if %opcion%==7 goto resolucion
if %opcion%==8 goto salir
if %opcion%==9 goto Nslookup
if %opcion%==10 goto Tracert

:loopback
echo.
echo Ejecutando prueba de Loopback (127.0.0.1)...
ping 127.0.0.1
pause
goto menu

:ipconfig
echo.
echo Obteniendo configuracion de IP...
ipconfig
pause
goto menu

:estandar
echo.
set /p url=Ingrese la URL o IP a la que desea hacer ping: 
ping %url%
pause
goto menu

:continuo
echo.
set /p url_t=Ingrese la URL o IP para el monitoreo continuo: 
echo Precionar las teclas CTRL+C para detener el proceso.
ping %url_t% -t
pause
goto menu

:cantidad
echo.
set /p url_n=Ingrese la URL o IP para verificar la latencia con 10 paquetes: 
ping -n 10 %url_n%
pause
goto menu

:carga
echo.
set /p url_l=Ingrese la URL o IP para la prueba de carga: 
ping -l 1000 %url_l%
pause
goto menu

:resolucion
echo.
set /p ip_a=Ingrese una direccion IP para decirte el nombre: 
ping -a %ip_a%
pause
goto menu

:salir
echo Espere un segundo, saliendo desde el menu.
exit

:Nslookup
echo.
set /p dominio=Ingrese el dominio o IP para consultar en el DNS: 
nslookup %dominio%
pause
goto menu

:Tracert
echo.
set /p destino=Ingrese la URL o IP para trazar la ruta: 
tracert %destino%
pause
goto menu
