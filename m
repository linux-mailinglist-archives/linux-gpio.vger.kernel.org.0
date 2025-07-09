Return-Path: <linux-gpio+bounces-22982-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3ABAFE7A5
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 13:27:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C689E1C28481
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 11:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630E1291C3D;
	Wed,  9 Jul 2025 11:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fehX/kcB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011049.outbound.protection.outlook.com [52.101.65.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0575F28EA7C;
	Wed,  9 Jul 2025 11:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752060449; cv=fail; b=SbNzRJZzV32H07oldxPb7eCfCFVjizrQMB1kH0ZHZsmFbrzfrDIya0llwAnjpyoTK6PhdPwak6cdp3NdfsS6WhuFHjMySgdob1zOx5y4btd/ZBWPAQY+4Xsn0e/Fx+5i1eE8CUF95fWXQs5++OOvHE1tGJxNhxqEBLdFbMgFjkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752060449; c=relaxed/simple;
	bh=otCXNrS7F7TDCU02odJgyKaL9bqYV5ltD9dB2XS18+o=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YEx/0uwYfXNIDRPWsyXW1kqWS7Agdzwa0nUjWhaPifXSmE9KbPWaWK0Ve1qnyF4i/6Nij7paUEmfUJTqfLlwqIGYGipQH0jnKQbTZdQqoXunORp2mNl64hKXnhC8hIJkDPAAoHBwQ4EB0lcrnv1HstWDERMOkdP3Qn0VQA4Locg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fehX/kcB; arc=fail smtp.client-ip=52.101.65.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amKxn/ci0uVX2FPTQctIZ/yHRw3M9tz6tawe62zkv3sFtoK+GR4WdXUTxuJmNsr8N+8mfktJLRSBVjFSZQo5SFN+PVjCtltO7EhriCkdeFxAhqtUv8nP9M301gIvsmuU2jM5XIg0ZaxsUSRhCnS5jjEUoB7bVzG49D4H4Qow3hemObxhw53BH5w5X15X3gIa5EJnZpBgR690rIRL/aIHvilKHxySBojs0Maa4Uy7NtRcDzDa00Fkv/O2wvPfRnSSH3jmKgYn5sjaTDzMbmuTqnAvuwBMF8zL42caFAlzPDxp95ypoX/mT7qEoczMdMz0vIWLSUiFtX4Z3a1T2aiqXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NICFUzoTMrwo/hGxFatPoc2/Hh0AAbQznPenmjbqpnY=;
 b=s8ReTpVPUeZlNPSkS0Nh6bvXvD1c9ChSfPz2+M6CF6/0Up1AV5DOb98xHFiewJeYvlxwXo1q++9TbtOVu3t1yG66wD0H6rYX/qoBxTUsedgn2zUPcYV9vT3GOVo9O6RHJSxyMS+3ZfE7nxj2NRa7GhjSo0mbbEA7SNQd0DpfCeYStxfZT8pqXULi/3P0PCdmDGkmp57yxnKJQ1JKalm/74Yy1+BWRT6fWFlMh5fUkFVBznkD91VAxpFAGROhY2tkFsJHD+vsFj/Q7Or9fAkaQeqjn3OZpzX2eoNBuYQj6Bra95AL4+Jt6mfZu0gWJfrcxPkav291rxjVeOgh93IIzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NICFUzoTMrwo/hGxFatPoc2/Hh0AAbQznPenmjbqpnY=;
 b=fehX/kcBVkCLeSMYcPsFAzMZME85H9mLgpGfzK3dG/qTFNbRkvTAPVK+v9MlwoGOkVY14mxbR66LlnCFVlw2VUAzfMK+dziIFDIdFAAAOes5xSULwL49izjkmysGPGR63aGpr3k3HuOVK/Xw0NcIa5mg5B/Xfz52lJA0DTUqSn9xu7YSvT20C37Gcmzu94EA0yy/h7qHEdSMFp+sCEJ02Y6H9fqkBDzXPcAd2m55x4Qf6MaokeIXG/WZYS0j7P6+jkMS/jI/AmvANjW0RvOO3OLfJtq8Thr1mMnLkw1roO682qKyuYUp4wnrXuX3JjxATsD+k29xZHeZkFoCDuhNaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by DB9PR04MB9915.eurprd04.prod.outlook.com (2603:10a6:10:4ec::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Wed, 9 Jul
 2025 11:27:22 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8880.030; Wed, 9 Jul 2025
 11:27:22 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/9] drivers: gpio: and the QIXIS FPGA GPIO controller
Date: Wed,  9 Jul 2025 14:26:49 +0300
Message-Id: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0256.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::19) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|DB9PR04MB9915:EE_
X-MS-Office365-Filtering-Correlation-Id: 957df4d3-ec24-4a40-dc32-08ddbedb923a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19092799006;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4BQnGD0uXnXFuAzKvLcNA59HbO+2dQSfmT+xQgMV9GlleCB23AicP9A3x2F9?=
 =?us-ascii?Q?ne4e+ipKeJRwevNdN4amg4MXoKba11LfJI5IrUq50/0XNFKxrEi4tRLj7+FT?=
 =?us-ascii?Q?MykjerBsdeGJLFJotIkJMX54Cs8576uRSCIBiZQ5TPhTheT832e+lp/qksvP?=
 =?us-ascii?Q?YS6MDoM4G1BGd/CAdZpZjXP80xBpt+rCvfykpls6FyYU5S5sIWCWcyb/u6ZV?=
 =?us-ascii?Q?FJrzj4+51QIy8DOKTXYvGX2nTpP2J+Bp8LtO8J6AcoLfth9kZ30P02SP2bk7?=
 =?us-ascii?Q?Ei7fPKHXjXYGRqd1Z1G7g9HMfr8wqyd5KgfaDwd4vAWR5biE8zn9bB98gIVo?=
 =?us-ascii?Q?fygGa8A199d0915CwomP7qGAdF5ybn96oR80uTOt3WCOECihqmj7BYZosj9W?=
 =?us-ascii?Q?JJM1E7hpwPK1fINQiF+Dm3HCnvIA2dii30NZziNVsMmYpzQYybfctKeUmNu7?=
 =?us-ascii?Q?2h+Jc95IZZSr1xWCu/6BBtuBPDxjNSU8S/PEF0eo/E1tcHBIXwZvr9+5VhsG?=
 =?us-ascii?Q?MHMsTU/NyOoMRjD2udz/vMKEQin7fS3QrvvXd2T19t8ja6tABg2Lc8sah7q+?=
 =?us-ascii?Q?hlypqAW2if/nO6RXDi89IoWVRM0/BkI+mv17gl0jRiKTQrnjxCVBvFC5vkJs?=
 =?us-ascii?Q?gGq7zoSi+t0DVBePgsSFiiG3UBitQKUSvIBkjNm9zncrI2Ccr9kO0g84AYl0?=
 =?us-ascii?Q?GkSDWwZSE9hsxVFhbgv0VoKj9h5rm04Iz6TPTevRhuTrTdKeWUwzl1bkU0GU?=
 =?us-ascii?Q?JnMqN+ODZGEKuRfEgPTz//iBOxCQwOBhQgPkmYN6X7BAH6MrRbLuhrhexmto?=
 =?us-ascii?Q?Yn8NQSuMphaRP8cqsPustyxoibKZejej2PJysnIhRUyt92OyODRP9GZbHe5L?=
 =?us-ascii?Q?0i4cK7FmMfai10sJkKMivq68rj4ZoiLRM+1k4hxaTpYI949XjUEJypOc3kE/?=
 =?us-ascii?Q?JeCM6jIxMl10IFSLh828itMSonrs0XhOSnonfFiMy/XSwJbm50RFkIfoTKuy?=
 =?us-ascii?Q?2YRUV02d6EkGucGmT/6S4JDSIAdA1tXLK55or50oIa1Kui2boyZAE7PlXRn9?=
 =?us-ascii?Q?tTwapNLP0ThJjVYf7ktfj9yrKHqHtiyq5ShPYrN3S3Fzv14IjHYOBg1Zz+j6?=
 =?us-ascii?Q?QKUm/VjZCloxzKdoxj98UAWGZP98YMT4isJvjxsKuus+jWKZCCBp0beSnDUI?=
 =?us-ascii?Q?ae5VKxkU2KYc9w2BOWluM/TWu2tAZn15jog0AwMv0BVNaY0IG4s9JdSMOysw?=
 =?us-ascii?Q?XEKd7Z0qumDvBw+vVXFNc9smEsihOuEfOFLKaYZhTAOp78vGvIB8h9P7GMs9?=
 =?us-ascii?Q?fjXaTT5wCwQlqUHqBwUhJwCSpcxzFUa4DBi2M67iSFdqRHBBp+LjW6K48ztW?=
 =?us-ascii?Q?PNr6SEMfYFbuPmenN/hlWSTfsIRo8wzXZtZYb1Nh43lZFcCA5WPCNF2bLfil?=
 =?us-ascii?Q?UVUx7Tjgmj4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TBfTuoLpAQARQMq9oLxjf2Zmm5YC9l/zvTQ1jE2ZGfl79DFix+G82mEzvoBu?=
 =?us-ascii?Q?NB2LcAOpS00cEeymfcGMWYR7t0m4fJ9cM06Q4iQM4+tBuUB1zhdgI6pLlXsr?=
 =?us-ascii?Q?lFY8QiysBXZ5t4+FBs6zsrR5rEmxY09axZi+ObuoJPHVPrTYLx3lHt3N0SC1?=
 =?us-ascii?Q?nvm44gYSSizE1m+GLASoEh0wHXQH3almgJ/+gHnHXRybjgZSTKqYbw9ZYM0N?=
 =?us-ascii?Q?lTmB2mC3ofKTTqZIpixPTFYBfEgsNlPxO6LQecPaHhQdSIWqNlITWy8NCbMZ?=
 =?us-ascii?Q?XdTC6SXEVHTZ5kySajKy6WPrxlcw64cF8otJ6f0BcSRkquUSnxAX58BaN4Rz?=
 =?us-ascii?Q?On1IXW09AVOzyai1WAzKseVn7HzGSh450zCAgEud0gVam1lAjwKRlCU2I9jP?=
 =?us-ascii?Q?Ox106j7VCz+1G2rG3XcXr5q6QNltIve2jggdqNUd7i+7ZxIbJ9qrzhtCDKwT?=
 =?us-ascii?Q?3PGgxUxUGj+LMQhhQ3FGHq2He225NVzd0bblkQhQfEBlLYBGVnrbXWXRlY0V?=
 =?us-ascii?Q?gBnyint45UmGQhx5xHxTfJ4fV3JYj7xVAg7dqIPvJcdN8slMwnYQBN+TicTU?=
 =?us-ascii?Q?BB7mRe0zNV709HAmifyCGoZqmRtD0dOGxViBM+KC7W6p1ms02PPMjhvaj0cu?=
 =?us-ascii?Q?brl9rbQ/UZSrVAy47eae05deJH+MldhD/No/6QJlywziRSSNj3vfyzjMkL20?=
 =?us-ascii?Q?9TzqOlyI9ybG3/9qVyWJ6U9M8icy2el38WdcttFryy38zgoRCFTM4kyQ8pBs?=
 =?us-ascii?Q?+OROolviOMhgc2s3TlJ4XQaieREbfXdbBxE62SkgZu8K+ffM7/vDs+omeVBv?=
 =?us-ascii?Q?csv4A5tZJkK05FzKgYc90m3rQXvXREmyx6G1/htaZmWhoN/NlvCq7MPgWFZB?=
 =?us-ascii?Q?sBCkkrzO8slnvYT35vQyrmtKq55nnX4QsXimYl3DYnTmEh5hBzEZWzXVwfiT?=
 =?us-ascii?Q?8sIsiPvUz+Qh7ASa2DjqXFo10CHI39O+MxL/a1zHYgyh/bgxrE9Oy4I1zdXG?=
 =?us-ascii?Q?rW0NAAPJo4aRzd3Kqs/BRx0VmOmUNLeg4IVQ9QOksgSTlqj0NSLv/2UymD2o?=
 =?us-ascii?Q?YOK6Yz2WLLLPYKJtYOgOVWYf5vaRZQDQaeQXuLzkkhKi53xotFc71d2PzT6N?=
 =?us-ascii?Q?oYJWyCPqApgg+VgpdTDgbcI3ySKjEkCxzptVj24Qmm1mRN7kdA6peG4ukmw5?=
 =?us-ascii?Q?FPG7UOASIzgiXfHc5woVFB4+1WXfWnzbgkKKX9VBQEBeNznDCAcQe1FMAsdj?=
 =?us-ascii?Q?xNgjI16afyz0aML9aHM3nJWst8ZlWvYP/pTyBesjXj56VR4HAcw7hjwAxOGd?=
 =?us-ascii?Q?5FaA08VRQ39msb3nXOakmK2oYYvawP0cKfrZRnLAoWWCLpgReFjNmnx3a4N9?=
 =?us-ascii?Q?++1tjI9wPxUHIrLfiixAqZWogv11VL0wiCgRBXez9qPk/x+klWAzNJuJgLzt?=
 =?us-ascii?Q?Z6DICDhY3QSFzzjMw9eS4zoaWevQyLfZBCFGpudpuKLlaW1oCq5MEkppXz5j?=
 =?us-ascii?Q?5jb1KH2sZXP5YdaNcRB73N8FT/5+LhOQ9XGMWEt0ncY2m4TQMLjiTPhkzjpw?=
 =?us-ascii?Q?mw9iWlQTC+kaID7txXAMr0IDPyt7OpR/qFaAINPo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 957df4d3-ec24-4a40-dc32-08ddbedb923a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 11:27:22.5699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4tdaTSY7VgRReiihN4cc96BzruNHKyJnozMzTyXV7DBu7AUceWLDGLfIiwN7lz3Tsn4cXWrGT88OHrUdWu8THw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9915

This patch set adds support for the GPIO controllers on the QIXIS FPGAs
found on some Layerscape boards such as LX2160ARDB and LS1046AQDS.

The first patch adds the necessary dt-binding for the new GPIO
controller driver. The filename of the new dt-binding was chosen as the
common part between all the compatible strings added.

The next two patches extend the fsl,fpga-qixis-i2c dt-binding and the
simple-mfd-i2c driver so that the LX2160ARDB FPGA is also probed by said
driver.

Patches 3/9 and 4/9 extend gpio-regmap and add the actual new GPIO
driver for these fixed direction GPIO controllers.

The last 4 patches extend the device-tree for the LX2160ARDB and
LS1046AQDS boards by describing the QIXIS FPGAs, when necessary, adding
the GPIO controller nodes and also using said GPIO lines to describe the
on-board SFP cages.

This patch set depends on the following in-flight patch:
 https://lore.kernel.org/all/20250707153120.1371719-1-ioana.ciornei@nxp.com/

Ioana Ciornei (9):
  dt-bindings: gpio: add bindings for the QIXIS FPGA based GPIO
    controller
  dt-bindings: fsl,fpga-qixis-i2c: extend support to also cover the
    LX2160ARDB FPGA
  mfd: simple-mfd-i2c: add compatible string for LX2160ARDB
  gpio: regmap: add the .get_direction() callback
  drivers: gpio: add QIXIS FPGA GPIO controller
  arm64: dts: lx2160a-rdb: describe the QIXIS FPGA and two child GPIO
    controllers
  arm64: dts: ls1046a-qds: describe the FPGA based GPIO controller
  arm64: dts: lx2160a-rdb: fully describe the two SFP+ cages
  arm64: dts: ls1046a-qds: describe the two on-board SFP+ cages

 .../bindings/board/fsl,fpga-qixis-i2c.yaml    |  35 +++++
 .../bindings/gpio/fsl,fpga-gpio.yaml          |  44 ++++++
 .../boot/dts/freescale/fsl-ls1046a-qds.dts    |  52 +++++++
 .../boot/dts/freescale/fsl-lx2160a-rdb.dts    |  76 ++++++++++
 drivers/gpio/Kconfig                          |   9 ++
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-qixis-fpga.c                | 141 ++++++++++++++++++
 drivers/gpio/gpio-regmap.c                    |  17 ++-
 drivers/mfd/simple-mfd-i2c.c                  |   1 +
 include/linux/gpio/regmap.h                   |   3 +
 10 files changed, 378 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/fsl,fpga-gpio.yaml
 create mode 100644 drivers/gpio/gpio-qixis-fpga.c

-- 
2.25.1


