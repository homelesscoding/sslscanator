```shell              ______
                     <((((((\\\
                     /      . }\
                     ;--..--._|}
  (\                 '--/\--'  )
   \\                | '-'  :'|    "Hasta la vista, SSL"
    \\               . -==- .-|
     \\               \.__.'   \--._
     [\\          __.--|       //  _/'--.
     \ \\       .'-._ ('-----'/ __/      \
      \ \\     /   __>|      | '--.       |
       \ \\   |   \   |     /    /       /
        \ '\ /     \  |     |  _/       /
         \  \       \ |     | /        /
          \  \      \        /
```
# SSLscanator
[![GitHub release](https://img.shields.io/github/v/release/matthernet/sslscanator)](https://github.com/matthernet/sslscanator/releases/)
[![License: GPL v3](https://img.shields.io/github/license/matthernet/SSLscanator)](https://img.shields.io/github/license/matthernet/SSLscanator)

## Automate and organize the sslscan output

The tool will create a file call "'target-list'-report" with the targets organized by vulnerabilities

### Installation:
    git clone https://github.com/matthernet/SSLscanator.git
    cd SSLscanator
    mv sslscanator.sh sslscanator
    chmod +x ./sslscanator
    mv ./sslscanator /usr/bin

### Example of use:
    For a simple domain: $ sslscanator -t target.tld
    For a target list: $ sslscanator -l target-list

### Output example:
    
    ------SSLv3------
    target.tld

    ------TLSv1.0------
    target.tld

    ------SWEET32------
    target.tld

    ------RC4------
    target.tld
 
    ------POODLE------
    target.tld
 
## Dependencies

The tool needs [sslscan](https://github.com/rbsec/sslscan) to work

### Notice:

The tool will create a temporary folder in the execution directory that will be removed after scanning ends

### Licensing:

SSLscanator is licensed under the GNU General Public License version 3 (GNU GPL v3).
