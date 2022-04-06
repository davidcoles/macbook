# macbook recovery scripts

NOTE that this does not backup data, just keys and provides scripts to install brew, etc

# backup

run the ./backup.sh script to backup ssh and gnupg keys to onedrive

# recover

* install xcode (you put a copy of Xcode_13.2.1.xip somewhere handy, right? try ~/onedrive/backup/xcode.txt)
* https://brew.sh/ - /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
* brew install git ansible
* git clone https://github.com/davidcoles/macbook.git && cd mabook && make playbook

;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
    '("melpa" . "https://stable.melpa.org/packages/") ; many packages won't show if using stable
    t))


M-x package-list-packages
Mx-package-install (eg. go-mode,yaml-mode)


(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
(add-hook 'go-mode-hook
	  (lambda ()
	    (add-hook 'before-save-hook 'gofmt-before-save)
	    (setq-default)
	    (setq tab-width 4)
	    (setq standard-indent 4)
	    (setq indent-tabs-mode nil)))
(setq-default c-basic-offset 4)

