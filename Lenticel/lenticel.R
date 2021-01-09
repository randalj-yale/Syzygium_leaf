#total resistance to skinning = phellem tensile component + phellogen shear component
#The Roles of Phellem (Skin) Tensile-related Fractures and Phellogen Shear-related Fractures in Susceptibility to Tuber-skinning Injury and Skin-set Development
#Modeling the nonlinear elastic behavior of plant epidermis
#Prediction of moisture loss across the cuticle of apple (Malus sylvestris subsp. mitis (Wallr.)) during storage: Part 1. Model development and determination of diffusion coefficients
#THE PERIDERM DEVELOPMENT IN QUERCUS SUBER
#pa based on onion skin
tens = .5
shear = U
r = tens + shear

#diffusion coeffiect, m/s apple skin
Dcutin = 4.5e-14
#difference in moisture concentration kg/(m*s) or pa*s
flux = -(Dcutin)*(deltaC)*(x)

#conversion from mol to kg
Cin = (pin/(i*R*T))*.018015
#i of low electrolyte water
  i = 1
#R of water
  R = 8.31446261815324
#standard temp
  T = 273.15
#assuming same water potential - for both groups, from oaks
  pin = psi*100000
Cout = (pio/(i*R*T))*.018015
  pio = -6.5*1000000
deltaC = Cout - Cin
#epidermal distance - estimate from oaks
x = (5e-6)

#radius of meristematic activity
q = 10
d = (seq(1,q,1))
y = .25*d*x- (d-1)*.25*x*.1^d
wid = 6e-5
V = 2/3*3.14*y^3*wid

#shear stress neo-Hookean
U = C10*(I - 3) + (1/D1)*(Je - 1)^2
#I changes in dimensions of cube
lam1 = 2/1
lam2 = 3/2
lam3 = 1/2
I = lam1 + lam2 + lam3
# D is 1/Pa
D1 = 1e-2
Je = lam1*lam2*lam3
#constant
C10 = .3

#Growth-induced residual stress ratio
V0 = x^2*wid
lamr = exp((V/V0))

U2 = C20*(I1 - 3) + (1/D2)*(Jej - 1)^2
lam10 = y/(x*.25)
lam20 = wid/wid
lam30 = (3*wid)/(2*wid)
I1 = lam10 + lam20 + lam30
D2 = .1
Jej = lam10*lam20*lam30
C20 = .3


newflux = -(Dcutin)*deltaC*y
tear = r - flux
tear = r - (newflux + U2)

    
#Stem hydraulic capacitance decreases with drought stress: implications for modelling tree hydraulics in the Mediterranean oak Quercus ilex
#hydraulic resistance
Rx = r1*exp(psi^2)*r2
    r1 = 1
    r2 = 1
#cumulative water
W = -logb(w2*psi+1, w1)
  c1 = -3
  c2 = 2
  w1 = exp(c1)
  w2 = log(w1)/c2
  psi = -2
#hydraulic capicitance
Cs = 1/(c1*psi+c2)
