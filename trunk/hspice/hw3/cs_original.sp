.OPTIONS ACCT POST ACOUT=0 UNWRAP LIST
.OP
.TRAN .1u 3u
.PARAM VDD=5
.GLOBAL vdd gnd

* Power supply definitions and bias current reference
vdd vdd gnd 5.0v
vin in gnd 1.8v
I2 IREF gnd 50uA

mp1 IREF IREF vdd vdd pmos L=1e-6 W=10e-6 M=1
mn3 out in gnd gnd nmos L=1e-6 W=5.2e-6 M=1
mp2 out IREF vdd vdd pmos L=1e-6 W=10e-6 M=4

*mp1 IREF IREF vdd vdd pmos L=1e-6 W=10e-6 M=1
*mn3 out in gnd gnd nmos L=1e-6 W=5.2e-6 M=1
*mp2 out IREF vdd vdd pmos L=1e-6 W=10e-6 M=4
c2 out gnd 200f

.INCLUDE ami.5um.typmodels

.end
