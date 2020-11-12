# IPYTHON STARTUP FILE
#     provides standard imports and sandbox items
# INSTALL
#     stow in `~/.ipython/profile_default/startup/`, e.g.:
#     cd ~/.ipython/profile_default/startup
#     ln -s ~/.dotfiles/ipython/ipystart.py



import numpy as np
import pandas as pd
import matplotlib.pyplot as plt



#functions for quick plotting

def plotdfs(dfs, x, y):
    """ Plot y vs x for all dataframees in the dict dfs, label with dict keys
    """

    for k in dfs.keys():
        plt.plot(dfs[k][x], dfs[k][y], label=k)
    plt.legend()
    plt.show()




#make a sandbox dataframe
df = pd.DataFrame({'a' : [1,2,3,4,5], 'b' : [10,20,30,40,50]})
