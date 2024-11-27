``` 1 , 3 , 4 , 5 , 0 , 7```

Next Permutation is an algorithmic concept where you rearrange a given sequence of numbers (or characters) to produce the lexicographically next greater permutation. If no such permutation exists (the sequence is in descending order), the sequence is rearranged into the smallest possible order (i.e., sorted in ascending order).

**Example** For the array [1, 2, 3], the permutations in lexicographical order are:

[1, 2, 3]
[1, 3, 2]
[2, 1, 3]
[2, 3, 1]
[3, 1, 2]
[3, 2, 1]

**Solution**  

```
class Solution {
  public:
    void nextPermutation(vector<int>& arr) {
        int ind = -1 , n = arr.size();
        
        for(int i=n-2;i>=0;i--){
            if(arr[i] < arr[i+1]){
                ind = i;
                break;
            }
        }
        
        if(ind == -1){
            reverse(arr.begin() , arr.end());
            return;
        }
        
        for(int i=n-1;i>ind;i--){
            if(arr[i] > arr[ind]){
                swap(arr[i] , arr[ind]);
                break;
            }
        }
        
        reverse(arr.begin()+ind+1 , arr.end());
    }
};
```


Link - https://www.youtube.com/watch?v=JDOXKqF60RQ&t=633s



