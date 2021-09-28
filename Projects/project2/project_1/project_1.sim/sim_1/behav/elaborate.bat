@echo off
set xv_path=D:\\software\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto dec2dfbfebf942f48a82959299d3f129 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot singlecyclesim_behav xil_defaultlib.singlecyclesim xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
