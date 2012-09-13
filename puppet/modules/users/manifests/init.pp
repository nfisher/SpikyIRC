class users {
  user { 'deployer':
    ensure     => present,
    managehome => true,
    groups     => 'wheel',
  }

  ssh_authorized_key { 'deployer_key':
    ensure  => present,
    key     => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDHB/a1L7iEH/SMUBukLpUpCQgZboOEvc+0RHMQZ0JMC4iaxzwoAbbDRUvv2T39NRXaojk3cgAQ9D9piN91jU9qwgVTTRs4smHs/A1yxvlsZVL879Q6pTBQpXFYMCEL9rSVQtHK27mEVht5SOoephKoTgA2icOqtbNFdWyb27v/CEE/k9sKI4igJsIbLzhjN9TYQf8LW8d9DvCuNbgXSYUK6iK/7w6hmAlHMXhCSs2LsvkjEqLSgCgUo0FRnUX76dGBpoDNKe6jryPKMlGZN5A73yOF1mpTSw33KJRXi99Uq1jQiQRfIgwHd5YSaX/Q+4xpdBaoAyh5+A45fQBGmT63',
    type    => 'rsa',
    user    => 'deployer',
    require => User['deployer'],
  }

  ssh_authorized_key { 'deployer_key2':
    ensure  => present,
    key     => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC5U2M4XmaFit2AMOtrP01im9mkmizrl7heUq8KXXN+BFYLj8GMKTQSWpfb8uB7enh8KKuqhZLQ4FXAxY+j11UTDWmSAS/TMrj30YT6ZpKvKKO8S+ossqxoYaACiS2oTVVOtwkcoaP+S3uRjmH4crIOhuYiGbzGt0XLyDv9aH2J8bVWqcWw31P5NjzTAKWNhNfxFOVdRUissUPTxndgzow2KXJ51c50zWMM97rufseznqvTOFMrcHag7QEcxe1LCKw/5RkUD8exAn336Hpcq57ipJvVb5jU6Yz21QIGuQgsJ6c07BASGGnDqQljO4NCVdR/ftszvQ56s8gUPqe/bkUx',
    type    => 'rsa',
    user    => 'deployer',
    require => User['deployer'],
  }

  users::irc {
    'nfisher': fullname => 'Nathan Fisher', key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC5U2M4XmaFit2AMOtrP01im9mkmizrl7heUq8KXXN+BFYLj8GMKTQSWpfb8uB7enh8KKuqhZLQ4FXAxY+j11UTDWmSAS/TMrj30YT6ZpKvKKO8S+ossqxoYaACiS2oTVVOtwkcoaP+S3uRjmH4crIOhuYiGbzGt0XLyDv9aH2J8bVWqcWw31P5NjzTAKWNhNfxFOVdRUissUPTxndgzow2KXJ51c50zWMM97rufseznqvTOFMrcHag7QEcxe1LCKw/5RkUD8exAn336Hpcq57ipJvVb5jU6Yz21QIGuQgsJ6c07BASGGnDqQljO4NCVdR/ftszvQ56s8gUPqe/bkUx';

    'dlewis': fullname => 'Deepak Lewis', key => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAo63DoaAWYBwyVemxdmnyjLAod9FjgL6lzRm5rCjlGBVZRYL3qxXzqZTK9dCxh8QKzjRJdKlG8HJs7cazHwV9aGVF3DyNCQVvJzD1seMlmNjEWkA0o2fHUIB9VSo5p0eD2WssUwN+Fw9jnC299C0aAS0AfqYUVxXIsiVgemoQVqy2p5yiKLomwDN80SWwMgAFvl1PNmDbv9NCB1mCfbsyUZ3bN4zStuUXZ/JT+dZxywbX5O212TWIouBJeiXIPn5kPO0eCW4nFvlrlP2RerFNLDiOuqRVpbWSZ5D5MS1wjXmstzgoOOBvUCUgwnXrNG7CpELFOLCJtxl2Dmlwomh/1Q==';

    'nferrier': fullname => 'Nic Ferrier', key => 'AAAAB3NzaC1kc3MAAACBANuM1SkfYrzGXYyg8bIqGvGMr6otpJQ3UEq6LdZDr0lQDLjV6YaAA+s2E/Vks9fCTwBzJ1y6wzEh5dVR2XCaxtMHcJTdBFBZNVnEUjx1mkuxaQb3LBWBlXrA/8ZfSC/eLaqwv7hVSbsZTm7AsO+fcp1O07YesnTOHer1EpmM4vuNAAAAFQD3s+lUUQzd8OMPyxM1b+xplGpMfwAAAIA5y/RpW5+xb3nsQha6YiJ8HSws7Vl92KV/oR0RUWwty4UgRhFr/6gQIZKX38Vp4JRbzflvFfCpA+7Bsupgsdd1GWI5NY199c8MnbXhKmnaKQHX2PSaEUdp5mePqYF7vj3lq1u3Ouuq8x+k9gn1PzzKK43nzn8JOtRMN0vpImmoCwAAAIEAlmKKcQNchCwDKvN/mUHaXplvm0vmv/Fkk4ZD0aIvii+wzRSSOFyuJ/oUVN98kXf2W9kgQDir6wnAhuU8PSZwKKyDwv3r0JVWm1XZkbUvoGYCXYEzufWy/D4thO2H0SUuoZ9RGdtSiEFyTSZH4bzUq2tGVibZuCPquDPl5AzRVIE=', type => 'ssh-dss';

    'ppotter': fullname => 'Philip Potter', key  => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAxPK5a2PwUij5Z+/dYKU5oIBVugDOY2QwuXiXsvo8xMoE9AMWYnLmDTgGVZ7VBqtXXuOhvRl7jm38xsFSaB7R0Z6ej48tmemnRKPIN4m7ahUua3Gdlr24/5dXB9QUg50JZsekF/drQivjfRhSTNFOnBhdcfkYy7Zi+tShRHJ/TWpMjFkZ+EBiW6GPYZqyBTOXV6HdPWOePxJkBRpEHcWxoQ+3uBLO1uCOxNAX10d+maFZ0Ql8zEvdAZJqMprC7LCBKKZBp5pw8mgSAIAHsPljnZ+dvabY4+WBd0qOvk4iSkjWad96LcPw8EyvhcL0+PK4gGLD1jb30y7kwxCc7EzggQ==';

    'ihassin': fullname => 'Itamar Hassin', key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCgcAeBoU9JsOoysDmP7h2PvED6r9jc1bO4QkzWmI3BhNEs4hNsmuGTOonk5gzgVQGAxQh9GDJyhO0HL2PVqIWsfvS8seqbs6b2pio2O874Jfs+4DQaqzCtA9ca+bnb9NgA80tBDMhrNT3iNVtAsWNyhqdglr6tXZb5S/10FZTYlJb7tWBIAFRnpAOW2Gk3q6B55x84RoklZJXxfdoG0ZfhMAux9DsrtevZfQPcbBys0yLcuIODZJaMUfaqn6qBisZfj3FPSfKFyFiF6wR2VroWDhFBIs5NIx9b8lPH8Up5ldqK7hhFM+mOKLetbfyLOo3+3NHoMxIIb7Frtn0uZBsz';

    'mryall': fullname => 'Mark Ryall', key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC7nrBRrLteSHFD1WVKjBDBv2OvpCk+/go/TERzHViiPS7UUQlGwlw1NRo1qRB0EDJzzvZP+mo1OuEdxmMRLbCibeEYceLpHyElS+Eap+QJAHhBVcB0tJe0dI/09jCPo9NepQ/sOlvXSmgchwvXx2qkEp6KmJ+Si8Z2sbCC47V6LV+UljCy4xP5rfYip1kmw+n0rQK66w6vBtDP6Uth3meYockdOhu2ZrG6xn03eXFkKIv598+2ZgmCAuH8jsCOzVzYWZxnpRr2GvtuWnU6wtCYsMPTQ3JljBhJcFyvol5P8jn+ZtbvToz/Kw1QhgMAEyFYw15QUdm1Zxq868gVK3o1';

    'jsmith': fullname => 'Jennifer Smith', key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC7ycJbZjZrHlmB7Ii1ir2R/cU4bjLKYB2aOWAhjCgiUz/RviRnlTFwRtOk6RQ5Io5r4X1s2TvtwxC1jSwxONrQ1mD4yZjBjT/HmwDLsRDH2P7oyx4yhhcu8Ih4eGMIq81wL65DDZNwM5/jDY/5ge0d3BeUebA8hz6Dhy6pLg1cjOH+fbMu9BH73H7FDJaBTFJBvOalkPTJwv4SnnN9HfauonNkK2rb1ODG5P02azVTXEwOd3dgg2NkZU3AyKHUwfAAQgpUMsTIdP5Kbxy2C1amRwQu/rlYpP1SkCgt3ZvET7+iA5Rl5EyNJghqKa1Ymb8gjYr5wm8B2QAY1+cr87xP';

    'jgray': fullname => 'James Gray', key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDEk/vSOfP/WS96ncFIvgrmzqr9SJeDR9k9LwrqcS/xcuyQl3l9GmqTAI3Cyz1z58qZRKfigE+cUjX33Kun6Ms8D4f1ubi+sT9kqI64QCHCpKRgwaDe4ocC30khxGvmF0Kn0gaqf/AoUTmXSeDpqV9/Id2FXGfnyoMnoKI/kS92heAJJWAJkvlYb3rcFlVBZey4rVzWDcsD8QjXsP4N/cbDoPxAzXhLcU9VWBHhQyBj3yCdqMs7OXnu7di4ZDzJugnOaV5dRHFLtP0uUxSBvoRoSO5dG9B6WM+xr2igJZvIYEiINTtwV+Va6aCe0fBww1ExnbsK00n/O4BOATjMIPrb';

    'sdqali': fullname => 'Sadique Ali', key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDZt5eGKHPSWrLNqTd+DqoZAF2HHDL++jzhuP3xgHmGXtsC+zT60dqF1ojBVGBnB7NxKWowwluC1KkRWpt7zBsEiZACpuNSzbIH5UXGOR0bPR0sSULf8WdokhIwUDrgdGh/daZo5FiXxbgYaadlhpBw7SdZVbYywyzMtxlE0shXxnzMoLyodHNAK/vN8BN7ITIcNF0hfJJx/C4N2+muBiGc4pBdSiiSjsZZyIycmT+KwqqpCdS5ZVIUTdfPyVVgr+Qpt8SbPbic7JXgQ0Oh6Vx6bY3xNCvh5+em0lvTZ3P5o1W37H/NjbHTH2qL7/MSecFiVsvxivzQpUE2nbd/GLgB';

    'jbrechtel': fullname => 'James Brechtel', key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCh10B3Vu0DU3+7Rf7yWkvRUEtqSQGZ+CedT4vbrL9/1pe7k2rIdEh4RRHEGIyHEz9f1csHYrVVhJnce3vXB5yyvB6FKD1wHnLvwp9Rc6PKilirofEpORTwjnPVgC1aUrI2rNJHhqUbuJ7wTfyjOGxGPYQ78nVopLmPq0fYSZD4fgKyn0uzic5Io1H65yqYyKA/O6/EfxVmEP7HmBt7/G9GzY+KEI8I2ze+4N9UXwd1E+PjWg2tXPKT6nmUBfeLsrCprETOnCWD2il8r3+YHvNH+EQZmVpdp8HIhO8T1AVRy7Bw7e7wU68lrWHkSASVvWO7ScA3pyRf8OI4LHsdP3Cr';

    'diptanuc': fullname => 'Diptanu Gon Chaudhury', key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCyip0nDLs8IOhByLl3CgEO6wGB+zGaqULVW2K36DNrHtFb/G82fKTegtTEDjeezx33JP03rw+2mFgqQTZOmZyOep4WG52Aj4rlYBzDPAYdiA0xWYi35PY80QI2ETn/SxVe4mWMKEN3J6IUut979XO2h5Lo6xOeh69pTMwwQezwKeEqY1YI6cEd25OcGdDDY6OZNH83+IZ83oKkTcPgE1wzFiMssbuEzt4uJjrA3r/eNRCcZPT0GVQW7p8stYBkL039LTrsJk7jgkuXhtiRRif3yNJHkGJ9KOavpvmNgSPZqtyt6QlwmJD1snRbTJvhTIfPe7tDYTpqKngT9ZIPfjYl';

    'srobinson': fullname => 'Scott Robinson', key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCsfrqyDxMLs+LU+55NQlGEPsucDRe0phRS31Dc9cbIB80ptxuoKFKO8NtmHCsb3V9juVZrHFe+I9p+4B2YiERqpUe8diyzL05L+dhfvVJm2t5QM7Qp6cyQv+fnUmCc0B8Q2G8Vs5+it72s/DyymiGNnzkpKk03zzCxH8yMe7cqacm6dqmZZrdp5JUnYLOXOEK8Bse4kxBWne6XE3JuWP4IxN97XvehLfxvHvldu9GUjWKbZeMns2jn0J9ST78AzwDhUiUFXV2nr02GBof9A0dMA0PXnVKKzy+rYJ9GL1mb8a6rZ+rFn6K//sPGINcoPNQ3qtqLKRUfLHy5ZSyCeVpj';

    'benbc': fullname => 'Ben Butler-Cole', key => 'AAAAB3NzaC1yc2EAAAABIwAAAQEA1Ta5Gpqtrs5qDYfH1aN2qRJoIwGc4gzJkeomI7dCug7nM8mpGvGCOmtZ3ZPPZbMMRARx4O7TH7RaeVTqUA1lkSI8vH2flZSCmjl50liGfRVlzqrfhFtH16Vj+j++SH7iHyBEx1VF7tUc+NM9ETJnFPaOpko3DFRvxsAsF3nyVVQuJLFAnKgElA2wkeulD3LErE+SpaS/tDOfgXttnwHdC4JdGrDzijIw7ojYsM623YQ39XEmYUFVCLF+sv7DEWH6Z/8LxFkJ23JDS/Fo4q7BMhRk84bHMUC99yAVjp1HjpvK8j4xQsWCcrdYCbisiGGuVdIWsETLYGFLO8Nr+t39Bw==';

    'pgm': fullname => 'Peter Gillard-Moss', key => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAqybTrrVOq9OT1KVLk1Fz+gyZF/CXeolyAMx+JL+OGOI8tRMhftQR0LjP4d3UBy/VJqqYsRX1gFTL8DqyfC4H9utpgzA/ji66jpbcp6PC/PtNVJn2FPQT8gpX44nx2kyHDmTk+ChyQ0hIsQAEVsa4vqWm6R3jmwXXeLS5iO19rfE2pLchxlRI9MFwyayutJR3CPFeVnkGh1GcoZ9/sdq5fRWSJops2lDzmC+JMIdGE0HRqsvsII/kLN0WzGyOqDqO+ek+Wcj811kCKzwSXtW8qNQDVErdC4zReYyuiT381nViz6SvmDvuYwagGbvTQqJ9v/GzkBeWtKHilM8P9/zLKw==';

    'korny': fullname => 'Korny Sietsma', key => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAzKmNl42+3Sa39q4kYodfv4Neiu78dWSFdRGF1EcD8HXr441c0YfcH+w1E2O6LI/7xd4n9cd4D9YdPZVdbG60p+289ngWs8aaHplhAfP3J5BZj1VYi3pASdMPPZa085zIxkp45Sj5kaUg6mKlW5fkPabHWvrCHm5qcsy92el1E605H0xaN7UHVh7ul/wEoCCW6UehjK7d8DsbRN2XneiHYnP7IYSIEINZU69Y+Wd5w6kM45X+ghv1EDZy7suQerJ04g4czbV9/e45FN19WnjDgjazi0QOaCwhP+RlYTZqondLnCRRemBSULuGM7nJKG4+5TWaEd1sHIy2hSC6+e7eTQ';

    'tcowling': fullname => 'Tom Cowling', key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQD90tyonLAnLlkMhlyKnDGmAx6tBWVLwsw2K2cE7XDT/EvuRaPqlHDcwCPJ1hlhHF87e+y6QT6a+tH/RU6yxVKtNP+MGof6wiYjYLYZpgNo8usYc3fJwmuEel/xBfZAs6a/AHko9kTHG2r8ea64dYWSqWlFiHPgTrAtCt56GAxz2HerSjIFmb8UoODkx1F9bz3Axo7MIdEKeTqKOPxrYBkH7xQZ7VsJsQgYPbHHRV8IuxNC9+4vXMptTaK5OoZWX6ynherN3Ymr6j7Kt+fMJKWrVEJpd2A7qqgkUNJOKwESh/XIKFU3Eq6FshfThMhpc19Nu33f4WsaqSrOm9aq5rmN';

    'jimg': fullname => 'Jim Gumbley', key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDBu62PcK1x0xdlp/4/8eDB5BmF3+rs4u1npWabRmJVTZGJUpoD/htUcTDiIWDWGgxDjOVAdv3SMDOuW0ZXTVFdmjavGvPoPXgScqF/FUJZ815KG/ol/KlTscVeOKFvOB4o6I3BNqkZxGq1Fv2ikBdvRJVs/lOkmHchN1Dq/ddjthdqk2px2FG6IN87Ln65X30/ROLhzse9UBZc5Oe+HNVznGbX42idptlvK3sq2qohu5bG23SHyaCtzruS4lX3ddHTlV/nxSwFmxs5Gbe7iz5e95i19N1CX9D17oWKOxkZBD+bUr31zmoAiazlPPxKAa7kLS7J7mUYmF6jaz9sK40p';

    'kief': fullname => 'Kief Morris', key => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAwaOjAEESTdtZzrircWLPKTZ3Crt0nhcak78ajV8b2etCaX1B305EZsqO9pi0r1QfeDufqaxLoEyytxoPf3OCkGgspK1G2JBBaNpvQzK2Jwn+OhddB/PiAzk+4ZITnSpANyoJymmHe6F9hbQzKBnjGl3Z8IqIDaqQcrkWSoma86bcuTQ55yCIuUtdDHD5B1E5TDX1FjYVwF/aSosaCzLs2mGNUFlf3UeSNDC44VS9uQaUqWRSoAzbc4WMLChrxByn3bP9g/QtX5Fw8OrXNOLJeG4f1DTmIfj20/UUcXjyaPjtNbpIaJx2jEh1awoV0Rh4v/JRcgZOPGkv8U16fyZIEw==';

    'gga': fullname => 'Giles Alexander', key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCykokcyuJ5dW3Ne4Xs0FJxNRZ4RoYePKswgIYgy8rca6ukbmODH4uP9/PKElBArZkhlVYxwKy39JfcycLnTfbRByNyuP61Tx3Df2NS7FgD0VG9eKoVCQFEoHY/hxYMriFpRaZlJJZBBo2Lzkyn5LSr68oiB8EAuw9QCwejWPk71aMfIceEjNg9xRt2x6pqOi+xRUzWTw82a4o0gK7Cuq04W+VONqHWT7LDQSWSqYP86QSdkJ6EZOJwCgclKYRaolzfxYZRv1bfDd80vKvYOuZpLl1zlbOCcqp7SEIqZovIObZirA7NwcLMURu/oInrxTNsS9jPOnH9E5uTa1OitGZP';

    'chilton': fullname => 'Chris Hilton', key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC0ridBAPshP6tvKALCgyZO6CfkQDQVSPZJuuofGzMvTCTKg+jMgwPiGDfyyNrCCW4elV4ipnXK/uKgzXEnZjA6FP1duc6iJBOsK1gJ27pXQd5eyKqJAk7vmzev75EmuOLhUcHNQyiBk2gzWNljT3HMR7NRBnmZ2h95ag8pEgNjGTVUsVBFU8Ga9sZLyV/9pJL5Tn8q5MDguiOP+e7xjzdEuTdqU9U5FjxLZggTuYVZbzoqTg/NJFZ+MQJHQqxU6bl4WAOpjGmoj/tzJxjDWiTlskAyDg73UtmL1G9svMTnexStrrUoeTfvYEKeGNtrJfokxFGWybVHJGalcmuQDT2z';
  }
}
