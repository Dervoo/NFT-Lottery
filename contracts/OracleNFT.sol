// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract OracleNFT is ERC721, Pausable, Ownable {
    constructor() ERC721("OracleNFT", "OFT") {}

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://QmY3KuinicM43CQP9ZFBfwg1t83DU7giRetJrNEyuJk1U2/";
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal override whenNotPaused {
        super._beforeTokenTransfer(from, to, tokenId);
    }
}
