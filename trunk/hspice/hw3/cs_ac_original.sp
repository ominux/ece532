* Power supply definitions
vdd vdd gnd 5.0v

*vin in gnd 1.8v
vinbias inbias gnd 1.8v
I2 IREF gnd 50uA

.AC dec 10 1 1GHz

Vp1 in inbias AC=1e-3

mp1 IREF IREF vdd vdd pmos L=1e-6 W=10e-6 M=1
mn3 out in gnd gnd nmos L=1e-6 W=5.2e-6 M=1
mp2 out IREF vdd vdd pmos L=1e-6 W=10e-6 M=4

c2 out gnd 200f

.probe ac vdb(OUT) vp(OUT)
.probe ac gain=par('20*log10(vm(OUT)/vm(in))')
.probe ac phase=par('vp(OUT)-vp(in)')
.probe ac margin=par('vp(OUT)-vp(in)+180')
