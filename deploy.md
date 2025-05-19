
#### 制作docker镜像，只用运行一次
- 修改config.yml，EXT_IP，设置外网ip
- 修改config.yml,ENV_BEACON_RPC，指定beacon rpc的ip:端口
- 制作命令
```
bash docker-build.sh
```

#### 链一键启动
- 执行 bash start-beaconchain.sh
- 执行成功，geth数据目录execution、日志文件execution-data/ETH.log，beacon-chain数据目录consensus、日志文件consensus-data/BEACON.log

#### 链分步骤启动
1. 初始化geth
```
docker-compose -f docker-compose-base.yml run ethbase eth_init.sh
```
2. 启动geth
```
docker-compose -f docker-compose2.yml up -d eth
```
3. 启动beacon
```
docker-compose -f docker-compose2.yml up -d beacon
```
4. 停止geth
```
docker stop deamon-ethpos-docker-eth-1
```
5. 停止beacon
```
docker stop daemon-ethpos-docker-beacon-1
```
6. 清理geth
```
docker rm -f deamon-ethpos-docker-eth-1
rm -fr execution/*
```
7. 清理beacon
```
docker rm -f deamon-ethpos-docker-beacon-1
rm -fr consensus/*
```

#### 验证者程序一键启动
- 执行 bash start-validator.sh
- 执行成功，目录basicconfig/validator_keys下生成助记词和key_store文件，key_store默认密码为12345678
- 日志文件consensus-data/validator.log

#### 验证者程序分步骤启动

1. 生成助记词或者导入助记词，目录为basicconfig/validator_keys
```
docker-compose -f docker-compse2.yml run staking-cli new-mnemonic
```
或者
```
docker-compose -f docker-compse2.yml run staking-cli existing-mnemonic --mnemonic "xxx xxx xxx ..."
```
2. 初始化validator
```
docker-compose -f docker-compose-base.yml run beaconbase validator_init.sh
```

3. 启动validator
```
docker-compose -f docker-compose2.yml up -d validator
```

4. 停止validator
```
docker stop deamon-ethpos-docker-validator-1
```

5. 清理，注意保存助记词
```
docker rm -f deamon-ethpos-docker-validator-1

rm -fr basicconfig/validator*
```