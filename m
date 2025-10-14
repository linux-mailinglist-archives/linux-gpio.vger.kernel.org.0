Return-Path: <linux-gpio+bounces-27122-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 711D1BDA821
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 17:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2EC254412E
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 15:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66BC302154;
	Tue, 14 Oct 2025 15:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MpMQphej"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013032.outbound.protection.outlook.com [40.107.159.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627C130171B;
	Tue, 14 Oct 2025 15:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760457266; cv=fail; b=bfJnFNtfmSvxz5bXJK2J5qLP7mvfRwfCn5UfuRvIYStgpB5aXsKEQ99++Z8WpdcCRy40NVzr2rl/BCZvXKP8TweYQ3v8IHW/z55JvQCh++hdc4Z4HDoom5TldF1tTd5o4+nnIUHdKWHd98z+WEfEuemGDFmTieGvhkacmkzp/U8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760457266; c=relaxed/simple;
	bh=kvxGYMz/BAg4QOSqunkY+9dz9HUBl8yYSeG4Ozh1XqY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NhG/MFY8xFtay/AftVYUCRCzdkqK04lfI5RwMLCcFIiFq5L4di+B1pHiVMUZlkY8qwMEGVrRtUudJDSkUYfWaggxV5CFbm+fl8kz9pZo/Av0pfIyHMaPIGuCnOLYL9nS9+xhETN8T8twlakdt82oT9yCQuLo8932gyNnleCDWro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MpMQphej; arc=fail smtp.client-ip=40.107.159.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQTTZk1DVDDey6qmZIOjhwpTUoHd5G3lXlHZwJf2g+5YPTaVSZ9/gIPQPvYsK41kPFIwnxp5zjZthJaQ9FipUiLDgJZwzeZQe1ejDyGA9cs6esAELYztzr+ribkYfrtvFNAC/BWYVvlD6PNxkjCJS2YAtgaIcWEwOeRmHVu++8NqcguTQHG6nsNYoYoqzrXSUs/pcjRi8uWHdFchbM45leiIF3Qh3W664VBI5ikpG3qIRp5jC72Dl0Pgob8GZYtcGxkre6Uj2YfckoDet/lZN7gPVYuAvPl+jX5RibxtloT6aEoF2lXSWOsjT0hNMdcRa1awl4KRrwo6/kdUaFeBVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofb+eJfT/WiKcJLRxU3yI73D9ON3FY+D8TBDX5HQN/A=;
 b=J3eSCmdntVijGje9A/dTXWh2wMmc0fd8qqS0IEobdZJT4jdDO7Aqr0weLLO6ytqouY0jK24USyogaWp2Cs3XA/Hp/jZnGDrxvQ9QetKHbTW6a47KsQslygHbC/92Gh2j8YwUxy29zMXCvKrntswWeq++E8k14kvvB5paDiFWcdGFAXwXqqMdjWJMe2rzGBxEan/H7MtC4VaUIp4DuTzYz6Lp/juNM5cWgBWvNAE2WdXAKdvNSPNlZf8I/voy3T7RkfmxSmCJFPzY+P3qn9WPvhAnN+gyhHMD0RvrPlYikj0YTZdXLFc8LGAWMDy2B0MsSC5kQwSHoiDfMQNTsWel1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofb+eJfT/WiKcJLRxU3yI73D9ON3FY+D8TBDX5HQN/A=;
 b=MpMQphejF3lMTymg74x+RWH4kdkaVjP+G1t2844rgGjfoQz2He6ukVKLZrZ8NQHL605dZ5u7LQfvtl0mj7hKmFje9bmVBhbZdc8WQ863ZXWaQ//e/jUlBGiFIFUUP27xVtnp9r3fLMXnQydUzRkFivOjDTjZI+uQDCL8Kzfcq/lKXgRMpoNCvZH/BVWyAnWWQuZDJ+oBdhVgrjp6gsZP6QXDBLDh4e4QvX91gAOo/PhYAEVdvk54+xAPLpwKrQJn8DfhdS6p04sCdZyjuNBw0YHMlBVOByQGbbHdIoaWcCWDCIR5npO/RbDr0aWqhFGbW4UQkKxkRy7Yx3tB8S2CkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GVXPR04MB9927.eurprd04.prod.outlook.com (2603:10a6:150:118::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 15:54:11 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 15:54:11 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 2/9] dt-bindings: fsl,fpga-qixis-i2c: add support for LX2160ARDB FPGA
Date: Tue, 14 Oct 2025 18:53:51 +0300
Message-Id: <20251014155358.3885805-3-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
References: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0140.eurprd04.prod.outlook.com
 (2603:10a6:208:55::45) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GVXPR04MB9927:EE_
X-MS-Office365-Filtering-Correlation-Id: b6e92431-db15-407b-65c5-08de0b39eafb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sTFS3nptgf9sT+QCz9sVpIk1kYv4bHbid7jbcgnB6kd4xJIEHOB2N7cbuJhq?=
 =?us-ascii?Q?J09DEkoN5o3Kz35w/6KnzZnFVcLnlpiJNVxKmhMIhkh22hm7g8tg5wyz7ASR?=
 =?us-ascii?Q?KH7h8ljQSxVZmqIRlyUrvj/M2k5fI8ygpkKqmD9Qb5bnrig5CoVk2wPzJF1H?=
 =?us-ascii?Q?Iu9AZlQWZJZobFxxZU2gtwHl06hBXYlnaR//UF0ZmiaYwQxfi8m+Npm13Zws?=
 =?us-ascii?Q?irmVx0ZidR9YDDK26ZFxz9ON2heanAJ9xL8IXRF5oKuPqx0nbtaWcfWrIaRE?=
 =?us-ascii?Q?VPTgLUsav5le2/mN2Sb4RQtDVjVBo44Tt/DOHfH9F3weVNaOhwMfs77L/4DE?=
 =?us-ascii?Q?MydebMCZnmyuzPyBcJFFyeoYpK6aigIVxI8ZM79b6BN0HJ/AqUD1Riw2aaMq?=
 =?us-ascii?Q?/poJJqepBSx1vvBmJwSzEjO5K71Zn2x7kDciPBdYTnY+9NZlQARwO8JLz62r?=
 =?us-ascii?Q?KWjxZ7q2cHE5ylIVgsGZOgRP4lEB+/LfUU7wOXUnH8yGnAbtWCOlacxO4Rpz?=
 =?us-ascii?Q?Co/+cnN1SagNI5pMFcgYvh/68XDHRsGtpyjLPk3NgvzxGxqwwQq/KiLBmnua?=
 =?us-ascii?Q?dpndbirQjJqFUa2ig1YXnHpin1lG0y9FI/8aBRA9KeO1CS/NJ32gsgqDcEyA?=
 =?us-ascii?Q?ys7Au3DGmm5fPJJRGh/vguOWUSr8nFlS137vGgaICVzriQ0d5U1BSNSVUEit?=
 =?us-ascii?Q?Kx/6v/zrcnTfChuB3Z8j35MV4dOLGIDw6eIhKhbQRtOpVq3zWFkA+dJZ2gZ8?=
 =?us-ascii?Q?T+GlEAFJ+LBlW2AEv7ObOfsNJ5kYrotIZQcyLVgXRaH1YWmnioKlx7Bvywr4?=
 =?us-ascii?Q?sXCZzjTa1+4mL2au3CBNvCEWghE9+kScftsSwA8yqCqJk04o/IV7DWfJ28W9?=
 =?us-ascii?Q?clPzmXvTCpev+XUDu6LLDTcTOoJThClJyy5TFD3BkeI9HaqwbvdaRoomVPOa?=
 =?us-ascii?Q?66EPtjvw/PJMiluExNTGtKv1pEGY908ZbQ3+VW6iWOBz1ng40WsKEXXtsSTD?=
 =?us-ascii?Q?G/3cYbaJcveKBwMO2uc6NmSBJ1lgnr8wbbHA+wx+2O7X+RanDwO/pUU5xH/m?=
 =?us-ascii?Q?t1zqlSoqKu1aE0GR24p7i9Dav+UvG6Nn9SzesTQiGOHLnu6xC0ibbfq1DaB7?=
 =?us-ascii?Q?cF9bt73c2plnWm2+hahje1JbpKPFHkVuh4+8N3QP23SLC3ZY+kgu0xQRJV9h?=
 =?us-ascii?Q?c/6ffJQ2bfAAvy/Ml+YU57n088sDxqC6Vepp+f0//+cdmKAVVeVAHM8Ef9H9?=
 =?us-ascii?Q?8wXZqmYI+oQ9ONcV4vaF5BupKZxaZi75d7+4AZFQdRaB4XzgPeOLXt1MIe1U?=
 =?us-ascii?Q?BrTX44J/ZW3359RkUjL30ar30ebqfX8DeHnVAtM2RjlTungEHEaFl9Eviulz?=
 =?us-ascii?Q?fJP/q6y6pG8UOwcWa8ccr1FMv+BFNB1ASGa8Q1SGzp68J3GhFLv96DowMLcp?=
 =?us-ascii?Q?++pwUEehecwC2zMUK6L4+TJRdEmDmDcsUzMk+qDnhYbQfF3y1w2guW0xiXrs?=
 =?us-ascii?Q?Q+ImgYw1uHAO47c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9D6hHNMNqAoS3agB1CK+LymgR/c/yWqa+hjj/tu6xdYdJ4FeHFUZfvkwrx+Q?=
 =?us-ascii?Q?YmW+Gvl+h2sQsubI+2M3E3+rcXFBM7MMCWg4Vbis3M4X17LAwNK1ZVcSp/bQ?=
 =?us-ascii?Q?Ai9rQaql3uI3hoHAuV1/JOmGk03if/hq3/7M/j3Posz20ozzh827C+lwJiwp?=
 =?us-ascii?Q?fb4uu02Whgu17VIOaXgB6ByYaJwg0GN8eQTDWaRB12kGXBJDKR3tzBbzwSqx?=
 =?us-ascii?Q?DXrODK1tfOfeqyfKzRbXr7H/rPaCwwPYPZhIsprRZI2ULOkRQQN8WktOJ+S/?=
 =?us-ascii?Q?03PEmqP0LGlSwFE+3anXRxJTomHMBKORbPUT09zCnaqv8g0SUQu2YvWUSmIk?=
 =?us-ascii?Q?5f9lSBWjB9AhAR/wscC2UG4sbgrVMOUwgwzGGzBMklYbvSL9SwnEyQDbUEnv?=
 =?us-ascii?Q?7tPFhf2BASm+/yU3osBGwABVZopCRkVP1fIrlS0QvoRMlLjrvqMBfMEvvoM1?=
 =?us-ascii?Q?zzi7ktvoOr4eYLDKR9ugThyNi5cHFWvG35i7wnbw1DE6qzJAasxGQjd6yged?=
 =?us-ascii?Q?gHIuOO37J3MsPiPv6u/jkrF/gFgAZARGYzyQVyLqBA8RZMFc/FVmQBeV5CK9?=
 =?us-ascii?Q?jrppuQFHLRY75tcCAi5Q0DX77XtCOglXH1fIEN8N7kmEqs/pcU3q8dYh8ppF?=
 =?us-ascii?Q?6cmUM6QNlS2vZec4KZatSCx9PXFmI9XNdAXOSnWSKYYLwUEsFhJkq90ilrgw?=
 =?us-ascii?Q?VShb5RyCYhvuGomvJ7EjAd+ZBeyNciAQpMgE6B+sxtxhK2nCtX5hyf4XjoUW?=
 =?us-ascii?Q?xl4nTN4wPgM58+5E1V3laHOztCbdnc9PiW+ZyoMzvoVWOn+Mx8DU1cs9Rvr5?=
 =?us-ascii?Q?ekRu9ApIwG5wQiESHtumTgKbJH265HAlEFDGIHBI34/LSYpxdnjDyyhEcwVt?=
 =?us-ascii?Q?05UVRnhCv4XaWGrIA2C9PnghsTxl57IHRKdq7xWf0hXus2p8ldzI5cbih5f9?=
 =?us-ascii?Q?UdUpRVuim9z94q26P3pOZ8nBC6fyphfE/phyPXAaGomhF6Rpjjl9cCF+ChWp?=
 =?us-ascii?Q?q5eJXeakhzqiGWsGRL0QWKR5Xog1ewN0YJmIjuAg0/amE8FTr4TI/ouOMaCu?=
 =?us-ascii?Q?Xrl+c7UczI5Q4Zc5+p+MaE6aGUQvapWDUU37nMa08J4UO9zJsn/uQQ+hPrf/?=
 =?us-ascii?Q?AP2VJks3z3vUT7f2sQLU9JDW4I7VybcknGYtIiWbqkWQwFjZcBICk3210cUx?=
 =?us-ascii?Q?iTvxYqZb9a2hW1tgIM9fOvv3JDLDVkMKQW3xfl7mMiVXaW4d8odljkjLYrKb?=
 =?us-ascii?Q?8dSlRYq1r2Md4EoC2FSvzzSHO95ndWITc/wQGiECgBla+toYjz7adqttqpJi?=
 =?us-ascii?Q?cCVNI5JPH6JJZWyuuZsFZ3XoFrn1yVeP4DtVLc8cTcVFF9KbydswY3zkSmyZ?=
 =?us-ascii?Q?BjIQYmWpKlVlx82QXF9U3ozkkNcqloRO5sQeYcewHBWp5j3A/R9xj6ZcyYg4?=
 =?us-ascii?Q?0VlExpSDjNuJIdoRHWKDFv1QtLxQRBZV9H04MC8q/K2AtlE0Ag3xTo3VZeeH?=
 =?us-ascii?Q?QGAM+K5lPgGOZWgJ5wF67CFdNRTd6MryMiLfUKYDWojHVvcRHq3OU8re+CBc?=
 =?us-ascii?Q?ddl8Ax8/A2LCR1gA7nEQVdTEuFgsGEEeLkYrsRwF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e92431-db15-407b-65c5-08de0b39eafb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 15:54:11.8154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z2sZ8sZInEZDRa0UPs4nQAwEgPdTNXyRIQCUNOtAW+Pq4n9jEp8bXVvNPl46OIwx6/aVDZIb8NZ5vwrklTvKJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9927

Extend the list of supported compatible strings with fsl,lx2160ardb-fpga.

Since the register map exposed by the LX2160ARDB's FPGA also contains
two GPIO controllers, accept the necessary GPIO pattern property.
At the same time, add the #address-cells and #size-cells properties as
valid ones so that the child nodes of the fsl,lx2160ardb-fpga node are
addressable.

This is necessary because when defining child devices such as the GPIO
controller described in the added example, the child device needs a the
reg property to properly identify its register location in the parent
I2C device address space.

Impose this restriction for the new compatible through an if-statement.

The feature set exposed by these QIXIS FPGA devices is highly dependent
on the board type, meaning that even though the FPGA found on the
LX2160AQDS board (fsl,lx2160aqds-fpga) works in the same way in terms of
access over I2C as the one found on the LX2160ARDB (fsl,lx2160ardb-fpga
added here), the register map inside the device space is different since
there are different on-board devices to be controlled.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v2:
- Enforce a unit address on the child gpios nodes (remove the ?)
- Enforce the use of unit addresses by having #address-size and
  #size-cells only for the newly added fsl,lx2160ardb-fpga compatible
Changes in v3:
- Replace the trivial-gpio reference with an explicit mention of the
  accepted child gpio compatible.
- Reword the commit message.
- Add the 'else' case to the if statement.
Changes in v4:
- Add an extra paragraph in the commit message to better explain the
  context.
Changes in v5:
- none
Changes in v6:
- none

 .../bindings/board/fsl,fpga-qixis-i2c.yaml    | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml b/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
index 28b37772fb65..e889dac052e7 100644
--- a/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
+++ b/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
@@ -22,6 +22,13 @@ properties:
               - fsl,lx2160aqds-fpga
           - const: fsl,fpga-qixis-i2c
           - const: simple-mfd
+      - const: fsl,lx2160ardb-fpga
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
 
   interrupts:
     maxItems: 1
@@ -32,10 +39,37 @@ properties:
   mux-controller:
     $ref: /schemas/mux/reg-mux.yaml
 
+patternProperties:
+  "^gpio@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        contains:
+          enum:
+            - fsl,lx2160ardb-fpga-gpio-sfp
+
 required:
   - compatible
   - reg
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,lx2160ardb-fpga
+    then:
+      required:
+        - "#address-cells"
+        - "#size-cells"
+    else:
+      properties:
+        "#address-cells": false
+        "#size-cells": false
+
 additionalProperties: false
 
 examples:
@@ -68,3 +102,27 @@ examples:
         };
     };
 
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        board-control@66 {
+            compatible = "fsl,lx2160ardb-fpga";
+            reg = <0x66>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            gpio@19 {
+                compatible = "fsl,lx2160ardb-fpga-gpio-sfp";
+                reg = <0x19>;
+                gpio-controller;
+                #gpio-cells = <2>;
+                gpio-line-names =
+                    "SFP2_TX_EN", "",
+                    "", "",
+                    "SFP2_RX_LOS", "SFP2_TX_FAULT",
+                    "", "SFP2_MOD_ABS";
+            };
+        };
+    };
-- 
2.25.1


