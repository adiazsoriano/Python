
#!/usr/bin/env python
# Author  : freeman
# Date    : 2020.12.20
# Version : 0.0.1
# Desc    : A Program which will build a plot chart for you 
#         : when you supply it with a stock symbol or a
#         : mutual fund symbol
###################################################################


import matplotlib.pyplot as plt
import pandas_datareader as pdr
from datetime import datetime


def getStockChart(tick, startd, endd):
    sd = startd.split('-')
    ed = endd.split('-')
    ticker = pdr.get_data_yahoo(symbols=tick, start=datetime(int(sd[0]),int(sd[1]),int(sd[2])), end=datetime(int(ed[0]),int(ed[1]),int(ed[2])) )
    ticker.Close.plot(label=tick)
    plt.xlabel("date")
    plt.ylabel("price")
    plt.title(tick)
    plt.legend(loc='upper left')
    plt.show()


def main():
    t = input("Enter in a Stock Ticker>> ")
    sd = input("Enter in Start Stock Date: yyyy-mm-dd>> ")
    ed = input("Enter in End   Stock Date: yyyy-mm-dd>> ")
    getStockChart(t, sd, ed)


if __name__ == "__main__":
    main()
