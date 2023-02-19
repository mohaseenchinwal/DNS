# DNS
A small project which collects the dns quiries stats by using bind rndc utiliy and stores these values to mysql database for the grafana frontend along with some error
correction fixe to aviod negative vlaues on the graphs. The end result is a nice view of dns traffic which gets updated every 2 mins displaying a smooth quiries traffic
graph and alerts can be set if anamolies is been obeserved.
