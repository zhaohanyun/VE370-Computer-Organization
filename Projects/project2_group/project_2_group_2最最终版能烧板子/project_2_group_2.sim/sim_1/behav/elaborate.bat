@echo off
set xv_path=D:\\Xilinx_Vivado\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto 59002f8076734e49b97baa4d12cd188a -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot p2pipelineSIM_behav xil_defaultlib.p2pipelineSIM xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
