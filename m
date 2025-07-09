Return-Path: <linux-gpio+bounces-22985-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C053AFE7B6
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 13:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B56EF4E317F
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 11:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3C82D46C1;
	Wed,  9 Jul 2025 11:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="N3GZvRZs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F86C2BEC2F;
	Wed,  9 Jul 2025 11:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752060453; cv=fail; b=lVx3GnGkptpEcCz4MnVf5wwHyaJcpKYW8Bgqke805y9YgVktcAPly4DBoo988b2PSE+Gm30YcnbDQmZl+QfGDfVJ0y3Rui/inqp57JHeqlGKmo2uEx+CKQoV0PRHmF1gqouYhurzDjx83bW5L4Iu3HVMbYWTyo937gtr62HskzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752060453; c=relaxed/simple;
	bh=rS1dlxFBzb0QGW1fmUrHV5AD/NdDL8tdWTykQ9qntp4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qojywCPeuptfpy/YBN0iETOtBqhnmmNawv4829ie+dKXTr8hwIpvoyU3TBnlu+kOMy9DQ+Xf/bx06niStK60+geYuIeTCvlkyK/y8FQfHrKK1qAPQm7u+tPwWMBPuLmLVXnp2v/KFQOS+CnsVWk1g5+xa6RNAaoz4t8L1m4vr1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=N3GZvRZs; arc=fail smtp.client-ip=52.101.69.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcZZcf0WD4j3Scjf1SWiLwWbcYDXSJXb7xYzhbf1x/NkjNKr3Ce3C7Bk+4lLaUe5nbsbMFRJXWqSwjVz0IqpVjn5w1Db+GVJQjVB8saa8a0V1cLjnm/qG5tRlnE7LhOTBJ9jLM+x7PTT2q3x/zFBRya4QfI222mLg6o8blJYDhG3+YpN839sNnC4fetCs9HmGdF4f1MtDMMc1t7yNkVeliTUzcK2kw/inoEmMcfeuCCAAE2QanFrc5HSScRVKuaOPnBgKshMwDmgwc4gwe9yStVq1odgoEtDqfCtD3ZY3uxymm6M5k/GsNw8FjZdMmLGL6gA9DIrsgUI8BXvWxmXKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dn9FpUymTdzW7GI7vUCAEH2tr27h/DTzEikXzzo+U1I=;
 b=ystg6QRn1Wtj7eF4ctE0dIwA0Bf6QcewYa4EYrHa07cXrpOo0Td1W8XNpdfLf688CJj1nTwBHwDzkjiUqrGXM5AxDxPM84QUxdZorsugKEWotH28tnIVBCrHJs3Ncxh/HpvDws3nGdgxfRSsHv9K4fGsbaZWFRLtyPAgy5sfWHr4T2IZZzEWmb3VPDAwh6uAqQ+ie+Mu5vuQR2YWVZfvlK0yosIxIM8rcys5o+1hAnvh7ZOHxU0EzV+a1LLicJMQBtRivP4PxDInf7wpIZJbs+GbCDfWl7pclCKfznqYWBYsDB5PFuS/wDx8w1enXGHHulAuxNXmX5RxOdOwkQJYuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dn9FpUymTdzW7GI7vUCAEH2tr27h/DTzEikXzzo+U1I=;
 b=N3GZvRZsikQ8PL+9b3cljFk4BUctA8YI5ly0dTMR60RMTjZXkHxXDkvmXPiH77OdaKJVWqCjEqAdfcChunOrKjtkK8qLS2SWfzhyPA7lceZcjU2Fqmcb5l6R/VqR8Wbr3LVHqly5l5IJLU4Mc7HqXGLzFTXOGxahBnVS1rz3GY5WMajoZfuKUoBz7OEJkUigQLRvjEprwy3l9DBsUMe2jQcVKCcQSs/CsG+5lPtmofUiVccT6Bi049c9MejNQuzGyy4z2VZ0ce/+/a02sC90tlJyuy/pjCV4uB72pcCPWr6Opa8fQFXBgf6AYHUUm1D/uH1vQh8pr1sxs7OlW4EXPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS8PR04MB7830.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 11:27:29 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8880.030; Wed, 9 Jul 2025
 11:27:29 +0000
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
Subject: [PATCH 3/9] mfd: simple-mfd-i2c: add compatible string for LX2160ARDB
Date: Wed,  9 Jul 2025 14:26:52 +0300
Message-Id: <20250709112658.1987608-4-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0266.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::14) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS8PR04MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ef291de-8ef8-45c5-b492-08ddbedb9663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zrtufz4RPlvLWN/wLpGEjMLq37anTm+W2QfSDkIFGiApzIXfixHtQWaQ17PB?=
 =?us-ascii?Q?tN9afVhzDs0uS56RPsEcduerr6cgzzp54pjCMf3q13fl4rAam2P14KATdCuV?=
 =?us-ascii?Q?ynvpYIbnvr5psAcAifSblnvc2Fk+/AZ8nCcZfRbA2A63aZQU5nTS8MM5m0GZ?=
 =?us-ascii?Q?JtLrHoXXbjVsWK1m58HXlwiGBG3ujVfy91qTy/gStKD9IUAE/ptlaHKOmnQc?=
 =?us-ascii?Q?0iOq3MxzcTI3jX4IWh4zUceKxAPkGtERqhesTg7p7BqvTT/8muYHpqzKUafL?=
 =?us-ascii?Q?UXDL9BRO2sPFBDLlNLdvG89yuNy833AsYw0uubEUvWaUXosswYsh5KRdBD/y?=
 =?us-ascii?Q?ogWr7RemynvDx/ZoiaTVYjX934hln3MIevjdVWJlOU9VhGJ6yo9T1rS4xtG+?=
 =?us-ascii?Q?fUKRB/2X/1kL6RLWrGMnTeRDUuDAnXjKUy9S2XK7Bpe4of7dqmg6m7KsSlJX?=
 =?us-ascii?Q?dyzwLeQC4bYTCOorzOemDtVAMffyFObMxEEJXIJKag68GI7G4bOyVI4NUtJt?=
 =?us-ascii?Q?7XovZoxYQ0xdFZyjRh92CwuYyxIQPQS/4cJ8RWBAM0cNmB0H10BsIaEIS1Ve?=
 =?us-ascii?Q?h6n+5hV6tarn1TA14k9gHmhQmGogX6/wdlvC9Q/inaHFZZ4pf49IAyzgSwiG?=
 =?us-ascii?Q?zu76HXrPFcGLLJ/vhKebvDPRchX0luHD0IGg1XtU8saoRGeY7mJGSwrqZhuX?=
 =?us-ascii?Q?P4u7MYKGhScK3VcCyWjc8Pu4z9OY/0ed7G7FoXTDzHRKA/arTj5/I9bl3evV?=
 =?us-ascii?Q?AGOLmIsvY5iszskxLhjRcJNdgIMg4pe3oTzFynmwgeYu55VyZ0DrQu4nzSGc?=
 =?us-ascii?Q?iOP9FGWGmNT4rWlE+XI+G/szMLYPL/DR6IfuILwC/ybUeXm+i0dSPfadqTwl?=
 =?us-ascii?Q?DWdMUcnkYzwngbGMsCevwpVqJbcbu4N3QcoGy33QTIV6KU5q/L3S2l0ciF9n?=
 =?us-ascii?Q?qq7ACXj4AXThL+fL04vn2bBb9zrVlVHHD44SmQXQFJK0+zPMLnqAn9sBb1lo?=
 =?us-ascii?Q?sckynuhn8Z60Ht5qpxnQEJup5t872CR//VXa/+7HFeXwZBvp4kzG8SlWUBeY?=
 =?us-ascii?Q?tGJ7QTQJFflnIqoEwAYmPtvWa7FNDODfGIrum5xYMfUY+XEezgVQn6MVJDkQ?=
 =?us-ascii?Q?4vKwVeg0uNf63ggiuu3u3q3MrlR9TsTsWwtoIQaXGRZbgOh+HnbJyzKMrYPN?=
 =?us-ascii?Q?uyMHE/MsiQfE28aKex84vtSBJsNknsBxTCQUnnlXmx536Q1LC0KHsui/gFKn?=
 =?us-ascii?Q?AHhMRvx2KaXFltMwRLUrbQp3HAyIhpCjRrPifOGD9mds7mQN6P2K3c7Lj2iV?=
 =?us-ascii?Q?Xb5OGgiXwEBfo6H4q6/idsG6TQraejjZgW6olc8RYyY5O+jAnLXFrXvD8O9G?=
 =?us-ascii?Q?RXasmYLOhE+WzEfFmszOgsGeuRCrYDgaUtJPK01c15cV6o/f1eIHUBfM7St7?=
 =?us-ascii?Q?p1PecBaswvM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X9SxZDSWAZ9MXZUx82Np2Y8C95CnptzGV9A+5hQzcn5pJnHwky9clBIFMo/e?=
 =?us-ascii?Q?X9GsTYn4VQ35ClxxuSr5n4KevDVo/vhu06Uc/6Yoq+S2zQI+l4JKj5P1DJtC?=
 =?us-ascii?Q?rEvxXNkD8HlSRKEURZmHzQ2X4x4XMyR3cRKMey4YWNKcHW+wSjRkOP7g9Iyk?=
 =?us-ascii?Q?RHwRnN1k6NURSXvk+arAf0r1sqdVWLyt34P0AsmpETspWyHfWPHO9paft0br?=
 =?us-ascii?Q?1RweFe3QOQjlQ1qqW5LYS9owSAZsU+F9B/cpJ97R8G6zCzjAAxHTRhNpjGJJ?=
 =?us-ascii?Q?nJpgdO+GNibRYvv1jrEhauV3zehBwf+9BDJksz+vkFCUiFRCQa46q+ZHN+he?=
 =?us-ascii?Q?c8SX5G0t/3WRD3TgVoTCFC5VaOxZWD2bCIoIQop/KzicG/KN9TRbwrrMIx3t?=
 =?us-ascii?Q?cKlx8aPRNeCq2dJKG9//ARzPw5k8Ul/wUgaeJclmbeuOEQQJiLa4gwtwq2p7?=
 =?us-ascii?Q?ap7iVTPMKVdEjmfsp5HuyGybIff88NHlsmsUz1nr/zP0wO2Fgp+KX+If1x9o?=
 =?us-ascii?Q?G7buJpWy9qZKEcyCSjVqOFdCEFYlcKOqqw+KDUaYhYNlB8LeMRUjzsPvzQp+?=
 =?us-ascii?Q?BUODPUO8NZAGRqGbWn3tHPISSRB4tETgsRUSAQEVpc43SLxk6S/+eu4PH/9o?=
 =?us-ascii?Q?WfEYJnjLDY2+HkeE26dLqocD8cb4+pnRJOWWnZpvbVrVZ0PNveAAxYzisWot?=
 =?us-ascii?Q?MaU2VtM1Q7Q9Z7xmaNEwTDqcsZoVivwNbCz2SbWNvEQL5ireI8TqEl0jmwDo?=
 =?us-ascii?Q?1CZmJzzXtg2t5X/E27zwOHpEwIJjuD138ihUmqQIU4zIgWEIzRGPU7Ym4Kk2?=
 =?us-ascii?Q?KjJQfSFoK7nxyTHJMNwlX+MBlr8yxS59Lu/MgB311JqH8jo9rPnBqKqmt5qA?=
 =?us-ascii?Q?V0L4Hr7Zg6saOhEstONQ6EwZjFjMglnxDrh7waLSWPaAflQajWYQ3u3omMvk?=
 =?us-ascii?Q?bOA3XkY4pah1cOOUmhV2Nv5wLvFPUlroyUCc2DKQPc5KSEyxNEroUsxIu62D?=
 =?us-ascii?Q?aEeA4GWLzwpgFAAnOpVMlRj6wYHFh2IKq8CyKzmn7btFI8CdZomW4jszuPtf?=
 =?us-ascii?Q?ARIMlapVl1+N4mYoM9wTaLDZkXF5SzDBq6cdu5dqpPO5w24QLj5tO4IS0yuN?=
 =?us-ascii?Q?b0XuBPvcTJ0v8f1mjioSeuw5JN5d2N0NyzeDo+iWkj5vRtzq3kLB0uVRWK/e?=
 =?us-ascii?Q?E9iTttOb4OV9T4tyP9YAJ3OC9fq3/zAdD3OG71glm929FqALPGQIdUwF9dCi?=
 =?us-ascii?Q?6hV7IGz7izvxlUrpMBnCgJ1TxxSXY3tRn1GRCLSehuL1cX6KM7Zg0H8cpRX7?=
 =?us-ascii?Q?kGgq0LFtHdxVbpzIP+K/JIRLV5TWJSGljOn2CVHRVGZT7Ew8dxSlEH3Gh6wP?=
 =?us-ascii?Q?jHzEc5jnOX9Rx4fvytvYh/1sfgiC7o03u8pd4zkoT7OKSExQ3vl+zUHBYled?=
 =?us-ascii?Q?p62GKIUTaVxWWkfkTVxrVFalPNTrvUK1ZwYcvT1w8CKbFA6hCeschrUNr44J?=
 =?us-ascii?Q?T5KKGuEhTTFtw0hXTQ8R53AdZq3GXLzko/g9xv2vWfjXyYyRz48FBbbMI4pI?=
 =?us-ascii?Q?ix7MMN9il1amqcAbLktb9Z9BDV1YuwcDmhaTgXmf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef291de-8ef8-45c5-b492-08ddbedb9663
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 11:27:28.9186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V9TthFR3j2EwS3AKSacj9ilvTnF5yXIx1p6ULTinC2Z/QkYRAiBYdSFaujDWPLHa/enqZ3KiZwsmR2LkcQzlAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7830

Extend the list of supported devices with the QIXIS FPGA found on the
LX2160ARDB board.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 drivers/mfd/simple-mfd-i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index f7798bd92222..9e6bdb0e1796 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -101,6 +101,7 @@ static const struct of_device_id simple_mfd_i2c_of_match[] = {
 	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705},
 	{ .compatible = "fsl,lx2160aqds-fpga" },
 	{ .compatible = "fsl,ls1028aqds-fpga" },
+	{ .compatible = "fsl,lx2160ardb-fpga" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);
-- 
2.25.1


