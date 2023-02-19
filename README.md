# DNS
A small project which collects the dns quiries stats by using bind rndc utiliy and stores these values to mysql database for the grafana frontend along with some error
correction fixes to avoid negative values on the graphs. The end result is a nice view of dns traffic which gets updated every 2 mins displaying a smooth query traffic.
graph and alerts can be set if anomalies have been observed.
