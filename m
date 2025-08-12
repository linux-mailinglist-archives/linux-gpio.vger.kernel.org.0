Return-Path: <linux-gpio+bounces-24304-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B23A0B2294F
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 15:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6727E684311
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 13:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4D82874F2;
	Tue, 12 Aug 2025 13:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rLWqIkPe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8495B285056;
	Tue, 12 Aug 2025 13:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755006025; cv=fail; b=EHx7kz46uvC85jt+lNe1z6LIOA0E4uasWN4ZWGDj6zO2cOwivoQgGLpRyB0E55oYELnf2SfE1HwVbi5x3nIhaLhldjY6USMQD1OgGeuK4/3CBXO5A9aK492fv7uB0ZA64omLCV7ju6cOOXDtKJgYEa9A5VcTyF98dly0/+qKIBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755006025; c=relaxed/simple;
	bh=5T5ZORB8jz88tewN3H515Ax2QHzhXK3vMXX+Y0yw4JM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B/dpAASA2lnYssfcUhe19BD8Iu+PpGvFSWT+JnmkuqNEoACcq2+HqootQC1M20SbfOgjwJaJOf2r5mdTBC/ge5oUs+4q0kVYbvQjuUp8UrnbAIuAhSaoZnMIvNwtWD5aBUDPeFP0OLTkly1O0yJomgfp0GxgNMX13HgW5Gd0AHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rLWqIkPe; arc=fail smtp.client-ip=40.107.93.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9icFtw+MaesvKAd3wUFaSqpa2l3d7S3/U5pHhF4UC4P2hm5bYyMaawSztJZrsslTOZKV8E8bFPh6nWRF5R9AtKzi3lEAjxSYen2boqWQDmuZtdQWL2CFxIWpcFEeddjEyEWD9lIUVSElNtUEVAflM5G+cgOwolcJGLpNf62TkPYuWhDdTLstdI0GBn5wmxQFM48jJe+4A0jwiAP6T3r8Nhb1LQLyFVXywu3/RlQ4rFn2DsBa0TiqQklF5U0lbK8P+uATGItaEvRldyxYzz9WhRsmAvC3ajPkhlQycbUOgb3ezhj6Wr5DorKm+80Lp5sJqYhLP39s7+y3ZP0Ba1/sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kl7fzjDd7CgbfHe4xymB1LrvFtawjpxit6MC9zqM/Hg=;
 b=WRChf76o4Z+wk7xfap42WmJaCfHa+stA4bfWrqz7Ct9Uyp5dtoS50E8SXYoEooPoLwDnzdvK937hCx7uP0Fuxvin0LSqy9ftCFNsY48ZmNBRSaXQSmoPxsemLbYwABXN4Bz7Dxy3jH2zg8nVMHUvO1O5LSgMzVwSMib/UwPruYI7N/HGV/eherPVzBi6eMJV3KEn1HNdBME/g5UcbGAIWKDTqbrXwarVzfHUEeSO6WVjf977J07PFJXKPP16noy7K6Dccokz9HGoKDahbmkjAHZgnxlrBsQp6zmZFYvWIm0Yg2P5bm/xCDKC26EOqjXf5kUa/Z+ZUoUalgbbywpfgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kl7fzjDd7CgbfHe4xymB1LrvFtawjpxit6MC9zqM/Hg=;
 b=rLWqIkPedNHZtHv9z0DI1NAZ+9MyhXO57cbKLzbjv0YZSZCIEXDDPFNzdedVnfftE0lbDAjkLhNv28Ir9q8ASGrshcYzh3SDeoTX8E9ZRWs7hyBlPF0V7LPu3MXDbTu32cUP4fnji2rViUvuemVhm1o1NCy3rSC7TGmwGx21XIjkwt8abJtiWB3NNzRt7rgXjD1qG5QLn3qBckLTInbSf0dGcF0bjXSFz9E79jBq4QXEwO6wjcA6SEgoFF3SazbE2DxAaxei+u3wpuLhXHFT49qjASAwB/VeUlJiwvVkTk2n/HccUGLSw6bH4CLm32tfP9BqqeQxAh/p0jI80UfeQw==
Received: from CH3P221CA0021.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::10)
 by SJ2PR12MB8738.namprd12.prod.outlook.com (2603:10b6:a03:548::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Tue, 12 Aug
 2025 13:40:15 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:610:1e7::4) by CH3P221CA0021.outlook.office365.com
 (2603:10b6:610:1e7::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.15 via Frontend Transport; Tue,
 12 Aug 2025 13:40:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Tue, 12 Aug 2025 13:40:14 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 12 Aug
 2025 06:40:01 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 12 Aug
 2025 06:40:00 -0700
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Tue, 12
 Aug 2025 06:39:59 -0700
From: David Thompson <davthompson@nvidia.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
	<andriy.shevchenko@linux.intel.com>, <mika.westerberg@linux.intel.com>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David
 Thompson" <davthompson@nvidia.com>, <stable@vger.kernel.org>
Subject: [PATCH v2 2/2] gpio: mlxbf3: use platform_get_irq_optional()
Date: Tue, 12 Aug 2025 09:39:52 -0400
Message-ID: <6eb2380fd533274b7adf66cb5aa87d98b46320c6.1755005277.git.davthompson@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <cover.1755005277.git.davthompson@nvidia.com>
References: <cover.1755005277.git.davthompson@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|SJ2PR12MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: b5f1072b-7361-4020-cfa6-08ddd9a5c45d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uDuzIOhTvsySYZukRyoDSq89wuPr3oN+N+AgUj2UJPLpEm6LhZAuozgB9zZ+?=
 =?us-ascii?Q?OvyFfrONj+c7wqBDAtcJIr+JEYfPmoa4Ogz9gtgfwavGAIl86giMRdg5twdf?=
 =?us-ascii?Q?Hqkz86/nzoR9w+pV2uy1CsQEpPr6ogmC/uuIm4bcZl7lv6Ot8xcENajbteym?=
 =?us-ascii?Q?W5jGvdSeBu0sotJyYWtvmbh/v8kzkQoRsoU0jiok1sD+8QOYwTiwtWXMauqZ?=
 =?us-ascii?Q?JLn5tC+yBzuyu2rlwzpXEWXZLVJYBVbUcg/VShWgEE65EbeglRZzG3OIWuUb?=
 =?us-ascii?Q?Ry5rweMBhZfw8umBwdsorpQD8tT5YCBj4OdicODwAh7FCqnS68wUiAfvp3RD?=
 =?us-ascii?Q?J1dw22l0aJc8aZZ+frHEbYMAmHmgB8cGlmwWzrGI2g5++4txByYqHd0YllPP?=
 =?us-ascii?Q?CPhcgOp5yEa2cHHJFfnCBtpc9iszkHG3OrFOeyx/0PYvtD0dnW8M78eqPKEV?=
 =?us-ascii?Q?wIR/Txqbjcbj43K97eH5Jc7z7O83SGd7X1D7nmaIEigv1AfjW1plWWUOyb2H?=
 =?us-ascii?Q?X1vl2NsMcDKqCy/TuGdZCn0Q2Keqgjar7hgk32aZXAmHCQ2S8gWeOfm6kbsF?=
 =?us-ascii?Q?ZS4kQjXHdilMbM1Y8Bs19SpluU9XnM+MZ7ztoMbZ9O4xUakCIXI1Pqn29PCy?=
 =?us-ascii?Q?ZykKNsP+YdteBLSg3YXffhxSey5iWrE/ciedlFUL0voqXemgPMIJfjyWKRAj?=
 =?us-ascii?Q?rp3iTyYdswpRAWaDpG4aUhE0vlY79tfYyTnhYd/MoVNUh2akfyruZD/iJvpp?=
 =?us-ascii?Q?EZkyfiEKB0bFEVSeEFJeHv0MG2kprZQ4oAetLACW/mZ6xHDVbBo6mt7miNVu?=
 =?us-ascii?Q?dIqICYmxqQls0K7Qm2PnUDraeoOlIcUnq2F97VqVrU29/4xArBqZGDJg6X4Y?=
 =?us-ascii?Q?7XZ9EXyoh8LD3KnTHP85MYeSpr7IpEpScMfEzke26gyYFhe5S3ngf5sR+RGY?=
 =?us-ascii?Q?ddB//I8UTkcDqKSOvPhYeuXhP6IVPkb1XUHmIS7LlN+KWOLOOg1kZNQNF7Iy?=
 =?us-ascii?Q?I4ZVmr2koEk1A72bfDNKT4xSPazPzqgTn1uOzUXHIN3+E2ITO3wb1r6LQtIm?=
 =?us-ascii?Q?m8/fQNd7VqBlY1b+NnM5cf33tluQlNYoqQcyaqoy3UIrbiHiZMfpPj/6sJEQ?=
 =?us-ascii?Q?M+LwbZyEg+bMZmIeED1u0bBzXIW3EbSNAh+K+K4y8EP32st8wpg2gzJ5EWJB?=
 =?us-ascii?Q?cXoUUYrY4PfS+WgsEG9DQAi4AjqDoBgPiEtKuCudSuB8VlyykT9S1pA40KXI?=
 =?us-ascii?Q?3ByKbZ3NTisZpWzVFVYIH1eX/8UCYlDAJPxzfT/deMqfUIqQvjSve1S15G2T?=
 =?us-ascii?Q?2CpI8pYY3zchLmHTH/U7D9G4FMQVGxAkrTvUaOVw6IbAwoB3htJi/bjOgkWE?=
 =?us-ascii?Q?KY4IGigGnBYnkRG2CDs49Z5pcyWwwyYQkRj8eBwgdle5i+r7f63cyEv8o4XP?=
 =?us-ascii?Q?qEKxJTyLiqHeza6TZDuA7jWBBODG/c/ByQBHfxafrLdKQQQ317vl6EpA4E96?=
 =?us-ascii?Q?dSQfjsnuszHVBZB1JHsACFoigYQbzTMuO5rJ?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 13:40:14.2326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f1072b-7361-4020-cfa6-08ddd9a5c45d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8738

The gpio-mlxbf3 driver interfaces with two GPIO controllers,
device instance 0 and 1. There is a single IRQ resource shared
between the two controllers, and it is found in the ACPI table for
device instance 0. The driver should not use platform_get_irq(),
otherwise this error is logged when probing instance 1:
    mlxbf3_gpio MLNXBF33:01: error -ENXIO: IRQ index 0 not found

Cc: stable@vger.kernel.org
Fixes: cd33f216d241 ("gpio: mlxbf3: Add gpio driver support")
Signed-off-by: David Thompson <davthompson@nvidia.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-mlxbf3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mlxbf3.c b/drivers/gpio/gpio-mlxbf3.c
index 10ea71273c89..ed29b07d16c1 100644
--- a/drivers/gpio/gpio-mlxbf3.c
+++ b/drivers/gpio/gpio-mlxbf3.c
@@ -227,7 +227,7 @@ static int mlxbf3_gpio_probe(struct platform_device *pdev)
 	gc->owner = THIS_MODULE;
 	gc->add_pin_ranges = mlxbf3_gpio_add_pin_ranges;
 
-	irq = platform_get_irq(pdev, 0);
+	irq = platform_get_irq_optional(pdev, 0);
 	if (irq >= 0) {
 		girq = &gs->gc.irq;
 		gpio_irq_chip_set_chip(girq, &gpio_mlxbf3_irqchip);
-- 
2.43.2


