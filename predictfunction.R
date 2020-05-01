wordprediction=function(input){
  '%ni%' <- Negate('%in%')
  as.character(input)
  input=tolower(input)
  if(wordcount(input)==1){
    for(i in 1:nrow(a){
      if(input!=a[i,1]){
        (a[which.max(a$frequency),])[1,1]
      }
      else{
        temp=(filter(b,word(b$feature,start = 1,end = 1,sep = " ")==input))[,1:2]
        temp$x=temp$frequency/filter(a,feature==input)[,2]
        word((temp[which.max(temp$x),])[,1],start = 2,end = 2,sep = " ")
      }
      
    }
  }
  
  else{
    input=word(input,start = wordcount(input)-1,end = wordcount(input),sep = " ")
    for(i in 1:nrow(b){
      if(input!=b[i,1]){
        for(i in 1:nrow(a){
          input1=word(input,start = wordcount(input),end = wordcount(input),sep = " ")
          if(input1==a[i,1]){
            temp=(filter(b,word(b$feature,start = 1,end = 1,sep = " ")==input1))[,1:2]
            temp$x=temp$frequency/filter(a,feature==input1)[,2]
            word((temp[which.max(temp$x),])[,1],start = 2,end = 2,sep = " ")
          }
          else{
            a[which.max(a$frequency),])[1,1]
          }
          
          
        }
      }
      else{
        
      }
    }
    temp1=(filter(c,word(c$feature,start = 1,end = 2,sep = " ")==input))[,1:2]
    temp1$a=temp1$frequency/filter(b,feature==input)[,2]
    word((temp1[which.max(temp1$a),])[,1],start = 3,end = 3,sep = " ")
  }
}
