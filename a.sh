# File Name: a.sh
# Author: hanhj
# mail: hanhj@zx-jy.com
# Created Time: 2019-07-17 18:31:50 week:3
#!/bin/bash
#ls -lh --time-style=+%Y-%m-%d
#sed  -e 's/[^ ]\+ [^ ]\+ [^ ]\+ [^ ]\+ [^ ]\+\(\[^ ]\+\)\(\[^0-9]\+\)\([0-9-]\+\)\(.*\)/\2\3  \1/' a
sed  -e 's/^[^ ]\+ 1 hanhj hanhj \+[0-9.KM]\+ \+\([0-9-]\+\) \+\([^0-9]\+\)\([0-9]\+-[0-9]\+-[0-9]\+\)\.\([^0-9]\+\)/\2\3.\4  \3/' a
