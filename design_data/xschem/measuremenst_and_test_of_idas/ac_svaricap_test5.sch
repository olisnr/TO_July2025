v {xschem version=3.4.7RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 317.5 320 1117.5 720 {flags=graph


ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1


divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0


autoload=0

y2=500
y1=5.1
x1=1e+08
x2=1e+10
sim_type=ac
rawfile=$netlist_dir/ac_mosvar.raw
color=4
node="1 i(i1) abs() /"}
B 2 317.5 730 1117.5 1130 {flags=graph


ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1


divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0


autoload=0

y2=3.3540742
y1=-2.0477792
x1=1e+08
x2=1e+10
color=4
node=q
sim_type=ac
sweep=dc
rawfile=$netlist_dir/ac_mosvar.raw}
N -230 245 -230 280 {lab=#net1}
N -230 340 -230 365 {lab=#net2}
N 80 315 80 360 {lab=#net3}
N 80 420 80 460 {lab=GND}
N -80 315 -40 315 {lab=#net4}
N 0 340 0 380 {lab=GND}
N 40 315 80 315 {lab=#net3}
N -80 315 -80 360 {lab=#net4}
N -80 420 -80 460 {lab=GND}
N -230 245 0 245 {lab=#net1}
N -230 420 -230 495 {lab=GND}
N 0 110 0 150 {lab=GND}
N 0 245 0 285 {lab=#net1}
N 0 190 0 245 {lab=#net1}
N 80 160 80 315 {lab=#net3}
N 40 160 80 160 {lab=#net3}
N -80 160 -80 315 {lab=#net4}
N -80 160 -40 160 {lab=#net4}
N -80 160 -30 30 {lab=#net4}
N 30 30 80 160 {lab=#net3}
N -30 -110 25 -105 {lab=#net5}
N 25 -45 30 30 {lab=#net3}
N -30 -50 -30 30 {lab=#net4}
C {devices/code_shown.sym} -797.5 487.5 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ
.lib $::SG13G2_MODELS/cornerRES.lib res_typ
.lib $::SG13G2_MODELS/cornerMOShv.lib mos_tt
"}
C {devices/code_shown.sym} 1152.5 -345 0 0 {name=NGSPICE only_toplevel=true 
value="
*.param temp=27
.control
save all 


op 
write ac_mosvar.raw
set appendwrite

let vfreq = 0
while vfreq < 1.8
   alter v1 = vfreq
   ac lin 1000 .1GHz 10GHz
   let I1=(i(V3))
   let Ctot=imag(I1)/(2*3.1415*frequency)
   let Q=imag(I1)/real(I1)
   write ac_mosvar.raw
   set appendwrite

   let vfreq = vfreq + 0.1
end

   alter v1 = 1.8
   ac lin 1000 .1GHz 10GHz
   let I1=(i(V3))
   let Ctot=imag(I1)/(2*3.1415*frequency)
   let Q=imag(I1)/real(I1)
   write ac_mosvar.raw
   set appendwrite

   alter c2 = 300f
   ac lin 1000 .1GHz 10GHz
   let I1=(i(V3))
   let Ctot=imag(I1)/(2*3.1415*frequency)
   let Q=imag(I1)/real(I1)
   write ac_mosvar.raw
   set appendwrite

   alter c2 = 100f
   ac lin 1000 .1GHz 10GHz
   let I1=(i(V3))
   let Ctot=imag(I1)/(2*3.1415*frequency)
   let Q=imag(I1)/real(I1)
   write ac_mosvar.raw
   set appendwrite

   alter c2 = 30f
   ac lin 1000 .1GHz 10GHz
   let I1=(i(V3))
   let Ctot=imag(I1)/(2*3.1415*frequency)
   let Q=imag(I1)/real(I1)
   write ac_mosvar.raw
   set appendwrite

   alter c2 = 1f
   ac lin 1000 .1GHz 10GHz
   let I1=(i(V3))
   let Ctot=imag(I1)/(2*3.1415*frequency)
   let Q=imag(I1)/real(I1)
   write ac_mosvar.raw
   set appendwrite

   alter c1 nx = 30
   ac lin 1000 .1GHz 10GHz
   let I1=(i(V3))
   let Ctot=imag(I1)/(2*3.1415*frequency)
   let Q=imag(I1)/real(I1)
   write ac_mosvar.raw
   set appendwrite


*plot i(v1)

.endc
"}
C {devices/launcher.sym} 480 -12.5 0 0 {name=h5
descr="Load IV curve" 
tclcommand="xschem raw_read $netlist_dir/ac_mosvar.raw ac"
}
C {devices/vsource.sym} -230 392.5 0 0 {name=V1 value="dc 1 ac 0"}
C {devices/ind.sym} -230 310 0 0 {name=L3
value=1m
footprint=1206
device=inductor}
C {devices/gnd.sym} -230 495 0 0 {name=l5 lab=GND}
C {devices/vsource.sym} 80 390 0 0 {name=V3 value="dc 0 ac 0"}
C {devices/gnd.sym} 80 460 0 0 {name=l8 lab=GND}
C {devices/gnd.sym} 0 375 0 0 {name=l9 lab=GND}
C {sg13g2_pr/sg13_svaricap.sym} 0 315 0 0 {name=C6 model=sg13_hv_svaricap W=3.74e-6 L=0.3e-6 Nx=1 spiceprefix=X
spice_ignore=true}
C {devices/vsource.sym} -80 390 0 0 {name=V2 value="dc 0 ac 1"}
C {devices/gnd.sym} -80 460 0 0 {name=l11 lab=GND}
C {devices/gnd.sym} 0 115 2 0 {name=l1 lab=GND}
C {sg13g2_pr/sg13_svaricap.sym} 0 160 2 0 {name=C1 model=sg13_hv_svaricap W=9.7e-6 L=0.8e-6 Nx=100 spiceprefix=X}
C {capa.sym} 0 30 1 0 {name=C2
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {res.sym} 25 -75 0 0 {name=R1
value=5
footprint=1206
device=resistor
m=1}
C {ind.sym} -30 -80 0 0 {name=L2
m=1
value=2n
footprint=1206
device=inductor}
