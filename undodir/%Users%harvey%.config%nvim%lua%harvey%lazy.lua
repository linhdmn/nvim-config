Vim�UnDo� ���;����e@{��ђ�=��An�&g��f s�V          	                           fZ��    _�                             ����                                                                                                                                                                                                                                                                                                                                                             fZ�     �                   �               5��                                                  5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             fZ�"     �                 ~/.config/nvim/5��                                                5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             fZ�"     �                   �               5��                        +                   +       5�_�                       *    ����                                                                                                                                                                                                                                                                                                                                                             fZ�$     �                 +https://www.youtube.com/watch?v=ZWWxwwUsPNw5��                                  ,              5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             fZ�;    �                   �               5��                                           Q      5�_�                    	        ����                                                                                                                                                                                                                                                                                                                               ;          ;       v   ;    fZ�     �                 -vim.opt.rtp:prepend(vim.env.LAZY or lazypath)    �                  5��       -                  P                     5�_�                             ����                                                                                                                                                                                                                                                                                                                               ,          ,       V   ,    fZ��    �                  <local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"       2if not (vim.uv or vim.loop).fs_stat(lazypath) then     -- bootstrap lazy.nvim     -- stylua: ignore   �  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })   end   -vim.opt.rtp:prepend(vim.env.LAZY or lazypath)5��                                  Q      h      5��