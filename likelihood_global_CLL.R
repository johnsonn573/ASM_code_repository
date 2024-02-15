

# THIS SCRIPT WAS NEVER USED!!!

# Likelihood global assumes p_ASM is the same across all individuals. 

# Loading each matrices of read counts for each sample.
# There are 4 matrices altogether: Unmethylated Strand 1, Unmethylated Strand 2, Methylated Strand 1, Methylated Strand 2.
# Each row is a CpG. Each column is a cell.
# Since we are not interested in strand, we are combining counts from strand 1 and strand 2.
rm(list=ls())
gc()

sample.IDs <- c("CLL01","CLL02","CLL03","CLL04","CLL05","CLL06",
                "CLL07","CLL08","CLL09","CLL10","CLL11","CLL12")

for(i in 1:length(sample.IDs)){
  print(i)
  load(paste0("C:/Users/User/Dropbox/projects/scrrbs/data/sample_matrices/matrix.",sample.IDs[i],".rda"))
  matrix.u1<-get(paste0("matrix.u1",sample.IDs[i]))
  matrix.u2<-get(paste0("matrix.u2",sample.IDs[i]))
  matrix.u=matrix.u1+matrix.u2
  matrix.m1<-get(paste0("matrix.m1",sample.IDs[i]))
  matrix.m2<-get(paste0("matrix.m2",sample.IDs[i]))
  matrix.m=matrix.m1+matrix.m2
  assign(x=paste0("U.matrix.",sample.IDs[i]),value=matrix.u)
  assign(x=paste0("M.matrix.",sample.IDs[i]),value=matrix.m)
  list=c(paste0("matrix.m1",sample.IDs[i]),paste0("matrix.m2",sample.IDs[i]),
         paste0("matrix.u1",sample.IDs[i]),paste0("matrix.u2",sample.IDs[i]))
  rm(list=list)
  gc()
  
  U.from.UM.matrix<-matrix.u
  U.from.UM.matrix[!(matrix.m>0&matrix.u>0)]<-0
  M.from.UM.matrix<-matrix.m
  M.from.UM.matrix[!(matrix.m>0&matrix.u>0)]<-0
  
  M.from.UM.matrix
}

# Other CLL01 variables
U.from.UM.matrix.CLL01<-U.matrix.CLL01
U.from.UM.matrix.CLL01[!(M.matrix.CLL01>0&U.matrix.CLL01>0)]<-0
M.from.UM.matrix.CLL01<-M.matrix.CLL01
M.from.UM.matrix.CLL01[!(M.matrix.CLL01>0&U.matrix.CLL01>0)]<-0

M.matrix.CLL01[U.matrix.CLL01>0]<-0
U.matrix.CLL01[M.matrix.CLL01>0]<-0

M.cells.CLL01<-rowSums(M.matrix.CLL01>0)
U.cells.CLL01<-rowSums(U.matrix.CLL01>0)
rm(M.matrix.CLL01,U.matrix.CLL01);gc()
prop.m.CLL01<-round(M.cells.CLL01/(U.cells.CLL01+M.cells.CLL01),2)
prop.u.CLL01<-1-prop.m.CLL01
prop.m.CLL01[is.nan(prop.m.CLL01+prop.u.CLL01)]<-1
prop.u.CLL01[is.nan(prop.m.CLL01+prop.u.CLL01)]<-1

# Other CLL02 variables
U.from.UM.matrix.CLL02<-U.matrix.CLL02
U.from.UM.matrix.CLL02[!(M.matrix.CLL02>0&U.matrix.CLL02>0)]<-0
M.from.UM.matrix.CLL02<-M.matrix.CLL02
M.from.UM.matrix.CLL02[!(M.matrix.CLL02>0&U.matrix.CLL02>0)]<-0

M.matrix.CLL02[U.matrix.CLL02>0]<-0
U.matrix.CLL02[M.matrix.CLL02>0]<-0

M.cells.CLL02<-rowSums(M.matrix.CLL02>0)
U.cells.CLL02<-rowSums(U.matrix.CLL02>0)
rm(M.matrix.CLL02,U.matrix.CLL02);gc()
prop.m.CLL02<-round(M.cells.CLL02/(U.cells.CLL02+M.cells.CLL02),2)
prop.u.CLL02<-1-prop.m.CLL02
prop.m.CLL02[is.nan(prop.m.CLL02+prop.u.CLL02)]<-1
prop.u.CLL02[is.nan(prop.m.CLL02+prop.u.CLL02)]<-1

# Other CLL03 variables
U.from.UM.matrix.CLL03<-U.matrix.CLL03
U.from.UM.matrix.CLL03[!(M.matrix.CLL03>0&U.matrix.CLL03>0)]<-0
M.from.UM.matrix.CLL03<-M.matrix.CLL03
M.from.UM.matrix.CLL03[!(M.matrix.CLL03>0&U.matrix.CLL03>0)]<-0

M.matrix.CLL03[U.matrix.CLL03>0]<-0
U.matrix.CLL03[M.matrix.CLL03>0]<-0

M.cells.CLL03<-rowSums(M.matrix.CLL03>0)
U.cells.CLL03<-rowSums(U.matrix.CLL03>0)
rm(M.matrix.CLL03,U.matrix.CLL03);gc()
prop.m.CLL03<-round(M.cells.CLL03/(U.cells.CLL03+M.cells.CLL03),2)
prop.u.CLL03<-1-prop.m.CLL03
prop.m.CLL03[is.nan(prop.m.CLL03+prop.u.CLL03)]<-1
prop.u.CLL03[is.nan(prop.m.CLL03+prop.u.CLL03)]<-1

# Other CLL04 variables
U.from.UM.matrix.CLL04<-U.matrix.CLL04
U.from.UM.matrix.CLL04[!(M.matrix.CLL04>0&U.matrix.CLL04>0)]<-0
M.from.UM.matrix.CLL04<-M.matrix.CLL04
M.from.UM.matrix.CLL04[!(M.matrix.CLL04>0&U.matrix.CLL04>0)]<-0

M.matrix.CLL04[U.matrix.CLL04>0]<-0
U.matrix.CLL04[M.matrix.CLL04>0]<-0

M.cells.CLL04<-rowSums(M.matrix.CLL04>0)
U.cells.CLL04<-rowSums(U.matrix.CLL04>0)
rm(M.matrix.CLL04,U.matrix.CLL04);gc()
prop.m.CLL04<-round(M.cells.CLL04/(U.cells.CLL04+M.cells.CLL04),2)
prop.u.CLL04<-1-prop.m.CLL04
prop.m.CLL04[is.nan(prop.m.CLL04+prop.u.CLL04)]<-1
prop.u.CLL04[is.nan(prop.m.CLL04+prop.u.CLL04)]<-1

# Other CLL05 variables
U.from.UM.matrix.CLL05<-U.matrix.CLL05
U.from.UM.matrix.CLL05[!(M.matrix.CLL05>0&U.matrix.CLL05>0)]<-0
M.from.UM.matrix.CLL05<-M.matrix.CLL05
M.from.UM.matrix.CLL05[!(M.matrix.CLL05>0&U.matrix.CLL05>0)]<-0

M.matrix.CLL05[U.matrix.CLL05>0]<-0
U.matrix.CLL05[M.matrix.CLL05>0]<-0

M.cells.CLL05<-rowSums(M.matrix.CLL05>0)
U.cells.CLL05<-rowSums(U.matrix.CLL05>0)
rm(M.matrix.CLL05,U.matrix.CLL05);gc()
prop.m.CLL05<-round(M.cells.CLL05/(U.cells.CLL05+M.cells.CLL05),2)
prop.u.CLL05<-1-prop.m.CLL05
prop.m.CLL05[is.nan(prop.m.CLL05+prop.u.CLL05)]<-1
prop.u.CLL05[is.nan(prop.m.CLL05+prop.u.CLL05)]<-1

# Other CLL06 variables
U.from.UM.matrix.CLL06<-U.matrix.CLL06
U.from.UM.matrix.CLL06[!(M.matrix.CLL06>0&U.matrix.CLL06>0)]<-0
M.from.UM.matrix.CLL06<-M.matrix.CLL06
M.from.UM.matrix.CLL06[!(M.matrix.CLL06>0&U.matrix.CLL06>0)]<-0

M.matrix.CLL06[U.matrix.CLL06>0]<-0
U.matrix.CLL06[M.matrix.CLL06>0]<-0

M.cells.CLL06<-rowSums(M.matrix.CLL06>0)
U.cells.CLL06<-rowSums(U.matrix.CLL06>0)
rm(M.matrix.CLL06,U.matrix.CLL06);gc()
prop.m.CLL06<-round(M.cells.CLL06/(U.cells.CLL06+M.cells.CLL06),2)
prop.u.CLL06<-1-prop.m.CLL06
prop.m.CLL06[is.nan(prop.m.CLL06+prop.u.CLL06)]<-1
prop.u.CLL06[is.nan(prop.m.CLL06+prop.u.CLL06)]<-1


# Function to compute likelihood of ASM and likelihood of not ASM.
likes <- function(u,m,prop.u,prop.m,U.cells,M.cells) {
  n = u + m
  like_A = (0.5^n)*0.5^(M.cells+U.cells)
  # We need a new likelihood for "not ASM". Do I need to account for two-tails by multiplying by 2?
  like_M = .01^u*.99^m*prop.m^M.cells
  like_U = .99^u*.01^m*prop.u^U.cells
  like_notA=like_M+like_U
  cbind(like_A,like_notA)
}


# This takes the likes function as part of its input. This will get fed into the optimization function to maximize parameter, probability of ASM (pa).
loglike2 <- function(u,m,prop.u,prop.m,U.cells,M.cells,probvec,p2) {
  pa = probvec*p2
  pnota=1-pa
  probs = as.matrix(c(pa,pnota))
  log(likes(u,m,prop.u,prop.m,U.cells,M.cells)%*%probs)
}

# Here we are taking tho loglike2 function as input. We want to maximize a single parameter across all 6 individuals.
logl=matrix(data=0,nrow=6,ncol=1)
testfunc2 <- function(probvec) {
  p2=.046
  logl[1,] = sum(loglike2(u=U.CLL01,m=M.CLL01,prop.u=prop.u.CLL01.j,prop.m=prop.m.CLL01.j,U.cells=U.cells.CLL01.j,M.cells=M.cells.CLL01.j,probvec,p2))
  logl[2,] = sum(loglike2(u=U.CLL02,m=M.CLL02,prop.u=prop.u.CLL02.j,prop.m=prop.m.CLL02.j,U.cells=U.cells.CLL02.j,M.cells=M.cells.CLL02.j,probvec,p2))
  logl[3,] = sum(loglike2(u=U.CLL03,m=M.CLL03,prop.u=prop.u.CLL03.j,prop.m=prop.m.CLL03.j,U.cells=U.cells.CLL03.j,M.cells=M.cells.CLL03.j,probvec,p2))
  logl[4,] = sum(loglike2(u=U.CLL04,m=M.CLL04,prop.u=prop.u.CLL04.j,prop.m=prop.m.CLL04.j,U.cells=U.cells.CLL04.j,M.cells=M.cells.CLL04.j,probvec,p2))
  logl[5,] = sum(loglike2(u=U.CLL05,m=M.CLL05,prop.u=prop.u.CLL05.j,prop.m=prop.m.CLL05.j,U.cells=U.cells.CLL05.j,M.cells=M.cells.CLL05.j,probvec,p2))
  logl[6,] = sum(loglike2(u=U.CLL06,m=M.CLL06,prop.u=prop.u.CLL06.j,prop.m=prop.m.CLL06.j,U.cells=U.cells.CLL06.j,M.cells=M.cells.CLL06.j,probvec,p2))
  sum.logl=sum(logl,na.rm=TRUE)
  -sum.logl
}

# We only want to maximize CpGs that have data. 
inc1=rowSums(U.from.UM.matrix.CLL01)>0&rowSums(M.from.UM.matrix.CLL01)>0
inc2=rowSums(U.from.UM.matrix.CLL02)>0&rowSums(M.from.UM.matrix.CLL02)>0
inc3=rowSums(U.from.UM.matrix.CLL03)>0&rowSums(M.from.UM.matrix.CLL03)>0
inc4=rowSums(U.from.UM.matrix.CLL04)>0&rowSums(M.from.UM.matrix.CLL04)>0
inc5=rowSums(U.from.UM.matrix.CLL05)>0&rowSums(M.from.UM.matrix.CLL05)>0
inc6=rowSums(U.from.UM.matrix.CLL06)>0&rowSums(M.from.UM.matrix.CLL06)>0
inc=inc1|inc2|inc3|inc4|inc5|inc6 # Logical vector that tells us which rows have read counts in at least one sample.

U.from.UM.matrix.CLL01=U.from.UM.matrix.CLL01[inc,]
M.from.UM.matrix.CLL01=M.from.UM.matrix.CLL01[inc,]
U.from.UM.matrix.CLL02=U.from.UM.matrix.CLL02[inc,]
M.from.UM.matrix.CLL02=M.from.UM.matrix.CLL02[inc,]
U.from.UM.matrix.CLL03=U.from.UM.matrix.CLL03[inc,]
M.from.UM.matrix.CLL03=M.from.UM.matrix.CLL03[inc,]
U.from.UM.matrix.CLL04=U.from.UM.matrix.CLL04[inc,]
M.from.UM.matrix.CLL04=M.from.UM.matrix.CLL04[inc,]
U.from.UM.matrix.CLL05=U.from.UM.matrix.CLL05[inc,]
M.from.UM.matrix.CLL05=M.from.UM.matrix.CLL05[inc,]
U.from.UM.matrix.CLL06=U.from.UM.matrix.CLL06[inc,]
M.from.UM.matrix.CLL06=M.from.UM.matrix.CLL06[inc,]

p.asm.matrix=matrix(data=NA,nrow=nrow(U.from.UM.matrix.CLL01),ncol=1) # This allows us to save the parameter estimate of pa that maximizes the likelihood.
l.asm.matrix=matrix(data=NA,nrow=nrow(U.from.UM.matrix.CLL01),ncol=1) # Here we are saving the likelihood.

# j corresponds to CpG site.
for (j in 1:nrow(p.asm.matrix)){
  print(j)
  U.CLL01=U.from.UM.matrix.CLL01[j,] # Unmethylated reads at the jth CpG site for CLL01. Each element of the vector is a cell.
  M.CLL01=M.from.UM.matrix.CLL01[j,] # Methylated reads at the jth CpG site for CLL01. Each element of the vector is a cell.
  U.CLL02=U.from.UM.matrix.CLL02[j,]
  M.CLL02=M.from.UM.matrix.CLL02[j,]
  U.CLL03=U.from.UM.matrix.CLL03[j,]
  M.CLL03=M.from.UM.matrix.CLL03[j,]
  U.CLL04=U.from.UM.matrix.CLL04[j,]
  M.CLL04=M.from.UM.matrix.CLL04[j,]
  U.CLL05=U.from.UM.matrix.CLL05[j,]
  M.CLL05=M.from.UM.matrix.CLL05[j,]
  U.CLL06=U.from.UM.matrix.CLL06[j,]
  M.CLL06=M.from.UM.matrix.CLL06[j,]
  inc1=which(U.CLL01>0|M.CLL01>0) # We only want to include cells with data.
  inc2=which(U.CLL02>0|M.CLL02>0)
  inc3=which(U.CLL03>0|M.CLL03>0)
  inc4=which(U.CLL04>0|M.CLL04>0)
  inc5=which(U.CLL05>0|M.CLL05>0)
  inc6=which(U.CLL06>0|M.CLL06>0)
  
  U.CLL01=U.CLL01[inc1] # Exclude cells with 0 read counts.
  M.CLL01=M.CLL01[inc1]
  U.CLL02=U.CLL02[inc2]
  M.CLL02=M.CLL02[inc2]
  U.CLL03=U.CLL03[inc3]
  M.CLL03=M.CLL03[inc3]
  U.CLL04=U.CLL04[inc4]
  M.CLL04=M.CLL04[inc4]
  U.CLL05=U.CLL05[inc5]
  M.CLL05=M.CLL05[inc5]
  U.CLL06=U.CLL06[inc6]
  M.CLL06=M.CLL06[inc6]
  
  prop.u.CLL01.j<-prop.u.CLL01[j]
  prop.m.CLL01.j<-prop.m.CLL01[j]
  U.cells.CLL01.j<-U.cells.CLL01[j]
  M.cells.CLL01.j<-M.cells.CLL01[j]
  
  prop.u.CLL02.j<-prop.u.CLL02[j]
  prop.m.CLL02.j<-prop.m.CLL02[j]
  U.cells.CLL02.j<-U.cells.CLL02[j]
  M.cells.CLL02.j<-M.cells.CLL02[j]
  
  prop.u.CLL03.j<-prop.u.CLL03[j]
  prop.m.CLL03.j<-prop.m.CLL03[j]
  U.cells.CLL03.j<-U.cells.CLL03[j]
  M.cells.CLL03.j<-M.cells.CLL03[j]
  
  prop.u.CLL04.j<-prop.u.CLL04[j]
  prop.m.CLL04.j<-prop.m.CLL04[j]
  U.cells.CLL04.j<-U.cells.CLL04[j]
  M.cells.CLL04.j<-M.cells.CLL04[j]
  
  prop.u.CLL05.j<-prop.u.CLL05[j]
  prop.m.CLL05.j<-prop.m.CLL05[j]
  U.cells.CLL05.j<-U.cells.CLL05[j]
  M.cells.CLL05.j<-M.cells.CLL05[j]
  
  prop.u.CLL06.j<-prop.u.CLL06[j]
  prop.m.CLL06.j<-prop.m.CLL06[j]
  U.cells.CLL06.j<-U.cells.CLL06[j]
  M.cells.CLL06.j<-M.cells.CLL06[j]
  
  # Initializing the probabilities.
  probs=as.matrix(c(1/2,1/2))
  
  ### This part does the optimization.
  testit2=optimize(f=testfunc2,lower=0,upper=1)
  
  p.asm.matrix[j,1]<-testit2$minimum # Save the parameter estimate.
  l.asm.matrix[j,1]<-testit2$objective # Save the likelihood.
}

p.asm.matrix[91,1]
l.asm.matrix[91,1]

p.asm.global=p.asm.matrix
l.asm.global=l.asm.matrix

save(list=c("p.asm.global","l.asm.global"),
     file=paste0("C:/Users/User/Dropbox/projects/scrrbs/data/sample_matrices/likelihood_global_v2.rda"))


