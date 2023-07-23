// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract upload {
    //0xqwety
    struct access {
        address user;
        bool access; //true or false
    }

    mapping(address => string[]) value;
    mapping(address => mapping(address => bool)) ownership;
    mapping(address => access[]) accesslist;
    mapping(address => mapping(address => bool)) previousData;

    function add(address _user, string memory url) external {
        value[_user].push(url);
    }

    function allow(address user) external {
        ownership[msg.sender][user] = true;
        if (previousData[msg.sender][user]) {
            for (uint i = 0; i < accesslist[msg.sender].length; i++) {
                if (accesslist[msg.sender][i].user == user) {
                    accesslist[msg.sender].push(access(user, true));
                }
            }
        } else {
            accesslist[msg.sender].push(access(user, true));
            previousData[msg.sender][user] = true;
        }
    }

    function disallow(address user) public {
        ownership[msg.sender][user] = false;
        for (uint i = 0; i < accesslist[msg.sender].length; i++) {
            if (accesslist[msg.sender][i].user == user) {
                accesslist[msg.sender][i].access = false;
            }
        }
    }

    function dispaly(address _user) external view returns (string[] memory) {
        require(
            _user == msg.sender || ownership[_user][msg.sender],
            "you don't have access"
        );
        return value[_user];
    }

    function shareAccess() public view returns (access[] memory) {
        return accesslist[msg.sender];
    }
}
