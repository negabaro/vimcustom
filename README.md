*first step

```
cd ~
git init
git remote add origin https://github.com/negabaro/vimcustom.git
git pull origin master
```

*highway(hw) install

**case of by ubuntu server

```
sudo apt-get install autoconf  automake
sudo apt-get install libgoogle-perftools-dev google-perftools
```


```
git clone https://github.com/tkengo/highway.git
cd highway
./tools/build.sh
```

```
echo $PATH
cp -p hw /usr/local/bin/hw
```
