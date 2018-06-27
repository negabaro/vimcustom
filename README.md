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


#단축키


Ctrl + P -> 무적의 파일검색

Ctrl + e -> nerdtree로 디렉토리 구조표시

트리구조로 표시된 파일명에서 m 을 누르면 파일/디렉토리  추가,리네임,삭제가 가능



