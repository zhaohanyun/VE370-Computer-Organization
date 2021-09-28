@echo off
set xv_path=D:\\software\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto 3ff0935030a64c16856107269683ed6b -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot sim_2a_behav xil_defaultlib.sim_2a xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
