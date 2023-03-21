// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract ERC20Staking is ReentrancyGuard {
    using SafeERC20 for IERC20;
    IERC20 public immutable token;
    uint256 public  rewardsPerBlock = 1000; // 0.01%
    uint256 public immutable minimumStake = 1 ether;
    uint256 public immutable lockupPeriod = 30 days;
    uint256 public totalStaked = 0;
    mapping(address => uint256) public balanceOf;
    mapping(address => uint256) public lastClaimed;
    mapping(address => uint256) public lockedUntil;

    event Staked(address indexed account, uint256 amount);
    event Withdrawn(address indexed account, uint256 amount);
    event Claimed(address indexed account, uint256 amount);

    constructor(IERC20 _token) {
        token = _token;
    }

    function stake(uint256 _amount) external nonReentrant {
        require(_amount >= minimumStake, "Amount is below minimum stake");
        require(token.balanceOf(msg.sender) >= _amount, "Insufficient balance");
        require(token.allowance(msg.sender, address(this)) >= _amount, "Insufficient allowance");
        require(lockedUntil[msg.sender] < block.timestamp, "Tokens are still locked");

        token.safeTransferFrom(msg.sender, address(this), _amount);
        balanceOf[msg.sender] += _amount;
        totalStaked += _amount;
        lastClaimed[msg.sender] = block.number;
        emit Staked(msg.sender, _amount);
    }

    function withdraw(uint256 _amount) external nonReentrant {
        require(balanceOf[msg.sender] >= _amount, "Insufficient balance");
        require(lockedUntil[msg.sender] < block.timestamp, "Tokens are still locked");

        balanceOf[msg.sender] -= _amount;
        totalStaked -= _amount;
        token.safeTransfer(msg.sender, _amount);
        emit Withdrawn(msg.sender, _amount);
    }

    function claim() external nonReentrant {
        uint256 reward = getReward(msg.sender);
        require(reward > 0, "No rewards to claim");

        lastClaimed[msg.sender] = block.number;
        lockedUntil[msg.sender] = block.timestamp + lockupPeriod;
        token.safeTransfer(msg.sender, reward);
        emit Claimed(msg.sender, reward);
    }

    function getReward(address _account) public view returns (uint256) {
        uint256 blocksSinceLastClaim = block.number - lastClaimed[_account];
        uint256 reward = (balanceOf[_account] * blocksSinceLastClaim * rewardsPerBlock) / 1e18;
        return reward;
    }

    function setRewardsPerBlock(uint256 _rewardsPerBlock) external {
        require(msg.sender == tx.origin, "Caller must be an externally-owned account");
        rewardsPerBlock = _rewardsPerBlock;
    }
}
