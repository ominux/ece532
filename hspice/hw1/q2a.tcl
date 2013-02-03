############################################################
## EZwave - Saved Window File
## Sunday, February 3, 2013 at 3:28:08 PM EST
##
## Note: This is an auto-generated file.
##
## In case of modification, Do not remove this comment
############################################################

# ===== Open required Database =====
dataset open /home/software/ece532/jpo4/ece532/hspice/hw1/q2a.sw0 q2a.sw0
dataset open /home/software/ece532/jpo4/ece532/hspice/hw1/q2a.sw1 q2a.sw1

# ===== Open the window =====
wave addwindow  -x 0  -y 0 -width 1354  -height 757 -divider 0.91

# ===== Create row #1 =====
add wave -overlay               -run 1 -show DC.i -color -16711936 q2a.sw0/V0P -run 2 -show DC.i -color -256 q2a.sw0/V0P -run 3 -show DC.i -color -16744193 q2a.sw0/V0P -run 4 -show DC.i -color -32768 q2a.sw0/V0P -run 5 -show DC.i -color -65281 q2a.sw0/V0P -run 6 -show DC.i -color -16711681 q2a.sw0/V0P -run 7 -show DC.i -color -3650716 q2a.sw0/V0P -run 8 -show DC.i -color -2968436 q2a.sw0/V0P -run 9 -show DC.i -color -16711936 q2a.sw0/V0P -run 10 -show DC.i -color -256 q2a.sw0/V0P -run 11 -show DC.i -color -16744193 q2a.sw0/V0P -run 12 -show DC.i -color -32768 q2a.sw0/V0P -run 13 -show DC.i -color -65281 q2a.sw0/V0P


# ===== Create row #2 =====
add wave -overlay               -run 1 -show DC.i -color -16711681 q2a.sw1/V0N -run 2 -show DC.i -color -3650716 q2a.sw1/V0N -run 3 -show DC.i -color -2968436 q2a.sw1/V0N -run 4 -show DC.i -color -16711936 q2a.sw1/V0N -run 5 -show DC.i -color -256 q2a.sw1/V0N -run 6 -show DC.i -color -16744193 q2a.sw1/V0N -run 7 -show DC.i -color -32768 q2a.sw1/V0N -run 8 -show DC.i -color -65281 q2a.sw1/V0N -run 9 -show DC.i -color -16711681 q2a.sw1/V0N -run 10 -show DC.i -color -3650716 q2a.sw1/V0N -run 11 -show DC.i -color -2968436 q2a.sw1/V0N -run 12 -show DC.i -color -16711936 q2a.sw1/V0N -run 13 -show DC.i -color -256 q2a.sw1/V0N


# ====== Create the cursors, markers and measurements =====
wave addannotation I(V0P)_5 -x -4.184210526962624 -y -0.0011398207249418162 -text "VDS = -4, VGS = -2"
wave addannotation I(V0P)_9 -x -1.5 -y -0.0042376648634672165 -text "VDS = -1, VGS = -4"
wave addannotation I(V0N)_9 -x 0.9736825259606917 -y 0.008810288404901518 -text "VDS = 1, VGS = -4"
wave addannotation I(V0N)_5 -x 3.9649122770106278 -y 0.003915964445929408 -text "VDS = 4, VGS = 2"
