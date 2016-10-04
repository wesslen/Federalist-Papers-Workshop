cvLDA <- function(Ntopics,dtm,K=10) {
  folds<-cvFolds(nrow(dtm),K,1)
  perplex <- rep(NA,K)
  llk <- rep(NA,K)
  for(i in unique(folds$which)){
    cat(i, " ")
    which.test <- folds$subsets[folds$which==i]
    which.train <- {1:nrow(dtm)}[-which.test]
    dtm.train <- dtm[which.train,]
    dtm.test <- dtm[which.test,]
    lda.fit <- LDA(dtm.train, k=Ntopics, method="Gibbs",
                   control=list(verbose=50L, iter=100))
    perplex[i] <- perplexity(lda.fit,dtm.test)
    llk[i] <- logLik(lda.fit)
  }
  return(list(K=Ntopics,perplexity=perplex,logLik=llk))
}

topicPlots <- function(results,K){
  ## plot
  df <- data.frame(
    k = rep(K, each=10),
    perp =  unlist(lapply(results, '[[', 'perplexity')),
    loglk = unlist(lapply(results, '[[', 'logLik')),
    stringsAsFactors=F)
  
  min(df$perp)
  df$ratio_perp <- df$perp / max(df$perp)
  df$ratio_lk <- df$loglk / min(df$loglk)
  
  df <- data.frame(cbind(
    aggregate(df$ratio_perp, by=list(df$k), FUN=mean),
    aggregate(df$ratio_perp, by=list(df$k), FUN=sd)$x,
    aggregate(df$ratio_lk, by=list(df$k), FUN=mean)$x,
    aggregate(df$ratio_lk, by=list(df$k), FUN=sd)$x),
    stringsAsFactors=F)
  names(df) <- c("k", "ratio_perp", "sd_perp", "ratio_lk", "sd_lk")
  library(reshape)
  pd <- melt(df[,c("k","ratio_perp", "ratio_lk")], id.vars="k")
  pd2 <- melt(df[,c("k","sd_perp", "sd_lk")], id.vars="k")
  pd$sd <- pd2$value
  levels(pd$variable) <- c("Perplexity", "LogLikelihood")
  
  library(ggplot2)
  library(grid)
  
  p <- ggplot(pd, aes(x=k, y=value, linetype=variable))
  pq <- p + geom_line() + geom_point(aes(shape=variable), 
                                     fill="white", shape=21, size=1.40) +
    geom_errorbar(aes(ymax=value+sd, ymin=value-sd), width=4) +
    scale_y_continuous("Ratio wrt worst value") +
    scale_x_continuous("Number of topics", 
                       breaks=K) +
    theme_bw() 
  pq
}

corrPlot <- function(probterms, thres = 0.08){
  
  cor_threshold <- thres
  cor_mat <- cor(probterms)
  cor_mat[ cor_mat < cor_threshold ] <- 0
  diag(cor_mat) <- 0
  
  library(igraph)
  
  graph <- graph.adjacency(cor_mat, weighted=TRUE, mode="lower")
  
  E(graph)$edge.width <- E(graph)$weight
  V(graph)$label <- paste(1:20)
  
  par(mar=c(0, 0, 3, 0))
  set.seed(110)
  plot.igraph(graph, edge.width = E(graph)$edge.width, 
              edge.color = "blue", vertex.color = "white", vertex.size = 1,
              vertex.frame.color = NA, vertex.label.color = "grey30")
  title("Strength Between Topics Based On Word Probabilities", cex.main=.8)
}