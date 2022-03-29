#!/usr/bin/env python

import os
import sys

import numpy as np
import pandas as pd

#COMPATIBLITY MODE FOR PLOTTING ON NON-X11 SERVER
    #(this must be called at top-level, not from a function)
if 'DISPLAY' not in os.environ or 'pfe' in os.environ['DISPLAY']:
    import matplotlib
    matplotlib.use('Agg')
import matplotlib.pyplot as plt
from mypylib import lplot
colors = lplot.set_palette(lplot.xkcdcolors, colorkind='xkcd')




def main():
    print('hello world')



if __name__ == "__main__":
    main()
