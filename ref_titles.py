import titlecase
import re

with open('references.bib', 'r') as f:
    with open('refs_title.bib', 'w') as fw:
        for line in f:
            if 'title =' in line:
                m = re.match( '(?:\s+title\s+[=]\s+[{])(.*)(?:[}][,].*?)', line )
                if m:
                    line = line.replace( m.group(1), titlecase.titlecase( m.group(1) ) )
            fw.write( line )
