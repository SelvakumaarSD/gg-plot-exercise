########################################################
# Introduction to ggplot2 - January 2018 - Dawn Koffman
########################################################
install.packages("ggplot2")  
library("ggplot2")

# slide 7: Create a Plot Object
# ###################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
p <- ggplot(data=w, aes(x=le, y=tfr))
p

# slide 8: Addding a Layer
# ###################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
p <- ggplot(data=w, aes(x=le, y=tfr, color=area))
p + geom_point(size=4)

# slide 10: Adding a geom Layer
# ###################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
p <- ggplot(data=w, aes(x=le, y=tfr, color=area))

p + geom_blank()

p + geom_point()

p + geom_jitter()

p + geom_count()

# Slide 11: Adding a geom Layer
# #############################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
p <- ggplot(data=w, aes(x=le, y=tfr, color=area))

p + geom_line()

p + geom_step()

p + geom_path()

# slide 12: Displaying Data and Statistical Summary
# ###################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
p <- ggplot(data=w, aes(x=le, y=tfr))
p + geom_point(shape=1) + geom_smooth()

p + geom_point(shape=1) + geom_smooth(method="lm", se=FALSE)

# slide 13: Displaying Statistical Summary
# ####################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
p <- ggplot(data=w, aes(x=area))
p + geom_bar()

# slide 14:  Already Transformed Data
# ####################################################
wb <- read.csv(file="WDS2012areabins.csv", head=TRUE, sep=",")
wb

p <- ggplot(data=wb, aes(x=area, y=count))

p + geom_bar(stat="identity")

p + geom_col()

# Slide 15: Displaying Distributions
####################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
p <- ggplot(data=w, aes(x=le))

p + geom_histogram()

p + geom_freqpoly()

p + geom_freqpoly(aes(color=area))

# slide 16: Displaying Statistical Summaries
# ###################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
p <- ggplot(data=w, aes(x=area, y=le))

p + geom_boxplot()

p + geom_violin()

# slide 20:  Aesthetics
# ###################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",") 
p <- ggplot(data=w, aes(x=le, y=tfr, color=area)) 
p + geom_point() + geom_smooth(method="lm", se=FALSE)

# slide 21:  Add or Remove Aesthetic Mapping
# ###################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",") 
p <- ggplot(data=w, aes(x=le, y=tfr, color=area)) 

p + geom_point(aes(shape=area)) +           
  geom_smooth(method="lm",se=FALSE)

p + geom_point(aes(color=NULL)) +
    geom_smooth(method="lm", se=FALSE)

# slide 22:  Aesthetic Mapping vs Parameter Setting
# ###################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",") 
p <- ggplot(data=w, aes(x=le, y=tfr)) 

p + geom_point(aes(color=area))

p + geom_point(color="red")

# slide 23:  Position
# ###################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",") 
w$tfrGT2 <- w$tfr > 2
p <- ggplot(data=w, aes(x=area, fill=tfrGT2))

p + geom_bar()

p + geom_bar(position="stack")

p + geom_bar(position="dodge")

p + geom_bar(position="fill")

# slide 24:  Bar Width
# ###################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",") 
p <- ggplot(data=w, aes(x=area))

p + geom_bar()

p + geom_bar(width=.9) # default 

p + geom_bar(width=.5)

p + geom_bar(width=.97)

# slide 25:  Position
# ###################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
p <- ggplot(data=w, aes(x=le, y=tfr))

p + geom_point()

p + geom_point(position="jitter")

p + geom_jitter()

# slide 26:  Transparency
# ###################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
p <- ggplot(data=w, aes(x=le, y=tfr))

p + geom_point(size=3, alpha=1/2)

p + geom_jitter(size=4,  alpha=1/2)

# slide 27:  Coordinate System
# ###################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
p <- ggplot(w, aes(x=factor(1), fill=area))

p + geom_bar() + scale_fill_grey()

p + geom_bar() + coord_flip()

p + geom_bar() + coord_polar(theta="y") 

p + geom_bar() + coord_polar(theta="y", direction=-1)

# slide 28:  Data Frame
# ###################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
africa <- subset(w,area=="Africa")
europe <- subset(w,area=="Europe")

p <- ggplot(data=europe, aes(x=le, y=tfr))
p + geom_jitter(color="blue") +
    geom_jitter(data=africa, color="red")

africa_europe <- rbind(africa, europe)
p <- ggplot(data=africa_europe, aes(x=le, y=tfr,color=area))
p + geom_jitter()

p <- ggplot(data=rbind(africa,europe), aes(le, y=tfr,color=area))
p + geom_jitter()

# slide 29:  Labels
# ###################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
wna <- subset(w, region=="Northern Africa") 
p <- ggplot(data=wna, aes(x=le, y=tfr))

p + geom_point() + 
    geom_text(aes(label=country),
    nudge_y=.2, size=4) +
    xlim(50,80) 

p + geom_point() + 
    geom_label(aes(label=country),
    nudge_y=.3, size=3) + 
    xlim(50,80) + ylim(2,6)

# slide 30:  Labels
# ###################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
labelset <-c("South Sudan", "Sudan", "Libya", "Tunisia")

p <- ggplot(data=subset(w,region=="Northern Africa"),
            aes(x=le, y=tfr))
p + 
  geom_point() + 
  geom_text(data=subset(w, country %in% labelset), 
            aes(label=country), nudge_y = .2, color="blue") +
  xlim(50,80)


# slide 31:  Non-Overlapping Labels
# ###################################################
install.packages("ggrepel")
library("ggrepel")

w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
wna <- subset(w, region=="Northern Africa") 
p <- ggplot(data=wna, aes(x=le, y=tfr))

p + geom_point() + 
  geom_text_repel(aes(label=country),
  size=4) +  xlim(50,80) 

p + geom_point() + 
  geom_label_repel(aes(
  label=country), size=4) + 
  xlim(50,80) + ylim(2,6)


# slide 32:  Annotations
# ###################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
wna <- subset(w, region=="Northern Africa") 
p <- ggplot(data=wna, aes(x=le, y=tfr))

p + geom_point() + 
    annotate("text", x=55, y=5.5, 
             label="South Sudan", color="red") +
    annotate("text", x=62, y=4.3, 
             label="Sudan", color="red") + 
    annotate("rect", xmin = 71.5, xmax = 75.5, ymin = 1.9, ymax = 3.1,
             alpha = .2) +
    ggtitle("Northern Africa") + xlab("life expectancy")


# slide 33: Scale
# ###################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
w$tfrGT2 <- w$tfr > 2
p <- ggplot(data=w, aes(x=area, fill=tfrGT2))

p + geom_bar(color="black")

p + geom_bar(color="black") +
scale_fill_discrete()

p + geom_bar(color="black") +
scale_fill_hue()

# slide 34: Fill Scales
# ###################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
w$tfrGT2 <- w$tfr > 2
p <- ggplot(data=w, aes(x=area, fill=tfrGT2))

p + geom_bar(color="black") +
scale_fill_grey()

p + geom_bar(color="black") +
scale_fill_brewer()

# slide 35: Fill Scales
# ###################################################
library(RColorBrewer)
display.brewer.all()

w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
w$tfrGT2 <- w$tfr > 2

p <- ggplot(data=w, aes(x=area, fill=tfrGT2))

p + geom_bar(color="black") +
    scale_fill_brewer(palette="Accent")

# slide 36: Manual Scales
# ###################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
w$tfrGT2 <- w$tfr > 2
p <- ggplot(data=w, aes(x=area, fill=tfrGT2))

p + geom_bar(color="black") +
scale_fill_manual(values=c("red","blue"),
                  labels=c("no", "yes"))

p + geom_point(aes(x=le, y=tfr, 
                   shape=area, fill=NULL), size = 3) +
xlab("life expectancy") +
scale_shape_manual(values=c(1,16,2,8))

# slide 37: Position Scales
# ###################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")

p <- ggplot(data=w, aes(x=le, y=tfr))
p + geom_jitter()

p + geom_jitter() + 
scale_y_reverse() 

p <- ggplot(data=w, aes(x=le, y=pop2012))
p + geom_jitter() 

p + geom_jitter() +
scale_y_log10(breaks=c(10, 100, 1000), labels=c(10,100,1000))

# slide 39: Theme: Titles, Tick Marks, and Tick Labels
# ####################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
p <- ggplot(data=w, aes(x=le, y=tfr))
p + geom_jitter() + ggtitle("Life Expectancy and TFR") +
xlab("life expectancy (years)") +
ylab("total fertility rate (tfr)") +
scale_x_continuous(breaks=seq(50,80,by=5), 
                   labels=c(50,"fifty-five",60,65,70,75,80)) +
theme(plot.title=element_text(color="blue", size=24, hjust= 0.5),
      axis.title=element_text(size=14,face="bold"),
      axis.title.x=element_text(color="green"),
      axis.text=element_text(size=14),
      axis.text.y=element_text(color="black"),
      axis.text.x=element_text(color="purple", size=20),
      axis.ticks.y=element_blank())

# slide 40: Theme: Legends
# ####################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
w$tfrGT2 <- w$tfr > 2
p <- ggplot(data=w, aes(x=area, fill=tfrGT2))

p + geom_bar() + 
scale_fill_manual(name="TFR value",
                  values = c("red","blue"),
                  labels=c("<=2", ">2")) +
theme(legend.position="left",
      legend.text.align=1)

p + geom_point(aes(x=le, y=tfr,
                   shape=area, fill=NULL), size = 3) + 
xlab("life expectancy") +
scale_shape_manual(name="Area: ", 
                   values=c(1,16,2,8)) +
theme(legend.key=element_blank(),
      legend.direction="horizontal",
      legend.position="bottom")

# slide 41: Themes - Overall Look
# ####################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
p <- ggplot(data=w, aes(x=le, y=tfr))

p + geom_point() + theme_gray()

p + geom_point() + theme_bw()

p + geom_point() + theme_classic()

p + geom_point() + theme_minimal()

# slide 42: Themes - More Overall Looks
# ####################################################
install.packages("ggthemes")
library("ggthemes")

w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
p <- ggplot(data=w, aes(x=le, y=tfr, color=area))

p + geom_point() + theme_base() 

p + geom_point() + theme_excel() +
  scale_color_excel()

p + geom_point() + theme_wsj()

p + geom_point() + theme_igray()

# slide 43: Themes - More Overall Looks
# ####################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
p <- ggplot(data=w, aes(x=le, y=tfr, color=area))

p + geom_point() + theme_stata() + 
  scale_color_stata()

p + geom_point() + 
  theme_economist() + 
  scale_color_economist() +  
  scale_y_continuous(pos="right")

# slide 44: Themes - More Overall Looks
# ####################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
p <- ggplot(data=w, aes(x=le, y=tfr, color=area))

p + geom_point() + theme_fivethirtyeight() +
  scale_colour_fivethirtyeight()

p + geom_point() + 
theme_solarized(light=FALSE) + 
scale_color_manual(values=c("red",
"green","yellow","purple"))

# slide 45: Facets
######################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
p <- ggplot(data=w, aes(x=le, y=imr)) + geom_jitter()

p +  facet_grid(. ~ area)

p + facet_grid(area ~ .)

# slide 46: Facets
######################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
w$tfrGT2 <- w$tfr > 2
p <- ggplot(data=w, aes(x=le, y=imr)) + geom_jitter()

p + facet_grid(area ~ tfrGT2, labeller="label_both") 

p + facet_grid(tfrGT2 ~ area, labeller="label_both", margins=TRUE)

# slide 47: Saving Graphs
######################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",") 
ggplot(data=w, aes(x=le, y=tfr, color=area)) + geom_point()

ggsave(file="le_tfr1.jpg")
ggsave(file="le_tfr2.jpg", scale=2)
ggsave(file="le_tfr3.jpg", width=5, height=5, unit="in")

ggsave(file="le_tfr4.png")
ggsave(file="le_tfr5.pdf")

# slide 50: Show Data
######################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
popLT300 <- subset(w,pop2012<300)

p <- ggplot(data=popLT300, 
            aes(x=area, y=tfr, size=pop2012))
p + geom_jitter(position=
                position_jitter(w=.2, h=.1),shape=21) +
scale_size_area(max_size=10)

# slide 53: Data + Annotation
######################################################
p <- ggplot(data=popLT300, 
            aes(x=area, y=tfr, size=pop2012))
p + geom_jitter(position=
                position_jitter(w=.2, h=.1),shape=21) + 
scale_y_continuous(breaks=c(1,2,3,4,5,6,7)) +
scale_size_area(max_size=10) +
annotate("text", x=1.3,y=7.1, label="Niger", size=4) +
labs(title="Country Total Fertiity Rates (TFRs), 2012", 
x="\nNote: United States, China and India are not included.", 
y="Total\nFertility\nRate\n(TFR)",
size="2012 Population\n(millions)") +
theme_bw() +
theme(axis.title.x=element_text(size=10,hjust=0),
      axis.title.y=element_text(angle=0),
      legend.key=element_blank(),
      legend.text.align=1)

# slide 54: Show Data
######################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")

p <- ggplot(data=w, aes(x=area, y=tfr, size=pop2012))
p + geom_jitter(position=
                position_jitter(w=.2, h=.1),
                shape=21, fill="gray") +
scale_y_continuous(breaks=c(1,2,3,4,5,6,7)) +  
scale_size_area(breaks=c(50,100,200,300,1000),
                max_size=18) + 
theme_bw() +
theme(axis.title.x=element_blank(),
      axis.title.y=element_text(angle=0),
      legend.key=element_blank(),
      legend.text.align=1)

# slide 55: Data + Statistical Summary
######################################################
w <- read.csv(file="WDS2012.csv",head=TRUE, sep=",")

p <- ggplot(w, aes(x=area, y=tfr,color=area))
p +  geom_boxplot(outlier.size=0) +
     geom_jitter(position=position_jitter(h=.1))

# slide 56: Data + Statistical Summary + Annotation
######################################################
p <- ggplot(data=subset(w,area=="Africa"), 
            aes(x=reorder(factor(region),tfr,FUN=median),
                y=tfr, color=region))
p + geom_boxplot(outlier.size=0) +
    geom_jitter(position=
                position_jitter(w=.2,h=0)) +
annotate("text",x=1.2, y=5.5,label="South Sudan", size=4) +
annotate("text",x=3.3, y=1.5,label="Mauritius", size=4) +
annotate("text",x=4.8, y=7.1,label="Niger", size=4) +
annotate("text",x=4,   y=3.2,label="Gabon", size=4) +
labs(title="Country TFR's for Africa, 2012",x="", y="TFR") + 
theme(axis.ticks.x=element_blank(),
      axis.title.y=element_text(angle=0),
      legend.position="none")

# slide 57: Statistical Summary
######################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
p <- ggplot(w, aes(x=area, y=tfr, color=area))
p +  geom_violin()

# slide 58: Statistical Summaries
######################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")

p <- ggplot(w, aes(x=reorder(factor(area),tfr,FUN="median"),
                   y=tfr))
p +  geom_violin() + 
     geom_boxplot(width=.1, outlier.size=0) +
scale_y_continuous(breaks=c(1,2,3,4,5,6,7)) +
theme(axis.title.y=element_text(angle=0,size=12),
     axis.text.y=element_text(color="black", size=12),
     axis.text.x=element_text(color="black", size=12),
     legend.position="none") +
labs(title="Country TFRs: Density Distribution, Median and IQR by Area, 2012",   
     x="", y="TFR") 

# slide 59: Statistical Summary
######################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")

p <- ggplot(w, aes(x=le, color=area))
p +  geom_line(stat="density", size=1.5)

p <- ggplot(w, aes(x=le, fill=area))
p +  geom_density(alpha=.4)

# slide 60: Statistical Summary + Annotation
######################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")

p <- ggplot(w, aes(x=le, fill=area))
p +  geom_density(alpha=.4) +
scale_fill_manual(values=c("red", "green", "blue", "yellow")) +
scale_x_continuous(breaks=c(45,50,55,60,65,70,75,80,85)) +
theme(axis.text=element_text(color="black", size=12)) +
labs(title="Distribution of Life Expectancy, by Area, 2012",
     x="life expectancy")

# slide 61: Statistical Summaries
######################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
p <- ggplot(w, aes(x=le))

p + geom_freqpoly(color="red", size=1, binwidth=1)

p + geom_histogram(fill="darkgray", binwidth=1)

p + geom_histogram(fill="darkgray", binwidth=1) + 
    geom_freqpoly(color="red", size=1, binwidth=1)

# slide 62: Show Data
######################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")

p <- ggplot(data=subset(w,area=="Africa"),
            aes(x=tfr,y=reorder(factor(country),tfr)))

p + geom_point() 

# slide 63: Show Data
######################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")
p <- gplot(data=subset(w,area=="Africa"),
           aes(x=tfr,y=reorder(factor(country),tfr)))

p + geom_segment(aes(yend=country,xend=0)) + 
    geom_point() +
theme_minimal() +
scale_x_continuous(breaks=c(0,1,2,3,4,5,6,7)) + 
labs(x="Total Fertility Rate (TFR)", y="",
title="Total Fertility Rates in Africa, by Country, 2012") +
theme(panel.grid.major.y=element_blank(),
      axis.ticks=element_blank())

# slide 64: Show Data
######################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")

p <- ggplot(data=subset(w,area=="Africa"), 
            aes(x=tfr, y=reorder(factor(country),tfr)))

p + geom_text(aes(x=tfr-.1, label=country,hjust=1), size=4) +
    geom_point() +
theme_minimal() +
scale_x_continuous(breaks=c(1,2,3,4,5,6,7),
                     limits=c(0,8)) + 
labs(x="", y="",
title="Total Fertility Rates (TFRs) in Africa, by Country, 2012") +
theme(panel.grid.major.y=element_blank(),
      axis.text.y=element_blank(),
      axis.ticks=element_blank())

# slide 65: Show Data
######################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")

a <- subset(w,area=="Africa")
a$region <- factor(a$region,levels=
c("Northern Africa","Southern Africa", 
  "Western Africa", "Middle Africa", "Eastern Africa" ))

p <- ggplot(data=a,aes(x=tfr,
                       y=reorder(factor(country),tfr)))
p + geom_segment(aes(yend=country,xend=0)) +
    geom_point() + 
scale_x_continuous(breaks=c(0,1,2,3,4,5,6,7)) +
labs(x="Total Fertility Rate (TFR)", y="",
title="Total Fertility Rates (TFRs) in Africa, by Country, 2012") +
theme(axis.text=element_text(color="black"),
      strip.text.y=element_text(size=9),
      strip.background=element_rect(fill="white"),
      panel.grid.major.y=element_blank(),
      panel.grid.minor.x=element_blank(), 
      axis.ticks=element_blank()) +
facet_grid(region ~ .)           

# slide 66: Show Data
######################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")

a <- subset(w,area=="Africa")
a$region <- factor(a$region,levels=
                     c("Northern Africa","Southern Africa", 
                       "Western Africa", "Middle Africa", "Eastern Africa" ))

p <- ggplot(data=a,aes(x=tfr,
                       y=reorder(factor(country),tfr)))
p + geom_segment(aes(yend=country,xend=0)) +
    geom_point() + 
scale_x_continuous(breaks=c(0,1,2,3,4,5,6,7)) +
labs(x="Total Fertility Rate (TFR)", y="",
     title="Total Fertility Rates (TFRs) in Africa, by Country, 2012") +
theme(axis.text=element_text(color="black"),
      strip.text.y=element_text(size=9),
      strip.background=element_rect(fill="white"),
      panel.grid.major.y=element_blank(),
      panel.grid.minor.x=element_blank(), 
      axis.ticks=element_blank()) +
facet_grid(region ~ ., scales="free_y")           

# slide 67: Show Data
######################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")

a <- subset(w,area=="Africa")
a$region <- factor(a$region,levels=
                     c("Northern Africa","Southern Africa", 
                       "Western Africa", "Middle Africa", "Eastern Africa" ))

p <- ggplot(data=a,aes(x=tfr,
                       y=reorder(factor(country),tfr)))
p + geom_segment(aes(yend=country,xend=0)) +
    geom_point() + 
scale_x_continuous(breaks=c(0,1,2,3,4,5,6,7)) +
labs(x="Total Fertility Rate (TFR)", y="",
     title="Total Fertility Rates (TFRs) in Africa, by Country, 2012") +
theme(axis.text=element_text(color="black"),
      strip.text.y=element_text(size=9),
      strip.background=element_rect(fill="white"),
      panel.grid.major.y=element_blank(),
      panel.grid.minor.x=element_blank(), 
      axis.ticks=element_blank()) +
facet_grid(region ~ ., scales="free_y", space="free_y")           

# slide 68: Statistical Summary
######################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",") 
w$tfrGT2 <- w$tfr > 2
p <- ggplot(data=w, aes(x=area, fill=tfrGT2))
p + geom_bar() +
scale_fill_manual(name="TFR value",
                  values = c("red","blue"),
                  labels=c("<=2", ">2")) +
theme(legend.text.align=1)

w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",") 
w$imrGT15 <- w$imr > 15
p <- ggplot(data=w, aes(x=area, fill=imrGT15))
p + geom_bar() + 
scale_fill_manual(name="IMR value",
                  values = c("red","blue"),
                  labels=c("<=15", ">15")) +
theme(legend.text.align=1)

# slide 69: Data + Statistical Summary + Annotation
######################################################
w <- read.csv(file="WDS2012.csv", head=TRUE, sep=",")

p <- ggplot(data=w, aes(x=imr,y=tfr))
p + geom_point(aes(color=area)) + 
scale_color_manual(values=
                   c("red", "blue", "green", "orange")) +
scale_y_continuous(breaks=c(0,1,2,3,4,5,6,7),
                   limits=c(0,7.8)) +
scale_x_continuous(breaks=
                  c(0,15,30,45,60,75,90,105,120)) +
theme_bw() +
theme(legend.position="bottom", 
      legend.direction="horizontal",
      legend.key=element_blank()) + 
geom_vline(xintercept=15,linetype="dashed") + 
geom_hline(yintercept=2,linetype="dashed") +
geom_smooth(method="lm", color="black", size=.8) +
geom_rug(position="jitter", size=.1)
