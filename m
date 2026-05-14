Return-Path: <linux-gpio+bounces-36800-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJvqG985BWrVTQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36800-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 04:56:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE6053D36D
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 04:56:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 971BB30364B6
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 02:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF89306754;
	Thu, 14 May 2026 02:56:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2097.outbound.protection.partner.outlook.cn [139.219.17.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4042E6CB3;
	Thu, 14 May 2026 02:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778727388; cv=fail; b=l3qOfPPFc7FYT204aESE7I+mqkEn2D7KiXnry0ggmCSye9uSDtyT/uYxTXhqBGd65g6xUAFchfLBvsIhFAs/sgNmxtYIfLQ8kHBuYCKE23/4qhvqgNdQADLcw3gMv8vfCz4qwbDvboEY2oIpBUj2ogAK3foq0xfqrJ7puIMOnKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778727388; c=relaxed/simple;
	bh=lqsa7yuFZVpYtyJL1B+Srj5gFfY9vQOP2cVyWLKfRrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ALLKqkAILTmJhpZLlm23Yn6MkJcBbInwnwgPlyZfk0KfY3qvi3dlNwR1EzgNs9Gc27xj70Zenk1VJnBJ1/8DzV5GyeSHv2wIgn0v0JPGweoHFnhJKlaYrukEpDWcjm6kthRcr0qINSyQftg+9ntFo1QSfx1EB7Cbk82xWkHtNlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com; spf=pass smtp.mailfrom=lecomputing.com; arc=fail smtp.client-ip=139.219.17.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocCtN4YvH1Fa//PSKZQqAC/l7cOic6gTP3oMNJhPJilYb8eO8tsdYDEoI82X0b8YKeLhIazsatnlOnf5F4wUP0OHrtELflKkxsEvuAkTGVRj8slV4sWIaFGJnsjL9UpNAoPv4MtT/4DIfMfxqBMpYOvnCxBYWpiBKYVAQbOYuP8qTBskQE2T7loJF1bbntCrZ3srnP6ExjJbqsTNHfPbd68azGZndVEpB1+y6X429g3E62ec1RJLDmiGhyuxrYxaa3BJpsxlzksZhLzEVeLy7U6Ly/j4TDyueZ2aDN+zkP3QIw/cN4rHrqMfjvrXO5d2HPwijuicrAmAC8Tp2MMQ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odDZBR+i/YP6CHKOwEO41H2yVH9bgR2jfa2KnazFggQ=;
 b=KXrkpNfeFrhgEoLujQ4aA/z6zT22a80HbO1SkFTiiN7PP2rK/gW8Y+rmCZ79P0iPD5FLEVuL/9eZRh43Be2GJw+EqdiN4yg8uqeNmpPuAumVV70yS17EUZ6QMade+i8ypoI0BDznjW6T9Wb8mw4NlnrYBTAGhILI8lscxRRC14Jv/HQL2h1QTDmQ4YmcBto8HPiGnqik2JqwZEJHtk4l4Lo3l1zSbDJDbrNKJkwo8M0o29+9mANEeV2J62TPdKbL1uZT4YjyBABVhh84kb72lehF0cXVKpM9EPlFARbIfkxQ5c5Dg09W6wWCRoclhfc5Z4qbhNXg9lljfePvObqkyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lecomputing.com; dmarc=pass action=none
 header.from=lecomputing.com; dkim=pass header.d=lecomputing.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lecomputing.com;
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17) by BJSPR01MB0562.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.25; Thu, 14 May
 2026 02:40:36 +0000
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 ([fe80::1c61:86e3:3a75:155d]) by
 BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn ([fe80::1c61:86e3:3a75:155d%4])
 with mapi id 15.20.9818.023; Thu, 14 May 2026 02:40:36 +0000
From: thomas <thomas_lin@lecomputing.com>
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
	thomas <thomas_lin@lecomputing.com>
Subject: [PATCH 2/3] spi: dw-mmio: Add LECARC ACPI ID and init hook
Date: Thu, 14 May 2026 10:40:11 +0800
Message-ID: <20260514024014.3376511-3-thomas_lin@lecomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260514024014.3376511-1-thomas_lin@lecomputing.com>
References: <20260514024014.3376511-1-thomas_lin@lecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0018.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::15) To BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJSPR01MB0707:EE_|BJSPR01MB0562:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a5f2cab-4d38-417b-3f4e-08deb1622d86
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|56012099003|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	cRNLI02Wgbrc735aDCUYmS1Pr996CL2TLjz5v04vZ8nMUr/0t7Zn3An8CW/cBXKZhvQSFVUu5XdQQHwV6Lr7LibA7H1wS82ZrMX27kxkKYS2AqaWhRtuEigjeOXZpLLR+u88so+77JlD0fq1fh4LfovdDK+cpPsfde66Dm62NaoE3wmEH3zJwimY1SdQciEvRtIt0qjULjPYrj+vn47xd/fkrbPqSxM7ap0zF737V9RdCe62VF6UpuqgUOF63flZdwQJGcecncEvQFEPZL4amrZh83Gcbz/GTMXIqVnX9CFy12DKKE6l2M1AiO58gYFqkr1u0LxlDP4bu0LmSnmUpXggRNdnY/aZZrM/wUwMrSX69oPC02dyxLPCy2ouBeOWokZDXLf+R8d5df156imHb98fAxufNdRZgSjR2Syw0HT5pJIK2aj2jA1e+oWk9vnecPWEEuoi0uyjcoAeP/bxLCA0V3AEfJjBlr/0Ygphxv2NWhlIQLsoHA3rpE50Es7145KwzQELPiYoxAH+7E24qtS53So2UWMLV6iTRAr+K9JcJG1+33uCrCHuKDzK+QI76/2Hbpn9ADE84hGy310YmQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(56012099003)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hqUP9TA8/arwI5w9NV/Lc3wD7c2Es9zfbnxDUQkNz4agUzPUYBH8WLW0TGfl?=
 =?us-ascii?Q?mYNkj3enejh2ykqTPUe+PZtgDy491UvcRT6ivHuVTLM4LOXURhzMCF8AuACd?=
 =?us-ascii?Q?QJoyWz2cEHFGzGpJwuBEJ6PdHieHCuN6aWg9pC6ljzC4TSiXGeZQ7V6LyWkk?=
 =?us-ascii?Q?hiVDkU47A6Z0irDCUmq0L+HEJo4DxAOAsylL/z9Nm3FDt7B24mIKVjEwJa6S?=
 =?us-ascii?Q?7Vk2frg470cT3rpBDALgz/ajISUsUk3eb0orepJPrVxNLWLNnYthiFK4Y39P?=
 =?us-ascii?Q?72XupqDPvr6MGsUrdL5gOw0cQ6620dZtGbw5mnxukVYdnrzChWqC9cYFSux5?=
 =?us-ascii?Q?WPdNgz5eVMLkYdQ0Z61TXi43T9unuCxV1BL35Y4k6NAl9JI5YpcAV0DRPG3B?=
 =?us-ascii?Q?P+Ui7tReCZ1LElzSFH9QBFSZpSUEw7UDUkuWYKKeun8S4rnqlbrH9kP5h8i3?=
 =?us-ascii?Q?q+liYK0W9RM9DyF2HEq3s3ZZBV+q+KsmpevM2mvlb0eR5tQS3vDETiGSFaEP?=
 =?us-ascii?Q?i0wA9Tls3lh2XWHkCHtBbzMu5VrueKWP23r4zN97Qu1YiWuvjSluEbvZ10rI?=
 =?us-ascii?Q?g+6zan4rIk4x9NYPtFy8bpx4kCvGGfurU7vZ+7SfcfUT9J2INwqO/MDNOBhZ?=
 =?us-ascii?Q?hAlkhr/aC8ub899b89URZQ3446Ylow4bAbIGmggBATWTtMGrASlQDtyD2Mmy?=
 =?us-ascii?Q?6Q5qB7CB2kNiTcWENci3rcy2NRRCIEhXRR8McmMmdqFtea6o306b/ccKupQn?=
 =?us-ascii?Q?enBtHkf6u2wM9vOKsQyHppdqJRg3ESgZQ4NyVeOCxBD2j0upDojHS/VL9YL4?=
 =?us-ascii?Q?cw7f94wdR/LceeewlgJvMnW5mJlsD6XFrKjpopZOhTjKexK42eo5Im6G0+UH?=
 =?us-ascii?Q?PXrq0l++uQxXF+TzMMF+ckYvAiQFY/fN8AZiiH13hUQznvpWUM5zVsG08c2j?=
 =?us-ascii?Q?Wqh3mc/E31JgieXjT3Tm4zAbkhLTCVDZtHeS5WBatWlqn3txBkBIjFMzAR/k?=
 =?us-ascii?Q?Igf2wAW0TGSmTYv4ucCFIe5HrTKyQdQvCVrTXcTq8kroJmb87l2zVBYBxSip?=
 =?us-ascii?Q?JsKuGOJxH4hToIsx9f1s//Dy/TTy+bmDkCWyJ8Gt0PCNrnFSGWbLU+kHOyUz?=
 =?us-ascii?Q?LVWtrEm2OH7AoJH/F0HZn32xAuyChCpgf6i8Pvq98Kp/hYBv015ldpxWExCX?=
 =?us-ascii?Q?Ghba7/h63EMw1Z4CyQzCAdIu+zT9j7EXP/+BXN3DNi3Ys64UYtN9K8DUP7+g?=
 =?us-ascii?Q?CdfEFKxSOAQYSFYpIz1dx+qBsPgF+As8QCudl5iagaWA5canfF3EzzrKWYCk?=
 =?us-ascii?Q?LBU0/ToUOPjb0DMrot6+9TjGwtXPxyHmsE3xOkm0At7kjv2lb7zIds5jU4hv?=
 =?us-ascii?Q?4zqTP3il8+BDulO0PeNGptC2RPZjvJO5TT1Ug3FiPIFeGqrQ6dK6W7saT4HX?=
 =?us-ascii?Q?VQ5vC5jZPVmCNLZGwdDvTzIRtQhuYhzfdaN69N+u65An35FDgXXum95GiBra?=
 =?us-ascii?Q?XzfIjHXYyBhxgh/RAUqnWubrLRZg7CiX8rddRxoYNE0CF7GegSgBI1HlTSqV?=
 =?us-ascii?Q?G/i9nkHCegBRdGMm1336cPrt+5UMpmQvYUxBuw4aMBM1GsiFTjKLWbUdd+dx?=
 =?us-ascii?Q?/gbuGq+rg4VqFQQMMauw0NwnYsvxgP94QqygEULzcbIwkZ9YINB2xlvj9+U5?=
 =?us-ascii?Q?AT/IH3SyvnWvgLkp9CsBf5LmXErIvZ2MrL8/HLBEYYYSXUqS4wZ9hwc3Dh2G?=
 =?us-ascii?Q?D0iYHJFE5Jwimkakv9XgjG23+K3WuIc=3D?=
X-OriginatorOrg: lecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a5f2cab-4d38-417b-3f4e-08deb1622d86
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 02:40:36.3978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3591a018-3909-4ea2-aee8-843d5abaed8d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PlFjWO5fMFsKzoShZCBP0gTVkUv1NNhY1YquSz5HlgBzON253LSYZr6E3lt3VqknhLmEX3H19jsChHr+wSzdrrOytvvupbOFitda8LxMUn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0562
X-Rspamd-Queue-Id: 2FE6053D36D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[lecomputing.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-36800-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.974];
	FROM_NEQ_ENVFROM(0.00)[thomas_lin@lecomputing.com,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lecomputing.com:email,lecomputing.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add ACPI ID "LECA0002" for LECARC SoCs. This ID requires a custom
initialization function dw_spi_lecarc_init() that sets dws->dws.ip
to DW_HSSI_ID.

Also add corresponding ACPI description in acpi_apd.c.

Signed-off-by: thomas <thomas_lin@lecomputing.com>
---
 drivers/acpi/acpi_apd.c   | 7 +++++++
 drivers/spi/spi-dw-mmio.c | 9 +++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
index bed0791c17fc..3a80e833215e 100644
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
@@ -252,6 +258,7 @@ static const struct acpi_device_id acpi_apd_device_ids[] = {
 	{ "HISI02A3", APD_ADDR(hip08_lite_i2c_desc) },
 	{ "HISI0173", APD_ADDR(hip08_spi_desc) },
 	{ "NXP0001", APD_ADDR(nxp_i2c_desc) },
+	{ "LECA0002", APD_ADDR(leca_spi_desc) },
 #endif
 	{ }
 };
diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
index 1bfdf24c3227..50b50553b360 100644
--- a/drivers/spi/spi-dw-mmio.c
+++ b/drivers/spi/spi-dw-mmio.c
@@ -234,6 +234,14 @@ static int dw_spi_intel_init(struct platform_device *pdev,
 	return 0;
 }
 
+static int dw_spi_lecarc_init(struct platform_device *pdev,
+			     struct dw_spi_mmio *dwsmmio)
+{
+	dwsmmio->dws.ip = DW_HSSI_ID;
+
+	return 0;
+}
+
 /*
  * DMA-based mem ops are not configured for this device and are not tested.
  */
@@ -453,6 +461,7 @@ MODULE_DEVICE_TABLE(of, dw_spi_mmio_of_match);
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id dw_spi_mmio_acpi_match[] = {
 	{"HISI0173", (kernel_ulong_t)dw_spi_pssi_init},
+	{"LECA0002", (kernel_ulong_t)dw_spi_lecarc_init},
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, dw_spi_mmio_acpi_match);
-- 
2.43.0


