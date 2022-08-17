# Auth   : Freeman
# Email  : flo@radford.edu
# DESC   : Silent Installer for MAC_OSX python installer
#        : for version 3.9.12
# Date   : 2022.08.16
################################

################################
# Change Directory
cd $HOME/Downloads
################################

################################
# Download this file for MAC_OSX
curl -C - -O https://www.python.org/ftp/python/3.9.12/python-3.9.12-macos11.pkg 
################################

###############################
# install Python Software
echo "Enter in your normal login password, when prompted !"
sudo installer -verboseR -pkg python-3.9.12-macos11.pkg -target /Applications
###############################

###############################
# Install Certificates
/Applications/Python\ 3.9/Install\ Certificates.command
###############################

##############################
# Update pip
/Library/Frameworks/Python.framework/Versions/3.9/bin/python3 -m pip install --upgrade pip
##############################

#***NOTE***#
##############################
# Python3 and pip3 are both installed in the /Library/Frameworks/Python.framework location and not in /usr/bin
# probably not going to create an alias, since it might over write the native MacOS pythonv2.7 software which can be a bad thing. 
##############################

#############################
# Download custom .bashrc file from Repo
cd $HOME
#curl -C - -O https://raw.githubusercontent.com/freemanbach/Python/master/python3/installscript/.profile
#curl -C - -O https://raw.githubusercontent.com/freemanbach/Python/master/python3/installscript/.bashrc
############################

#############################
# install Finance Packages
#############################
/Library/Frameworks/Python.framework/Versions/3.9/bin/python3 -m pip install --user wheel 
#/Library/Frameworks/Python.framework/Versions/3.9/bin/python3 -m pip install --user scrapy
#/Library/Frameworks/Python.framework/Versions/3.9/bin/python3 -m pip install --user pandas_datareader requests ta scipy numpy plotly
#/Library/Frameworks/Python.framework/Versions/3.9/bin/python3 -m pip install --user pandas matplotlib seaborn statsmodels QuantLib pyfinlab
#/Library/Frameworks/Python.framework/Versions/3.9/bin/python3 -m pip install --user yfinance PyAlgoTrade yahoo_fin 
#/Library/Frameworks/Python.framework/Versions/3.9/bin/python3 -m pip install --user Statistics-pyt backtrader scikit-learn pyfin
#/Library/Frameworks/Python.framework/Versions/3.9/bin/python3 -m pip install --user arrow prettypandas beautifier tabulate
#/Library/Frameworks/Python.framework/Versions/3.9/bin/python3 -m pip install --user keras BeautifulSoup4 pybrain
#/Library/Frameworks/Python.framework/Versions/3.9/bin/python3 -m pip install --user pydot pygal rasa
#
##############################
# Cant get some of these installed without XCode
# python3 -m pip install --user SOFTWARE
# /usr/local/bin/pip3 install --user pymc3 scikit-learn yfinance statsmodels zipline pyfolio
# /usr/local/bin/pip3 install --user pyfin vollib quantpy ffn tia pynance mplfinance plotly yahoo_fin 
# /usr/local/bin/pip3 install --user vaderSentiment xlsxwriter xlrd openpyxl
# /usr/local/bin/pip3 install --user quandl tqdm
##############################

#############################
# Creating directories
#############################
#mkdir -p ~/finc3114/{labs,hws}
#mkdir -p ~/itec109/{labs,hws}

rm -f $HOME/Downloads/python-3.9.12-macos11.pkg
echo "DONE."
