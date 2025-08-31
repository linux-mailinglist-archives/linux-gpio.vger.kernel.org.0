Return-Path: <linux-gpio+bounces-25237-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8325DB3D173
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Aug 2025 10:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A18F87ABE37
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Aug 2025 08:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2649F239E88;
	Sun, 31 Aug 2025 08:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="fpnU48h9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012003.outbound.protection.outlook.com [40.107.75.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB951BC58;
	Sun, 31 Aug 2025 08:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756630215; cv=fail; b=iTeayMx8h4laIpZ6oWT+2muOibCGglVVQIV6z/iENhTcFc0/24ywtmMce7E1Ef9Y0BTMvZkjrKfIsMddM3EoKzrtdzArnTZKLneGmEaTx1P8cnU8bZ+08DD5jvIQyRSxz1brwgqTUPNeGsP8tFYeMURRQg29cwiLKW+0FKsc8yA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756630215; c=relaxed/simple;
	bh=GsH1TxjEmnagTubaIfJ+loN4kD5XRA8rWE+J/t7hD4c=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ZuaPMJxxrm88uG9O2mL4k7+ix6Sz2/Ibjmj5bzagEo4Mb+pl0juzJ0i9khlRkcj9h6lI6e3ZIh9DFZsEaysVIo+qAhP/MJw9y8xXcP7EuYwkhUddtjDgwPewh6+6FZAXwRHxNGe5ZeEG2evvNsBJJXCYFmY24kI36rVCJPh4mmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=fpnU48h9; arc=fail smtp.client-ip=40.107.75.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4+AO0QN6ZC7hZWJPBow+6ks67REKE6h1lfiSvCNB3bgoTnnCuFZFf+oYP/wE0lRCIFIdyw50wAqsgp/d7vErprkW1RtFD+MbmhwuEoIWg0FRc9F/Ytvo64B/XgGT5Pi3UDozm7AnqVGuLE/c9lQtraJzEEQUi0GOC+Yu5hDg5fdNsCj99Jv7bMmqgn0XHVqlVAA6XX6dLhTZO4ILg3MJ+SCqgd72PLKRFE8PPQKFT56+Y0ToRypDxbsJQ3J1aOu19K2xb+ZGryHpX8gyPQIyJSSBKm3UX2oSbd/l3qbaeBqecn3Mu9F4q1QTqFl3JhvaTr+x1W5/YAKtoaN73o9kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+QMGBwd8OzwIAQ/woeuDDu1JuY9LN0v/DsA5w4b09Jg=;
 b=DqQ1rGSUOMBmeKoq71UucmxFooFeOWf72mRcbaDVZirmKRWEn1f4IEBvaiwd3A5tVFU5AVk8DNwYJsU64eKZ1nsgpfEgP7A3tMw+1KSZ1qLQSkCiCrYgAj4z84hZ9GtOz1TGAQcNfJ/fZqNDE9+whsXKYJRZrcvx2aDZuBZkoaoPCRqM1N62BALyRV006NooZYJ5a/ng71MawpjdkwwbOc2p1GAuq6H8u1qCM5YuZnXYiGzrOWv67kLWllUpKNBIw6VVRk3PZpIL22Ucr2NGwtzymAP5MBKGcn+h28KCIFuuliMJU7DQsGyryDbNPAWhxPXg/KExLAzLdqttTkc9kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QMGBwd8OzwIAQ/woeuDDu1JuY9LN0v/DsA5w4b09Jg=;
 b=fpnU48h9754CXcnEw6Z57stQb19WmJdktaq364u8EfXH9VHKtbi5grssSEXhDRHhWClDQNqCOp3BWM+ljbV7cFWr9mSgAcV//kpruMsLtKzZUgGOxzKhQSzOxAjzBegKvrSAsuXayeE2zjvusM3WTWzr0MgsnRW/znmFwa4+HIWq8LHHzi+BydRsk64wOI5pOpMdDwLCEmfDKhRxCeMeEDgnbtvzolHbhFZ9mExynXepKUg2ipPSX7KyXTl3Z1XZP5qVbkHCBIpueH0p62tWHUGpPTqBDe50OOIK4zJ5fbbzQEkqsLuikEZZ2UaG6WCG9Oq81UFFb5b/Z2Fp2xqhtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 KL1PR06MB6372.apcprd06.prod.outlook.com (2603:1096:820:99::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.26; Sun, 31 Aug 2025 08:50:09 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9073.021; Sun, 31 Aug 2025
 08:50:09 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list),
	linux-renesas-soc@vger.kernel.org (open list:PIN CONTROLLER - RENESAS)
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH 0/3] pinctrl: Use int type to store negative error codes
Date: Sun, 31 Aug 2025 16:49:55 +0800
Message-Id: <20250831084958.431913-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0196.apcprd04.prod.outlook.com
 (2603:1096:4:14::34) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|KL1PR06MB6372:EE_
X-MS-Office365-Filtering-Correlation-Id: f5876109-4606-4b97-c7cf-08dde86b63cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8EMcVsn7OvOJMWGQnEKj8cSBO6oe+JEDSaCLrDukf+3oQGkPHjjO9kpEQJ3W?=
 =?us-ascii?Q?n1WNBsq+cU3CnijJS67SApkIkEX/95psVYf3zvvK1eEv7SY4WvmXLsKWMxVa?=
 =?us-ascii?Q?5ubkW8Lm1+owvBuB1e4z4fETUm13L/vhQTWRoB85r2DP22KVSjpNrw36+GGx?=
 =?us-ascii?Q?6FZEkIFlAoddEATxIYSGhtY2AwIxuW0eYUPzpsx3SSn+jduhZTVi8MX794ao?=
 =?us-ascii?Q?Zif8EqcW4RVuIJT9KG1XnfKcc10IiH1YhPa1qNjN4sQ1rr7/FQhvZ7LZFIqp?=
 =?us-ascii?Q?PUpq9cyDkHDu5A+ElynJ69szW9p0B8NBa1t4f8yZs5Wjp3vv7DTWm7j6X0S8?=
 =?us-ascii?Q?KVxsT2whfEWlxrJ3wROLMlvgHH7Y2Wll08yZfsiWLitxabife4R6ydqU/OXe?=
 =?us-ascii?Q?7l9jNZ0kF5UR79Dp+WFMwpTm2il/vE87ft5dN2ofH05QGQVwREKV9nRLjEV4?=
 =?us-ascii?Q?4y/7RIoKLl2sUvxXNTrvZViHn6qFkcY+Wle3q7e32PzByDrgp3Jspjf9Mv6t?=
 =?us-ascii?Q?+4+nnGBwskLrOfpnqTT2U25j7g64bgVvS609gSQ036Y0x2rET62B7LAO7YEB?=
 =?us-ascii?Q?YEOyOVrjPuSMci+Np1anQ7SRBTk5Y0q5xbwel6tGXgIa3cJuk67lKTiAecTy?=
 =?us-ascii?Q?P1SwMFYb2v3fh1CXS348eAhY0gI6FzWqlVJz/blDYwkh4AJ5KhfrQIZeksnL?=
 =?us-ascii?Q?h3hGA8DKrRsaZeol5VqilNrXYqdYK9Z/C2uh2VYUsU2D05IQMDPiHVVmbt6b?=
 =?us-ascii?Q?+mPlsVRD/BLUGnFHujJU4ScWs/HOxzY9F9/phyZeuJiQGwEv50KdTVIR9nK2?=
 =?us-ascii?Q?iOMVLmvUlIra+2tcdCcKNcV7GFqF0+I+FvSAt0mwYbQJGv8IBnrCrVcLXA3N?=
 =?us-ascii?Q?97Ghb5+7NHWmndjMEvthJJVKwwxk71fr8QxtV1miYewNsKeCoogrUIRer7mC?=
 =?us-ascii?Q?G0ZNK/t2RXF2DIAzxLvNWRfFa1fEt4zvXXdB9lB+k0f6/gdU8U5PqrwVYMqj?=
 =?us-ascii?Q?pDkvv6E1pppGubgLXUdnrFysp0s38/AloYYaUw47atvJYC38Exuc3c22/7bj?=
 =?us-ascii?Q?0CnZaQkUfvWtfGqNHel+GSUoS7z/3c4uoePjAjbnpbuQiPnaRSD/Y0RHQ+dC?=
 =?us-ascii?Q?TT+jFpHkCu9FDXXavXhWIvTpAaLRRyvGEP8kLhCSdzFtb/PBmUCXLlPBEATI?=
 =?us-ascii?Q?0GO/fGwzmmP0VYyTMINkrmBQR7SPTrox46WfU6O8P2C/wn5+iy6ky1BoyDlu?=
 =?us-ascii?Q?ip/qdBf9y3d9Q2OuT1zrt8Db1hkRoDG7BOz4c9P23ICxX5oY3uyXda+ZFKWL?=
 =?us-ascii?Q?R6U7ibpihwYOWB2yAj/is+vwYJZYlD+8pRiG3OVMmjYrlo2v9As511KV/oMD?=
 =?us-ascii?Q?MRv7bSRG+y2Av+xXNLEDtcti+peth4MIpOGXc/Cg4SuR+K8OpmKMumfwU8Pd?=
 =?us-ascii?Q?qBBMH/Sr5Bk4qNI0+TV2EfmZhn015qxhm4quhlJl4xU98h9Zlei59p7LYKCD?=
 =?us-ascii?Q?pqrZbSw4adUsitY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a7GPzChEBo8cQYrnr6gtnfGMlSz3JG3uyVQURO0zyZ3xn+l5eziVo8M9+y6Q?=
 =?us-ascii?Q?T/fYYuqdcIO1HSlx0Qbv/ceMoIGFwNOrbM95IFMjPtSwHggG/OrifEtEI0V+?=
 =?us-ascii?Q?rlC0CYWCJzV4MxEWCkAg3ZIL1Jsk9piA8W6kKF3D4tzXaQ0DOD2mV1/rmCu5?=
 =?us-ascii?Q?kJ+kwUIWN/LeyxPMuqzS9XqVliqA6oTEze0cNBfRDQzieYX/IoAnkASveCuE?=
 =?us-ascii?Q?ss5u5aOjJvHkWZ+mk/6s7F3xXImXrS3iLX4iZZQ/Y+Z0SbvakDY9//+JPNF0?=
 =?us-ascii?Q?YzzNwBC0Iu9WbyvuFpiOGUATBuK3/fBWsnxLN67Bkwfteiu7E4Lfdm04OrLJ?=
 =?us-ascii?Q?hjjD+QqJ82Ko1ghU7dLP9x5ijZh0xO/YuiMxga3U86P7zXqSIMVvQNjPwWBK?=
 =?us-ascii?Q?FJ6D6p1WXggqzVSspLPmW4I4IgCHGllgDuVrVEqFpEwB0P5HFPzj5bH9W1p0?=
 =?us-ascii?Q?AbuvJnqf+kwSpGSGwK4rmKjPA2IXQPe7fXkhcPvWdF7dKa8z0Fdq2uuHg1tn?=
 =?us-ascii?Q?lfGT/g5WvYECawq38naZmEBld6bzyRlCkfTBYo8+ILnYIUabGsPrQZIhUSSq?=
 =?us-ascii?Q?db8+l18D7eMMGlBDgP6520vi852AgYNFwX9DBLlgTE5fYx0qpqEZ0I7phZ5P?=
 =?us-ascii?Q?eOnrto1iqQzkoJ1yjv+4+UOZMDVVQqLiqbo21yCVEQ8KerrbDPZTkXe6u27h?=
 =?us-ascii?Q?d44pqNpKTNP6jTjYmwMaIEk60ikgH6F1vD8oJaxeVqfew1DxyOno6xmB+kHr?=
 =?us-ascii?Q?QpNv3YC3mQkuC5Wag2pniUxiJmCEGsNNi4qMjcfRzKHHndJECyyykY3HNhsH?=
 =?us-ascii?Q?Zgj2rNOGnfLXaiLLjymXEf5Eo8OP2b59Iq3mjUzMtkgMWYRSRc9YFdO4rJbf?=
 =?us-ascii?Q?v5dbMdUUiqEH6Ht43a896E/DWUyclZpsBAbZvlZI/2MVowvPZCz/g6cAMVjn?=
 =?us-ascii?Q?GG5l3xQrjUJgWBxKZun1bN7tCdgciGuKQYzD0pjsyjAftd0RRqF6AQIh/KPz?=
 =?us-ascii?Q?MlN4xA8b5Rt2buJClkSSQKu0K69DsHbtX9tSfpvWi4P8vE4JRTxZxGgp9DMp?=
 =?us-ascii?Q?tDlM8L88O6xIGsrHSCce16eIpJnKPB/oefoEPLsmYHbZJXKKqAf4UshGPCUR?=
 =?us-ascii?Q?2afrfkDmcPglY5cJYEdUw2jrAEQ4PcKi6T0E3DjbdTcr38K8QQtYvC+IF4js?=
 =?us-ascii?Q?BNNPA0ldLfivfxA1/S3/FVpbq2X1gI5NWXnQUwWqc9oz72oI/dsxzR19tAsH?=
 =?us-ascii?Q?F8TtSfg1oJMz0rEw8kGwPHtM1/GS8neQL5/m1K+nhiW4reLkmV83Z4BZDLvd?=
 =?us-ascii?Q?R7IwC6cHOMCKtUDX9wLqIKrG8t5QA6WKP1HoIAR+kAZPzUMK7tLUbbzi5B0I?=
 =?us-ascii?Q?Y+FScc/wXPtIB3fRmCJXchD1DG9RclAmf/cGSI+TmgFlTxwOZyykTT3aHeeX?=
 =?us-ascii?Q?1//lCo0gD/oIzjusgKqyMt0JATEUdaZdi1rc3mjNISuBnihnSxec5+Ci4HEK?=
 =?us-ascii?Q?yasZhNqDacIoz7qMLTfwb3JK8YQMuox13gW7kZplC0H2PZPikQHzCvPNfp3a?=
 =?us-ascii?Q?miuPNII9mm0dz7cWTQxiLzh9eDQ/l2MivbBrzCHe?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5876109-4606-4b97-c7cf-08dde86b63cf
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2025 08:50:09.2360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YjEBDylWQTBw+py8guAHHZHurnKGvwJbfHTcMSQkvkNVG59dlyHwvUV9Vo6HdjREeLHLp5u81HNIR7B7KhKcjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6372

The 'ret' variable usually is used to store returns from some functions,
which return either zero on success or negative error codes on failure.

Storing the negative error codes in unsigned type, doesn't cause an issue
at runtime but can be confusing.  Additionally, assigning negative error
codes to unsigned type may trigger a GCC warning when the -Wsign-conversion
flag is enabled.

Change "ret" from u32/unsigned int to int type.  No effect on runtime.

Qianfeng Rong (3):
  pinctrl: armada-37xx: Use int type to store negative error codes
  pinctrl: ma35: Use int type to store negative error codes
  pinctrl: renesas: Use int type to store negative error codes

 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 6 ++++--
 drivers/pinctrl/nuvoton/pinctrl-ma35.c      | 3 ++-
 drivers/pinctrl/renesas/pinctrl.c           | 3 ++-
 3 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.34.1


