#!/bin/bash

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)

## Always update the Amass version manually ##
AMASS_VERSION=3.12.3


echo "${RED} ######################################################### ${RESET}"
echo "${RED} #                 TOOLS FOR BUG BOUNTY                  # ${RESET}"
echo "${RED} ######################################################### ${RESET}"
logo(){
echo "${BLUE}
                ___ ___ _  _ _____     
               | _ ) _ ) || |_   _|
               | _ \ _ \ __ | | |
               |___/___/_||_| |_|${RESET}"
}
logo
echo ""
echo "${GREEN} Tools created by the best people in the InfoSec Community ${RESET}"
echo "${GREEN}                   Thanks to everyone!                     ${RESET}"
echo ""


echo "${GREEN} [+] Updating and installing dependencies ${RESET}"
echo ""

sudo apt-get -y update
sudo apt-get -y upgrade

sudo add-apt-repository -y ppa:apt-fast/stable < /dev/null
sudo echo debconf apt-fast/maxdownloads string 16 | debconf-set-selections
sudo echo debconf apt-fast/dlflag boolean true | debconf-set-selections
sudo echo debconf apt-fast/aptmanager string apt-get | debconf-set-selections
sudo apt install -y apt-fast

sudo apt-fast install -y apt-transport-https
sudo apt-fast install -y libcurl4-openssl-dev
sudo apt-fast install -y libssl-dev
sudo apt-fast install -y jq
sudo apt-fast install -y ruby-full
sudo apt-fast install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-fast install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-fast install -y python-setuptools
sudo apt-fast install -y libldns-dev
sudo apt-fast install -y python3-pip
sudo apt-fast install -y python-dnspython
sudo apt-fast install -y git
sudo apt-fast install -y npm
sudo apt-fast install -y nmap phantomjs 
sudo apt-fast install -y gem
sudo apt-fast install -y perl 
sudo apt-fast install -y parallel
pip3 install jsbeautifier
sudo npm install -g gnomon #for timestamp refer to https://github.com/paypal/gnomon
echo ""
echo ""
sar 1 1 >/dev/null

#Setting shell functions/aliases
echo "${GREEN} [+] Setting bash_profile aliases ${RESET}"
#curl https://raw.githubusercontent.com/unethicalnoob/aliases/master/bashprofile > ~/.bash_profile
echo "${BLUE} If it doesn't work, set it manually ${RESET}"
echo ""
echo "${RED} USE YOUR OWN 'bash_profile'${RESET}"
sar 1 1 >/dev/null 

echo "${GREEN} [+] Installing Golang ${RESET}"
if [ ! -f /usr/bin/go ];then
    cd ~
    wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash
	export GOROOT=$HOME/.go
	export PATH=$GOROOT/bin:$PATH
	export GOPATH=$HOME/go
    echo 'export GOROOT=$HOME/.go' >> ~/.bash_profile
	
	echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
	echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile
    source ~/.bash_profile 
else 
    echo "${BLUE} Golang is already installed${RESET}"
fi
    break
echo""
echo "${BLUE} Done Install Golang ${RESET}"
echo ""
echo ""
sar 1 1 >/dev/null


#Installing tools

echo "${RED} #################### ${RESET}"
echo "${RED} # Installing tools # ${RESET}"
echo "${RED} #################### ${RESET}"


echo "${GREEN} #### Basic Tools #### ${RESET}"

#install altdns
echo "${BLUE} installing altdns ${RESET}"
sudo pip3 install py-altdns
cd ~/tools/ && git clone https://github.com/infosec-au/altdns.git
echo "${BLUE} done${RESET}"
echo ""

#install nmap
echo "${BLUE} installing nmap${RESET}"
sudo apt-fast install -y nmap
echo "${BLUE} done${RESET}"
echo ""

#install masscan
echo "${BLUE}Installing Masscan${RESET}"
sudo apt-get --assume-yes install git make gcc
cd ~/tools/ && git clone https://github.com/robertdavidgraham/masscan
cd masscan
make
echo "${BLUE}Done${RESET}"
echo ""
# Installing Gospider 
echo "${BLUE} downloading Gospider${RESET}"
echo "${BLUE} downloading knockpy${RESET}"
go get -u github.com/jaeles-project/gospider
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing knock2${RESET}"
go get -u github.com/harleo/knockknock
echo "${BLUE} done${RESET}"
echo ""

sar 1 1 >/dev/null
echo ""

echo "${GREEN}#### Installing fuzzing tools ####${RESET}"
install gobuster
echo "${BLUE} installing gobuster${RESET}"
go get -u github.com/OJ/gobuster
echo "${BLUE} done${RESET}"
echo ""

#install ffuf
echo "${BLUE} installing ffuf${RESET}"
go get -u github.com/ffuf/ffuf
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing dirsearch${RESET}"
git clone https://github.com/maurosoria/dirsearch.git ~/tools/dirsearch
echo "${BLUE} done${RESET}"
echo ""

sar 1 1 >/dev/null

echo "${GREEN}#### Installing Domain Enum Tools ####${RESET}"

#install aquatone
echo "${BLUE} Installing Aquatone ${RESET}"
##install the chromium for aquatone
git clone https://github.com/scheib/chromium-latest-linux.git && cd chromium-latest-linux && chmod +x update.sh && ./update.sh && cd ../ && rm -rf chromium-latest-linux
cd ~/ && wget -q https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip && unzip aquatone_linux_amd64_1.7.0.zip && sudo mv aquatone /usr/bin/ && rm LICEN* && rm READM*
echo "${BLUE} done ${RESET}"
echo ""

#install subDomainizer
echo "${BLUE} Installing subdomainizer ${RESET}"
git clone https://github.com/nsonaniya2010/SubDomainizer.git ~/tools/SubDomainizer
cd ~/tools/SubDomainizer && chmod +x SubDomainizer.py
sudo pip3 install -r requirements.txt 
echo "${BLUE} done ${RESET}"
echo ""


install massdns
echo "${BLUE} Installing massdns ${RESET}"
git clone https://github.com/blechschmidt/massdns.git ~/tools/massdns
cd ~/tools/massdns
make
echo "${BLUE} done ${RESET}"
echo ""


#install subjack
echo "${BLUE} installing subjack ${RESET}"
go get -u github.com/haccer/subjack
echo "${BLUE} done ${RESET}"
echo ""

echo "${BLUE} installing Sublister ${RESET}"
git clone https://github.com/aboul3la/Sublist3r.git ~/tools/Sublist3r
cd ~/tools/Sublist3r
sudo pip3 install -r requirements.txt
echo "${BLUE} done ${RESET}"
echo ""

echo "${BLUE} installing Subover ${RESET}"
go get -u github.com/Ice3man543/SubOver
echo "${BLUE} done ${RESET}"
echo ""

echo "${BLUE} installing subzy ${RESET}"
go get -u -v github.com/lukasikic/subzy
go install -v github.com/lukasikic/subzy
echo "${BLUE} done ${RESET}"
echo ""

echo "${BLUE} installing spyse ${RESET}"
sudo pip3 install spyse.py
echo "${BLUE} done ${RESET}"
echo ""
sar 1 1 >/dev/null


echo "${GREEN} #### Installing XSS Tools#### ${RESET}"

echo "${BLUE} installing dalfox${RESET}"
git clone https://github.com/hahwul/dalfox ~/tools/dalfox
cd ~/tools/dalfox/ && go build dalfox.go
sudo cp dalfox /usr/bin/
echo "${BLUE} done${RESET}"
echo ""


#Xspear for XSS
echo "${BLUE} installing XSpear${RESET}"
sudo gem install XSpear
sudo gem install colorize
sudo gem install selenium-webdriver
sudo gem install terminal-table
sudo gem install progress_bar
echo "${BLUE} done${RESET}"
echo ""

sar 1 1 >/dev/null



echo "${GREEN} #### Installing Cloud workflow Tools #### ${RESET}"

echo "${BLUE} Instaliing awscli${RESET}"
sudo pip3 install awscli --upgrade --user
echo "${BLUE} Don't forget to set up AWS credentials!${RESET}"
echo "${BLUE} done${RESET}"
echo ""

sar 1 1 >/dev/null




echo "${GREEN}#### Downloading Git tools ####${RESET}"

echo "${BLUE} git-scanner${RESET}"
git clone https://github.com/HightechSec/git-scanner ~/tools/GIT/git-scanner
cd ~/tools/GIT/git-scanner && chmod +x gitscanner.sh
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} gitgraber${RESET}"
git clone https://github.com/hisxo/gitGraber.git ~/tools/GIT/gitGraber
cd ~/tools/GIT/gitGraber && chmod +x gitGraber.py
sudo pip3 install -r requirements.txt
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE}  GitHound${RESET}"
git clone https://github.com/tillson/git-hound.git ~/tools/GIT/git-hound
cd ~/tools/GIT/git-hound
sudo go build main.go && mv main githound
echo "${BLUE} Create a ./config.yml or ~/.githound/config.yml${RESET}"
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} gitsearch${RESET}"
git clone https://github.com/gwen001/github-search.git ~/tools/GIT/github-search
cd ~/tools/GIT/github-search 
sudo pip3 install -r requirements3.txt
echo "${BLUE} done${RESET}"
echo ""
sar 1 1 >/dev/null

echo "${BLUE} installing Sudomy${RESET}"
git clone --recursive https://github.com/screetsec/Sudomy.git ~/tools/Frameworks/Sudomy
cd ~/tools/Frameworks/Sudomy
sudo pip3 install -r requirements.txt
sudo npm i -g wappalyzer wscat
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing findomain${RESET}"
cd ~/tools/Frameworks
wget https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux
sudo chmod +x findomain-linux
sudo cp findomain-linux /usr/bin/findomain
echo "${BLUE} Add your keys in the config file"
echo "${BLUE} done${RESET}"
echo ""
sar 1 1 >/dev/null

echo "${GREEN}#### Other Tools ####${RESET}"

#echo "${BLUE} installing SSRFMap ${RESET}"
#git clone https://github.com/swisskyrepo/SSRFmap ~/tools/SSRFMap
#cd ~/tools/SSRFMap/
#sudo pip3 install -r requirements.txt
#echo "${BLUE} done${RESET}"
#echo ""


#install JSParser
echo "${BLUE} installing JSParser${RESET}"
git clone https://github.com/nahamsec/JSParser.git ~/tools/JSParser
cd ~/tools/JSParser
sudo python3 setup.py install
echo "${BLUE} done${RESET}"
echo ""

#install subjs
echo "${BLUE} installing subjs${RESET}"
go get -u github.com/lc/subjs
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing broken-link-checker${RESET}"
sudo npm install broken-link-checker -g
echo "${BLUE} done${RESET}"
echo ""

#echo "${BLUE} installing hakrawler${RESET}"
#git clone https://github.com/hakluke/hakrawler.git ~/tools/hakrawler
#cd ~/tools/hakrawler
#go build main.go && mv main hakrawler
#sudo mv hakrawler /usr/bin/
#echo "${BLUE} done${RESET}"
#echo ""

## hakrawler not working "-bash: /home/dhanush/tools/hakrawler/hakrawler: No such file or directory"


echo "${BLUE} Paramspider${RESET}"
git clone https://github.com/devanshbatham/ParamSpider ~/tools/ParamSpider
cd ~/tools/ParamSpider
sudo pip3 install -r requirements.txt
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing webtech${RESET}"
sudo pip3 install webtech
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing gau${RESET}"
go get -u github.com/lc/gau
echo "${BLUE} done${RESET}"
echo ""



echo "${BLUE} LinkFinder${RESET}"
git clone https://github.com/GerbenJavado/LinkFinder.git ~/tools/LinkFinder
cd ~/tools/LinkFinder
sudo pip3 install -r requirements.txt
sudo python3 setup.py install
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} SecretFinder${RESET}"
git clone https://github.com/m4ll0k/SecretFinder.git ~/tools/SecretFinder
cd ~/tools/SecretFinder && chmod +x secretfinder
sudo pip3 install -r requirements.txt
echo "${BLUE} done${RESET}"
echo ""
sar 1 1 >/dev/null


echo "${GREEN}#### ProjectDiscovery Pinned Tools ####${RESET}"

echo "${BLUE} installing notify & intercept ${RESET}"
GO111MODULE=on go get -v github.com/projectdiscovery/notify/cmd/notify
GO111MODULE=on go get -v github.com/projectdiscovery/notify/cmd/intercept
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing naabu${RESET}"
echo "${BLUE} installing libpcap-dev${RESET}"
sudo apt install -y libpcap-dev
GO111MODULE=on go get -v github.com/projectdiscovery/naabu/v2/cmd/naabu
echo "${BLUE} done${RESET}"
echo ""


echo "${BLUE} installing dnsprobe${RESET}"
GO111MODULE=on go get -v github.com/projectdiscovery/dnsprobe
echo  "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing nuclei${RESET}"
GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing subfinder${RESET}"
GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing httpx${RESET}"
GO111MODULE=on go get -v github.com/projectdiscovery/httpx/cmd/httpx
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing shuffledns${RESET}"
GO111MODULE=on go get -v github.com/projectdiscovery/shuffledns/cmd/shuffledns
echo "${BLUE} done${RESET}"
echo ""

sar 1 1 >/dev/null


echo "${GREEN} #### Installing tomnomnom tools #### ${RESET}"
echo "${GREEN}   check out his other tools as well  ${RESET}"

echo "${BLUE} installing meg${RESET}"
go get -u github.com/tomnomnom/meg
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing kxss${RESET}"
go get github.com/Emoe/kxss
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing anew${RESET}"
go get -u github.com/tomnomnom/anew
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing assetfinder${RESET}"
go get -u github.com/tomnomnom/assetfinder
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing waybackurls${RESET}"
go get -u github.com/tomnomnom/waybackurls
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing gf${RESET}"
go get -u github.com/tomnomnom/gf
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing httprobe${RESET}"
go get -u github.com/tomnomnom/httprobe
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing concurl${RESET}"
go get -u github.com/tomnomnom/hacks/concurl
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing unfurl${RESET}"
go get -u github.com/tomnomnom/unfurl
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing anti-burl${RESET}"
go get -u github.com/tomnomnom/hacks/anti-burl
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing filter-resolved${RESET}"
go get github.com/tomnomnom/hacks/filter-resolved
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing fff${RESET}"
go get -u github.com/tomnomnom/fff
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing qsreplace${RESET}"
go get -u github.com/tomnomnom/qsreplace
echo "${BLUE} done${RESET}"
echo ""
sar 1 1 >/dev/null

echo "${GREEN} #### Other other Tools #### ${RESET}"


echo "${BLUE} installing Urlprobe${RESET}"
go get -u github.com/1ndianl33t/urlprobe
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing amass${RESET}"
cd ~ && echo -e "Downloading amass version ${AMASS_VERSION} ..." && wget -q https://github.com/OWASP/Amass/releases/download/v${AMASS_VERSION}/amass_linux_amd64.zip && unzip amass_linux_amd64.zip
sudo mv amass_linux_amd64/amass /usr/bin/
cd ~ && rm -rf amass_linux_amd64* amass_linux_amd64.zip*
echo "${BLUE} done${RESET}"
echo ""

sar 1 1 >/dev/null

echo "${BLUE}Installing Github Org Search Tool${RESET}"
cd ~/tools/GIT && git clone https://github.com/pocdork/gitdomain.git
echo "${BLUE}done${RESET}"

echo "${GREEN} #### Downloading wordlists #### ${RESET}"
git clone https://github.com/assetnote/commonspeak2-wordlists ~/tools/Wordlists/commonspeak2-wordlists
git clone https://github.com/fuzzdb-project/fuzzdb ~/tools/Wordlists/fuzzdb
git clone https://github.com/1N3/IntruderPayloads ~/tools/Wordlists/IntruderPayloads
git clone https://github.com/swisskyrepo/PayloadsAllTheThings ~/tools/Wordlists/PayloadsAllTheThings
git clone https://github.com/danielmiessler/SecLists ~/tools/Wordlists/SecLists
cd ~/tools/Wordlists/SecLists/Discovery/DNS/
##THIS FILE BREAKS MASSDNS AND NEEDS TO BE CLEANED
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
printf "${BLUE} Wordlists downloaded ${RESET}"

sar 1 1 >/dev/null

echo "${GREEN} Installing puredns ${RESET}"
GO111MODULE=on go get github.com/d3mondev/puredns/v2
echo "${BLUE}done${RESET}"

echo "${GREEN} Installing dnsvalidator ${RESET}"
cd ~/tools && git clone https://github.com/vortexau/dnsvalidator.git
cd ~/tools/dnsvalidator
sudo python3 setup.py install
echo "${BLUE}done${RESET}"

wget -r https://wordlists-cdn.assetnote.io/data/manual/2m-subdomains.txt -O ~/tools/2m-subdomains.txt

echo "${GREEN} use the command 'source ~/.bash_profile' for the shell functions to work ${RESET}"
echo ""
echo "${GREEN}  ALL THE TOOLS ARE MADE BY THE BEST PEOPLE OF THE INFOSEC COMMUNITY ${RESET}"
echo ""
echo "${GREEN}                YOUR VPS WITH TOOLS SETUP DONE ;)                         ${RESET}"
echo "${RED}Hello there Do some hackin !!!${RESET}"