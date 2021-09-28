@echo off
set xv_path=D:\\software\\Vivado\\2017.2\\bin
call %xv_path%/xsim p2pipelineSIM_behav -key {Behavioral:sim_1:Functional:p2pipelineSIM} -tclbatch p2pipelineSIM.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
