/*
 * @lc app=leetcode id=31 lang=cpp
 *
 * [31] Next Permutation
 */

// @lc code=start
class Solution {
public:
    void nextPermutation(vector<int>& nums) {
        int i = nums.size() - 2;
        // find break from right to left (smaller element)
        while(i >=0 && nums[i] >= nums[i+1]) {
            i--;
        }

        // find the element to swap with
        if(i >= 0){
            int l = nums.size() - 1;
            while(l > i && nums[l] <= nums[i]){
                l--;
            }
            swap(nums[i] , nums[l]);

        }
        // reverse the array from i+1 to end
        reverse(nums.begin()+i+1 , nums.end());

    }
};
// @lc code=end

