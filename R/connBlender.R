#'Blend two conns files
#'
#'Takes in two conns files and combines like peaks and adds peaks not included in each others
#'
#' @param KO_conns the first dataframe you want to combine
#' @param WT_conns the second dataframe you want to combine
#' 
#' @return a blended dataframe
#'
#' @examples
#' loop.data = sortConnections(loop.data, bed)
#'
#' @export
connBlender <- function(KO_conns, WT_conns){
  
  uniquePeaksKO = unique_peak(KO_conns) 
  
  print("unique peaks for KO done")
  
  uniquePeaksWT = unique_peak(WT_conns)
  
  print("unique peaks for WT done")
  
  vectorsizeKO <- length(uniquePeaksKO)
  vectorsizeWT <- length(uniquePeaksWT)
  
  KOpeaks.data <- createDF(vectorsizeKO)
  WTpeaks.data <- createDF(vectorsizeWT)
  
  KOpeaks.data <- buildDF(uniquePeaksKO, KOpeaks.data)
  WTpeaks.data <- buildDF(uniquePeaksWT, WTpeaks.data)
  
  SUMpeaks.data = sumPeaksName(WTpeaks.data, KOpeaks.data, vectorsizeKO, "W","K")
  
  print("sum peaks done")
  
  SUMpeaksblend.data = peakBlend(SUMpeaks.data)
  
  return(SUMpeaksblend.data)
  
}