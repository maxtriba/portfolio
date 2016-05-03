/*

	Author: Max Triba
	
	Calculate the probabilities over t trials that you will pull a full item from a bottle, if on replacement you break an item in 
	half and return half to the bottle.
	
*/


n <- 24
trials <- 48
ch_vec <- rep("f", n)

# while('f' %in% ch_vec)

for(i in seq(1, trials)) {
  
  choose <- sample(ch_vec,1)
  
  if(choose == 'f') {
    
    print(paste('P of selecting a full item at trial', i ,'is: ' , round(sum(nchar(ch_vec[ch_vec == 'f']))/length(ch_vec),2)))

    for(i in seq(1,length(ch_vec))) { # remove an f, replace with an h
      if(ch_vec[i] == 'f') { 
        ch_vec[i] <- 'h'
        break
      }
    }
  } else {
    sort(ch_vec, decreasing = TRUE)
    ch_vec <- ch_vec[2:length(ch_vec)] # remove an h becasue you've chosen one 
    print(paste('P of selecting a full item at trial', i ,'is: ', round(sum(nchar(ch_vec[ch_vec == 'f']))/length(ch_vec),2)))
  }
  
}

ch_vec
length(ch_vec)
    

f <- function(x) {
  if(x == 0) return(1)
  else return (x * f(x-1))
}