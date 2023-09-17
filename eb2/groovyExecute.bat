@echo off
setlocal enabledelayedexpansion

set script=practice.groovy
set repetitions=10

for /l %%i in (1,1,%repetitions%) do (
    groovy %script%
)
