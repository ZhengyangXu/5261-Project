main <- main[,-c(7,9)]

m2_CN_d <- diff(log(main$m2_CN))
main$m2_CN <- c(0, m2_CN_d)

m2_US_d <- diff(log(main$m2_US))
main$m2_US <- c(0, m2_US_d)

CSI300_d <- diff(log(main$CSI300))
main$CSI300 <- c(0, CSI300_d)

GSPC_d <- diff(log(main$GSPC))
main$GSPC <- c(0, GSPC_d)

LIBOR_d <- diff(log(main$LIBOR))
main$LIBOR <- c(0, LIBOR_d)

SHIBOR_d <- diff(log(main$SHIBOR))
main$SHIBOR <- c(0, SHIBOR_d)

INT_dif <- main$LIBOR - main$SHIBOR
INT_d <- diff(INT_dif)/INT_dif[1:(length(INT_dif)-1)]
main$INT <- c(0, INT_d)

EX_d <- diff(log(main$RMBperUSD))
main$RMBperUSD <- c(0, EX_d)

main <- main[-(1:28),]

for (j in 7:8) {
  for (i in 1:nrow(main)) {
    if (main[i,j]==0) {
      k <- max(which(main[1:i,j] != 0))
      main[i,j] <- main[k,j]
    }
  }
}