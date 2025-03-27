Return-Path: <linux-gpio+bounces-18031-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B7DA727E3
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 01:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA4BA1771F9
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 00:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A1FC133;
	Thu, 27 Mar 2025 00:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FFjEMNp4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2065.outbound.protection.outlook.com [40.107.241.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B6923CE;
	Thu, 27 Mar 2025 00:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743036662; cv=fail; b=f67vcf/xMJdoJ1r9/tLvj6osTZ2f8gDDPcTg8xh8tXDHGsmynszxYT2enuv3Z/WAniwi2s02aaHHOhEBLpOS6U9jz1i+rLvsGizNzE5laGJr1eAhcangx8qBY6t+1iGWXCKDS57SVvz+IBBj3boBvr/E2MQJBWU0RsIjoHRIqvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743036662; c=relaxed/simple;
	bh=BjSMvoiAnFzvzUqzJq4QP2cm4zUTQMossZsQgAqi20w=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=VFEGgBQgzLPR9Hw3/HLs7d8FZMQVsV4ssC1RzGCwuH1IlYP92PHLuLoZyKub/bC7+hYLW3H/d8rKw5+iajdxuBnYujZg/VxJ1q9VfcKGBy0wRjy9+BSHZgX0zr0krQP5dsZlcPHs82jxM66scokGgNRhGNsIJ5FPwIzwCZX/k1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FFjEMNp4; arc=fail smtp.client-ip=40.107.241.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NdYwP4PbQlxBM/m0LuE7PQl4xZQxAD0ihGEfOyOHg/3JJajcoDR4hz5JLDUpkHHCTifITOr76wDn+zBO9QUbuJb5ElRNabqHdv7KHp+riHz5JKWrwW3KdsaOfOeP8HFK0OgbvW+LgWHdlBLt7WXiqyIXjuYQSg9LyZ2PfhyTx61KesfrZvLTwgxAeVFvUOfYuBXR9kTV2TBBqUGPrTbLUhH+T4JKm736POgfuSD75MX2wwq1trnlCGJ+2Wwn5jE6C+9vC5d3uVPdb4J9sJpXDRL4yGomTPZFvdxGTFa72El3X+nvPEJXFLy0dPPh3AqguKbuEACECQQ3XGfOK2ReIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Usr858JYEuF2vOHvB0fr0aDL7xSPT/qlWbvw4e/EKE=;
 b=EMR3u4jaXgl6EeBkdSOmcEA1x+OPiecGFeEzgv3oVYM6+tzt/lAfVe5hRmtJjKwbLS6qRd03usMHZ/Nbxfo6LkfxeQaiR6dEJA+VWUbB+zL11EWPxryQKVJaTxrqkQyQd6DXfxm+tWOCVA2ej9d8Y/XJCkKGTqGZDQVf7n8MYJGzIg7HoSWz8HzZCr0ozaJRY3S4C5o1RKzj3iZyOORklHpiCJktDqq0cO/h1cajnWtmReGMb9Rhzw9AwUodzaUaNZQ0kROkEqXRsVrH/bZmuSp8DXrpsWl/aS/ix/hL2Ef2g0Za38aPmSKBLfykHAEvA1lTDZfYlh4uK3rUn3Ajlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Usr858JYEuF2vOHvB0fr0aDL7xSPT/qlWbvw4e/EKE=;
 b=FFjEMNp4nG/KB1gTl2TmtE16H6RKZuz6UAm5SpclpDDiNbcKlMTOXN4TvAum6wcfVLY/hMpWHDH+ttjDXnps+XCyTNoC9rGs0LLAeJ4JCFUG1UPrwEOKCUZ0mTl0X/0NFx5K5ExQX4J2W+JdhHIfIIVFUOits0oUec6hZtisDxxYHi6StTXLjDGlJd2VL07LHwoh2ZlF/rSqQvWjctKasx27OrAMDnKeZ7EYclfAij9KePDxrx2PuLZsIjq36ifWCjDIPcqvZlM5SeAubBoAb4UYy5Bdj3cm+mGByyJmeltkKhN96tMmmpzTvRzZOA2z+2nhqAV5siE67hmwFx759g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8726.eurprd04.prod.outlook.com (2603:10a6:10:2dd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 00:50:55 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 00:50:55 +0000
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
Subject: [PATCH V2 1/2] gpiolib: of: Add polarity quirk for s5m8767
Date: Thu, 27 Mar 2025 08:49:44 +0800
Message-Id: <20250327004945.563765-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
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
X-MS-Office365-Filtering-Correlation-Id: 2b9c271f-7603-447c-ec92-08dd6cc96de3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/HRYNKBDzYfNyWwbi/DmAU6hQwPGPN5SPk9B9SG4gW4uCaLoDTZ2nIgnoee/?=
 =?us-ascii?Q?eK0ZNk+//gkGZWh2rfgsmZPjB0QvDqY4WCC5FJHd+erxxgaMMRVaTjd67zWg?=
 =?us-ascii?Q?zf8ItjmSR7gymmez1OpF6EVjNHflEOD5ZIofHFaSOXZlN73Z/OyRysUQthne?=
 =?us-ascii?Q?8zW1Fp7FOJcnKy7gT2bDOr5sbZ7cyTC1KzVAvofdY7eRugbggn0e/g4wiRQN?=
 =?us-ascii?Q?zqRdpDpL+qe5Q3rdf1c/UVTvZAesadRlLGUZMlZZ4NBorUIMFFqV+FKYGb7l?=
 =?us-ascii?Q?gUAlNHHqzFVjoVkveFNfboTvuHF0ILFrhf94viFQKsoHwefUMdnHcOoty6cf?=
 =?us-ascii?Q?/tT62yt9VpLLL9tYELwYiorToj/TJjUlwmlXUGQsV+lC+L2hGRDwCdkP8f7Z?=
 =?us-ascii?Q?qDma5g2GXouTtVHtKw99tDpuBNp5NojCKiALyOeInvfsY6Nq85+Wj235bov2?=
 =?us-ascii?Q?/Ljb/Web/MZfjzYkDS5RgJG7CtU0ltfw0qp+cAq3QLHB29zFTvOJI3BdSaAs?=
 =?us-ascii?Q?+gHMbHj5iTHoL7XdRFoYcfW7qTYpLhoJY6F2opW70YMJqChdkw6s9r2wjNh4?=
 =?us-ascii?Q?R7L+/ngeZE7MvyJ77k931xasPKeBB8T+ygmYU+98fWaQmRWQ9cEKvscWSpir?=
 =?us-ascii?Q?9AnzQ28ugzP02ZArxhfymg70RtTR4cKnKzc5khTeODXnYQWTXqMZM56ZVSAS?=
 =?us-ascii?Q?MCc5ApdZEIcd2UQB4JNFb07dYUWYyz/ji/Ih6s4jv89Ji6Dus3Nq2eIYhIXL?=
 =?us-ascii?Q?pWCF728eBxgXmZ8yx9zZOa24tljyZ4tmKsOhak5Ceyug1lIlWOOixKdfT4Uc?=
 =?us-ascii?Q?gI2WZsr5Mh95qJ9Q0GKbodtWqZCYFutL17+8QQENyE9oqQIQyj+8Oapcg7nl?=
 =?us-ascii?Q?05aa8XqOzJutWjdOmODyr+J/4zwkFLEvmAXxv9VACbqD5D+4Ytx7CRIG7Bgi?=
 =?us-ascii?Q?Y71Rxf3tan7IuxAa+0dmYXsaohlLEcIwJJ/I/cFlQND4Ao7Qa+PgwQ7TXS4g?=
 =?us-ascii?Q?0tLYNXq+dyoZVX7iViCkcfZ1Mrj+RSHqJpK5f0HExORpxuT4vjJg4akhO0tt?=
 =?us-ascii?Q?hZayj8k+Lg9Dc1jFbF9j8HUBBc4HZzfBolIfebi3sxhcBAVD7fcEmMlpF6KF?=
 =?us-ascii?Q?YbcedNBPpOTErlftcZ+N5XlDiF7e/6XyL2bJV9wXVcR9ooq/pk4H6B4xGMXr?=
 =?us-ascii?Q?bMDUyZACtF0qqgLOLmJk21OMcdUwXrEo3nX4ng6ylJ8jV2xOk/w8Lf0F4oYo?=
 =?us-ascii?Q?D8Q0Ev9mxPniCZEcF2nfT/IiGHKINHBXheYptiG0sLswdukqaZpmPvc+mlKe?=
 =?us-ascii?Q?E0w56UvI/F9snTrT58eINMNr+j9PMBsYLgYH0qRUgrFc/l00nJG2jio27ujW?=
 =?us-ascii?Q?92kfKC0lan8WrqCKntSusASxd5AGqhQDBYPswIfTarNe9swKWOM9PDANcDl2?=
 =?us-ascii?Q?osSmbSgJGbLAS37b8dueO76CBp8nIqMS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s64dX482XKp3rXC8M2IcJRV6y7BIaMH95E01d9y/CeHGcHH+pEZDSL8em9EW?=
 =?us-ascii?Q?6u/wJ/Rdto7iNg46fd47l5J67b1Wdz1s/z7jSCugaF8Z5SLBpMm+IBaJ1tRh?=
 =?us-ascii?Q?FFeufY7r1uJpkLU6/Zal9waJw2kDmYpkAtBmUCxZq8mNl4OKVl0XaMCrutwV?=
 =?us-ascii?Q?twOxunKbg076m0n6hAjGPgrCv9O0m6Ecwy+vIInT0IzN2RMjJL7mBHe6hsoD?=
 =?us-ascii?Q?hENdjOPWbFHauJ+5X1Eqsv4yAu/hURxQDJalNIW9HXszhTniaTJKNE0v+06l?=
 =?us-ascii?Q?q3FUIWzsTWdh2ERPqXvbFMU6un41w2cOdyv6iR8+7MQpCJPRXnq8JVEvD3r1?=
 =?us-ascii?Q?Jv+GSRspLJIeZq04n3wLnzY7f2DCvqKWSX1LZSYpiRVLPnEeTUOnkdn74j/y?=
 =?us-ascii?Q?ZNkKt556PPzgdGDIUUrYHvFysRqcbPqkNjOAeUmKuNHtrzye6GmBs/Jz4LW3?=
 =?us-ascii?Q?xOkOtvA0qBO3gBv+uuVA/+sIHuANfJs3/bIbQSe66Vfutnz3a2kWtqCt2Z6v?=
 =?us-ascii?Q?yiF4opqqVu6GMfS730HIT7w4FByG3mgK+kdOVwhZBIQQarJTohI87qCTVJEh?=
 =?us-ascii?Q?TYV/qgeuOuS7VJCC4CkmBiF4KhXohOA7iuffLeUtxgfqDDMD3875Pa0WCpua?=
 =?us-ascii?Q?Lkd9QwNGGKAd9RUQrpU9kAWUl22maMIcPDmR4EPI6F7WvKbysITnzgtnMLeJ?=
 =?us-ascii?Q?4UUhJ1Kdf6wZFb1crQ1EnocMFn01oEIKclaeFAxM4pYpAMfI/YywWRFKYliM?=
 =?us-ascii?Q?6KMhHrZXlj9cP0rpNocK0Je9okOc7UbglNCffnI5DNyWpt2clp1rH0s4f4Mo?=
 =?us-ascii?Q?cICYpI1i1VC3MZQC0JYvmINc8QGhhlZ4ruQQjfv+1fNIaenz01RNw2jadDvT?=
 =?us-ascii?Q?DmGImFl9IeTS6BvraxMKGgfB5Sr8+ImCsfICDLRYznAnSiQXeZZv7l5uZhQL?=
 =?us-ascii?Q?QBFqIU34Kal6thetSGiOE4aMieK9+f5nBRai9yLkownBYBCGtD9xxJ4+sHjb?=
 =?us-ascii?Q?Kz2QNCDTrZwEgyPYxbkbLFZchD8E9f2M1eMtXGgiHqZ9wNf5q3Ub5vkYJOr5?=
 =?us-ascii?Q?xMSPYb57DTmTvCcDxqfbwPM3TVLhnFsBNIOUFEsgmubwsaq78Bypf9IDJmxu?=
 =?us-ascii?Q?Oq6Xn9XmfgrCejS87SrIjcYx6V9stjmQZe2GpNDDQCZISrxJ+R0KDXJnJRkZ?=
 =?us-ascii?Q?OowWITKT4hCl+8KGeasw3XqP1fQWQapSgXN5PUQn5FvRR2NQ9CJvOrAcHgRE?=
 =?us-ascii?Q?R/u+ibU/EpvQfSGNBCt4vUPBgw8MQE+UsATKfT8egw0iohjykk/4lZnjjV66?=
 =?us-ascii?Q?jEapQdADu54sz4M+eWq4rnVG+6nRSIcqOZpkusDnCIrrJR2ssQdnH1XrlOKR?=
 =?us-ascii?Q?+ox+B3QnedWWBApvKkjRV4RcExEVOAzrWMa+Ib8g/D0b8Gc+aK678iXLFMW6?=
 =?us-ascii?Q?eyuPTm0jvgGjmBwHB/RJifkMX9Tpf+jC59TB1NiF7Xhs/mZ06M8+Ms/uwBs0?=
 =?us-ascii?Q?gewu4RU5GbigTtdyif2ua0p3T//dsO27XCpOhKkOlr3dF7XVgoVCDP/cn6Wp?=
 =?us-ascii?Q?tXci0Gp3u6nJJq0DTEnXHEtyhyBVxy6hT++RG9aQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b9c271f-7603-447c-ec92-08dd6cc96de3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 00:50:55.1604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: il/7V9tt6fXN4kOxZoYgWCjZsQrzxua10eK+l/dJwGD+M8F4zjZMtWR+iFoH5T9SA+h7K8YYch7wAQMedC3i4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8726

From: Peng Fan <peng.fan@nxp.com>

This is prepare patch for switching s5m8767 regulator driver to
use GPIO descriptor. DTS for exynos5250 spring incorrectly specifies
"active low" polarity for the DVS and DS line. But per datasheet,
they are actually active high. So add polarity quirk for it.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V2:
 New patch

 drivers/gpio/gpiolib-of.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index eb667f8f1ead..83559dd24f32 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -222,6 +222,15 @@ static void of_gpio_try_fixup_polarity(const struct device_node *np,
 		 */
 		{ "lantiq,pci-xway",	"gpio-reset",	false },
 #endif
+#if IS_ENABLED(CONFIG_REGULATOR_S5M8767)
+		/*
+		 * According to S5M8767, the DVS and DS pin are
+		 * active-high signals. However, exynos5250-spring.dts use
+		 * active-low setting.
+		 */
+		{ "samsung,s5m8767-pmic", "s5m8767,pmic-buck-dvs-gpios", true },
+		{ "samsung,s5m8767-pmic", "s5m8767,pmic-buck-ds-gpios", true },
+#endif
 #if IS_ENABLED(CONFIG_TOUCHSCREEN_TSC2005)
 		/*
 		 * DTS for Nokia N900 incorrectly specified "active high"
-- 
2.37.1


