const myFunction=(array)=>{
    const reversedArray=[]
    for (const el of array){
        reversedArray.unshift(el)
    }
    return reversedArray
}

module.exports ={myFunction}

