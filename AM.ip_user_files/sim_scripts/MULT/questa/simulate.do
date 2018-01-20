onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib MULT_opt

do {wave.do}

view wave
view structure
view signals

do {MULT.udo}

run -all

quit -force
