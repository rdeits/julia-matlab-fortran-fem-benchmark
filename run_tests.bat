rem FEM Benchmark Windows main test run script.

rem Copyright 2013-2018 Precise Simulation, Ltd.


SET OCTAVE="C:\Octave\Octave-4.2.1\bin\octave-cli.exe"
SET MATLAB="C:\Program Files\MATLAB\R2017b\bin\win64\matlab.exe"
SET JULIA="%HOME%\AppData\Local\Julia-0.6.1\bin\julia.exe"


rm -f output/*


%OCTAVE% --no-gui run_matlab.m
cd output
move output_matlab.txt output_octave.txt
cd ..


%MATLAB% -nojvm -nosplash -r run_matlab


%JULIA% run_julia.jl


bash -c ./run_fortran.sh


cd src_matlab
%OCTAVE% --no-gui process_results.m
rem %MATLAB% -nosplash -r process_results
