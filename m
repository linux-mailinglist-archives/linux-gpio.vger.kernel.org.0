Return-Path: <linux-gpio+bounces-18032-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC6EA727E6
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 01:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D0211892197
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 00:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54C4208CA;
	Thu, 27 Mar 2025 00:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qPTR+xx9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2065.outbound.protection.outlook.com [40.107.241.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8B2C2E0;
	Thu, 27 Mar 2025 00:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743036665; cv=fail; b=GLtFYAJ1Efd2e0KKX0CTlSpq8bSf7Q4JXenpafyEXzV3joJUUDKtzzLAQK1ELINQf6Nw31uS8Xpmchjy74pyjP2TlLmMC6Qgsw9Jvjb/V+01Hdi5IlnUt8p8fjMp22S8IhwEk+I4Ylb/HI/JhnYvUXZDgbXSZhfOzCW/MtMsSdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743036665; c=relaxed/simple;
	bh=4Z3IrBoQV5F1jcwcv63Bxs98dlQ0u1RR1VsFiyMdJJA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L7rjnXW83Njpg9CaaZ7CqdfO5kVdsWHcj38ct2hvMxnzZOi0P1C5Moxdj2F7d8qynaBGhMMxqVkhZgvXVSxbFfxok5FTqgrj00jAbzThlMS4tbOwjqskmD8WGSvhpM0YokqAfCeq/19+WQlxc8mvRHWyh3F94/GF0dNvCeYkecg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qPTR+xx9; arc=fail smtp.client-ip=40.107.241.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tul3HWCf1U0TRoyhFHFY7/0codGagNn4os/QcARMbndPaPuikx0PotxvoZGHlfIrLKxVw6sWoVrjk+tCu7ihnvPzSmorjORRy9ht0akyzAEc4+OunKYTos/ZJtaWyDvy9m+czqyf0lJapKQHqNrarBL3pSicpxVbx9KaKZGXyMw0C6nvxr6v7XFBZMMakQ//pIFt8fFxUHW5/tMkv/NkEw8+jfLtMeIBDt11tT5+uy+KSq+BvmD5OgPaUMaMjFY6yJXsHeqCWnGs4nVtBE95vEC5RRZluGwZ5JzwXWK6n/nTbTozgW8vWLhCjDhPwZXhTMtApA6km9y/y++rCTyeWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xU+gcbRkmZdBApCxYTuh0F8s39N8XUE733O5zh+nofs=;
 b=OVSeOONXzQ5z60GC609D4D3CUxaxXb4DK50myFl6jO8ffEBlnqKmVraATtIlSsbEEaIJ7C7sz6qddzyOdyW1rcURjm0VXqg3uBmbwXJCFLmXEFFzdeVP6Ev31BccJ4QPe2RUmunJ9Tww9DBxOxTQD7qPy3XUn15dtuP7WqrT/tkCohyMazGqJrUcJMPiyivjZqq+U6WnNaBdSBsawcSFVbuddQpWO9rtMSX1qGJY72oRgETgvYrlOFnPgh+vlQweI6nihWxVArQPFoHl+zktr9zIw1VOFB0C14OXvk3XZ3bZwtjLsD1Y8uuYNM1nx3AKvONUAChNaoknhL4Wrcb3og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xU+gcbRkmZdBApCxYTuh0F8s39N8XUE733O5zh+nofs=;
 b=qPTR+xx9Jmg7/NRahxauiGiyencMBqygBSCaX09N2EpRxnVwy0mQGXadTpoHo9UxHzGH4D5jiog4NyVDp9M/My+nDbprAOTYvBYkYwMH+7Gp55yx0qOWMgPf3s/u1fl+lbyJfSzwJKBN/CX08Y9HAuwu7Jp6la4WMEHx34PGkYnjM5VigEpQPEx/mxTsl1LPRYSz6i7curuj3d+0prOAYsLQ76nzRKzPo2+Q0aOKsvstJpq4YmT4wSndifjxekSRqumCAHyFR+VJkoAbiA5HJ/WReLNOFCpRuIgZc+CSbTIYc7+uOLHT3TlSq0hCm2JKy5BseOM067uUsvT3sjxlSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8726.eurprd04.prod.outlook.com (2603:10a6:10:2dd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 00:50:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 00:50:59 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	krzk@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	andriy.shevchenko@intel.com
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 2/2] regulator: s5m8767: Convert to GPIO descriptors
Date: Thu, 27 Mar 2025 08:49:45 +0800
Message-Id: <20250327004945.563765-2-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250327004945.563765-1-peng.fan@oss.nxp.com>
References: <20250327004945.563765-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0004.apcprd06.prod.outlook.com
 (2603:1096:4:186::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB8726:EE_
X-MS-Office365-Filtering-Correlation-Id: bc5ffbd6-109e-4fde-9a94-08dd6cc97042
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qimuT/kzd9voqsXoOZnmGcWfjmUTeVJkQTSXqqfj6OcE6SKmsJsuYo5YGdG4?=
 =?us-ascii?Q?IATUgXEfOUL0X0JMtArCzsezvjhN30B1Hwf7YTPXixoaOMa8hXfudsmGWrJD?=
 =?us-ascii?Q?ve2uhUyGEL4hok5fkI0T2506fyqFvhGrm2oNhlOyRNl9eeJgvHgyKOH5Nvxv?=
 =?us-ascii?Q?emjFAoIv3E+iNLVNAPG3zpzxZv44m5SxE4s266Tdf0U9zZ746yoUsEUuXGwr?=
 =?us-ascii?Q?rkbeKaA1jXwBx2ikzKt6fI06t2CJBuz2C2/jvg3BKMBJSpHJhvU3DvP5MojT?=
 =?us-ascii?Q?9k0F04Jo8i+ejEC3STG3/qHCv1NblIY6BGSW3hWxd2aTY+RJtj4rKxCGxn//?=
 =?us-ascii?Q?mU1gPkN4Qj7A5XqW/ceu/8ZvYM4nPyosJJnCpe8gBP+RF73eM4E4sZ4m8oJc?=
 =?us-ascii?Q?inAdWzkNmLecKqnuKy8nLjjfJf4u5LxtTrj6xQnTAJRuLmocX+2yJf+oPUsF?=
 =?us-ascii?Q?s3RbaebEdvdptL0OGY6Z7U2puIoQTjaoi4urzA8HBEcAjv0Xft3AGx1pgk6Q?=
 =?us-ascii?Q?J3mxIXsGc/jFMOAOcARPHb2RQXocHpm7Mq2WDvzN4yOcbk3SzGeOiiWNFIn0?=
 =?us-ascii?Q?FHH3TORGA6GafriWTrvCNVSPWg4L4xDWe0jJ5X7Y3DaO6cJk3TDE8yfQfsac?=
 =?us-ascii?Q?BOmjTsL6K5PnMhDnS7ywoCHjDx090cKnY5IM4y5nbBIoBtHMVvLvz+EslAh9?=
 =?us-ascii?Q?x8RcGMAM/tW1MXevDdvsHE462SLJD/7ep+XBKDym3rLKUK+k1lKVww8YYTKy?=
 =?us-ascii?Q?u34PcnVHb9HWw1L5R6huIoIq7Lz64yvgie3ljoAvIf+qmEqkcur8crPxEpX5?=
 =?us-ascii?Q?xMnQLmMAOIpmemxF8o2ruaBPLjz+hRygJx1WGGx9o1VxqrAbnMaYv3ikuQFP?=
 =?us-ascii?Q?o5buTXYieVwrwGiTPiRtFunS/QcRt214PlwZXqESzrXX/E0rPNBjWJL9rV6I?=
 =?us-ascii?Q?AbMov3AQY/LHKg3LC+1RQDauM8qlVTskUr8eb1k4esTGtcu6+93KzOQc/4P1?=
 =?us-ascii?Q?NfMr2GEqdiE0gZIgiW7OsTl5Wkyi5XqVJjnyKMeiuQw7nDQvZ2ZWbiLjZSh/?=
 =?us-ascii?Q?gt01Y8ow4bq55DGa8kIZwQV6UMW5RnVbq6ibAUUCTNK9MavU07xamNrztAz+?=
 =?us-ascii?Q?aJvfO0kFgyLukWXVG1iVMPRH6su3j45vlATQgim/hU4vXPQrmn9VvemTf3Sq?=
 =?us-ascii?Q?5hG/IBVnSPSPqLBVE4D5NxdWJiT6n4YQ4lOtFgiH/Qsyo8EkAG/HZKWgm1ti?=
 =?us-ascii?Q?tqKJnT/ltFeFX5cIrWiYtYUpEti3KhQQVOLAgtImt18sjwUPNI8RJUYC2qk4?=
 =?us-ascii?Q?EySfMppqQ5bngzldLP8kwFiEuIVYaCfzE2oyu8/nC5OX9rw+dEPP1GeXfaqp?=
 =?us-ascii?Q?QrcTDDeWW9ZTJHi1CApyWZCTY/0F0T2kCHEzqk1fz0VaymYTCpZXU7ZjSK8t?=
 =?us-ascii?Q?9qAXpoxav82uHZoczMchrom6uP9A4VFB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qqQseNcMx5hXhN19sqCGuPKhSagiJcV7MvoIDGaNdKCp1YCmQekXj3ZWGPSp?=
 =?us-ascii?Q?8QMikLwo5kantXfWOLQplNTt3UKdFG2NsVx16sBqmmidTymI5dAi0tlAyKsZ?=
 =?us-ascii?Q?wYKJFo+BvC7xA1AtIv36Oqazu2ufOjeuSMEJpdni4K1nePpSeEYuMhdTO6IL?=
 =?us-ascii?Q?tNZJDwg7/rrSG770oENPNTGz4EgW/aaXPABL0nfkplVlBVPk9+6+HNPrtX6C?=
 =?us-ascii?Q?rvITmxriYNg/jNmd7T4gTNNn0RB51IKN+KtG7trXs8GP/15e7i8a+KgZphGG?=
 =?us-ascii?Q?JZqvU1bnKv4ZjFWH84LZ1ijLnYxkz78RzjPdbmzz9XftPG3OakOqV45k3ePm?=
 =?us-ascii?Q?i6CZbMtTnZmbwsFOUUUfdalRuMRzLB9SIvFjbhl7J1tdqGlFpxkK89M47BQq?=
 =?us-ascii?Q?RdRmQsjITpMXUqnxMiCjYl14RBMwOmVn5+CaXNlrRdS64XeVBEGqyhMrR3cy?=
 =?us-ascii?Q?iyzNtCCXH/VOlgJKb8kgH1xkOzmrYjhL7lkgV6qI6kRSyqbEje9kwI7aTwsq?=
 =?us-ascii?Q?hWi5NVPy6r3Iw6lO2TrKA2dNLF/MWlMiFSg6ZLVdN9rsEPT/1Tx4Y38AIwys?=
 =?us-ascii?Q?+iTu4wJRpI+3vG7eHlaoHajtv7HgPNT4e42esG88WggBUtVh6HaTZS9WHfkj?=
 =?us-ascii?Q?uuAsfSGkxCtOd4qPEzqkxmHSMAOrsfdtx2OGpR2odYFOuvFO4pmzjTHvgwQf?=
 =?us-ascii?Q?+nPjmUgiCr8QMxRKitACOjapMZqw8Y93bkloxRwjOC7QF82Lsd9uw8q95HIr?=
 =?us-ascii?Q?TkPZhTGlk9BMo5d00K0j3b3TgxQmdEPRwrsh+kQT8vvYRD/JYhR2v5wt7fqE?=
 =?us-ascii?Q?7AmmOTm+lp0gHVEiSFmsGChc07L/lR3gUxZIHy45tgznWhmVuLOwG9Z0PBN7?=
 =?us-ascii?Q?VgUPDd2caTl/kfFqKc57gySw2qelMkjr46kIhUx45Z+fSLVZGcMtNfaTH2R1?=
 =?us-ascii?Q?LsU39sCyUSLmlJUP8rB03X3SaHFBKNyMUFCFGsaMkztQQhMYvG1HO5AYrDDi?=
 =?us-ascii?Q?DvEEIgcZ0gghCwOt9sZb9qJDBNxuE6XZTxOPQ2N15loC2dj+UNeP7+HcOIE0?=
 =?us-ascii?Q?ir4CuU+I6Mfb/dR+NPLUZdLQHIHJdRiWBzAyrZ/86QzugiGgmYS6BJfOu5oG?=
 =?us-ascii?Q?lspo8s1G3BoKsab+uYGgpm9RiAdSE3iPulIwAwDcYMLTRj1mKCKn1EmmHn6V?=
 =?us-ascii?Q?54oyIlCGC8nKzouxQtmWhjhZ6+sKxOWIs1dl3wx4iFCD8MmLgVziWR4P8Ysx?=
 =?us-ascii?Q?sKqWTqA4UjUsZPmbvZl6lpZUDiMklkYURr4cI6Ls1OLu8BLCOn+6UVoqpj3p?=
 =?us-ascii?Q?EZP8AJAy95Dz06e/xH5bDHJmOckYt7M9GDrs3pIohCR9N46sC4kLU+hghUVH?=
 =?us-ascii?Q?SZTJFrvtQMHJoLRwqLuohxTFxf2k0R0T739N2c4HU4d4dwo8xNGdHZuY1VSi?=
 =?us-ascii?Q?PyimrlMmWz3gUzHdJm7MxjI48g8gkjlfyCehIvug6Hv2jPULBIxrICeKqU4o?=
 =?us-ascii?Q?LsZa9N0ceBSNQJa4b4DlC+jC4SWfBm5EJxSdnKHTJRPWHoPRJJxjMlvVB72o?=
 =?us-ascii?Q?z+EHKKsW0MzvdXhrauwyhtsfQIRyz7ecc+7uG8s8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5ffbd6-109e-4fde-9a94-08dd6cc97042
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 00:50:59.3777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oVAllKbfX/H08N5h6B6UNdCH/wCloNDNTfwf9r7dbzWR03CIYCAMGanZQCUfcC4F12mzGfCKP8GmnY5pDCQevA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8726

From: Peng Fan <peng.fan@nxp.com>

Update the driver to fetch buck_gpio and buck_ds as GPIO descriptors.
Then drop the usage of 'of_gpio.h' which should be deprecated.
Based on commit 84618d5e31cf ("regulator: max8997:
Convert to GPIO descriptors") as a reference to make the changes.

With the quirk fix for s5m8767 in of_gpio_try_fixup_polarity,
the polarity will be active-high, even if exynos5250 spring DTS
wrongly use active-low polarity. So using GPIO descriptors,
it should work as before.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V2:
 To address Andy's comments:
  Typo fix
  Format update
  Use !!(temp_index & BIT(x))

  I not have devices to test, just my best practice to work out this patch.

 drivers/regulator/s5m8767.c | 146 ++++++++++--------------------------
 1 file changed, 38 insertions(+), 108 deletions(-)

diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index d25cd81e3f36..fe2631378ccd 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -5,7 +5,7 @@
 
 #include <linux/cleanup.h>
 #include <linux/err.h>
-#include <linux/of_gpio.h>
+#include <linux/of.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -35,8 +35,8 @@ struct s5m8767_info {
 	u8 buck2_vol[8];
 	u8 buck3_vol[8];
 	u8 buck4_vol[8];
-	int buck_gpios[3];
-	int buck_ds[3];
+	struct gpio_desc *buck_gpios[3];
+	struct gpio_desc *buck_ds[3];
 	int buck_gpioindex;
 };
 
@@ -272,9 +272,9 @@ static inline int s5m8767_set_high(struct s5m8767_info *s5m8767)
 {
 	int temp_index = s5m8767->buck_gpioindex;
 
-	gpio_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
-	gpio_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
-	gpio_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
+	gpiod_set_value(s5m8767->buck_gpios[0], !!(temp_index & BIT(2)));
+	gpiod_set_value(s5m8767->buck_gpios[1], !!(temp_index & BIT(1)));
+	gpiod_set_value(s5m8767->buck_gpios[2], !!(temp_index & BIT(0)));
 
 	return 0;
 }
@@ -283,9 +283,9 @@ static inline int s5m8767_set_low(struct s5m8767_info *s5m8767)
 {
 	int temp_index = s5m8767->buck_gpioindex;
 
-	gpio_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
-	gpio_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
-	gpio_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
+	gpiod_set_value(s5m8767->buck_gpios[2], !!(temp_index & BIT(0)));
+	gpiod_set_value(s5m8767->buck_gpios[1], !!(temp_index & BIT(1)));
+	gpiod_set_value(s5m8767->buck_gpios[0], !!(temp_index & BIT(2)));
 
 	return 0;
 }
@@ -482,42 +482,6 @@ static int s5m8767_enable_ext_control(struct s5m8767_info *s5m8767,
 
 
 #ifdef CONFIG_OF
-static int s5m8767_pmic_dt_parse_dvs_gpio(struct sec_pmic_dev *iodev,
-			struct sec_platform_data *pdata,
-			struct device_node *pmic_np)
-{
-	int i, gpio;
-
-	for (i = 0; i < 3; i++) {
-		gpio = of_get_named_gpio(pmic_np,
-					"s5m8767,pmic-buck-dvs-gpios", i);
-		if (!gpio_is_valid(gpio)) {
-			dev_err(iodev->dev, "invalid gpio[%d]: %d\n", i, gpio);
-			return -EINVAL;
-		}
-		pdata->buck_gpios[i] = gpio;
-	}
-	return 0;
-}
-
-static int s5m8767_pmic_dt_parse_ds_gpio(struct sec_pmic_dev *iodev,
-			struct sec_platform_data *pdata,
-			struct device_node *pmic_np)
-{
-	int i, gpio;
-
-	for (i = 0; i < 3; i++) {
-		gpio = of_get_named_gpio(pmic_np,
-					"s5m8767,pmic-buck-ds-gpios", i);
-		if (!gpio_is_valid(gpio)) {
-			dev_err(iodev->dev, "invalid gpio[%d]: %d\n", i, gpio);
-			return -EINVAL;
-		}
-		pdata->buck_ds[i] = gpio;
-	}
-	return 0;
-}
-
 static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
 					struct sec_platform_data *pdata)
 {
@@ -525,7 +489,7 @@ static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
 	struct device_node *pmic_np, *reg_np;
 	struct sec_regulator_data *rdata;
 	struct sec_opmode_data *rmode;
-	unsigned int i, dvs_voltage_nr = 8, ret;
+	unsigned int i, dvs_voltage_nr = 8;
 
 	pmic_np = iodev->dev->of_node;
 	if (!pmic_np) {
@@ -635,10 +599,6 @@ static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
 
 	if (pdata->buck2_gpiodvs || pdata->buck3_gpiodvs ||
 						pdata->buck4_gpiodvs) {
-		ret = s5m8767_pmic_dt_parse_dvs_gpio(iodev, pdata, pmic_np);
-		if (ret)
-			return -EINVAL;
-
 		if (of_property_read_u32(pmic_np,
 				"s5m8767,pmic-buck-default-dvs-idx",
 				&pdata->buck_default_idx)) {
@@ -652,10 +612,6 @@ static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
 		}
 	}
 
-	ret = s5m8767_pmic_dt_parse_ds_gpio(iodev, pdata, pmic_np);
-	if (ret)
-		return -EINVAL;
-
 	pdata->buck2_ramp_enable = of_property_read_bool(pmic_np, "s5m8767,pmic-buck2-ramp-enable");
 	pdata->buck3_ramp_enable = of_property_read_bool(pmic_np, "s5m8767,pmic-buck3-ramp-enable");
 	pdata->buck4_ramp_enable = of_property_read_bool(pmic_np, "s5m8767,pmic-buck4-ramp-enable");
@@ -684,6 +640,8 @@ static int s5m8767_pmic_probe(struct platform_device *pdev)
 	struct regulator_config config = { };
 	struct s5m8767_info *s5m8767;
 	int i, ret, buck_init;
+	const char *gpiods_names[3] = { "S5M8767 DS2", "S5M8767 DS3", "S5M8767 DS4" };
+	const char *gpiodvs_names[3] = { "S5M8767 SET1", "S5M8767 SET2", "S5M8767 SET3" };
 
 	if (!pdata) {
 		dev_err(pdev->dev.parent, "Platform data not supplied\n");
@@ -731,12 +689,6 @@ static int s5m8767_pmic_probe(struct platform_device *pdev)
 	s5m8767->buck2_gpiodvs = pdata->buck2_gpiodvs;
 	s5m8767->buck3_gpiodvs = pdata->buck3_gpiodvs;
 	s5m8767->buck4_gpiodvs = pdata->buck4_gpiodvs;
-	s5m8767->buck_gpios[0] = pdata->buck_gpios[0];
-	s5m8767->buck_gpios[1] = pdata->buck_gpios[1];
-	s5m8767->buck_gpios[2] = pdata->buck_gpios[2];
-	s5m8767->buck_ds[0] = pdata->buck_ds[0];
-	s5m8767->buck_ds[1] = pdata->buck_ds[1];
-	s5m8767->buck_ds[2] = pdata->buck_ds[2];
 
 	s5m8767->ramp_delay = pdata->buck_ramp_delay;
 	s5m8767->buck2_ramp = pdata->buck2_ramp_enable;
@@ -787,58 +739,36 @@ static int s5m8767_pmic_probe(struct platform_device *pdev)
 
 	if (pdata->buck2_gpiodvs || pdata->buck3_gpiodvs ||
 						pdata->buck4_gpiodvs) {
+		for (i = 0; i < 3; i++) {
+			enum gpiod_flags flags;
 
-		if (!gpio_is_valid(pdata->buck_gpios[0]) ||
-			!gpio_is_valid(pdata->buck_gpios[1]) ||
-			!gpio_is_valid(pdata->buck_gpios[2])) {
-			dev_err(&pdev->dev, "GPIO NOT VALID\n");
-			return -EINVAL;
-		}
-
-		ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[0],
-					"S5M8767 SET1");
-		if (ret)
-			return ret;
-
-		ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[1],
-					"S5M8767 SET2");
-		if (ret)
-			return ret;
-
-		ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[2],
-					"S5M8767 SET3");
-		if (ret)
-			return ret;
+			if (s5m8767->buck_gpioindex & BIT(2 - i))
+				flags = GPIOD_OUT_HIGH;
+			else
+				flags = GPIOD_OUT_LOW;
+
+			s5m8767->buck_gpios[i] = devm_gpiod_get_index(iodev->dev,
+								      "s5m8767,pmic-buck-dvs", i,
+								      flags);
+			if (IS_ERR(s5m8767->buck_gpios[i])) {
+				return dev_err_probe(iodev->dev, PTR_ERR(s5m8767->buck_gpios[i]),
+						     "invalid gpio[%d]\n", i);
+			}
 
-		/* SET1 GPIO */
-		gpio_direction_output(pdata->buck_gpios[0],
-				(s5m8767->buck_gpioindex >> 2) & 0x1);
-		/* SET2 GPIO */
-		gpio_direction_output(pdata->buck_gpios[1],
-				(s5m8767->buck_gpioindex >> 1) & 0x1);
-		/* SET3 GPIO */
-		gpio_direction_output(pdata->buck_gpios[2],
-				(s5m8767->buck_gpioindex >> 0) & 0x1);
+			gpiod_set_consumer_name(s5m8767->buck_gpios[i], gpiodvs_names[i]);
+		}
 	}
 
-	ret = devm_gpio_request(&pdev->dev, pdata->buck_ds[0], "S5M8767 DS2");
-	if (ret)
-		return ret;
-
-	ret = devm_gpio_request(&pdev->dev, pdata->buck_ds[1], "S5M8767 DS3");
-	if (ret)
-		return ret;
-
-	ret = devm_gpio_request(&pdev->dev, pdata->buck_ds[2], "S5M8767 DS4");
-	if (ret)
-		return ret;
-
-	/* DS2 GPIO */
-	gpio_direction_output(pdata->buck_ds[0], 0x0);
-	/* DS3 GPIO */
-	gpio_direction_output(pdata->buck_ds[1], 0x0);
-	/* DS4 GPIO */
-	gpio_direction_output(pdata->buck_ds[2], 0x0);
+	for (i = 0; i < 3; i++) {
+		s5m8767->buck_ds[i] = devm_gpiod_get_index(iodev->dev,
+							   "s5m8767,pmic-buck-ds", i,
+							   GPIOD_OUT_LOW);
+		if (IS_ERR(s5m8767->buck_ds[i])) {
+			return dev_err_probe(iodev->dev, PTR_ERR(s5m8767->buck_ds[i]),
+					     "can't get GPIO %d\n", i);
+		}
+		gpiod_set_consumer_name(s5m8767->buck_ds[i], gpiods_names[i]);
+	}
 
 	regmap_update_bits(s5m8767->iodev->regmap_pmic,
 			   S5M8767_REG_BUCK2CTRL, 1 << 1,
-- 
2.37.1


