data attrmap;
    length id $20 value $50 fillcolor $20;
    id = "colorid";
    value = "Netflix";               fillcolor = "#E50914";    output;
    value = "Amazon Prime Video";    fillcolor = "#00A8E1";  output;
    value = "Disney+";               fillcolor = "#113CCF";   output;
    value = "HBO Max";                   fillcolor = "#5B2C91"; output;
    value = "Hulu";                  fillcolor = "#1CE783";  output;
run;

ods graphics / reset width=6in height=5in imagemap;

proc sgplot data=WORK.SERVICES(obs=5) dattrmap=attrmap;
    where Service not in ("YouTube Premium", "Tencent Video", "iQIYI", "Youku", "ALTBalaji", "iflix");

    vbar Service / 
        response=Subscribers
        group=Service
        groupdisplay=cluster
        datalabel
        attrid=colorid;

    xaxis label="Streaming Platform" discreteorder=data;
    yaxis label="Number of Subscribers" grid;
    title "Number of Subscribers per Streaming Platform";
run;

ods graphics / reset;
