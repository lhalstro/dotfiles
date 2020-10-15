# IPYTHON STARTUP FILE
#     provides standard imports and sandbox items
# INSTALL
#     stow in `~/.ipython/profile_default/startup/`, e.g.:
#     cd ~/.ipython/profile_default/startup/ipystart.py
#     ln -s ~/.dotfiles/ipython/ipystart.py



import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

#make a sandbox dataframe
df = pd.DataFrame({'a' : [1,2,3,4,5], 'b' : [10,20,30,40,50]})
