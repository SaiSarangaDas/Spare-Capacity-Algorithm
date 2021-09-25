# Spare-Capacity-Algorithm
The following functions written in MATLAB comprise the algorithm for deciphering the spare capacity of a network to mitigate the effect of targeted attack. The sequence of the input and output arguments for the MATLAB functions given below is the sequence in which the variables are to be initialized. Some of the functions given below are nested within other functions that are a part of this document.

* The `codes` folder contains the main codes used for implementing the spare capacity algorithm.
* The `supp` folder contains Supplementary Table S1, to go with the main manuscript.
* The `data` folder contains the necessary network data files.

## Citation 



## Authors


-   [Sai Saranga Das](https://github.com/SaiSarangaDas)
-   [Karthik Raman](https://github.com/karthikraman)

## Acknowledgments


* Indian Institute of Technology Madras
* [Centre for Integrative Biology and Systems Medicine](https://ibse.iitm.ac.in/)
* [Robert Bosch Centre for Data Science and Artificial Intelligence (RBCDSAI)](https://rbcdsai.iitm.ac.in/)

# Installation

Just clone this repository into your MATLAB toolbox folder (or download the [ZIP](https://github.com/SaiSarangaDas/Spare-Capacity-Algorithm/archive/refs/heads/main.zip) and extract) and add to path.

# Sample Code

```
a=analysescalefree(200,5,5,0.25,2.5); % to generate a network 'a' which is scale free in this case
[c,d,e,y,z,f,g,h]=robustnessvalue(a,10,1,3,inf); % a is a given network for which spare capacity needs to be designed.  

k=sum(g)-1; %Ro value  
l=sum(h)-1; %R value  
m=(l/k)-1; %R/Ro-1  

plot(f,g)  
hold on  
plot(f,h)  
xlabel('q','Fontweight','bold')  
ylabel('S(q)','Fontweight','bold')
```





