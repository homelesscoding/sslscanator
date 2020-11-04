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


## Automate and organize the sslscan output

Example of use: `./sslscanator.sh target-list`

The tool will create a file call "'target-list'-report" with the targets organized by vulnerabilities

## Dependencies

The tool needs [sslscan](https://github.com/rbsec/sslscan) to work

### Notice:

The tool will create temporary files for each target in the execution directory that will be removed after scanning ends

### Licensing:

SSLscanator is licensed under the GNU General Public License version 3 (GNU GPL v3).
