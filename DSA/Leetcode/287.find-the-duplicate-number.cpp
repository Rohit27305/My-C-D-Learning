/*
 * @lc app=leetcode id=287 lang=cpp
 *
 * [287] Find the Duplicate Number
 */

// @lc code=start
class Solution {
public:
    int findDuplicate(vector<int>& nums) {
       // slow and fast pointer or hare and tortoise method
        int s = nums[0] , f = nums[0];
        s = nums[s];
        f = nums[nums[f]];
        // detect cycle
        while(s != f){
            s = nums[s];
            f = nums[nums[f]];
        }
        s = nums[0];
        while(s != f){
            s = nums[s];
            f = nums[f];
        }
        return s;
    }
};
// @lc code=end

