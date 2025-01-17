// SPDX-License-Identifier: MIT
// Gearbox Protocol. Generalized leverage for DeFi protocols
// (c) Gearbox Holdings, 2022
pragma solidity ^0.8.10;

import { IAddressProvider } from "../IAddressProvider.sol";
import { ICreditManagerV2 } from "../ICreditManagerV2.sol";

enum AdapterType {
    ABSTRACT,
    UNISWAP_V2_ROUTER,
    UNISWAP_V3_ROUTER,
    CURVE_V1_EXCHANGE_ONLY,
    YEARN_V2,
    CURVE_V1_2ASSETS,
    CURVE_V1_3ASSETS,
    CURVE_V1_4ASSETS,
    CURVE_V1_STECRV_POOL,
    CURVE_V1_WRAPPER,
    CONVEX_V1_BASE_REWARD_POOL,
    CONVEX_V1_BOOSTER,
    CONVEX_V1_CLAIM_ZAP,
    LIDO_V1,
    UNIVERSAL,
    LIDO_WSTETH_V1,
    BALANCER_VAULT,
    AAVE_V2_LENDING_POOL,
    AAVE_V2_WRAPPED_ATOKEN,
    COMPOUND_V2_CERC20,
    COMPOUND_V2_CETHER
}

interface IAdapterExceptions {
    /// @notice Thrown when adapter tries to use a token that's not a collateral token of the connected Credit Manager
    error TokenIsNotInAllowedList(address);

    /// @notice Thrown when caller of a `creditFacadeOnly` function is not the Credit Facade
    error CreditFacadeOnlyException();
}

interface IAdapter is IAdapterExceptions {
    /// @notice Credit Manager the adapter is connected to
    function creditManager() external view returns (ICreditManagerV2);

    /// @notice Address of the contract the adapter is interacting with
    function targetContract() external view returns (address);

    /// @notice Address provider
    function addressProvider() external view returns (IAddressProvider);

    /// @notice Adapter type
    function _gearboxAdapterType() external pure returns (AdapterType);

    /// @notice Adapter version
    function _gearboxAdapterVersion() external pure returns (uint16);
}
