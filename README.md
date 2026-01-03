# dotfiles
ターミナルを使いやすくするdotfilesの設定たち。  
[chezmoi](https://www.chezmoi.io/)を使って管理しています。

# セットアップ方法

## chezmoiインストール
### Mac
PATH通すの省略できるので `brew` でインストールするのが良さそう。

```
$ brew install chezmoi
```
### Windows
TBU

### 資料
- https://www.chezmoi.io/install/#one-line-package-install

## 本リポジトリのclone
```
$ chezmoi init git@github.com:ytebine07/dotfiles.git
```

## Macに必要なディレクトリ作成

最近のMacには `/usr/local/bin` が無いようなので作成する

```
$ sudo mkdir /usr/local/bin
```

