# IPYTHON STARTUP FILE
#     provides standard imports and sandbox items
# INSTALL
#     stow in `~/.ipython/profile_default/startup/`, e.g.:
#     cd ~/.ipython/profile_default/startup
#     ln -s ~/.dotfiles/ipython/ipystart.py



import numpy as np
import pandas as pd
import os
if 'DISPLAY' not in os.environ:
    #Compatiblity mode for plotting on non-X11 server
    import matplotlib
    matplotlib.use('Agg')
elif 'pfe' in os.environ['DISPLAY']:
    #for some reason, pfe sets display but hangs up, so treat as no X11
    import matplotlib
    matplotlib.use('Agg')
import matplotlib.pyplot as plt



def dfread(fname, **kwargs):
    """ alias for pd.read_csv, with my standard delimiter)
    """
    return pd.read_csv(fname, sep=' ', **kwargs)

#functions for quick plotting

def plotdfs(dfs, x, y):
    """ Plot y vs x for all dataframees in the dict dfs, label with dict keys
    """

    for k in dfs.keys():
        plt.plot(dfs[k][x], dfs[k][y], label=k)
    plt.xlabel(x)
    plt.ylabel(y)
    plt.legend()
    plt.show()




#make a sandbox dataframe
df = pd.DataFrame({'a' : [1,2,3,4,5], 'b' : [10,20,30,40,50]})



print("\nlhalstro' custom ipython functions available:\n" \
      "    - plotdfs(dfs,x,y)\n" \
      "    - dfread(fname)\n" \
      "    - df = pd.DataFrame({'a' : [1,2,3,4,5], 'b' : [10,20,30,40,50]})\n" \
)
