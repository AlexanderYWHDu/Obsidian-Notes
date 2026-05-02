
 >[!stickies2|blue] 
 >  🔗 [[02. Knowledge/01. Paper/{{date|format("YY")}}-{{title|replace(":"," - ")|replace("  "," ")}}/{{date|format("YY")}}-{{title|replace(":"," - ")|replace("  "," ")}}-Metadata.md|Metadata]]

#resource/paper/English-note #Note/flashcards/English 

---
# 🖊️Annotation
{% for annotation in annotations %}{% if annotation.color == "#ffd400" %}

- 🏷️ {{annotation.annotatedText}} {% for t in annotation.tags %} #{{t.tag}} {% if not loop.last %}
{% endif %}{% endfor %}
?
🖊️ {{annotation.comment}} 🔗 {{pdfZoteroLink|replace("//select/","//open-pdf/")|replace(")","")}}?page={{annotation.page}}&annotation={{annotation.id}}) {% if annotation.imageBaseName %} 🌌-  ![[{{annotation.imageBaseName}}]]{% endif %}
{% endif %} {% endfor %}
<!--SR:!2024-06-07,4,270-->

# Words 缩略

{% for annotation in annotations %}{% if annotation.color == "#ffd400" %}
{{annotation.annotatedText}} {% for t in annotation.tags %} {% if not loop.last %}
{% endif %}{% endfor %}{% endif %} {% endfor %}
