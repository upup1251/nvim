Vim�UnDo� ��24f<���\�L��h �i�{�Ts�3r�1�                                     f'j    _�                     
       ����                                                                                                                                                                                                                                                                                                                                                             f&     �   	            )keymap.set('n','<C-up>',':resize +1<cr>')5��    	                     �                      5�_�                    
       ����                                                                                                                                                                                                                                                                                                                                                             f&     �   	            (keymap.set('n','<Cup>',':resize +1<cr>')5��    	                     �                      5�_�                    
       ����                                                                                                                                                                                                                                                                                                                                                             f&     �   	            %keymap.set('n','<>',':resize +1<cr>')5��    	                     �                      5�_�                    
       ����                                                                                                                                                                                                                                                                                                                                                             f&     �   	            $keymap.set('n','>',':resize +1<cr>')5��    	                     �                      5�_�                    
       ����                                                                                                                                                                                                                                                                                                                                                             f&	    �   	            #keymap.set('n','',':resize +1<cr>')5��    	                     �                      5�_�                    
       ����                                                                                                                                                                                                                                                                                                                                                             f&     �                  �                  local keymap = vim.keymap   --设置leader键为space   vim.g.mapleader = " "   keymap.set('i','jk',"<Esc>")   --the buffer , windows and tabs   --next:   $keymap.set('n','<C-n>',":bnext<cr>")   &keymap.set('n','<C-m>',':tabnext<cr>')   --size:   %keymap.set('n','up',':resize +1<cr>')       --增加窗口   %keymap.set('n','<leader>sv',"<C_w>v")   %keymap.set('n','<leader>sh',"<C_w>s")        5��                                  f      q      �                          q                     5�_�                    
       ����                                                                                                                                                                                                                                                                                                                                                             f&     �   
          �   
          5��    
                                    (       5�_�      	                      ����                                                                                                                                                                                                                                                                                                                                                             f&     �             �             5��                          9              (       5�_�                 	           ����                                                                                                                                                                                                                                                                                                                                                             f&     �             �             5��                          a              (       5�_�   	      
                 ����                                                                                                                                                                                                                                                                                                                                                             f'     �   
            'keymap.set('n', 'up', ':resize +1<cr>')5��    
                    0                    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             f'-     �               'keymap.set('n', 'up', ':resize +1<cr>')5��                      	   Q              	       5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             f'8     �               'keymap.set('n', 'up', ':resize +1<cr>')�             5��                         �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             f'9     �               /keymap.set('n', 'up', ':verticalresize +1<cr>')5��                          �                     5�_�                       (    ����                                                                                                                                                                                                                                                                                                                                                             f'=    �               0keymap.set('n', 'up', ':vertical resize +1<cr>')5��       (                 �                    5�_�                       (    ����                                                                                                                                                                                                                                                                                                                                                             f'A     �                  �                  local keymap = vim.keymap   --设置leader键为space   vim.g.mapleader = " "   keymap.set('i', 'jk', "<Esc>")   --the buffer , windows and tabs   --next:   &keymap.set('n', '<C-n>', ":bnext<cr>")   (keymap.set('n', '<C-m>', ':tabnext<cr>')   --size:   'keymap.set('n', 'up', ':resize +1<cr>')   'keymap.set('n', 'up', ':resize -1<cr>')   0keymap.set('n', 'up', ':vertical resize +1<cr>')   0keymap.set('n', 'up', ':vertical resize -1<cr>')       --增加窗口   'keymap.set('n', '<leader>sv', "<C_w>v")   'keymap.set('n', '<leader>sh', "<C_w>s")5��               '                  �      �      �                          �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                               )                 v   (    f'W     �   
            'keymap.set('n', 'up', ':resize -1<cr>')5��    
                     "                     5�_�                           ����                                                                                                                                                                                                                                                                                                                               )                 v   (    f'W     �   
            %keymap.set('n', '', ':resize -1<cr>')5��    
                     "                     5�_�                           ����                                                                                                                                                                                                                                                                                                                               )                 v   (    f'[     �               0keymap.set('n', 'up', ':vertical resize +1<cr>')5��                         L                     5�_�                           ����                                                                                                                                                                                                                                                                                                                               )                 v   (    f'\     �               .keymap.set('n', '', ':vertical resize +1<cr>')5��                         L                     5�_�                           ����                                                                                                                                                                                                                                                                                                                               )                 v   (    f'_     �               2keymap.set('n', 'left', ':vertical resize +1<cr>')5��                         L                     5�_�                           ����                                                                                                                                                                                                                                                                                                                               )                 v   (    f'`     �               .keymap.set('n', '', ':vertical resize +1<cr>')5��                         L                     5�_�                           ����                                                                                                                                                                                                                                                                                                                               )                 v   (    f'c    �               0keymap.set('n', 'up', ':vertical resize -1<cr>')5��                        �                    5�_�                            ����                                                                                                                                                                                                                                                                                                                               )                 v   (    f'i    �                  �                  local keymap = vim.keymap   --设置leader键为space   vim.g.mapleader = " "   keymap.set('i', 'jk', "<Esc>")   --the buffer , windows and tabs   --next:   &keymap.set('n', '<C-n>', ":bnext<cr>")   (keymap.set('n', '<C-m>', ':tabnext<cr>')   --size:   'keymap.set('n', 'up', ':resize +1<cr>')   )keymap.set('n', 'down', ':resize -1<cr>')   3keymap.set('n', 'righe', ':vertical resize +1<cr>')   2keymap.set('n', 'left', ':vertical resize -1<cr>')       --增加窗口   'keymap.set('n', '<leader>sv', "<C_w>v")   'keymap.set('n', '<leader>sh', "<C_w>s")5��               '                              �                                               5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                             f'     �   
            'keymap.set('n', 'up', ':resize +-<cr>')5��    
                     1                    5��