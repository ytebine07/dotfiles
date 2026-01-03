# dotfiles
ターミナルを使いやすくするdotfilesの設定たち。  
[chezmoi](https://www.chezmoi.io/)を使って管理しています。

# セットアップ方法

## chezmoiインストール
### 🍎 Mac
PATH通すの省略できるので `brew` でインストールするのが良さそう。

```
$ brew install chezmoi
```
### 🪟 Windows
TBU

### 資料
- https://www.chezmoi.io/install/#one-line-package-install

## 本リポジトリのclone
```
$ chezmoi init git@github.com:ytebine07/dotfiles.git
```

## Oh My Zsh インストール
```
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## powerlevel10k インストール
```
$ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
```
- 資料 : https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#oh-my-zsh

## dotfileの反映
```
$ chezmoi apply
```

## Macに必要なディレクトリ作成

最近のMacには `/usr/local/bin` が無いようなので作成する

```
$ sudo mkdir /usr/local/bin
```

