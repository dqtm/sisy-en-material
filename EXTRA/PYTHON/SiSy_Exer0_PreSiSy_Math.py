#!/usr/bin/env python
# coding: utf-8

# # List 0: Pre-SiSy Math Exercises
# 

# In[1]:


import numpy as np
import matplotlib.pyplot as plt

# instructs Jupyter to embed plots within a notebook, and generates interactive plots
get_ipython().run_line_magic('matplotlib', 'notebook')

# The inline option takes less memory with non-interactive plots
#%matplotlib inline


# ## Thema-1 : Functions with fractions

# __(Exercise-1)__ Simplify the compound fraction (“Doppelbruch”) in the expression below:
# 
# $$  f(x) = \frac{1}{1+\frac{1}{1+x}} $$
# 
# 
# __Solution:__       
# $$  f(x) = \frac{1+x}{2+x} $$

# __(Exercise-2)__ Calculate the following limit cases for the function $ f(x) $ from Exercise-1: 
#      
# 
# Write a Python code snipppet generating a plot of 
# $f(x)$   for    $x\in$   $[{ 10^{-3}, 10^{+3} }]$ 
# 
# Use the function logspace to define a vector x. 
# 
# Check the syntax of this function with the help function.

# In[2]:


x = np.logspace(-3,+3,300)

f_x = (1+x) / (2+x);

# create a figure with single set of axes, and specified size(width,height)
fig, ax = plt.subplots(figsize=(6,3))
ax.semilogx(x,f_x)
ax.grid(1)

plt.title("List 0 : Exercise 2")
plt.xlabel("x")
plt.ylabel("f (x)")
# plt.show()     


# ## Thema-2 : Complex Numbers (specially polar notation with Euler’s identity)
# 
# __(Exercise-3)__	Determine the Cartesian notation of the following complex numbers:
# 
# $$ z_1=2\cdot exp (j\frac{\pi}{2})= 2 \cdot e^{+j\frac{\pi}{2}} =+2 \cdot j  $$
#             
# $$  z_2=1 \cdot exp (-j \pi ) = -1   $$
#             
# $$  z_3 = \sqrt{2}  \cdot exp (-j \frac {\pi} {4}  ) = 1-j   $$
#             
#        
# __(Exercise-4)__	Determine the polar notation of the following complex numbers:
#  	Hint: draw them as a vector in a complex plane
#     
# $$  z_4 = 1+ j \cdot 1=   \sqrt{2}  \cdot exp (+j \frac {\pi} {4}  )   $$ 
#             
# $$  z_5 = -1+ j \cdot 1=   \sqrt{2}  \cdot exp (+j \frac {3\pi} {4}  )    $$
#             
# $$  z_6 = -j \cdot 3 =   +3  \cdot exp (-j \frac {\pi} {2}  )    $$
#                   
# 
# Find out the NumPy conversion functions that allow you to verify your results from exercises 3 & 4. 
# 

# In[3]:


# Define conversion functions, as defined in Matlab

def cart2pol(x, y):
    rho = np.sqrt(x**2 + y**2)
    phi = np.arctan2(y, x)
    return(rho, phi)

def pol2cart(rho, phi):
    x = rho * np.cos(phi)
    y = rho * np.sin(phi)
    return(x, y)


# In[4]:


z1 = pol2cart(2,np.pi/2)
z1


# In[5]:


z2 = pol2cart(1,-np.pi)
z2


# In[6]:


z4 = cart2pol(1,1)
z4


# __(Exercise-5)__	Analyse the code snippet in the cell below. Make the necessary changes, such that you generate a plot showing a spiral with four windings (Spiralwicklung). 

# In[9]:


N = 4;              # number of windings
theta= np.arange(0, N*2*np.pi, np.pi/8)        

M = theta.size                                 # equivalent to Matlab >> M = length(theta);

aux = np.arange(0,M)                           # equivalent to Matlab >> aux = 0:1:M-1;

rho = 2*(aux/M)           # increasing radius for spiral

z1 = rho*np.exp(1j*theta)

# Polar is not supporting this syntax, so had to do separated plots
#fig, axs = plt.subplots(1, 2, figsize=(6, 3))
#axs[0].plot(z1.real,z1.imag)
#axs[1].polar(theta,rho)

fig5a, ax5a = plt.subplots(figsize=(3, 3))
ax5a.plot(z1.real,z1.imag)
ax5a.grid(1)
plt.title("List0_SiSy : Exercise 5")
plt.xlabel("real (z1)")
plt.ylabel("imag (z1)")


# In[10]:


# Alternative: plot using command for polar coodinates
# Obs.: polar() command not supported in Matplotlib object-oriented API (?)

fig5b, ax5b = plt.subplots(figsize=(3, 3))

plt.polar(theta,rho)
plt.title("List 0 : Exercise 5 - Alternative")
plt.grid(1)
plt.show()


# __(Exercise-6)__ Determine the polar notation of the following complex numbers:
#             Hint: Please do not use the method of multiplication with the conjugated complex,
#              but rather calculate the polar notation for both numerator and denominator. 
#              
#              
# __Solution:__
# 
# $$  z_7 = \frac{1}{ -j \cdot 3} = 
# \frac{1}{3} \cdot \frac{1}{exp (-j \frac {\pi} {2})}  = 
# \frac{1}{3} \cdot {exp (j \frac {\pi} {2})} =
# j \cdot \frac{1}{3}   $$
# 
# $$  z_8 = \frac{1}{ -1+j} = 
# \frac{1}{\sqrt{2}} \cdot e^{-j \frac{3\pi}{4}}=
# \frac{-1-j}{2}  $$
# 
# $$ z_9 = \frac{-1+j}{ 1+j} = e^{j \frac{\pi}{2}}=j   $$
# 

# __(Exercise-7)__ Given the complex function $ f(x)= 1+j \cdot x $, determine the value of x for which:
#       
# a. $ \vert f(x) \vert = abs \{f(x)\}=\sqrt{2}  $
# 
# b. $ \langle f(x) = phase \{ f(x) \} = +45°  $
#              
# __Solution:__
# 
# a. $ x=1 $
# 
# b. $ x=1 $
# 

# __(Exercise-8)__ What is the value of the magnitude and phase of the complex function $ g(x) = \frac {1} {1+j \cdot x} $, when x=1:
#       
# a. $ \vert g(x) \vert = abs \{g(x)\}= ...  $
# 
# b. $ \langle g(x) = phase \{ g(x) \} = ...  $
#              
# __Solution:__
# 
# a. $ \frac{1}{\sqrt{2}} $
# 
# b. $ \frac{-\pi}{4} $
# 

# ## Thema-3: Trigonometric Functions 
# 
# __(Exercise-9)__	& __(Exercise-10)__    Solution
# Verify your sketch by generating the same plot in Matlab. 

# In[12]:


# PARAMETERS
A = 1.5
f0 = 1e3
phi = np.array([0, np.pi/2, -np.pi/2])

T0 = 1/f0;
tstep = T0/20;
t = np.arange(0,2*T0,tstep)

x1_t = A*np.sin(2*np.pi*f0*t + phi[0]);
x2_t = A*np.sin(2*np.pi*f0*t + phi[1]);
x3_t = A*np.sin(2*np.pi*f0*t + phi[2]);

# PLOTS
fig, ax = plt.subplots(figsize=(8, 4))
ax.plot(t,x1_t,'b',t,x2_t,'r',t,x3_t,'g',)
ax.grid(1)
plt.title("List0_SiSy : Exercise 9 & 10")
plt.xlabel("t  (s)")
plt.ylabel(" x_N(t)")

ax.legend(('x_1 with phi=0','x_2 with phi=+pi/2','x_3 with phi=-pi/2'))


# ## Thema-4 : Function description using the sum-sign
# 
# __(Exercise-11)__  
# __Solution:__
# 
# $$ x(t) = 2 + 
# \frac{1}{2} \cdot cos(2\pi f_0t) +
# \frac{3}{2} \cdot cos(2\pi 3f_0t + \pi)   $$
# 

# __(Exercise-12)__ & __(Exercise-13)__ Try it out the conv operation with the comb-function to get shifted copies of the original y(t) !

# In[13]:


# Define comparison with defined tolerance
import math
def realclose(x, val):
    return( math.isclose(x,val,abs_tol=1e-9))

# PARAMETERS & VECTORS
tstep = 1e-2

t = np.arange(-5,5,tstep)
t_long = np.arange(-10,10,tstep)

y_t = [(1 if np.abs(i)<1 else 0) for i in t]   # declare the generator
#print(y_t)                                    # consume the generator, remove after check

p_t = [(1 if ( realclose(i,-4) or realclose(i,0) or realclose(i,4) ) else 0) for i in t]                                 

yp_t = np.convolve(y_t,p_t)


# PLOTS
fig, axs = plt.subplots(3, 1, figsize=(8, 5))
axs[0].plot(t,y_t,'b') 
axs[1].plot(t,p_t,'g') 
axs[2].plot(t_long[:-1],yp_t,'r')         # exclude last element of t_long to have equal lenghts


axs[0].set_xlim(-10,10) , axs[0].set_ylabel('y(t)')     # adjust xlim to match range of 3rd plot
axs[1].set_xlim(-10,10) , axs[1].set_ylabel('p(t)')     # and add labels
axs[2].set_xlim(-10,10) , axs[2].set_ylabel('conv(y,p)'),  axs[2].set_xlabel('t (s)')              


# ## Thema-5 : Integration and Differentiation of exponential-function
#  
# __(Exercise-14)__ 
# __Solution:__
# 
# a. $  \int e^{at}dt  =  \frac{1}{a} e^{at} + C  $
# 
# b. $  \frac{d(e^{at})}{dt} =  a \cdot e^{at}  $
# 
# c. $   \int _0 ^t      e^{a \lambda} d\lambda = \frac{1}{a} \left[ e^{at} -1 \right] $  
# 

# ## Thema-6 : Graphical solution for Integrals  (as area under the curve)
#  
# __(Exercise-15)__
# __Solution:__  Approximation of an integral with _cumsum*tstep_

# In[14]:


# PARAMETERS
tstep = 1/100
t = np.arange(-0.5,2.5,tstep)

x1_t = [(1 if i>0 else 0) for i in t]   
y1_t = tstep*np.cumsum(x1_t)           # Question: np.cumsum(tstep*x1_t) not possible. why? because not array?

x2_t = [(1 if (i>0 and i<1) else 0) for i in t] 
y2_t = tstep*np.cumsum(x2_t)           

x3_t = np.array(x2_t) - [(1 if (i>1 and i<2) else 0) for i in t]   
y3_t = tstep*np.cumsum(x3_t)           


# PLOTS
fig, axs = plt.subplots(3, 1, figsize=(8, 5))
axs[0].plot(t,x1_t,'b',t,y1_t,'r') , axs[0].grid(1) , axs[0].set_ylim(-1.5,1.5)
axs[1].plot(t,x2_t,'b',t,y2_t,'r') , axs[1].grid(1) , axs[1].set_ylim(-1.5,1.5)
axs[2].plot(t,x3_t,'b',t,y3_t,'r') , axs[2].grid(1) , axs[2].set_ylim(-1.5,1.5)


# ## Thema-7 : Plots in log-log scale
# 
# __(Exercise-16)__	
# __Solution:__ 
# 
# for $   0<x<<1  \Rightarrow f(x) \approx 1   $
# for $   x >> 1  \Rightarrow f(x) \approx \frac{1}{x} $		
# 
# possibly   $  f(x) = \frac{1}{1+x}  $

# In[15]:


# PARAMETERS
x = np.logspace(-3,+3,200);
f_x = 1/(1+x);

# PLOT
fig, ax = plt.subplots(figsize=(6,4))
ax.loglog(x,f_x), ax.grid(1)
ax.set_xlabel('x') , ax.set_ylabel('f (x)')


# ## Thema-8 : Logarithm of basis 10
# __(Exercise-17)__	Determine the value of the following logarithmic expressions:
# __Solution:__
# 
# a.	$ log_{10} (10^n) = n  $	 
# 
# b.	$ log_{10}  \left( {\frac {10^n} {10^p} } \right) = n-p  $	 		  
# 
# c.	$ log_{10} (2^n) = n \cdot (0.3)  $	  given  $ log_{10} (2) \cong  0.3  $	   
# 
# d.	$ 20 \cdot log_{10} (2) \cong  6.0  $	 	 
# 
# e.	$ 20 \cdot log_{10} \left( \frac{1}{2} \right) \cong  -6.0  $	 	 
# 
# Check your results, using the function log10 which calculates the logarithm with basis 10. 

# In[ ]:


n = 5.76
np.log10(10**n)


# In[ ]:




