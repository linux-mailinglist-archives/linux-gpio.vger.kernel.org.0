Return-Path: <linux-gpio+bounces-27125-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A740BDA855
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 17:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DD4FB4F03BA
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 15:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF935303C96;
	Tue, 14 Oct 2025 15:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WAyF0z61"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013032.outbound.protection.outlook.com [40.107.159.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF9F302CA0;
	Tue, 14 Oct 2025 15:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760457275; cv=fail; b=QxfBADJtCCVQf9KGG12PFqE3GVq03fU8vDyXTuXyRVN7A0ZbMhXNoVyeo4N0zCM11fBT3cDfVGY0shBgmIPe8h04B1ZHMrfC2pEIODK4/36B5Gs3hIyBkDynppOOdSWUtaFDmSrKXW5bIOx3uLXWY+UIMa4UFjD6HTiQlE8NoJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760457275; c=relaxed/simple;
	bh=ayEsnigveGesjkSv3xfjHR+UuOP5Q5mu4qJFLMCk2D4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TFCLS6ZXVyou/58FB19ZXTDbuvjJnBp+myuPB1zkCfc4Za1RONShfk7oXqt49SglBKPaFXSCuDGmBuUen73L0EOxMBIKLaRhW9RKys1IOsKaRardgYw0c9NbxP41wpIA+TutpNxoiqe+bB4CCGmeh4L4oTNJAOBOp07HlC6EsV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WAyF0z61; arc=fail smtp.client-ip=40.107.159.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bmJfQH+Q1Mp2rAduH7Pa5BCPkxQVNSIB5ZVNsTc7bZwf3OVQPSO/rwYKz9FmdSr+JQAA48OpqFNaMt7IY5CFJxsPPCoeLLKPt3iglEDvBkZpK5BVpQCG9yfX+BsEimH33dr+s4fDhldTTx02ILrj8Pdulyl9BgTzYF02LXRdSAJ/hMcbki2NUZgMTi7MytbOpqMjzKJF0LTib8vE3ou/uTGkxXzik660E6trl7wErA+MqCNpSl52MDnFN5NNvWbtD/kArFUbnluCdR2/gB/Mw5xOwZLr+i5NJofmJMGM0Wk3/tpQ1eMgJ5U33YIOmB+FrnFmS4JY2I9lab26TxnE8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkR6kQ1Dsx+/NgTMsX07SnLBfptAB0RWBuX9pNSFlRs=;
 b=O8RcpgWnYZO0mdVm7C/fS3PZ/1nT/nMf4S94jv4ynMGM6d/dyBf74QTgb5WEFSM3d5YgsoipV6zAYoREP4u0nlSYSWM2A7BnCL+WlSgByWowjDi1g1Nr2UudG3zIXJ35jkD9vK+yeoEGaXSqaMGRIthrbsqkCEmXD4nZezk0nLb+q/2BLbnZPq1v7S0a/OV4EcxpZYESkKkr5c+Nu57h7WE2GUksi1NkgovOU57GDZy2wB6itdNNt3zJHNSlU9q4Ti1nP3x+nDXv60FpY6pUxupoJ39vBjNmrKueHS2U6hD/Dee5cKbEwGNe5dI1xLbiqI0EexKLfCzEaWNH5Zqq5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkR6kQ1Dsx+/NgTMsX07SnLBfptAB0RWBuX9pNSFlRs=;
 b=WAyF0z61nGfwWgH5GcQv9uLeUVFlCHCZEonqcFYqmec9WnbwvvN+kyMJZrrJ9DkahCkTBuZ/JdMCtDKuw14AK1evJR6aXwoikI1OavIZvYVlECaC/sU6hB/ZOys5B6cZMK7VeJrhxvaQ5pKirj5DtXiRArMtyrPc15NEE+qojR9w2YsaBu2Gg/wVk9Vciq0DFeCJ3tPwPb7oDDr5MAJzMQOlt/heC+qEYju58r7j/A4S6VRuUyriweFow5ZpSMbA76Bh/8VJa0Z+URmazXMLln5pIF5NpFDl1ADO4Nih9SLi2XCBioGuh6Q12sJrmxjOoM1yB4+GQMP0FKb5hM8XFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GVXPR04MB9927.eurprd04.prod.outlook.com (2603:10a6:150:118::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 15:54:15 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 15:54:15 +0000
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v6 4/9] gpio: regmap: add the .fixed_direction_output configuration parameter
Date: Tue, 14 Oct 2025 18:53:53 +0300
Message-Id: <20251014155358.3885805-5-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
References: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0133.eurprd04.prod.outlook.com
 (2603:10a6:208:55::38) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GVXPR04MB9927:EE_
X-MS-Office365-Filtering-Correlation-Id: e1d8dfb4-1078-4a25-cc13-08de0b39ecd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2qK2Dssn524M+tRIibjVcG6CzQ5YTnV618iCM6nI81/uZwbe5xvfmaWA8UJi?=
 =?us-ascii?Q?eyP2wnt4ADVJWMliIHrZpbo33BIvKPnSFaRFm1jz3EUloOgAXxQp6P6wTsaV?=
 =?us-ascii?Q?0hFdPJJ6Qbt5pJunAqRUMUfJ7UE55hIB2SjmijOQZSQX3dlOun3DuPDZ/6st?=
 =?us-ascii?Q?v8oNw2OjNiLYImMt3KtRvDjd0IRTJCHLFbtlgLT/Xy4dJKd+t4+RTeAXrj+x?=
 =?us-ascii?Q?xrPO70jauic90ajYJt7+y383vF2VGoOiatgBlTY+qf1SO4PRddp+8KHm1X26?=
 =?us-ascii?Q?248qTNSqJZDZUdSsZl4vMLa3GbuW+YjODiQNBMRgwKdnB6qs0J9LM9GkDJBp?=
 =?us-ascii?Q?Y3vfKashKT8yXpjd1jJe49ESh4rwjw0br4mHiDLtI0SzDAFFoC5v9Ob/eFSt?=
 =?us-ascii?Q?I6uW7GlqOz4B2EYztxcMF5KELpAfE69WWgHxje53kldBeniZs5qv43gz0Clo?=
 =?us-ascii?Q?/5IXbETRWDKuO4aTWk57uVrfZDK75kpsPw/DGVLme9th13hEfhN3dJpJ9FjY?=
 =?us-ascii?Q?ggF8Tst0S9kpR8orV8DL3BKlVXJMPL2Mt4EZruL9dutGVDUfOa8uwNjVtT1C?=
 =?us-ascii?Q?W3PbOwJoAJ5oPHySCCq9nk/I5Jc0JevIDZLEfbXGpXH9RAtfu7Mx37bimMn4?=
 =?us-ascii?Q?lADO6VAKeU66omwaWEhcRTMyabVDYkFvpKszR3RKOdmGyvnbpxbT7cTTb8Ru?=
 =?us-ascii?Q?Wf42xjT4gnyqmejydgAWrB60NcZbMPEZfq9B+ki76KE/+6f2NjNrR1c3+nyu?=
 =?us-ascii?Q?GYjHL7tsrUYQJmqXS+U17lSmOl5vQkO/lBrmb+BGVcH9+4ulwJUoZJD2PAvK?=
 =?us-ascii?Q?t+ReuH1ThoEqjcaGIF5ZOWiuFHDqQZr6oGgTwgvPiILAwsMBrtLdDc6yrF20?=
 =?us-ascii?Q?USGtdq9XYhVHt/VBtFqw8+YUMDZqX2hnzj6fq4mRn8PkYu9JD9KMdVixFr7r?=
 =?us-ascii?Q?KQ8czVrvclTQe+bslfN5yy23SBR/RzM4vHB1YCuDYXPaa4YCir8jVtC5Qekw?=
 =?us-ascii?Q?aqTzLsfGLy3UFSHA3GHmr8JC3zz/hVoWqSu9u8HwMQ9Q8bJaxF2X0nCO0vNi?=
 =?us-ascii?Q?EsH8V+bou5+DO9Co5WxJYXuEBn3iCqXeB2Htr+teytxqrBAWLwH1OQZN/J7l?=
 =?us-ascii?Q?3d6Wkq543U0YWUpd6qIJq3Jevlszq2qp9gFKfGhYPDEOxbrlyCqJcw43tEos?=
 =?us-ascii?Q?oCktfd1W8vfwtXXdvyt2kZccZvC2mXJELuTAO9TJ+4zTQsl+3NZx+AbUSkEM?=
 =?us-ascii?Q?vdTA+tppidi5r+HPAueDc8DDP785jmvLxWVutL2JQxaWfRyuvv0xYOfhJ7MQ?=
 =?us-ascii?Q?z3iejY9qfRpuUyfhHy1QOVzgSiynEBWGYqkaxVNXstKcwTxIz3+QK7pv9d5g?=
 =?us-ascii?Q?wvofW+AIhylLaTHfCzuSC2g36Irt/08phkJqaphJiC7c//9tW+5GU3pch1K7?=
 =?us-ascii?Q?sto/+4OA0vLYrsH1ohtIiwBxTSfqXlv9uq68PLFObkvyxmugqrmcoQq/cOpY?=
 =?us-ascii?Q?h7RAm7rlMdaXq48=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9Ut9edhdJ/dA65VsJgyZ8a2ZQ+bWrmSTrsFvBVsSBksovq5AfaCNG3b49bAH?=
 =?us-ascii?Q?QwRY/AJmWFn0d896IK/KZhDU7fMYR+zCzl/m+2iSUnRz6GIeUSd+gHeEub/G?=
 =?us-ascii?Q?/c/ipCYoF9QkUGJkt/0pElTVYLP0O6LON6uN1GFWWhup3eWN1ZotB/WbbCrE?=
 =?us-ascii?Q?g7dLF/iup+ntwfjSWrf3Gio5vu11Y1a8nWJBwwlQgynwUBvGJng0CA42Nz7r?=
 =?us-ascii?Q?pdTTN6Ymznq0nvDP++OEvlcSLHxZ4zLeO4vdxal1F4LxcpRifhiAJOVEX3a8?=
 =?us-ascii?Q?TpkHP7R0yQOUsUwWwhIZtqZQ9h7TCbkRf+wA+RJ2XKZvM4ZEiEK6VbM4q4vh?=
 =?us-ascii?Q?bDy9XNK/wCSzojNAMWI2GQnKU5H79HKzrCBu7ZbM6vmeDQkUBZ5Xc0ePakLh?=
 =?us-ascii?Q?EV/HgN8n06UBAJI/uUxOwVGSpiGgE1WWzSJ7jnkL6MJU1jT7cq88P5GjfFWw?=
 =?us-ascii?Q?xh22eFCZl3Z0Rat6dvTeGFt+fw1d84NF5ofrhLY+/2Xg32cz5pZvjw5TsoVY?=
 =?us-ascii?Q?G1d7PC3KFf8kJMIj84s/wbGZl7y5fMeI+Ed2YBGQ//gfOj2dA83hyPjVybll?=
 =?us-ascii?Q?d2UqhUdU5nG9rtni4fM4C0465Z0vVTMIiCXXaZYpAOc7pJQET3DoaIiZ0s3S?=
 =?us-ascii?Q?E5ABxn92QLmjL5EGgPqSyAnzRp6dfNtTR+Ev+Vu8/c3llDda2slA8PC7L6Fx?=
 =?us-ascii?Q?Measm+ki7U15XWp/n742eLgSvfGfRZQtJiThPlSTzAl3y0D7+fDQwaxYIPqB?=
 =?us-ascii?Q?AgOFOwIwQh+UYRp0YwGgvVbeoVgLNfeTIg/bDsyUc3dVt2azGJphUiqZJHf8?=
 =?us-ascii?Q?ErFQkwxEAduhnW0T7XoUulabVg53iLCKY3Sfd0kyCB043T6qL+ZaelXagR14?=
 =?us-ascii?Q?QrMNq/JQ2XZy9I0pEI5sccj2GobOHM0YGthsFVoIsN5HyZpUJIw0wzzZ7TsO?=
 =?us-ascii?Q?2OiW4sD5JBypuydlYD4wfqQwVc/DcvjIPopjKV7lzbUuQhOtdwd3QuIZGnQ/?=
 =?us-ascii?Q?5AIiNcMVsjvOQ87PR0xKS1BsNvEncN/4BrKxtJE96bm4ldof8Hat3T32hIAH?=
 =?us-ascii?Q?ZmfpumFd4HoIRlru1Zgx2auwQfXfWgsuGWb+Vv+xKk22wMXPN85+Tb7XT5+y?=
 =?us-ascii?Q?aWKSr1r1eBMiobgnixsjC+2TPmyAXb1F/bH0n675J1S1eJ+HshP96uMtN4VK?=
 =?us-ascii?Q?x1vQtYmp8SEhuJOnfwsfCSem720xn2fqspzACw2SDGcibX3TrCNEJFD2Roqe?=
 =?us-ascii?Q?3YAfamhwJho38e0yjcMolyzD8NxA11atlIzQ24CAQV0ICsyr6goBUXP9vkaV?=
 =?us-ascii?Q?GOdeE2uA35HSb7xSecE0qswhu1yZUL+idz8ydjdXHCoSKlTvROTBT4hJ6NS8?=
 =?us-ascii?Q?AJW7SrzsqyRl0Iv8fvybvWdYbwwzNP1LXOUiGyhMFfWdm0uqyJQCD8NutiO8?=
 =?us-ascii?Q?qt0/+NGt+j2ZxcGF/hFSvDI9Xg1HWgaBJ0jzhV+nhk8EVnQ+qY42rTIchvNe?=
 =?us-ascii?Q?fY9gG3D0+OZf//Qs8x4O7GcyIdy5wgg0SxEHHGy3A6FNrzYPDd7txx6pYeNF?=
 =?us-ascii?Q?hurS7Bfo3oOsNP8OTV94ugFEDiOcpiRsSmJ3NQ5U?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d8dfb4-1078-4a25-cc13-08de0b39ecd5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 15:54:14.8936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q96T9rE3rFUWVB+olsgwhGQIBzjivB1ZWLskutfQt6eFh82tuLQ0q7i7xpV3YIChHJUgkrUW7WTqGZkxXTirkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9927

There are GPIO controllers such as the one present in the LX2160ARDB
QIXIS FPGA which have fixed-direction input and output GPIO lines mixed
together in a single register. This cannot be modeled using the
gpio-regmap as-is since there is no way to present the true direction of
a GPIO line.

In order to make this use case possible, add a new configuration
parameter - fixed_direction_output - into the gpio_regmap_config
structure. This will enable user drivers to provide a bitmap that
represents the fixed direction of the GPIO lines.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Michael Walle <mwalle@kernel.org>
---
Changes in v2:
- Add the fixed_direction_output bitmap to the gpio_regmap_config
Changes in v3:
- Make a deep copy of the new bitmap.
- Remove the offset check against the ngpio.
- Added documentation for the new config field.
Changes in v4:
- Replace devres bitmap allocation with bitmap_alloc() and
  bitmap_free().
Changes in v5:
- Rebased on top of latest linux-next, change the extra goto statement.
Changes in v6:
- none

 drivers/gpio/gpio-regmap.c  | 26 ++++++++++++++++++++++++--
 include/linux/gpio/regmap.h |  5 +++++
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index ab9e4077fa60..f4267af00027 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -31,6 +31,7 @@ struct gpio_regmap {
 	unsigned int reg_clr_base;
 	unsigned int reg_dir_in_base;
 	unsigned int reg_dir_out_base;
+	unsigned long *fixed_direction_output;
 
 #ifdef CONFIG_REGMAP_IRQ
 	int regmap_irq_line;
@@ -134,6 +135,13 @@ static int gpio_regmap_get_direction(struct gpio_chip *chip,
 	unsigned int base, val, reg, mask;
 	int invert, ret;
 
+	if (gpio->fixed_direction_output) {
+		if (test_bit(offset, gpio->fixed_direction_output))
+			return GPIO_LINE_DIRECTION_OUT;
+		else
+			return GPIO_LINE_DIRECTION_IN;
+	}
+
 	if (gpio->reg_dat_base && !gpio->reg_set_base)
 		return GPIO_LINE_DIRECTION_IN;
 	if (gpio->reg_set_base && !gpio->reg_dat_base)
@@ -284,6 +292,17 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 			goto err_free_gpio;
 	}
 
+	if (config->fixed_direction_output) {
+		gpio->fixed_direction_output = bitmap_alloc(chip->ngpio,
+							    GFP_KERNEL);
+		if (!gpio->fixed_direction_output) {
+			ret = -ENOMEM;
+			goto err_free_gpio;
+		}
+		bitmap_copy(gpio->fixed_direction_output,
+			    config->fixed_direction_output, chip->ngpio);
+	}
+
 	/* if not set, assume there is only one register */
 	gpio->ngpio_per_reg = config->ngpio_per_reg;
 	if (!gpio->ngpio_per_reg)
@@ -300,7 +319,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 
 	ret = gpiochip_add_data(chip, gpio);
 	if (ret < 0)
-		goto err_free_gpio;
+		goto err_free_bitmap;
 
 #ifdef CONFIG_REGMAP_IRQ
 	if (config->regmap_irq_chip) {
@@ -309,7 +328,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 						 config->regmap_irq_line, config->regmap_irq_flags,
 						 0, config->regmap_irq_chip, &gpio->irq_chip_data);
 		if (ret)
-			goto err_free_gpio;
+			goto err_free_bitmap;
 
 		irq_domain = regmap_irq_get_domain(gpio->irq_chip_data);
 	} else
@@ -326,6 +345,8 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 
 err_remove_gpiochip:
 	gpiochip_remove(chip);
+err_free_bitmap:
+	bitmap_free(gpio->fixed_direction_output);
 err_free_gpio:
 	kfree(gpio);
 	return ERR_PTR(ret);
@@ -344,6 +365,7 @@ void gpio_regmap_unregister(struct gpio_regmap *gpio)
 #endif
 
 	gpiochip_remove(&gpio->gpio_chip);
+	bitmap_free(gpio->fixed_direction_output);
 	kfree(gpio);
 }
 EXPORT_SYMBOL_GPL(gpio_regmap_unregister);
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index 622a2939ebe0..87983a5f3681 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -38,6 +38,10 @@ struct regmap;
  *			offset to a register/bitmask pair. If not
  *			given the default gpio_regmap_simple_xlate()
  *			is used.
+ * @fixed_direction_output:
+ *			(Optional) Bitmap representing the fixed direction of
+ *			the GPIO lines. Useful when there are GPIO lines with a
+ *			fixed direction mixed together in the same register.
  * @drvdata:		(Optional) Pointer to driver specific data which is
  *			not used by gpio-remap but is provided "as is" to the
  *			driver callback(s).
@@ -85,6 +89,7 @@ struct gpio_regmap_config {
 	int reg_stride;
 	int ngpio_per_reg;
 	struct irq_domain *irq_domain;
+	unsigned long *fixed_direction_output;
 
 #ifdef CONFIG_REGMAP_IRQ
 	struct regmap_irq_chip *regmap_irq_chip;
-- 
2.25.1


