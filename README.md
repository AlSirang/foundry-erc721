## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

# Svg Base64 Encoding

## Happy Svg

data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAwcHgiIGhlaWdodD0iMjAwcHgiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9y
Zy8yMDAwL3N2ZyI+CiAgPGNpcmNsZSBjeD0iMTAwIiBjeT0iMTAwIiByPSI4MCIgZmlsbD0ieWVs
bG93IiAvPgogIDxjaXJjbGUgY3g9IjcwIiBjeT0iNzAiIHI9IjEwIiBmaWxsPSJibGFjayIgLz4K
ICA8Y2lyY2xlIGN4PSIxMzAiIGN5PSI3MCIgcj0iMTAiIGZpbGw9ImJsYWNrIiAvPgogIDxwYXRo
IGQ9Ik02MCwxMjAgUTEwMCwxNTAgMTQwLDEyMCIgZmlsbD0idHJhbnNwYXJlbnQiIHN0cm9rZT0i
YmxhY2siIHN0cm9rZS13aWR0aD0iNSIgLz4KPC9zdmc+

## Sad Svg

data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAwcHgiIGhlaWdodD0iMjAwcHgiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9y
Zy8yMDAwL3N2ZyI+CiAgPGNpcmNsZSBjeD0iMTAwIiBjeT0iMTAwIiByPSI4MCIgZmlsbD0ieWVs
bG93IiAvPgogIDxjaXJjbGUgY3g9IjcwIiBjeT0iNzAiIHI9IjEwIiBmaWxsPSJibGFjayIgLz4K
ICA8Y2lyY2xlIGN4PSIxMzAiIGN5PSI3MCIgcj0iMTAiIGZpbGw9ImJsYWNrIiAvPgogIDxwYXRo
IGQ9Ik02MCwxMzAgUTEwMCwxMDAgMTQwLDEzMCIgZmlsbD0idHJhbnNwYXJlbnQiIHN0cm9rZT0i
YmxhY2siIHN0cm9rZS13aWR0aD0iNSIgLz4KPC9zdmc+Cg==
