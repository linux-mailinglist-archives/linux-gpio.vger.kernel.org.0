Return-Path: <linux-gpio+bounces-7363-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F92903EF3
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 16:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 698A8289126
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 14:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0508B17D899;
	Tue, 11 Jun 2024 14:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EN53Ejyf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341B517334F
	for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2024 14:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718116703; cv=fail; b=IzSj09TR8DLibgyU2YcRm3QQKOw7fWcflAMZAVsIVbPUcr0pGnTE50gpLYGmAkMN/RYqPadTc55xStW2y2eKjTeOynVzQM8La3RwidbMkvrFxhQRb0cxf5TlbEbXUlPrSq2RxvZkEt6MU6f6bHJr8Y3/6RgcyJzUJ0DIUwN2YWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718116703; c=relaxed/simple;
	bh=UH7o4bJQBBFAr5DEH/RzszxF1NKXFGO7tcAFwwFaz6U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZndrV8RWWlBXrJKsN9jm9boOAasqqdh4y2XWlVtCaRmmb+/Qflyoa2UMQGM7MNsPqytN+I/vl4b8Ouf+t635NYU+eWWaZfKYBlSuMxzXBlRUuGs8t5yxa+gXbrwhagKgWpQMODThtC7BOjQCGdUxE2pSBMu/4qoLTf9Az0INzLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EN53Ejyf; arc=fail smtp.client-ip=40.107.220.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agzqcJjSUonwOUxFbN7DIhtyxfLtik6fdyTiLyu2iyYDx2pxKuwnRqUuI3zWP0+tQMEbL4J8VHraNbfAYfrR89taXZMd1vOXfjmaM39XTHBBldPPQiGlWCIzrEE5yybFoNQ5xNKp70fNmopUjwr/CSh8GMd76fUpsZSLtJzA1bxS/H8nB5pjAn/3jw7zsuSbTMbx3EcEurgCtXFvGRyHW7/WpHLj/ynw3HdpyCvwa18+R3tzv+rFS4hkPNyd/B02nVtIEZZr7PSth2Gfez/6XVg8I5jnC2fJHgfCfhpX3CG3Uvkj0/rUUCUZE3z4eYcF5SjNI+iI2rbuL7/5aPBEYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6c0e+cgLr+Fhv9/jPJnyDC29B4dQDK/DEfXfHXPgp8Y=;
 b=H5OlHKa/DLdEUpPtdEgB2sdPR3FtPXIB05Xskmkvw2sqBH2CTHp1f+ZDkyHQIc9YKKclRZgCPEHeAnj3UEA3yRCvFyZNPzTg9qnk7Ql4g8u+rPPltR4Nc0mZ2SlubrhFvCZZR/1Mx6GUfk2A+XuPaxiW8EoTveFUITDnvrukAguQxLiAvsHBd0GO08P+Lk3fA9CQkmWzVosswQ7ua/w42ZGFb8THw933nX/fJhAvknpdSTzgVYjuoaM4arvl5dkjwpYHEzJCRCnf7PD3vyfd9KLFGdt+fGUtjkdA6fFnrPckQJOju5Fx3oqjNRzi6h4VCNoC1BHAl0riYpUknGrTbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6c0e+cgLr+Fhv9/jPJnyDC29B4dQDK/DEfXfHXPgp8Y=;
 b=EN53EjyffKzdizheL0Rsjwa7SjJLUKiAjPEtn5koQf36RwVfEczC6VYWAd2PxSaACjGRGhpTHkQ6bhvxoHfnHL2D79BUV7t+33qBGkdYcZtqTSq4WMB3Eu7/Ft46DOkBdbIvB9pLVlVQdNNaAdbUrFwDogM8vtai2GvyJSob4tRnxnwHWiwlfwiKbIEuFPf4rTco8u2qbO2HGXtUUw2AL1H4yDBffNs2APU9+frc8SU85fI7TOhj/3frMiJfYq6gG8KW040wfWXN9/PyqZ700YcInH8+r09VlIpA75oYxuGmeIqBjCHJQSJ5bNtVa3402xzORrnwpvIdaXzbOHoQ0A==
Received: from BY3PR04CA0014.namprd04.prod.outlook.com (2603:10b6:a03:217::19)
 by MW6PR12MB8707.namprd12.prod.outlook.com (2603:10b6:303:241::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 14:38:19 +0000
Received: from CO1PEPF000044F1.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::4e) by BY3PR04CA0014.outlook.office365.com
 (2603:10b6:a03:217::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.28 via Frontend
 Transport; Tue, 11 Jun 2024 14:38:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044F1.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Tue, 11 Jun 2024 14:38:19 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 11 Jun
 2024 07:38:03 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 11 Jun
 2024 07:38:03 -0700
Received: from vdi.nvidia.com (10.127.8.14) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Tue, 11 Jun
 2024 07:38:02 -0700
From: Asmaa Mnebhi <asmaa@nvidia.com>
To: <andy.shevchenko@gmail.com>, <linus.walleij@linaro.org>,
	<bgolaszewski@baylibre.com>, <linux-gpio@vger.kernel.org>
CC: Asmaa Mnebhi <asmaa@nvidia.com>, David Thompson <davthompson@nvidia.com>
Subject: [PATCH v1 1/1] gpio: mlxbf3: Support shutdown() function
Date: Tue, 11 Jun 2024 10:38:00 -0400
Message-ID: <20240611143800.4115-1-asmaa@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F1:EE_|MW6PR12MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e13e64c-d332-4358-b264-08dc8a242358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230032|82310400018|36860700005|376006|1800799016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nSMlY/C9dzNeEGfNrkrKjKCo4F8n4NHI1iCcQiNoflEUyratHm87NSyOhzzO?=
 =?us-ascii?Q?LwV09DmnqF3cQDkceKE7XVJ/aFM60qBtt5AEPZ+eLdcWPFqcM5k5nAg4WQp7?=
 =?us-ascii?Q?3j+LDGBvL8o41do/EM5zMrd3TyzYG+388JedNzHWbk/8R9h/rSKiQYTyC1Mu?=
 =?us-ascii?Q?pvveWdqGcGj4gk/5ium+VDAo4DQsx2Ehd/ovh31UPaXXA3OT/Yrei9uyxfQ4?=
 =?us-ascii?Q?VeDnwNFjJat1agGqnm+o60KhXVKUVtKG7yuFdHq/9huoErqSetbv0sRT1J5K?=
 =?us-ascii?Q?1v2mtD3JBvA1HFctB/BdVCe5um+8Hyx069PW9r1H5JJcaZJfkAN/IWCZQowE?=
 =?us-ascii?Q?dNd52RdBLiD8OmM/qNcf1htGxhMAjJ9zEAyRypt0JO0OGiWhK7ka8JWrMEEo?=
 =?us-ascii?Q?lFwdSLXwsBG7BMITB/WQxPss13P17cGkpuMUsVMqGgPH3ce7MFoTIom2CIOq?=
 =?us-ascii?Q?v5fwUu9OjhlFp4wBEB+DSPWWh3UDDEeslFdLMValg9Ox3IvY2cxUyItB7tln?=
 =?us-ascii?Q?30bafWbGqhVTqeRertA13iayUAWdTjH7eSTggbgv5ly2rIn2s4cT4+Sey0H3?=
 =?us-ascii?Q?Z5O8YU74GlQsqCsBVskkj3+lXfTG6ixcaPIXQknnWtiI31YosBiOrzc+YeX9?=
 =?us-ascii?Q?2s7hrzDexj3eHn8G9uv1CRSFl/yQBIc77+FjgGqoLzxBNh5GmG4vpL+rnXeK?=
 =?us-ascii?Q?LEQcD4CAVaGpwzzhfV3nqjfOQ/XjJslk56XZAE4NxQLmHh0MaxE15aTQ6sW5?=
 =?us-ascii?Q?r7ymH9h4GAgb1A56BM66LvbWPzImVcFa7d7s+eH4T5E3/FBFg88VYDlEam+W?=
 =?us-ascii?Q?I1niOGgUIdbq9O32hMt6359Qhy7Q6JCol49jZtEt0e/HzDwMwxa6xVXidKX+?=
 =?us-ascii?Q?FBxZKzoED7cnLHlyKrnr/vDPbqAjrOFxHBSJL1kTf/aLwP6nkiD66XvO/s7H?=
 =?us-ascii?Q?ain57Bud8lrjycuG7uaA66VwCznBO79BfKm2pbRvnduwzkBl8nNzgc+qa2MI?=
 =?us-ascii?Q?qMj2qw0Yl0RdfbUY2DbPO2h/cBpzCM/7HX2RoxnMI6CECpWU5sjRbXEIfC3j?=
 =?us-ascii?Q?VcIZI7MDQVqdNXcau6UdNJStbr24XjzNurLH+j7cibNcknU5/jnGc279NZiE?=
 =?us-ascii?Q?hk2Cw1LI78F1RHhyzvR1/OFc3YS05h4g+rI576UUDzsyUTnhCAFn7BAzhR+3?=
 =?us-ascii?Q?MpcCMAzIf8wxkBLxashkJtehkiD527wfXzIDFqV90ptl2Z3VshVrhFGCQBvl?=
 =?us-ascii?Q?aDV4FJyLIaJb1zjW5rThV3zifTfNSPB1NREuod0EjLpd+OSRSWDb1xBWDPyH?=
 =?us-ascii?Q?IojQl/S7LKdsYZVuO1qxBbX61mobrGzCTeRqfJTb2ZhHS0AALdewX6oR1FGT?=
 =?us-ascii?Q?QY8kuxltBr2iqg2uyWzeuw7AgT3KLcime00WKFNS7cYBLF2Iqw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230032)(82310400018)(36860700005)(376006)(1800799016);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 14:38:19.5301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e13e64c-d332-4358-b264-08dc8a242358
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8707

During Linux graceful reboot, the GPIO interrupts are not disabled.
Since the drivers are not removed during graceful reboot,
the logic to call mlxbf3_gpio_irq_disable() is not triggered.
Interrupts that remain enabled can cause issues on subsequent boots.

For example, the mlxbf-gige driver contains PHY logic to bring up the link.
If the gpio-mlxbf3 driver loads first, the mlxbf-gige driver
will use a GPIO interrupt to bring up the link.
Otherwise, it will use polling.
The next time Linux boots and loads the drivers in this order, we encounter the issue:
- mlxbf-gige loads first. The gige driver uses polling while the GPIO10 interrupt
  is still enabled from previous boot so if the interrupt triggers, there is nothing
  to clear it.
- gpio-mlxbf3 loads.
- i2c-mlxbf loads. The interrupt doesn't trigger for I2C because it is shared with the gpio
  interrupt line which was not cleared.

The solution is to add a shutdown function to the gpio driver to clear and disable
all interrupts. Also clear the interrupt after disabling it in mlxbf3_gpio_irq_disable().

Fixes: 38a700efc510 ("gpio: mlxbf3: Add gpio driver support")
Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
Reviewed-by: David Thompson <davthompson@nvidia.com>
---
 drivers/gpio/gpio-mlxbf3.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpio/gpio-mlxbf3.c b/drivers/gpio/gpio-mlxbf3.c
index d5906d419b0a..40bd93e3d695 100644
--- a/drivers/gpio/gpio-mlxbf3.c
+++ b/drivers/gpio/gpio-mlxbf3.c
@@ -39,6 +39,8 @@
 #define MLXBF_GPIO_CAUSE_OR_EVTEN0        0x14
 #define MLXBF_GPIO_CAUSE_OR_CLRCAUSE      0x18
 
+#define MLXBF_GPIO_CLR_ALL_INTS           0xFFFFFFFF
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
+	struct mlxbf3_gpio_context *gs = dev_get_drvdata(&pdev->dev);
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


