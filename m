Return-Path: <linux-gpio+bounces-37004-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEV8O0uDCmqv2AQAu9opvQ
	(envelope-from <linux-gpio+bounces-37004-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 05:11:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A089565557
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 05:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19DDB301D043
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 03:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F6A37CD4F;
	Mon, 18 May 2026 03:06:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2101.outbound.protection.partner.outlook.cn [139.219.17.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728EF34D3BE;
	Mon, 18 May 2026 03:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779073582; cv=fail; b=ftfyUp0aDoFV2i8MVE3PxUUbIpYLTFAcfwfLjt58gc8/dE7Cs+jwsFW6+w2IjNJrcMXGW5ooKN1sUPeEbi5mgExS655h058YpqEap6/7uGF5Idwq3rqsU76WcU1ahlt+xKnYCTI0FvIf2jSd7X0gqoO5xRDv2Gr4I2FJjMvZ+LQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779073582; c=relaxed/simple;
	bh=+Er87ChW9xID6/aRhQemZFnnt60MWTwvfwiF8dYDo2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jRkOV/HIWQyBtgy58SiUWRTl1e94aJ/NXZFJ8q4ihypFFtbqdRU8HvFX5cXLNuPEbHec74aZdhdxIbpT4RR4zUzgxuRZ7shvvxVz2tjQUYmpdOz4KTuX/800eIdiU9vDZg+zOsHyBkdvYLx4wOnDLYVN/Bg25Ikh2Bsnw0WbmQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com; spf=pass smtp.mailfrom=lecomputing.com; arc=fail smtp.client-ip=139.219.17.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wwtu+5FDKeN6XehNviySM3nGToK0pD+BCbkBYXubPzkpkvZ2xojI9dt7bTo3lxDcuEys+Zb2pJ9qUX9Fcj6mrA1pBv9f7xdGCTvbEVuyFko0WYy3PxEQuyB+6zdg9xRcxoKx8gp51iM0O2uSy9dS8EZjS1oX4C2PSDwFa8lFhtbYlI+LV5ffMJ/JduV/5sY6Pa22SoKJMDPQ9AbgugHkAQp+DIR9UVuiN6qALYtT9s0bXQMR6nJPSTgXJjlGIM2jqkAbd60WE9BVVEnSE3TONzgAaQFhhZRniIwznDGe90UmfQ9UkGNcFu1XvhGQfhIuEATBh84e2O7eDRNVBW+30A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LeGdcwPCWebxeV0ZyocXxAswF9IcvsUt1jqTrBza+ZE=;
 b=AOP5m/nuH1ddu82N3qqZj5gokmMeMeecibKh0hIP2YOyNORnrUmMoYRNy/OtnrjapuBPY17BLIVzIYF+iaYI7/Q0nG5KpLrgk620xQPFE1KDxXA0SxCoAPyFcZdK4pHPf48qZJXEAc2EX5/BNIHSdnFl6+633kFhIpJjma9nUjwx8qOPa8xzQjKRXSFgB8OCFWCrGv9cRN6VdOJ4WbYGeY+eOLSJPVWGYzMenL9/UfVF6fEDg+D2sJKmkDENPHiJ+dOVUFhHRXYCBbZIrPlFGjx342qRxiDAKoOD/RMRcbqOT12HgATkh4AKmNaf89l4zU7zwBCIpar8croq9vxq7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lecomputing.com; dmarc=pass action=none
 header.from=lecomputing.com; dkim=pass header.d=lecomputing.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lecomputing.com;
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17) by BJSPR01MB0548.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:10::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 02:49:52 +0000
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 ([fe80::1c61:86e3:3a75:155d]) by
 BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn ([fe80::1c61:86e3:3a75:155d%4])
 with mapi id 15.20.9818.023; Mon, 18 May 2026 02:49:52 +0000
From: Thomas Lin <thomas_lin@lecomputing.com>
To: rafael@kernel.org,
	lenb@kernel.org,
	hoan@os.amperecomputing.com,
	linusw@kernel.org,
	brgl@kernel.org,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com,
	andi.shyti@kernel.org,
	broonie@kernel.org
Cc: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	lucas_hao@lecomputing.com,
	puntar_liu@lecomputing.com,
	jihua_tao@lecomputing.com,
	stan_xu@lecomputing.com,
	lumin_liu@lecomputing.com,
	notics_zhang@lecomputing.com,
	braden_zhang@lecomputing.com,
	harold_wu@lecomputing.com,
	will_zhang@lecomputing.com,
	aurora_jiang@lecomputing.com,
	ryen_lin@lecomputing.com,
	andy_jiang@lecomputing.com,
	Thomas Lin <thomas_lin@lecomputing.com>
Subject: [PATCH v3 2/3] spi: dw-mmio: Add ACPI ID LECA0002 for LECARC SoCs
Date: Mon, 18 May 2026 10:49:35 +0800
Message-ID: <20260518024937.453714-3-thomas_lin@lecomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518024937.453714-1-thomas_lin@lecomputing.com>
References: <20260514034319.3507315-1-thomas_lin@lecomputing.com>
 <20260518024937.453714-1-thomas_lin@lecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SH0PR01CA0002.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::14) To BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJSPR01MB0707:EE_|BJSPR01MB0548:EE_
X-MS-Office365-Filtering-Correlation-Id: 575834af-2c78-47e2-c10f-08deb4882292
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|22082099003|18002099003|56012099003|921020|38350700014|4143699003;
X-Microsoft-Antispam-Message-Info:
	LO9SbZ3+hqVF5QJbJNCttPCYb8owxsSN86i3J8jpwE8gYGwweE5Y1H0nhNYHCxFYBxrioo9EAIPLB0OsLhldJC6Jykp+x9T1aGiR3uJpv+DYAvRi0r6OHejGVKnYdD56XW4u3UlDhX/QzCcwjLqF4Wqe6IbkASbw2rqREOzbAsNePqVYDJp6tTKS4F2iie+wsRwIeZ66fj4Z7qUCPy7NobC3nX9mCnWr7GPZYhiU6VqOQWfhfyS87hFOc81h2jkJbRlgN74xzD/Sq+8c6E2LCk67Yp67QXmXSNbb4xI7HEAzGmoDLDZfP3q+smRiiF2gpmmhd9jF+eLEkor66/0hlToS9YGAFtlaTkI5euA3CyRNwBotTKPMERvI5KkwK7Co5PEJ9mWnvbhWSsQ0LCS7LrctmGcwJ7FumXKluxmtR5ipktH/E8kuEs7UcsQQXFbe2URYGc2KW62wG2AjZgGTtqPZB1/VmW69q1aoTOWZbJ4Ew/gvaNQXIYzTUTwfbFZ25rzB7wLB13So/4MOXjD8oMPRYdudPUGFJq7+wmplYDyCOYfURP1OcrGJKvgFJTMCexW0dYS5pZJ6ZPfe/2KRkg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(22082099003)(18002099003)(56012099003)(921020)(38350700014)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gAfRVrlC5zrT0SRazMgGHoTSyQ+29ELiMUPUpcs12BlB0JlXqYPzfUqn5PR7?=
 =?us-ascii?Q?0V2Xo9rGygpzcyKXxi9g4ENrXcpKZPVGHFmny7+9cV7WCd05VH7diC4VbC9W?=
 =?us-ascii?Q?DkSN9lNBf6Ylvjz1IlKAdVdbKQFQhKL709hyTa/oDWQsS/o3QRDMpwiWyE9B?=
 =?us-ascii?Q?sXOkbAYaKpN4gsvOBQU3ZUA9DCW6aGLNurPZBAzOuoNQaqha1yEIefA71g9v?=
 =?us-ascii?Q?2BN2cwvVxpRNPvjMXfnBy409+0/2kIU0ikuhgQkS1odJ8J8jT8pRnGCxYWQd?=
 =?us-ascii?Q?tsf2q9QJjKVUDvGfEqXjUUZgfKPHbR0Yh7nzgNO6ZXNJKdRomItEThTBjeQ6?=
 =?us-ascii?Q?BXNSgplOKlRsZ8okGNFlcBiQ9WyD3iTsQMYi05R28EPzTki7mur9dLwnjERA?=
 =?us-ascii?Q?5S1FCVkn9yg3IjYhCC2TrubTt+QfQ6ljeadAh5CqbC7T5eGVN4GZINKJl+aY?=
 =?us-ascii?Q?P+KY0c3+SOVjdN5wj6TPWS5P8gKiWtDDTFVgfHTPN5nc69lS7xZtSt3FI6dm?=
 =?us-ascii?Q?59TtebLGglxutVR2935D9SQWoRm14a6m91w6nmL2955zecJicKp4RD/gJO/2?=
 =?us-ascii?Q?r1kAOaJv+MOeR7c+7/2nHUORq8FZcEaGO6gOt0NemnnnSmic9G8QqMsGRNVv?=
 =?us-ascii?Q?TBOzA5j+VMQyPHCmRWTy5k2jfxw4gFJd2kMjBxHAh8rA2vbsuOkKLfl8QI53?=
 =?us-ascii?Q?eONK8VngQL8aQkkUKQVq3nNjslKvGUTIOs+PAyZQzyJvGTRD8bq59AKWjW9K?=
 =?us-ascii?Q?6wePAfZvtShbbznjoJMVlUh/waoY2nO8EtO8eC7u7eBPOnhfsVv++493PelL?=
 =?us-ascii?Q?3KANncfEms2OEdB3mqohRp+kEHTs0j0B5lrALnuo/5/+QXDjFJsBOTJH9/Ds?=
 =?us-ascii?Q?zbLgxGcTDMipL83W6vaBBVAtBjwjOBeLYXNYWRU6W1Y2hxX7nerTcNPUBSfL?=
 =?us-ascii?Q?hKYsXaG7x4C1LvkTj+8pO2ggfn36wAss5WVryQd5JeF9e3ZDgZ17/ggjPYe2?=
 =?us-ascii?Q?FxYVeYvooANvIgM8WUpd6OtycAu2PlaLqZxk5g6T5t8/3qLMtN5uwTz96qvm?=
 =?us-ascii?Q?pzk/TLT2kXb/gALonW4SvOlKL7CMEIyceXvWTUIK9t+bF2XcHhh5fy/uDAAf?=
 =?us-ascii?Q?sW04krvKHncddlE1vYFSUYJwDXpwGUiyMIO+vXMEN2gSgIZQtmKCm+Mjv1jY?=
 =?us-ascii?Q?m1k3p/+JEUptUHDn1HnWqI9XB6mPAgn+ANU8iGIgv4mNu3tvc9G7eeJjVBGV?=
 =?us-ascii?Q?n+apBlZ64IE/RXtt06RxOCOwJnF/FEwKN+Rt09/EKyeSz0q7Q8NYqHXyCWJC?=
 =?us-ascii?Q?B5x3EyX8dR+reSlDrkWFaRzUwrAXDLwBp2xh2T2g887d9afSZLuw3FJf4NBA?=
 =?us-ascii?Q?Qt+dQ68JPocq4gkDpO9LFpIlJh+VyKO0Xe42kbegDNHuNPOPabe0UBpacGGu?=
 =?us-ascii?Q?TFu58mgt/6c3ECmdIqno9prjUtYcq+c4qRNOjvDtLTtI7cmH5uuSknCqemdP?=
 =?us-ascii?Q?YyDGUU86c0xWrKHpyofiuAXCsS3KG5dOaC1RwoKFfpUhHkF1VNa/mN9KMIPz?=
 =?us-ascii?Q?afRBNYU5OnXQXneM4MiQB6J7MToL6K/9Uhq1LB74qmGCPUqiXK3TotGPgELe?=
 =?us-ascii?Q?CDX2LJm+8ec5Fp33uTYugJtK4XN93SRR5ydNxTpBC0VbPzejhF4HGHVAUQWk?=
 =?us-ascii?Q?9hfT929wIaP5cuXWmTrNO2pKvryFkHyNBG0h0Jgapi57rSRg5NJYtgzlY4jZ?=
 =?us-ascii?Q?zxWPstMV0vRKUherXqM3CRDLMxjxeOI=3D?=
X-OriginatorOrg: lecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 575834af-2c78-47e2-c10f-08deb4882292
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 02:49:52.4823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3591a018-3909-4ea2-aee8-843d5abaed8d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: leD7mGzoM81KTXM3soxLvqdQsAJAWN9HmsV3lWXDV8bzRo83HBrAcsjtWuW0VwFVl/BR6thapSwt+FfmdzhYRBbYEUfKMHgJhZTerwPeE6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0548
X-Rspamd-Queue-Id: 6A089565557
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[lecomputing.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-37004-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[thomas_lin@lecomputing.com,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,lecomputing.com:email,lecomputing.com:mid]
X-Rspamd-Action: no action

This ID requires a custom initialization function
dw_spi_hssi_no_dma_init() that sets dws->dws.ip to DW_HSSI_ID.

Signed-off-by: Thomas Lin <thomas_lin@lecomputing.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/acpi/acpi_apd.c   | 7 +++++++
 drivers/spi/spi-dw-mmio.c | 7 ++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
index bed0791c17fc..4d5a51d30adc 100644
--- a/drivers/acpi/acpi_apd.c
+++ b/drivers/acpi/acpi_apd.c
@@ -181,6 +181,12 @@ static const struct apd_device_desc hip08_spi_desc = {
 	.setup = acpi_apd_setup,
 	.fixed_clk_rate = 250000000,
 };
+
+static const struct apd_device_desc leca_spi_desc = {
+	.setup = acpi_apd_setup,
+	.fixed_clk_rate = 400000000,
+};
+
 #endif /* CONFIG_ARM64 */
 
 #endif
@@ -251,6 +257,7 @@ static const struct acpi_device_id acpi_apd_device_ids[] = {
 	{ "HISI02A2", APD_ADDR(hip08_i2c_desc) },
 	{ "HISI02A3", APD_ADDR(hip08_lite_i2c_desc) },
 	{ "HISI0173", APD_ADDR(hip08_spi_desc) },
+	{ "LECA0002", APD_ADDR(leca_spi_desc) },
 	{ "NXP0001", APD_ADDR(nxp_i2c_desc) },
 #endif
 	{ }
diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
index 1bfdf24c3227..4fc864d38cff 100644
--- a/drivers/spi/spi-dw-mmio.c
+++ b/drivers/spi/spi-dw-mmio.c
@@ -226,8 +226,8 @@ static int dw_spi_hssi_init(struct platform_device *pdev,
 	return 0;
 }
 
-static int dw_spi_intel_init(struct platform_device *pdev,
-			     struct dw_spi_mmio *dwsmmio)
+static int dw_spi_hssi_no_dma_init(struct platform_device *pdev,
+				   struct dw_spi_mmio *dwsmmio)
 {
 	dwsmmio->dws.ip = DW_HSSI_ID;
 
@@ -438,7 +438,7 @@ static const struct of_device_id dw_spi_mmio_of_match[] = {
 	{ .compatible = "amazon,alpine-dw-apb-ssi", .data = dw_spi_alpine_init},
 	{ .compatible = "renesas,rzn1-spi", .data = dw_spi_pssi_init},
 	{ .compatible = "snps,dwc-ssi-1.01a", .data = dw_spi_hssi_init},
-	{ .compatible = "intel,keembay-ssi", .data = dw_spi_intel_init},
+	{ .compatible = "intel,keembay-ssi", .data = dw_spi_hssi_no_dma_init},
 	{
 		.compatible = "intel,mountevans-imc-ssi",
 		.data = dw_spi_mountevans_imc_init,
@@ -453,6 +453,7 @@ MODULE_DEVICE_TABLE(of, dw_spi_mmio_of_match);
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id dw_spi_mmio_acpi_match[] = {
 	{"HISI0173", (kernel_ulong_t)dw_spi_pssi_init},
+	{"LECA0002", (kernel_ulong_t)dw_spi_hssi_no_dma_init},
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, dw_spi_mmio_acpi_match);
-- 
2.43.0


