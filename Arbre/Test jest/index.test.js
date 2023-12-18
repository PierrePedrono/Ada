const {myFunction} = require('./index')
describe('introduction to automated tests', () =>{
it('myFunction should return a resversed array', () =>{
    //Given
const sampleArray = [1,2,3]
    //When
const reversedArray = myFunction(sampleArray)
    //Then
expect(reversedArray).toEqual([3,2,1])
})

it('myFunction should return a reversed array with complex items', () => {
    //Given
const sampleArray = [1, 'abc', false, {foo:"bar"}]
    //When
const reversedArray = myFunction(sampleArray)
    //Then
expect(reversedArray).toEqual([{foo:"bar"},false,'abc',1])
})


})