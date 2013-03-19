.OPTIONS ACCT POST ACOUT=0 UNWRAP LIST
.OP
.TRAN .1u 3u
.PARAM VDD=5
.GLOBAL vdd gnd

* Power supply definitions and bias current reference
vdd vdd gnd 5.0v
vin in gnd 3.0v
I2 vdd IREF 50uA

mp1 IREF IREF gnd gnd nmos L=1e-6 W=10e-6 M=1
mn3 vdd in out gnd nmos L=1e-6 W=10e-6 M=1
mp2 out IREF gnd gnd nmos L=1e-6 W=31.6e-6 M=1 

c2 out gnd 200f

.INCLUDE ami.5um.typmodels

.end




