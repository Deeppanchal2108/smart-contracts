// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleVoting {
    struct Proposal {
        string description;
        uint256 votes;
    }
    address public owner;
    Proposal[] public proposals;
    mapping(address => bool) public hasVoted;

    constructor() {
        owner = msg.sender;
    }

    function addProposal(string memory desc) public {
        require(owner == msg.sender, "Only owner can add proposals");
        Proposal memory p = Proposal(desc, 0);
        proposals.push(p);
    }

    function vote(uint256 index) public {
        require(!hasVoted[msg.sender], "Already voted");
        require(proposals.length > index, "index out of bound");
        proposals[index].votes += 1;
        hasVoted[msg.sender] = true;
    }

    function getTotalProposals() public view returns (uint256) {
        return proposals.length;
    }

    function getProposal(uint256 index)
        public
        view
        returns (string memory, uint256)
    {
        require(proposals.length > index, "index out of bound");
        Proposal memory p = proposals[index];
        return (p.description, p.votes);
    }
}
