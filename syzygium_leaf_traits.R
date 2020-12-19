library(phylolm)

syz = read.newick("Syzygium.txt")
typeof(syz)
plot(syz)
tip = c("E_uniflora", "T_queenslandica")
syz= drop.tip(syz, tip)
trait=read.csv("syzygium traits.csv", row.names=1)
name.check(datos, syz)
datos<-read.csv("syzygium traits.csv",header=TRUE, row.names = 1)

model1 = gls(ep_ab_anticlinal~mid_vas_shape, data=datos, correlation = corPagel(1,syz))
summary(model1)
model1 = gls(mid_vas_shape+mid_ad_phloem+mid_scler+lat_vein_bs+leaf_ven_type~ep_ab_anticlinal+stomata+lam_cutic+mid_ad_surf+mid_ab_surf+lam_ad_shape+lam_ab_shape, data=datos, correlation = corPagel(1,syz))
plot(model1)
#mid_scler 0.8585955; leaf_ven_type 1.111111 (remained above 1.05 for all surface defining traits); lat_vein_bs 0.2452138; mid_vas_shape 0.1515344; mid_ad_phloem 0.7646696

#Soh, W.K., Parnell, J. Comparative leaf anatomy and phylogeny of Syzygium Gaertn.. Plant Syst Evol 297, 1 (2011). https://doi.org/10.1007/s00606-011-0495-2

state<-(c("ad","ab")[rep(c(1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,2,1,1,1,1,1,1,1,1,2,1,1,1,2,1))]);names(state)<-syz$tip.label
syzygium_tree<-make.simmap(syz,state)
plotSimmap(syzygium_tree)
#petal coherenace for ab and ad pal layer
data1<-trait[,c("petal_coher", "ad_pal_layer")]
data2<-trait[,c("mid_ad_surf", "mid_ab_surf")]
data3<-trait[,c("lam_ad_shape", "lam_ab_shape")]
data4<-trait[,c("palisade_percent", "mid_vas_shape")]
data5<-trait[,c("lamina_thickness", "leaf_ven_type")]
mvOU(syzygium_tree, data1)
mvOU(syzygium_tree, data2)
mvOU(syzygium_tree, data3)
mvOU(syzygium_tree, data4)
mvOU(syzygium_tree, data5)