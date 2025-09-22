Return-Path: <linux-gpio+bounces-26464-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1B3B91AB2
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 248322A568B
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 14:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC781244679;
	Mon, 22 Sep 2025 14:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ms63WAWn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011019.outbound.protection.outlook.com [52.101.70.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F75C236A70;
	Mon, 22 Sep 2025 14:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758551093; cv=fail; b=phOzpn6M0vz/6rI13c41XakEgBIUOJOH0zeFHfn7V9SaTUb2wru9qMC2ca05EOoTV/kFiFRAfkZ9ZWg3fwx3X1yE4Xv4dt+rX2ZR42yqHxct0Be7KT1eJt+mr2zh6KQnm6L8VBAg63j/r6P5g69qU2zEnAm5jh0J7j0k79I7LK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758551093; c=relaxed/simple;
	bh=F8JJ1KeMsAiN3fToX2CJN6FbXfFc2/Rn3vjKsQgTISU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g8+6rOjmPO8q3qzAMQdzNwEGIkw3g01KrznUaqJyBORtG4ALb8U44SiuWUNAe/TGeOGccU3Q2HMuMms8vvmYXXygqDnw54pmu7awKO4MSS9wa2PJgKKI/Mc4ui/aUHFMSBvEDqByYgcrF3UMB3QVi274Xo/FwpNKbFkzX6xxTkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ms63WAWn; arc=fail smtp.client-ip=52.101.70.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ta8nLAqKw9DSE1mBDmQgPDolCG+mxg6mV+kKK/vi5WOKXG/gBGuboYGesNML3OUYTpcnpZbyCZ6tAtmU6Ynb0CGtbEHNZIEObwBYF7ddM71ElEMRxsvi1a7KGfDbVmIKsQ4gLdXwMG4EQRkcHy0BWd3nxSd45t8uKWjIaejhw7IUl4tGgJNhALMXDZ0ixhe+qT/tUKhKMuXUk+6j960J7CZReNnmW3z6iV9jfJDOv0Q8Zr71FUB9R+45+0BMd/kwyPmz+iWCpmklucojwz+lw+Q1Dh2yBk1yqZr5zf0e51iwzwkcwSD1bov/L0cIRKTdPsmaN5Px91OO0rlWAbYzTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7+duBxB5Qr0ltVKX2ZAiQvu35uQfETAn2Ga/Of0Q9g=;
 b=pIZfE6c0PYouZUATWq0m+7UHjDWlEnqFxn1t+WHbzeO1XeWxEsH0bF1cw8r3rh+ul6rpZ5Fp70L/zeqGH1mA4GollO7JxtZLSYq4FcsNraJFYlnSv8ezEIvkfXO7Rc7u9RwRW5MgxvCNSkUz8e4srk0xqvNsgJpDXgNszIq0eU0vsL3/nosYHIwCrfJFgW+gpGVStYorhUgueyUJvK/AMNxOxmGFEglgG5j7DlNkexODlRx9Gnvc6aESUw//MJLhQkR0klP8la/e6846eo5+Hudao+IAMsE7H8tUqcoYI+elbXbqB9QRGl+gQxClG4L7UVzIqewBvAhTPZKvehNqhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7+duBxB5Qr0ltVKX2ZAiQvu35uQfETAn2Ga/Of0Q9g=;
 b=Ms63WAWnNpRLL1Z8o73Yr3PYVDoSPkYUs0ZKAwKyAlIzSIJgRGsYzrtM6dymr3QfhgkDsgnOFkvFx3E3qLILlLSKKly+4Oj4OjS9V6VVd5yKnrPVCpKN/p2CTMo60hrAVAvJtFjWJIcXd1zPdfkhBtjpbZr5WjAc0k9P5Gn6DW1Vy424BLQVI6xviO0sC5IAzo5p3+5qWMTOafjPsGDMrOrulvHSYjQrdAj2iMzo+VVneRyFXFCip0US7eCJWPpnVf0CaRr/1VaMyo28jckH2Tt/MdejLqPVMYfUu+bI1dSIFCleKOUphtZSyii6muOUr+5akLpAYY8JEaAEVVRYIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by DBAPR04MB7207.eurprd04.prod.outlook.com (2603:10a6:10:1b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 14:24:49 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 14:24:49 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v5 05/12] mfd: simple-mfd-i2c: add compatible string for LX2160ARDB
Date: Mon, 22 Sep 2025 17:24:20 +0300
Message-Id: <20250922142427.3310221-6-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
References: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0035.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::14) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|DBAPR04MB7207:EE_
X-MS-Office365-Filtering-Correlation-Id: a0c48d29-222e-4e68-45ce-08ddf9e3c961
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c4/kBb4uNBTG95bPLK4nVUstDSsdxZ4pA0CeGDCbwj3LQBIGPvpOYqaW9KXJ?=
 =?us-ascii?Q?ay5yyiRW0Eq6m1ci1zK4iaOnYiZywOJHJd4LrPRQpSgHhP4E9xLrehFeSZyZ?=
 =?us-ascii?Q?CfDfGQcAucLfiNYwM5RevCKx1LpU6tTZMjKhK/SYyMFv4QSZj9IiJuE1R6m0?=
 =?us-ascii?Q?FG7SL7KQH2cHQ0UeznSXb3ZsuuIpDpzaWB7nI21cUeuhUXQKYn59rMVdEt4o?=
 =?us-ascii?Q?8oj6vbGA84wJTDiJZ/HSx3HXeBuORh4Q8RDtrbhiDkOw1a1SnhIRBizm9YDu?=
 =?us-ascii?Q?2/6TaYwkMY5EJwoq+rn9LgPtgae0YQj81UtlczZ+Yp2t0eWKlv4byavNuUhq?=
 =?us-ascii?Q?MSdLlbHrR59moNJFa5AMF6pzI1JWjuY842WMrk2VRO1j66DBzzWB7Yu27hmR?=
 =?us-ascii?Q?DTWxqmTpzoG+tjJanMT85sMBvnve+kizE8pDkOKOi2a3l6oh3WK9peoVH0pY?=
 =?us-ascii?Q?MrWk3CMtNeHXNoUPLduLUpuxHV6aKlSOkyVDrDfuQeMo7M76zvL3At3Y4mXn?=
 =?us-ascii?Q?cwoIrc309NMLcEZAeNgHRWUsSs6JraZmTwQqY4dJULkTwUyhOLrZsMx+9Pn3?=
 =?us-ascii?Q?TapfqN1xhEIh4RT3AjaJOAAFbJ28eLmxa7h0FwsQ+iyhT2BKjyou/wyfnZ5K?=
 =?us-ascii?Q?UYJdPMYskdXM8qdZVJuKd7embUtdFdXgY7xvjc5l9PxbNwGhN16Z6BI2h7g3?=
 =?us-ascii?Q?r185u4/oEM6LYNLCpfpjqvnkwQhElFcObFpS2LN+/IzA2w7L3oRqBBa5zC5E?=
 =?us-ascii?Q?lNtend/OMSNqIbpJI2c8CXj/6hEY6dE67Cf4zVvlvD0t8uQa1y12XH+QRLtU?=
 =?us-ascii?Q?VCFUqlzKqEwxF4+xL/CN1qmAR5KvtTOun3N8wl6ElJyODaeiIoMNj+oD6VDA?=
 =?us-ascii?Q?xjGL6n2U7XT/qU6UfIGkw3NWFAr1+EPe4EYiSKc87BeEAfjgsueqYWugFxmh?=
 =?us-ascii?Q?OhgkvA5OkENle3ZJlUIYxBLdPK/4Xqt3IlQEEjtszN3tEoKUh20jIdHcrIRU?=
 =?us-ascii?Q?MFOQrGkwhVFq0sPDL5fklUf2Id9KKRRcOH/atNoliAD6AT8WqwrHFtNe+yPS?=
 =?us-ascii?Q?M2rN4XZPGIbTF67NsilElP3qytLnBqcRF2mYMEc7k6+gCPfT3xdxBA+hvSsH?=
 =?us-ascii?Q?Rqpmd2zemZx04RJO4g/hRmMdQ7QLUtKwlRd7ujJi8YK7X9jtLDaImMrZdCY8?=
 =?us-ascii?Q?pVBDAhpAAiTvE6HNitDJLKA/4NP+2hZFpJReQlXOJ92iy40900i+hqzuf5HV?=
 =?us-ascii?Q?sTzqMOkimhjwW3ZBzO7RQa3iX7SDYs46auVZS2rU3jom4uOlGGlhZmMQJw6N?=
 =?us-ascii?Q?HmcEXQ697tXkfX/KNkLwGM314oCSASs2xF6sxQIO6+quPgb6dHZvqHA8K93R?=
 =?us-ascii?Q?3i5vSzjOu550QyNM0aYf+FO3V+0fLLJN6yQ0FDpcR0fiXEn/PnW6gROuz5oA?=
 =?us-ascii?Q?FXz/5C7WFFSbHuEA+DnluCgAPC4iVC6zewqzObTlJVBDEa6sN9sYGA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9DVlFOcnTilSf8R4MDhdAizFbzh3kxg8MsJHQdZzdPnufmEc7+PbpPHfbwfs?=
 =?us-ascii?Q?0WhgM4najL/wPlxnyA19vMxlrR85rYA4v8kSDXC4UiICKSR55iU49j+/0qLm?=
 =?us-ascii?Q?S6wR5YjxDkw/bITeRrLN0nYblzgIIoIrHlrQcP3HPLw/tGee+G3btuIBEHhc?=
 =?us-ascii?Q?g5gFTS2NrnuOeKN2tWJ22rMy/1078rYyOfcvXmSLpuVnjcYKY1v7vLpj7Mah?=
 =?us-ascii?Q?d6iSGcyRNiT7mlxmbeJUHeGPCEIMmfJPGIEyH4Q2k5QlGseNfX3R0YoTu+j8?=
 =?us-ascii?Q?IiSSqbIL9a+yTyupsjxLMbSU6hFcpphOOIgxLPNAWx3ZafWlhQ5KlsRmi/F2?=
 =?us-ascii?Q?xTMI1AErsiD6f2ZBW21/ZLIm/2oqvXs+ZPwFYi2eMF1eYVSmwhW+gKVDKoRb?=
 =?us-ascii?Q?EZkIwmrsXjqeRgErhMPnv0hmWHJUkZXmaw+5ZUjDQc66j+gH4qUgEdO7xWtq?=
 =?us-ascii?Q?7ts4NEY5hNlYLp/4lfm9jhW6sgwGD2BoOGkv8rX0+rsrSQoyG+97bOIMUlYZ?=
 =?us-ascii?Q?yYZZY2vr4RXIErN5CtBzqqs1BJsrTgBjSCCbMr6ruqk0tTiff7Uw/Ju4PR6K?=
 =?us-ascii?Q?jrEq1p9yuqRf61jYtQsxEIJ7wh8S/Jmpan9tJmQO+/8HDdWy2/pMQjsVVkV9?=
 =?us-ascii?Q?Gd+89BahsmEVVRxRihEnxH68S6SMFheQF+iAJ/hd86CtMSbsF0dk6iq+16dW?=
 =?us-ascii?Q?QWWUUMjan61egR0zbru0ye3OnsljPqaSJW1QWPlKSwwKfXtV9Gu/kVAj1psr?=
 =?us-ascii?Q?RM27v8kALTvIYcFcDFJs37FxUBLIkQHO3LFLkWaBrFLs4QKngBlmq1qWmF/a?=
 =?us-ascii?Q?E+lWYHjdwoEZybKPaCJRAJGzGDVzvdnav4nD6BJyuINnEeMG3wE2KcNb96z2?=
 =?us-ascii?Q?Z6I87GG6KXXhKL9YlhK0g5jWBDhhUDVankzfwQNoyHoxDVfoesDy8NikRKjh?=
 =?us-ascii?Q?u6cy2Wh5WpbEvGEOjaAutPnfMO7dP9fxac++C10ZrNea2VlLdg1Wkkvq4B7O?=
 =?us-ascii?Q?l1pVPVae7zt7goE+qnPXNHWeizdVeE22QbXjN7G+iLtmu2sNRhC9Mfr1JGnA?=
 =?us-ascii?Q?PmQHOscjlcYFuQnWUDJZxBGcFtAmq8r3Ctt1c+qcgIQk97hclmDTQVAx7h4E?=
 =?us-ascii?Q?crGKgN9YAXFdsti7ATmmuH4+EnbyB0Mt0qHpuQaArH0U/sWKCFxMJSywnXHs?=
 =?us-ascii?Q?diGfzLM4XDprbQntWk9svA4wYjVRYMUB7JqfXsKowFvlH6m2RZ3b8BiNF6Ur?=
 =?us-ascii?Q?LoSqIBw71WMYY39/JQPs0yqI0yX8r09CBu+bufdwaGlV7CsYDEBBIPbV+004?=
 =?us-ascii?Q?1hO8i/OkQ+O0ouxea+ohYrHjyDAwoYBRQWkKkZRbF+ZJiQtcWBOgsRRhvTWK?=
 =?us-ascii?Q?NvFndPm7ys3oyUgXrD+8FjzVvM9CbPGknJiey9s2gwYqEiiZBJcRm2rm9jLq?=
 =?us-ascii?Q?jSvF+c+QRABGkHFVafyzE5sVFiVW4JUsDg3BcFM27K/i6sGcCOmBijL8Fwv2?=
 =?us-ascii?Q?qHkg18OlTHkaOLe/0tJJPnKFYo/UE6vkaj5DsWY66II8Tf8n2ypZ1SP1YkEA?=
 =?us-ascii?Q?QdhH7C66Yj98++yJiIgKAarSvz6xTaF93vIykwym?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c48d29-222e-4e68-45ce-08ddf9e3c961
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 14:24:48.9042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Z+kkQNg5CNeXThH28ih9COtIDbAB66WuuS0m7wOCqzCNRnHFiV9bdVwdrWPnhCT0ebe3vx6UStCiu+Ripi8Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7207

Extend the list of supported devices with the QIXIS FPGA found on the
LX2160ARDB board.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- none
Changes in v3:
- none
Changes in v4:
- Insert the compatible so that the alphabetical order is kept.
Changes in v5:
- none

 drivers/mfd/simple-mfd-i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 0cca7a9044cd..0a607a1e3ca1 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -112,6 +112,7 @@ static const struct simple_mfd_data spacemit_p1 = {
 static const struct of_device_id simple_mfd_i2c_of_match[] = {
 	{ .compatible = "fsl,ls1028aqds-fpga" },
 	{ .compatible = "fsl,lx2160aqds-fpga" },
+	{ .compatible = "fsl,lx2160ardb-fpga" },
 	{ .compatible = "kontron,sl28cpld" },
 	{ .compatible = "maxim,max5970", .data = &maxim_max5970},
 	{ .compatible = "maxim,max5978", .data = &maxim_max5970},
-- 
2.25.1


