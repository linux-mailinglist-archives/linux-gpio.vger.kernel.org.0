Return-Path: <linux-gpio+bounces-26382-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01634B89A91
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 15:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7D8D3AF86E
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 13:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5AB3126BB;
	Fri, 19 Sep 2025 13:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="geG/+cEq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013044.outbound.protection.outlook.com [40.107.159.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3ED311C1D;
	Fri, 19 Sep 2025 13:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758288384; cv=fail; b=POPI4neGUvQFZUE6+l/2saZ1c7DGP5nr+KoRWvJO4AYjPsK1hWvMJFxO0GCAW3JH3I+BGB2h6uyYG3GxmLMsIlCREUekDcMN4qbENlu4OnYf8NQbYydgMZifA5GWRw49+G9aBYNVdpHOYi99u1UsRm4hTsF5e7NEc5+IhoAdp0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758288384; c=relaxed/simple;
	bh=LooZ2cWxIlVoxVWUMnh3La0ZTlTZtE9/Pwkmb50Q6O4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dmkmIL/9iAToqt6TYoSdpDb7I2khoiMyJVqUTsCNVX0GjmN05Um/7b4aS1Z+J3eChgT/AlyBszb4jNX9Rk7JShaKiM3F5KQEOsAvqyxLLyIRTg3isQyqk/tWbjO8VIoNsKklm7W1vXlDsTczTJFCRjoRREB/oavjPoSQnlIoddk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=geG/+cEq; arc=fail smtp.client-ip=40.107.159.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qhXOtVhxxjm9+j8C2MndXOP63BCbsDM8L+CP2+TKug4VYufmxd7YtNgVvJf4TwvHXjDoKmQtrrj/iFDJCoFz2PbeCvwiQ8TTzCz9aa5eAIxIBIsDxrq2uy4k2hAbqoQ7ojfftJNuQ0cpc4KrOJ4q1U2AjKJIVl0EUoGsfYvKi9iVRi0pqkkzPZhkKI+hfeXAe0IeMpfAPUgok3KLGGvkNjvLWc+7lIuo/RoxxRfsX6ejy1IWTUCki/GN7vnGHOYhCNBnsNqUDABz3P+HE9ADyl0ih/EFdShHZqvuoAK8KxYbqEk8khhJUre2Ph+we/GgtSmceIwO/i1xNbxgKLeFag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WizXSdou3G8sYmJ3qIDx3qV2cywzA2eWq/PDgsQR+5U=;
 b=ta188plhIb5kmoMQUy223Ugd4lwLfEUc7T4nvxfo+8izZ4j+CoxPTSnd8hHSXxE9FlTLvu+/eFAYN3SewgCqKw8gICs3szMk5ssNWaMVxMAAz+nM+L6TJ3xg9f4Ybo2nUI+zEOQyUIMDMHw4hA5MAL6kW5pXN9m1u22ZfsjuU6oYGqnnj2cFtjZaWD/FgvvE9KQy6qLpZWR0AHfYY26NV0dePGz94KJBLRKW2uNnFsuF06JYzcCRQ86i9FwGOfLwUU90EloNL7gKoIFooRD24VEw08bJYSBwUqpZoehxOobyvCmcakVPMBo5inqWvOpJddrxN9NBgZEIvs1hrk8d9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WizXSdou3G8sYmJ3qIDx3qV2cywzA2eWq/PDgsQR+5U=;
 b=geG/+cEq0a4vtpw2/HBZcZ7TIL1c3Xt8tvUg8MqRq+ZS3k99xo5wufYwbaHPE5PMJOF0v6/FCBkzkV3bs/LlDNLP3Ah958rASxA9ClGFMxr8RVsNjtxn0tlu9OJr5j+pBsk1M+WecXsWbrGWV/vQYjsUPXhDWpI6U5ddY4T751Sa19u67ipRCwndXaOFTOc/WQaBI6E7s9ZTBth1Q/JvoC8AuK9foH6Nx1gRaUgYzGkc66YgZUBCMEFosOEXDfUiVhXk5DyGk/60gFoO2rudJVN3t620fYWVyTE7OSi31l6xgPF9SU7fvdkurngxnUJ7gmTrWhmsbSDOVbF+ppOuCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 13:26:11 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 13:26:11 +0000
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
Subject: [PATCH v4 04/11] mfd: simple-mfd-i2c: keep compatible strings in alphabetical order
Date: Fri, 19 Sep 2025 16:25:08 +0300
Message-Id: <20250919132515.1895640-5-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
References: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::9) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|DBBPR04MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: bcf82ce3-6cc4-427a-fa71-08ddf78019a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KLWJUYEr063ps4/cZlQ9zZTi/vx68aZ2+qdnhmpQXS8giJnEDecb9ijQyagz?=
 =?us-ascii?Q?s5CNWKWVa1gdcSJBegaYrMSHS2p11XBtppS/EXUa4UomJSazGgatHvMyHYs0?=
 =?us-ascii?Q?Kw8BvfWG9lmEQAHHTXFpP2NmKNHYsgwTVFV6giEaUJU3lIE0WLIRKJVzkVop?=
 =?us-ascii?Q?ld5WLKnHZLE3qZtJAT4j/7B485Baerf/7fXyLpiUo0SsYEc+xqpg7/nHQGMh?=
 =?us-ascii?Q?uTDrlpBzwgna0zb4+SAIUZGlX1uacWZEyhi9IPb4GfnECAQhahYdYLTE3fw/?=
 =?us-ascii?Q?TpbRDF63WNJeqmDzYzIocpWyn9RS7yg+s/O7qwkafiyCudaEnBPzObyhOU0g?=
 =?us-ascii?Q?6ONy/vZQuM0Q6jO6o9L9WaBnkUscxFg57Qhz026BcVX+DPR1bAk5tVpcg1Ic?=
 =?us-ascii?Q?0DL9dMSVinKfbJOJPWrs+EBGCOdWKIWUG3mk2Ze61kpRYpmGieQEz1w3JDpD?=
 =?us-ascii?Q?s38cC5OX0S4Jl44AyN5ckG6JTlFOvlz3Z7b3ffPwNoh8QxpixP/2srNm3NsC?=
 =?us-ascii?Q?RC4I1Gnog5sWUN5NJGGRwpBgyxUOOGD3g/ImYyp1j2YCLyYuevvmbAdic2YD?=
 =?us-ascii?Q?OBxL2aD/B/Csxh9MsHO5EtOLpsDpFLC7VJYDdxJrXCa2aS+x8ep+vDxHAMKR?=
 =?us-ascii?Q?ZWzTDndFXYhBNJKL8JnqONFkIGtRglVES/fluVmgjVi2fs4ZM+2yhtY39f6f?=
 =?us-ascii?Q?PTdy7ME1jVWyqZ6SUNTQfBAYX3I5H5LVvn7NbPoK6NklXnMDn+BbDAJ7lHqQ?=
 =?us-ascii?Q?VnxM8PBg7jRo8zk/akudNtJi2Fv0xYeL9qkJdTSzELXqav9CjePnXbzLs8fE?=
 =?us-ascii?Q?OjjSo8xWZoxNOYWtdSkx8Y5RZaZFxeCs3YJb8zL6m/tq+6RU7P4WUhI8QMNf?=
 =?us-ascii?Q?sLbwexqDeBkkx/acMxC7+GAhGWhNyoHcHqV//gh+UnBos85YH1osOMiVA6oq?=
 =?us-ascii?Q?4CS+nCssc3v08+dozoEc7dFboC0fB4UGp+mYhigvutjH8AlYU5Ur+A7RoWug?=
 =?us-ascii?Q?L/2t47qNNdD5P6pO4dcuwm+P0OBZfstzK9RGV8fFO/nnL2uR24ZanpUJiaB4?=
 =?us-ascii?Q?/0W+nKK7ypKr5n5pOYbGOlZQgztt18PCJ2k/LdFZYfwORkTyTF2ZXSteNnB0?=
 =?us-ascii?Q?K9OduCRfP850OPc8kvEfgtLgSJMXjWUDGulMWq+gYK5EXdOZbtv2IjD4hQgw?=
 =?us-ascii?Q?KbtknAh5jMLrn0RCz0SB0Pq5BZdZV5b7apOnswxI1r226S0831Disy5BMXL+?=
 =?us-ascii?Q?l1fOj8dD1gv44IqXHenKuZMqyLIBR+vPgz7o+Q8K3ho6/tNBw7NTmLmYH5El?=
 =?us-ascii?Q?c4aXcZNzLsdJmBNeVcGvWVumgbHAqwjyz73w2E2KYuhFbvCS0wZ4pUrr0a/V?=
 =?us-ascii?Q?cU1p/dUwt6AlcIzwql6KdHoyCMRK4AQTtmrV93w9uj+OOfGDH9FCdRLc6ENk?=
 =?us-ascii?Q?egFnpHuSoers5SmYVKGYijd9o7evdRqa63N01/+dK4dVI+1gRE2LCw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+WhRSKZqbjYyeMvA7yAYWIFaRal5A6Aovbhqn7gFers4K29KhC7jotn1pC2I?=
 =?us-ascii?Q?HCyaJ9bQsfnnsbj7ULSIgSWWQtS6136hoscpdVy+mCUSgway038CGunsJXGF?=
 =?us-ascii?Q?8UNrSTCO8ktC4YFWk3/US0drAZ6ZpRXqarSdGdyYQRIv8ss2dS3C7X4A8wlf?=
 =?us-ascii?Q?lHcKaaC9thGXbJxoxTgXbVlGaX5zLrwLpeyQEml3r/z4c19HymVuQ7NPeB8E?=
 =?us-ascii?Q?UIF3ghnVGrYG9yYY+CgLhiQ5xyL/15tto44REhGeCzqzSGDFeI7FtgeivENG?=
 =?us-ascii?Q?ym+lp36b2wKbKtkfG6z8TUA1xgZ1B2GKvHK2Y1I+T2JMi2pbb9K14fyCs1Rp?=
 =?us-ascii?Q?aIe4nR56Rbtr4MpjtHivvBsPKpPkAeXCmh1xU/Ol/TJXDtTt6AE1WSaCycsa?=
 =?us-ascii?Q?QZi5q41RJrxaVWIf0TzSyl9eyCzyPhiFjWCa318KnXSNLlJEdYzmcuSZ+bES?=
 =?us-ascii?Q?6Wx1MKZ7wYTo9ADJAB7r0Aojm0genImmli/r6FKjz25dRWUxUezsHPVkoYkm?=
 =?us-ascii?Q?ZShjmcKYsxNGAN/zmPc52UbGujtFovXyJm/J5eV/EGIUIrJH3FjBprF1DPnV?=
 =?us-ascii?Q?EtF/M3qYdvs1U++HTh/gklu9XXC22Lzw8jg2QaWjp+iiiFoAKeLcrOuXG/M4?=
 =?us-ascii?Q?ewn9diiEEBMZcuBYDmVX+QkvbvssCWcGILaWaZdoHN162gPBsZQMjzm3Tkd+?=
 =?us-ascii?Q?DzpB97hebG/aWzP9+pLXY7adHeYyqhakKJq8pSAOMu36dwVaER9qHVa4cOZZ?=
 =?us-ascii?Q?XNtjo+UuL5gKgpJ9h+XAy9G8987ZzvMwjz5/YMBYpTEWai1UK4HfqZUZVzrJ?=
 =?us-ascii?Q?MkIrAAKYbf4TbZaO3h84fr5qEddsQvAoam81/QATG9bA0L5J98v7+QLL3kv1?=
 =?us-ascii?Q?TJ/4xaElmJMMwGtW23Pyo+hWyCBa9sczEney2cS6zK+CRuUS/O9zIs9XFqiw?=
 =?us-ascii?Q?W5Py822RMaQsuQfTXaR/dil2rOq2Mwuo+vvx6tmRy1sh1dIoQ6Em8vIIKWcl?=
 =?us-ascii?Q?SBFYQ6Wm7TRk8MuuKpBt1AnV/Sj10dBPXu/8dT6hPh10yazp8Akwwd5msMkX?=
 =?us-ascii?Q?aVHQEt1nkN6Yogrf+HxcGWYGaXytLCPWPNMi7DovWraiefd4Bjc8XPhLrFO2?=
 =?us-ascii?Q?ljxSGxKj9PYsm+ma3HXWzjQPrJbJ0cO2P1L7T4W8aY5raGqA5ewMbkexAkQL?=
 =?us-ascii?Q?d9rSI7T6nfTmV6eTMcsQoOEUwE6gPuAv7210ujkZU0wtf+H+S6ZHb6W48vAo?=
 =?us-ascii?Q?E1cV7SXpV4UiyTguXOALl0yErfG3t6Psgp6n/dw8SoPbjrYeimmus7R4sdfk?=
 =?us-ascii?Q?qkewG1wqXKKHVkreMtI7H7dDmPQi4YKmvEfARSqlhhCbgv7OS3LCbgdfmMAW?=
 =?us-ascii?Q?bFwToVyrEwZ+nZXbXQ87GPqe8+wJPjK76Rog9CIOQdYS9E+WaUhfrOSGwZa9?=
 =?us-ascii?Q?JC3xXWCbxDvFajkO3EyTnVm1VycD4G4l4pzIIwWx1eSoCrcqDCUKOZDsV59Q?=
 =?us-ascii?Q?QXFEEYrPgNxrgiff2ZkqY4wSpdKIfZoEURf5ajq21nzEQgxTsROB8HNORsna?=
 =?us-ascii?Q?3d09kmaE457RFKlOEPh+ia7igVHkEI6WyzhX6Ebv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf82ce3-6cc4-427a-fa71-08ddf78019a9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 13:26:11.6170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BImuX40WoKTc8dcKy924y1Gjkn8vsbspCEd7dLfG+TyCz5SEq2AsH40Bn7gk4sPGZjxnc5u84lTM8MrgiEqIvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7737

Reorder the of_device_id structures so that they are in alphabetical
order.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v4:
- new patch

 drivers/mfd/simple-mfd-i2c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 63ac26388860..0cca7a9044cd 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -110,13 +110,13 @@ static const struct simple_mfd_data spacemit_p1 = {
 };
 
 static const struct of_device_id simple_mfd_i2c_of_match[] = {
+	{ .compatible = "fsl,ls1028aqds-fpga" },
+	{ .compatible = "fsl,lx2160aqds-fpga" },
 	{ .compatible = "kontron,sl28cpld" },
-	{ .compatible = "silergy,sy7636a", .data = &silergy_sy7636a},
 	{ .compatible = "maxim,max5970", .data = &maxim_max5970},
 	{ .compatible = "maxim,max5978", .data = &maxim_max5970},
 	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705},
-	{ .compatible = "fsl,lx2160aqds-fpga" },
-	{ .compatible = "fsl,ls1028aqds-fpga" },
+	{ .compatible = "silergy,sy7636a", .data = &silergy_sy7636a},
 	{ .compatible = "spacemit,p1", .data = &spacemit_p1, },
 	{}
 };
-- 
2.25.1


