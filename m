Return-Path: <linux-gpio+bounces-26387-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B57FAB89ABE
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 15:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3107C166EE2
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 13:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642C9313D6D;
	Fri, 19 Sep 2025 13:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QY9rZWtr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013044.outbound.protection.outlook.com [40.107.159.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2440430CB5E;
	Fri, 19 Sep 2025 13:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758288393; cv=fail; b=qUNvehQR6IaECKHOiV0aBSLN3NLjmh1f5ggPCkDCxKMmmyCZ61gw3ph18ED9VnVHF7slJSxMi+0RQI/Sf4coB9Vxl0MWLZDU5BXETa/ZhLjGUSI0h8oxS0qcQ0Q0ai+R6lf6LaWwVYOnpYaaxBHlZDfghhD0Un/VeVPX6ErWB2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758288393; c=relaxed/simple;
	bh=b0cPKt5+/TAqfnPf4zDjzvcG3I+bSD9kKSRaPyUHC5w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fwJQ3lMlql5mM78trphDUAbwEDJYc0X9+rQdehqUamZBfLG0Ax1nFsAGHaqmnI84PwAsgnu8GtQWIS02pbrRqLqPmDi/8zZDo1FXD+gjjdlc4iUEDtLeJrwmPY+mzpRT0yBXMKbJzCW/IkMCuM5ewmdY4jrXsnJUGFoV150iP0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QY9rZWtr; arc=fail smtp.client-ip=40.107.159.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O784AV5lN3KyaA/4UyvWVJmj1Z8nSOaJJr3ppIMKnZuLAuqm+5gp2q6H1eXuXfAhmYzAMZ2t+usPt9otLnOQ6nCyr4UbLvDjko2JJyI8v0+xfrA/5UBu8QlTVAi89+jGpJF6kee0U83u5Xz68CHVjR3X3iJY+BEGt/R3puNNBsVICLsGPtKldPaN+fn5mf8kiYpoOwYgauCC1APN6sjSw69sPRiy2TDKKuFsoJLg2M+/gKznpG5sKuHA9Pd5E4QGNwLugvAfAJnOo0t30s3jmogKIqFQonPXcYtkuF6a+B6ketRx8ELqJBT/1uNzMcA0Qy91KePiykQodjlaPDGh/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TOUUMT3N8vz9B0FWt7QlFj57haTKOjDIGiLZVblr+AQ=;
 b=GGA4EZFhauvYy5+3QussexpweVmktM80vU4FCoNdumN+T25/x+XFnd6LGSMzN4oA7l3URlWaq8jBgdUM9fjy7dOyWo63iHUoDPim1lDS7sBnLVKx0IKYuwa1tyxtg+tLZqg9l15Hr9t8H1+2XEiIVyjATv4ASB1o5Fv+iN0wXOM1JJeYkLSn4RqBAVIh1jlb0Um2XybK39TuqZ08a25PUl/JUut40xs5FvEuLgF/mXhh9XFqgvItz7hJkUi+8zDU/PDeHSopiDVxpDyjGKwiFNfLCawU11zQ99s7pHdUeX0uahDA6BmxyZ0TsdoV7OZ1Mn1O/7AiLK6LDAOud8YrNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOUUMT3N8vz9B0FWt7QlFj57haTKOjDIGiLZVblr+AQ=;
 b=QY9rZWtrGFQNGoHpa5MPHGG+VGiy8E0jIgKRgecZhFN6cf/BS4TCrI6XqdBjQbhK6BOGugzRS3nNXOH9duaXX5+L/oekuc3BygG/kWSOaBxsJh2rWiNsi4zAS9s5MWn1kgbrwWT6K2iC+rRJrzbiZgzHAgKbhcHLphxLnn2yVlc/4W/UiwYUXn8wbA2tGz9RiDqLpJV5b7RERkQ7Z1m0fCzPl7X2mWBZuzb7rld+EYyQrl9EbyMgI8Sd/AwmID74e73IU13vCkJFruSVokSh0y+mGqlOSEqr/wCRY5BLiu8NHa38p+2LPdTQ5SR4TUxkJOWkVi3PY0UwYdmxaRitZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 13:26:17 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 13:26:17 +0000
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
Subject: [PATCH v4 07/11] gpio: add QIXIS FPGA GPIO controller
Date: Fri, 19 Sep 2025 16:25:11 +0300
Message-Id: <20250919132515.1895640-8-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
References: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV0P278CA0047.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:29::16) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|DBBPR04MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: 213ea414-c3f9-45b9-7694-08ddf7801d4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7OCRlem+Gshfl4jDKLPDSV+te+eDYxLLEYva3UiOyaigK1gPVJoHdLAybEJa?=
 =?us-ascii?Q?s73M7BJzYRhonsOuirabWq6N7baORE0Y/aar10AfmJPRC4hssngp2FrP4Wdy?=
 =?us-ascii?Q?4GAuKnESthFfsYo754VupeDvV5W/8yjfjEDAFb2ltY5RR9c+KHMC5Xlu6uyr?=
 =?us-ascii?Q?oEgYTMD4xvU8Ro+9J4wSidNP/wu+uOoiUSqU1C6RkKFkdeqofgLKpo8PkIQB?=
 =?us-ascii?Q?No3uYuVeUxODlPF40dp1mxpi6wMErDB2Qzjt3dk9fc4Ss6lJTIKXr/RYp5lN?=
 =?us-ascii?Q?fVFivnq1gLe+CEQ9QbR5hNX9AMQfGsDFKFJPzxEc3CTqjCOvW5t3wdIGhTqJ?=
 =?us-ascii?Q?UnBKhzxStBDvzM7fcWv/isyfp5jmT4PPGZbtlfZWcKObU2xn/m5+IFePUEwC?=
 =?us-ascii?Q?92INN975uqaeGm1oZnj6MD2qEKe4Im31ny3rhfgaSX24gLiP6E72BL3VZhoZ?=
 =?us-ascii?Q?fyJ9c41qqnF5tmtnfEAhAVn8l4JoL1b0wHZtNKAREWrLjwsOwkqtvHKvJMyD?=
 =?us-ascii?Q?3MLSvSjhx3WLltRTgtTqswzKD1C2Psw1xX5pPZ7OtoPXhjm1enG1b3JLDTHq?=
 =?us-ascii?Q?fMwK2Zp999lsAWCeG2fYEmDzxDhkVwze7sGWGlixlRjvXUywcEuAwob94+HS?=
 =?us-ascii?Q?hiTbi4NTp2+PtuJodRPIPCuuAZ8LYlCeQRCMQxCyFV4W8yRHN8+xuZ1Ie6lK?=
 =?us-ascii?Q?QXQv1JqTMVD6L1+cVJzq64+yigm69F2DKPxEy9yE0eAwynv3yGrGlonKHopV?=
 =?us-ascii?Q?55rJJe2zjSKEAa4XBw1nCSQElWpfNxR5n0oepKNKQ1A31EeB3JjqnQmfUYIL?=
 =?us-ascii?Q?eMrhORpAd4LTGcAAi5ovUZ4+RNcMU/U1FRK55eVSjadd5XNA4M6+TA1xzHa7?=
 =?us-ascii?Q?zcWkn1yVrjgvJ72lnflYeQgyHBu6H0i2z7Ftm8eOD9hgxHHC6ky9qbWaOKZD?=
 =?us-ascii?Q?2GQ54WaQHdaRkeMa7nG8EFix24TaHAhjhbthwbMLUaoYgUzfDxqHD8/Yv9Dv?=
 =?us-ascii?Q?4qrYvCUscHwcgYEQUOmLzNDXTtvSSUkOz57CmYSxsQKknuHkVK8X57m3pTL4?=
 =?us-ascii?Q?HoaWnTJ4DTaOeh0z1Wyb+X/w2meUx44TRX2JBzJmDQdT0c6DCRxPb4PdKDCQ?=
 =?us-ascii?Q?JGQTgRIsRw3amZ7rAchBmJ8dpYrgO4yRbaZ1f9yT+x65TF09GVtdy2DfUz9m?=
 =?us-ascii?Q?71hYtrAUQmxqqVyVF0F58ROrn6wxuGeRS+FYMhFmnIvfhZ5PL7PlerrEAK24?=
 =?us-ascii?Q?kz/T7i9WtctIouz89DeMaxh0V49bnsWOuDYljus1RATNjmgePz/dgukv5j9w?=
 =?us-ascii?Q?Q2XZNhZdcKVFubs7cWVJkfzFtGVMtYdJgJf2Mm/MzpszF8AOk4fhU2K33Fci?=
 =?us-ascii?Q?h2gsdBKGhGW6NWKveQCnaWjMOpusMactwpnJhkO88tLOMRrIfA9yOlSmALHS?=
 =?us-ascii?Q?0/p0L+k5n8L+rxEuKxLxqi8fO8YixANqLsgdFKQQhiv/cdacMS0WHA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nb9uBdU3uQubWjvWnnFHj417dDf5N8RADW6nirvsaKiycAUg4CN6MGn5238p?=
 =?us-ascii?Q?stXq6zx1N3Kg5zDbXDu8zv9TCWTE0cAwqiqpjY/0236Eslb01I63K8y9RZER?=
 =?us-ascii?Q?kRLRf84W8u3vYNQswVm+HVN6jZVtsp9aazIou0yWxyAcpaI5ZNqgFw62kU4M?=
 =?us-ascii?Q?RICq+nSk7Gp2WnO8Vwig9Nhl2gQGj0CBz5v+WD5l/qM6d4RPjlRm5eDJue3i?=
 =?us-ascii?Q?KX1A2gD4SghM6w0dSfV86lgo7vIzy9xQlb/JYUS/vYGZATr0Fk8npQ7vjJp3?=
 =?us-ascii?Q?YpjaAKlWhg7X8YDvYFcoKVYTs+QUSbbA/rOiQ50+ZE0++LJecRKOJFKJp014?=
 =?us-ascii?Q?ngsIl/dKh3mSTqsZJZQTxXyRtqBU4YEoFC3oVzNMZyTyUjLFJy34U8ee31Eg?=
 =?us-ascii?Q?EEs6+6dCJXR0sSNRvvXhYis6zBOaBwacd87Mt7DLHGIv5sPyjfSh6cvoy3bz?=
 =?us-ascii?Q?WujmkWNpxYkK2kMaUpQV5PDJrzfx9XAmJ9FcbzZiNhMGDAG2HxI+r1hF96Dr?=
 =?us-ascii?Q?2GN5RRuafSCOr7yXfL+bHVUMzsdnNLhFdqZ4HPfPRH3htM1GrnfAUdhjvYJi?=
 =?us-ascii?Q?dHDmtd33Rt3z035PwMNqeJH61mERcF/WFk3mcqaJnR1MPrHmj+YHFYlx3xvs?=
 =?us-ascii?Q?SyBhRZkYgYZk9sjV9mx/o4Ii7iU9CetFds0J8btfoIP3SXh68AdfYxOBHlcE?=
 =?us-ascii?Q?BqYMh07+9Z429ZrcY3zMFr4sCgF2xVkQq4iwx5Zkq37vxLNXQ7LqXv07EScG?=
 =?us-ascii?Q?Xo6TQ2WXYTZygHHbHohKsowzYHcdJstOe6fzuWds1eypaaYwufgKMFRVNchY?=
 =?us-ascii?Q?qzwqMmSwvu2G0IP7mMmC9R5bcr0+BESOqkVD2NE9ey8qutFC/VSFDeGfGSnZ?=
 =?us-ascii?Q?tppNoCOP/qzmpoSRWk7Eih9IbTN+HfkQ1miEYfPSpc3i43SorH+F7lfD6s4H?=
 =?us-ascii?Q?SDtes1vfI3NJp/ZYU25CZbs9ndnokqbQwACsqEPoY6v4UENuDOgv+F9ZBudB?=
 =?us-ascii?Q?NfcgiFpS1Jon9BChCO6Vfsa5nhk/HFAjsb2rHhEpTy9d2Rg0NkQhwqF3qtES?=
 =?us-ascii?Q?ZIq8jj8Y6kePvvmmk4s/eUUr1gVdO9Q097h0lkkRiNV/0AjnNBNJgVERS9eR?=
 =?us-ascii?Q?monZyUCsRPZj/RBabQZKpr9b8BwdO8JdOpGvPPpGxgFzDn8br3JJVArx3J/x?=
 =?us-ascii?Q?MUuMxZHK3sgyhJb3/8jEgdSuPgNmtQMogg+ht0Ma2gC48eDZNis8u159ul3s?=
 =?us-ascii?Q?xxUZD9u0Jp66MBR42nHW9IMLrLqz+KflUIKe5LxjFaE1qQdOmd2lzOtVGvk9?=
 =?us-ascii?Q?+Ma+btThVxwhaHHbia+G83rAHDO+lZjXQRY+RWBfwgDBEJtqw7BC/8fjh9r8?=
 =?us-ascii?Q?bmFvzTRLPUJHdBxgXppJ6/rpJtvWlKofXjZ58HdtLFs0+nM8aqTiU35HHJAJ?=
 =?us-ascii?Q?NXwzbvgPmIyfT3iTOIzWFEwsWp9biP1QS/S8RmXkwU15jEZgpSnU2I8xImkt?=
 =?us-ascii?Q?rkp8pWGEJpYQ5xWaoLCdRR2ZqgHlffandJpjd6Q4hWGHp/fK95PUs6qZChBX?=
 =?us-ascii?Q?FvPnSmrw4nYl3xWBO5/d6XaN9Tjezs3bi+PeC3VB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 213ea414-c3f9-45b9-7694-08ddf7801d4c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 13:26:17.7688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WbxCdEJdvtqG9ZO/R67b60JR8N/g1dz863Oe5uhViaB1TlmltWcCu79rP8UHQEIdL28NGlyJIF3P7CRQx0uF7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7737

Add support for the GPIO controller found on some QIXIS FPGAs in
Layerscape boards such as LX2160ARDB and LS1046AQDS. This driver is
using gpio-regmap.

A GPIO controller has a maximum of 8 lines (all found in the same
register). Even within the same controller, the GPIO lines' direction is
fixed, which mean that both input and output lines are found in the same
register. This is why the driver also passed to gpio-regmap the newly
added .fixed_direction_output bitmap to represent the true direction of
the lines.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- Use the newly added .fixed_direction_output bitmap representing
  the fixed direction of the GPIO lines.
Changes in v3:
- Remove 'drivers' from the commit title.
- Remove the qixis_cpld_gpio_type enum since its not needed.
- Remove the NULL check for device_get_match_data().
- Use a bitmap declared on the stack as the config field passed to
  gpio-regmap.
Changes in v4:
- none

 drivers/gpio/Kconfig           |   9 +++
 drivers/gpio/Makefile          |   1 +
 drivers/gpio/gpio-qixis-fpga.c | 107 +++++++++++++++++++++++++++++++++
 3 files changed, 117 insertions(+)
 create mode 100644 drivers/gpio/gpio-qixis-fpga.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 81fe3b085f7b..e963a7ee4ce1 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1962,6 +1962,15 @@ config GPIO_LATCH
 	  Say yes here to enable a driver for GPIO multiplexers based on latches
 	  connected to other GPIOs.
 
+config GPIO_QIXIS_FPGA
+	tristate "NXP QIXIS FPGA GPIO support"
+	depends on MFD_SIMPLE_MFD_I2C || COMPILE_TEST
+	select GPIO_REGMAP
+	help
+	  This enables support for the GPIOs found in the QIXIS FPGA which is
+	  integrated on some NXP Layerscape boards such as LX2160ARDB and
+	  LS1046AQDS.
+
 config GPIO_MOCKUP
 	tristate "GPIO Testing Driver (DEPRECATED)"
 	select IRQ_SIM
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index b1593ce92ebe..850c0e086c82 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -144,6 +144,7 @@ obj-$(CONFIG_GPIO_PL061)		+= gpio-pl061.o
 obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)	+= gpio-pmic-eic-sprd.o
 obj-$(CONFIG_GPIO_POLARFIRE_SOC)	+= gpio-mpfs.o
 obj-$(CONFIG_GPIO_PXA)			+= gpio-pxa.o
+obj-$(CONFIG_GPIO_QIXIS_FPGA)		+= gpio-qixis-fpga.o
 obj-$(CONFIG_GPIO_RASPBERRYPI_EXP)	+= gpio-raspberrypi-exp.o
 obj-$(CONFIG_GPIO_RC5T583)		+= gpio-rc5t583.o
 obj-$(CONFIG_GPIO_RCAR)			+= gpio-rcar.o
diff --git a/drivers/gpio/gpio-qixis-fpga.c b/drivers/gpio/gpio-qixis-fpga.c
new file mode 100644
index 000000000000..048a2cac4f0f
--- /dev/null
+++ b/drivers/gpio/gpio-qixis-fpga.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Layerscape GPIO QIXIS FPGA driver
+ *
+ * Copyright 2025 NXP
+ */
+
+#include <linux/device.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/regmap.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+struct qixis_cpld_gpio_config {
+	u64 output_lines;
+};
+
+static const struct qixis_cpld_gpio_config lx2160ardb_sfp_cfg = {
+	.output_lines = BIT(0),
+};
+
+static const struct qixis_cpld_gpio_config ls1046aqds_stat_pres2_cfg = {
+	.output_lines = 0x0,
+};
+
+static const struct regmap_config regmap_config_8r_8v = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static int qixis_cpld_gpio_probe(struct platform_device *pdev)
+{
+	DECLARE_BITMAP(fixed_direction_output, 8);
+	const struct qixis_cpld_gpio_config *cfg;
+	struct gpio_regmap_config config = {0};
+	struct regmap *regmap;
+	void __iomem *reg;
+	u32 base;
+	int ret;
+
+	if (!pdev->dev.parent)
+		return -ENODEV;
+
+	cfg = device_get_match_data(&pdev->dev);
+
+	ret = device_property_read_u32(&pdev->dev, "reg", &base);
+	if (ret)
+		return ret;
+
+	regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!regmap) {
+		/* In case there is no regmap configured by the parent device,
+		 * create our own from the MMIO space.
+		 */
+		reg = devm_platform_ioremap_resource(pdev, 0);
+		if (!reg)
+			return -ENODEV;
+
+		regmap = devm_regmap_init_mmio(&pdev->dev, reg, &regmap_config_8r_8v);
+		if (!regmap)
+			return -ENODEV;
+
+		/* In this case, the offset of our register is 0 inside the
+		 * regmap area that we just created.
+		 */
+		base = 0;
+	}
+	config.reg_dat_base = GPIO_REGMAP_ADDR(base);
+	config.reg_set_base = GPIO_REGMAP_ADDR(base);
+
+	config.drvdata = (void *)cfg;
+	config.regmap = regmap;
+	config.parent = &pdev->dev;
+	config.ngpio_per_reg = 8;
+	config.ngpio = 8;
+
+	bitmap_from_u64(fixed_direction_output, cfg->output_lines);
+	config.fixed_direction_output = fixed_direction_output;
+
+	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(&pdev->dev, &config));
+}
+
+static const struct of_device_id qixis_cpld_gpio_of_match[] = {
+	{
+		.compatible = "fsl,lx2160ardb-fpga-gpio-sfp",
+		.data = &lx2160ardb_sfp_cfg,
+	},
+	{
+		.compatible = "fsl,ls1046aqds-fpga-gpio-stat-pres2",
+		.data = &ls1046aqds_stat_pres2_cfg,
+	},
+
+	{}
+};
+MODULE_DEVICE_TABLE(of, qixis_cpld_gpio_of_match);
+
+static struct platform_driver qixis_cpld_gpio_driver = {
+	.probe = qixis_cpld_gpio_probe,
+	.driver = {
+		.name = "gpio-qixis-cpld",
+		.of_match_table = qixis_cpld_gpio_of_match,
+	},
+};
+module_platform_driver(qixis_cpld_gpio_driver);
-- 
2.25.1


