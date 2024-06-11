Return-Path: <linux-gpio+bounces-7366-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C964990423D
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 19:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6339F28BA5B
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 17:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6ED23BBFB;
	Tue, 11 Jun 2024 17:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="R/3qXUSU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC2D11720
	for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2024 17:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718126137; cv=fail; b=hAFI9Vkd3PLewE9eaZI11PW+7DVOwfaappAyF0ifNwD7bQItJwg7OpPJDMrJPncTGpwiCQ5kbzDEo0YDuEh86ok+vmNNWqGSyMUfUzfqfzbuxmgyLYUBZYdAHfc0W8LZFf8uufmGKqEokkDGVw4VVBYRAiD/ePUWLZHOVd12fhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718126137; c=relaxed/simple;
	bh=VUUkuHZqaeXnpZRUz/ZHzfmxhOlvxwemDqBhc2hrsg4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d4vRetJ1psfgg34nqux8G6aEEjlFdvUcJP63Fj6STGy1CnIC80oaeoQ2R+OVrlTyGyW9OW7VxbuBH/SQquKejgSuVZvLupjh8cCU+qG/jgJmreJ75c2jYhEn4A9iqjuxdcAPpDJuQ5Y6i8qOq78FsT4YUr/lXug6+29rI6MyiSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=R/3qXUSU; arc=fail smtp.client-ip=40.107.92.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JN0J7dO1p09xLxdxqVkHsRVmJL+m7JaFhsbgp2hAYou1xy/fiAyjZCj/RzhW9dMEWpGN3RQRn4KXfNGxKhCD7Td1C1K1SuaRh5VI+jSoV1NAWf8/7zz8bTonsou+f3aOtdLazneBCvFIjIjuO0T3/16B920xSMTPDU04T1b61fsGCLRhzdRD3yomf4R01pmknvaJd2TWkcCHP+mwXqMb8Ma8Q9+iEOKcUhXgkZ3OSN7LW+H363E9g94HePNTrpDEQ+OMHBBzVB1p2c2lUuDf5XpTRDwt68ooKHoYyVyaykObRVjPqq5B6pTx0av8ro5gWko9zcdMZh1Y4ON4Bw4DQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55/RUGrTH+YmyLT6ielYn43KHKzBSOVRN6F0wJrmuuA=;
 b=X9x3nDrWp0tjcVeCfrtcNQPVu9ITNX7qf0J8LOhqW/JYPetFoAcR/CkrGk/Ay1gOnMD24465N/iEBlptby/AGECBbkJr+fyWkjT/eJaAJh4Jd/1/UOtlkLXN7e+6EXiyWhwUleBmTvBImUCynKij7/FUdzcJ6q0um2WUQs0fx2HN1Q4q6MkzpxM6cai6QOz5ZZE5Fq/zduEX62zSryiIWJlrdCJI0+TJNSztVeB+2h8kj8LXfCj9KC4K9GhlVfUGVTeBbI18T8Ye0McSscj8Xx+UqMyy+jKoB6pnwnsnz3lNNVfsKS+e6IEATVfKAdCYcHgkJZejnNOSVSskGxoLRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55/RUGrTH+YmyLT6ielYn43KHKzBSOVRN6F0wJrmuuA=;
 b=R/3qXUSUpthWjEIERXkPw3YqQe1Xt1EGHvgT2399/jagwdSNHr0/s1Imgd8UIYF3aFR1kn0zPqf/tjolfqDRSWyskgP70r6SpoS8SL66KYOp2BMNAOj34fQNTUp6pcWUcZH/h4dbobh605GkwXgB3Cg2QPSC8t3qobmVM/ymgcjqAYcFeUgctiDmTAgCCPecp99QAGG9GRB9DuY9b1KBpVKchCd6aDY0S8fWhsu6pqstnDVnoWTnfzEGfQC2hP7p3VpHqLPvh3I1ot8vKM1JmycSO+AGzKWoDywx2X27BjH75DeDR9X5WYKrSM8oMXJXhq4jhzBSoBoL9XlI2E0KXw==
Received: from BL0PR0102CA0026.prod.exchangelabs.com (2603:10b6:207:18::39) by
 SN7PR12MB6815.namprd12.prod.outlook.com (2603:10b6:806:265::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 17:15:31 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:207:18:cafe::67) by BL0PR0102CA0026.outlook.office365.com
 (2603:10b6:207:18::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.19 via Frontend
 Transport; Tue, 11 Jun 2024 17:15:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Tue, 11 Jun 2024 17:15:31 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 11 Jun
 2024 10:15:12 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 11 Jun 2024 10:15:12 -0700
Received: from vdi.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 11 Jun 2024 10:15:11 -0700
From: Asmaa Mnebhi <asmaa@nvidia.com>
To: <andy.shevchenko@gmail.com>, <linus.walleij@linaro.org>,
	<bgolaszewski@baylibre.com>, <linux-gpio@vger.kernel.org>
CC: Asmaa Mnebhi <asmaa@nvidia.com>, David Thompson <davthompson@nvidia.com>
Subject: [PATCH v2 1/1] gpio: mlxbf3: Support shutdown() function
Date: Tue, 11 Jun 2024 13:15:09 -0400
Message-ID: <20240611171509.22151-1-asmaa@nvidia.com>
X-Mailer: git-send-email 2.30.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|SN7PR12MB6815:EE_
X-MS-Office365-Filtering-Correlation-Id: 34dcd521-a577-4607-3d2f-08dc8a3a1902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230032|1800799016|82310400018|376006|36860700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4t4IyqEWZAigyfbrHt3mpwGmspHT59AundePLEPh2hriptqauHeXSmfNiE6Z?=
 =?us-ascii?Q?pPmL1zdwkWoqs5LEmEgbwtUnsib29Ma+5abeKxB+7BRaUCIhMMyLSTJJ1wXr?=
 =?us-ascii?Q?FQLn9oUwZl+gg+A3IgEABX/xluHgU3wng0QCrsMKrRGfWRvRtMPl9Z/xkzo2?=
 =?us-ascii?Q?miGd6curwgT7B0DB0mhfz7keCzZRvPtfvQyiCXPiyz01CUotBdp2oGUUbf3Z?=
 =?us-ascii?Q?wiHHe/S8KTxqmucxLRYbytZ0idZIn/f4vRSuiLPa88yz8QZ+OGdYL55ncp3R?=
 =?us-ascii?Q?fwOmK58/5a23E7zBi6j2X278uLoFaCVzmRKrwJwyA4qh8f3XYZL20lm858ee?=
 =?us-ascii?Q?u0OefHohhbKQGle7LVzBuDWMUSt7FlwioFUqqU4RL+csLMfTIzzcXQI6hVhw?=
 =?us-ascii?Q?PK8UyaQId82M+x/tHnbnPnNVVP0iIsvqnVsSBZsmP/vZzAuLqdP8L/sKHdhx?=
 =?us-ascii?Q?M+rBgdM8jLBs+P2JhmrL6/7ABxesVmDRGco4eH1SiCQ5ySFigh85WLJ11qeQ?=
 =?us-ascii?Q?FapqeqMXjO+VNWCNcXiU1nJw16X2lnX3cVT+Qa9X85JD7r5HF6b4yKj0dqRC?=
 =?us-ascii?Q?C+o30cj6sqOC7/6NHQLJgl7H9mwRtKvYPN+D/5Cs+BwVR7pZfNHRi7zWw6zm?=
 =?us-ascii?Q?TK3SXu8o04SaMTC3FarDXbgHnb2T2+toLA0SJdWYSzxzFvOve6G/plyOndhc?=
 =?us-ascii?Q?bcBf+Pu8TGZc3/I2HYCKtgXodJ5fx3i0/JRDg8vQmTUstJkKCkrURDYlPYjl?=
 =?us-ascii?Q?1o6gJkOwsW9ShzLCeYEKnE9cYyWJdyyeVmF2/Km77vTPgvmGKVVCNl7ZUmOI?=
 =?us-ascii?Q?n4ZQfi6a8bCZnork4RER2gV1BWU67MOyKNk8QzO3nLPxP29TlhBWVec3p6aj?=
 =?us-ascii?Q?CHRk5MHDOqTl1hyTbYcOBV0eOnaxkRdNJ7Oo2XgcHw8ACo24OVrNzUyv+qKb?=
 =?us-ascii?Q?mlT8LJQ8faInAbYduWQrLNajw83zLJgNNLrL/BTKPiPss68ImOSF0dt+YmU3?=
 =?us-ascii?Q?Saks5J1I2IxdhLSijsOEiTqHAs7utZOMQudj52+hFBj7mTsPO/F/PnRNCZwN?=
 =?us-ascii?Q?VxgZSSN2zyTifVvbnC83Ul17uAqdiIlstcv+oPtIy22+0QjXu0M8k8hJp+wi?=
 =?us-ascii?Q?5erGFAwHslja1YVHHdNGivdpb2YbH0iAFEA4HcuaL4oE7Y+9kJQNYN0N/5wG?=
 =?us-ascii?Q?+yR+CuFiNTa1ab6l710vNUBHpKxpEx9Z958Z3BuVfE7XUmv8fYWDZCG4VeBe?=
 =?us-ascii?Q?m+J9hRGK8Ihm13n1nheJiNFfXqIiIqSaTxQBDEURpejKg+EL6h28lMeOvrAL?=
 =?us-ascii?Q?4pq6NPsaEvE+jZ8j+5AXeb/MsmoE4dtrF+llYYzKVBdyDbUrEA8pTo4glVl3?=
 =?us-ascii?Q?E7RU9cmb+YizwXc8xJznRWzXplK9UnZ80v06Ihc2xZ3b5KAISA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230032)(1800799016)(82310400018)(376006)(36860700005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 17:15:31.0206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34dcd521-a577-4607-3d2f-08dc8a3a1902
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6815

During Linux graceful reboot, the GPIO interrupts are not disabled.
Since the drivers are not removed during graceful reboot,
the logic to call mlxbf3_gpio_irq_disable() is not triggered.
Interrupts that remain enabled can cause issues on subsequent boots.

For example, the mlxbf-gige driver contains PHY logic to bring up the link.
If the gpio-mlxbf3 driver loads first, the mlxbf-gige driver
will use a GPIO interrupt to bring up the link.
Otherwise, it will use polling.
The next time Linux boots and loads the drivers in this order, we encounter the issue:
- mlxbf-gige loads first and uses polling while the GPIO10
  interrupt is still enabled from the previous boot. So if
  the interrupt triggers, there is nothing to clear it.
- gpio-mlxbf3 loads.
- i2c-mlxbf loads. The interrupt doesn't trigger for I2C
  because it is shared with the GPIO interrupt line which
  was not cleared.

The solution is to add a shutdown function to the GPIO driver to clear and disable
all interrupts. Also clear the interrupt after disabling it in mlxbf3_gpio_irq_disable().

Fixes: 38a700efc510 ("gpio: mlxbf3: Add gpio driver support")
Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
Reviewed-by: David Thompson <davthompson@nvidia.com>
---
v1->v2:
- Change 'gpio' to 'GPIO'
- Use GENMASK()
- Use platform_get_drvdata()

 drivers/gpio/gpio-mlxbf3.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpio/gpio-mlxbf3.c b/drivers/gpio/gpio-mlxbf3.c
index d5906d419b0a..10ea71273c89 100644
--- a/drivers/gpio/gpio-mlxbf3.c
+++ b/drivers/gpio/gpio-mlxbf3.c
@@ -39,6 +39,8 @@
 #define MLXBF_GPIO_CAUSE_OR_EVTEN0        0x14
 #define MLXBF_GPIO_CAUSE_OR_CLRCAUSE      0x18
 
+#define MLXBF_GPIO_CLR_ALL_INTS           GENMASK(31, 0)
+
 struct mlxbf3_gpio_context {
 	struct gpio_chip gc;
 
@@ -82,6 +84,8 @@ static void mlxbf3_gpio_irq_disable(struct irq_data *irqd)
 	val = readl(gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_EVTEN0);
 	val &= ~BIT(offset);
 	writel(val, gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_EVTEN0);
+
+	writel(BIT(offset), gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_CLRCAUSE);
 	raw_spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
 
 	gpiochip_disable_irq(gc, offset);
@@ -253,6 +257,15 @@ static int mlxbf3_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static void mlxbf3_gpio_shutdown(struct platform_device *pdev)
+{
+	struct mlxbf3_gpio_context *gs = platform_get_drvdata(pdev);
+
+	/* Disable and clear all interrupts */
+	writel(0, gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_EVTEN0);
+	writel(MLXBF_GPIO_CLR_ALL_INTS, gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_CLRCAUSE);
+}
+
 static const struct acpi_device_id mlxbf3_gpio_acpi_match[] = {
 	{ "MLNXBF33", 0 },
 	{}
@@ -265,6 +278,7 @@ static struct platform_driver mlxbf3_gpio_driver = {
 		.acpi_match_table = mlxbf3_gpio_acpi_match,
 	},
 	.probe    = mlxbf3_gpio_probe,
+	.shutdown = mlxbf3_gpio_shutdown,
 };
 module_platform_driver(mlxbf3_gpio_driver);
 
-- 
2.30.1


