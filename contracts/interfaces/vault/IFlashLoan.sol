// SPDX-License-Identifier: AGPL-3.0-or-later

pragma solidity >=0.5.0;

import "./IFlashLoanRecipient.sol";

interface IFlashLoan {
    /**
     * @dev Performs a 'flash loan', sending tokens to `recipient`, executing the `receiveFlashLoan` hook on it,
     * and then reverting unless the tokens plus a proportional protocol fee have been returned.
     *
     * The `tokens` and `amounts` arrays must have the same length, and each entry in these indicates the loan amount
     * for each token contract. `tokens` must be sorted in ascending order.
     *
     * The 'userData' field is ignored by the Vault, and forwarded as-is to `recipient` as part of the
     * `receiveFlashLoan` call.
     *
     * Emits `FlashLoan` events.
     */
    function flashLoan(
        IFlashLoanRecipient recipient,
        address[] memory tokens,
        uint[] memory amounts,
        bytes memory userData
    ) external;

    function flashLoanFeePercentage() external view returns (uint);

    /**
     * @dev Emitted for each individual flash loan performed by `flashLoan`.
     */
    event FlashLoan(IFlashLoanRecipient indexed recipient, address indexed token, uint amount, uint feeAmount);
}