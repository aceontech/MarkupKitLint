 #!/bin/sh
find "${SRCROOT}" -type f -iname "*.xml" | xargs -I '{}' xmllint --noout '{}'
