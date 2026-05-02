# Questions

```add-summary
tags: #state/why
include: #resource/paper/name/{{citekey|replace(":","-")}}
```

# Notes

Notes::
Mindmap:: 
Skim:: [[02. Knowledge/01. Paper/{{date|format("YY")}}-{{title|replace(":"," - ")|replace("  "," ")}}/Skim_Note-{{citekey|replace(":","-")}}.md|Skim Note]]
Read:: [[02. Knowledge/01. Paper/{{date|format("YY")}}-{{title|replace(":"," - ")|replace("  "," ")}}/Read_Note-{{citekey|replace(":","-")}}.md|Read Note]]
English:: [[02. Knowledge/01. Paper/{{date|format("YY")}}-{{title|replace(":"," - ")|replace("  "," ")}}/English-{{citekey|replace(":","-")}}.md|English Note]]
Start_Reading_Time:: {{dateAdded|format("YYYY-MM-DD")}}

Methods::  

Conclusion::  

Improved:: 

# MetaData

Title:: {{title|replace(":"," - ")|replace("  "," ")}}
Rate:: 
Date:: {{date|format("YYYY-MM")}}
Type:: #resource/paper/Types/{{itemType}}
Public:: {{publicationTitle}}
Author:: {% for t in creators %} {{t.firstName}} {{t.lastName}} {{t.name}} {% if not loop.last %}, {% endif %}{% endfor %}

Tags:: {{allTags}} , #resource/paper/metadata
DOI:: {{DOI}}
URI:: {{url}}

Citekey:: {{citekey|replace(":","-")}}


# Abstract 

Abstract:: {{abstractNote}}

# Links

Zotero_link:: 🏷️ {{pdfZoteroLink|replace("//select/","//open-pdf/")}} 
Pdf_link:：🔗 {{pdfLink}}

# Relations

{% for t in relations %} - [[02. Knowledge/01. Paper/{{t.date|format("YY")}}-{{t.title|replace(":"," - ")|replace("  "," ")}}/{{t.date|format("YY")}}-{{t.title|replace(":"," - ")|replace("  "," ")}}-Metadata.md|{{t.date|format("YY")}}-{{t.title|replace(":"," - ")|replace("  "," ")}}-Metadata]] {% if not loop.last %}
{% endif %}{% endfor %}
