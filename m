Return-Path: <linux-gpio+bounces-36917-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOJaMuABB2qVqgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36917-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 13:22:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3494554E4EC
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 13:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5EA1308AFBB
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 11:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56FC147279E;
	Fri, 15 May 2026 11:05:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2136.outbound.protection.partner.outlook.cn [139.219.17.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16783B8948;
	Fri, 15 May 2026 11:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843101; cv=fail; b=XnFoUAVrIs2ACgWTsSB43gGMikcreYhInrbKMq65qLHoIEauWvZoYStwnCN1r4C9f8tJZHAbuQKk315vY8VKyFgMvZWLJuxJdbrSoHhNjAwp24ZafeZ0lK4+bR3OZhOorCpkEczXePQgXEKIhqomE6tJiIX86vpgW8jDsezvXLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843101; c=relaxed/simple;
	bh=kiLvO8wNUWMGxGEWZNHPrDSidr8QMOrEqGyWCRy8+XU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gshGni5FH1BPE+m2npcmPrSBTzcj2LSwt7xhAYUG3r5vVuj9/8DwfVyhvhcJq0yD65vpe1B2TG3h28Q3jLGmP+2r91+TM6sP/F8wQ33Nomajr8w7moDPDppap4gUSDYI3kzxM3hL5Yabcw53a9o4/MWo+7NQQuAPWseNa6aVliM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com; spf=pass smtp.mailfrom=lecomputing.com; arc=fail smtp.client-ip=139.219.17.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFoYt+e+5s1qRQE3uzxBjv0ik27Kn27CDLg0KmFXU8QCGWm0+WyDESr4OSybKFGZUrPM9ilQ5YtkzZOLvadqgEFrNVUgNTjjTiQekaaxUrIWoJfj2RIj+gALxMpucJoeIMMG18ZyY+ZDscKiuW4HB1v9lAEkc5A/aQ+eGY1vJijWnqFfNxyMmXh6jwWDI+DDtP5+7K/RN2iLR6OJ2RqoW7CigBVQr3AWJvQa25HZgLSMncnI9vj/7yp1TqOyE6pL4UpLhoBjb86oydzagwDP4NXvbs2IySkgHfNajUI2ACAFiFgv0AtoIUzdlgJo6q/PO0Nf25QyHbIAMqrrBbTqaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXX0j9ZAgh9bokFmQw4QSpSoQ7S5H0jwuM/ezdVlGEY=;
 b=Mz1FYUCFrdA9hQub5L2D5ksTzXa4ACjJJuH1+duSdlc7PZD4QDkk08fvGHDxbAWk41YBNN/x0kSqFRwUFIM60pA33S6g15NeB6p37XuCvECD8XP+8QTCzNDavUpQay+QEEZfO7qDtFjgZwlqNk/kIXqD/0Wkm10h7XvXE3C1W2jF1wOLlDHaSAwo8Vn4IYqyzlalbXioG8UlMy3jiQ8vj1IEi6Wjin5CN2GVxxMLhFLk2a30NOn6Zv1cj7lepMgK/Bke7tGaCk7YGIgNPvDjanAV3Oax8SGYSiKkFUtMI7a9/gDy25FgEyIr5J2WqKXLAjNNyce1MiK/V39xqF9gLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lecomputing.com; dmarc=pass action=none
 header.from=lecomputing.com; dkim=pass header.d=lecomputing.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lecomputing.com;
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17) by BJSPR01MB0547.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.30; Fri, 15 May
 2026 11:03:41 +0000
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 ([fe80::1c61:86e3:3a75:155d]) by
 BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn ([fe80::1c61:86e3:3a75:155d%4])
 with mapi id 15.20.9818.023; Fri, 15 May 2026 11:03:40 +0000
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
Subject: [PATCH v2 2/3] spi: dw-mmio: Add ACPI ID LECA0002 for LECARC SoCs
Date: Fri, 15 May 2026 19:03:19 +0800
Message-ID: <20260515110322.2883310-3-thomas_lin@lecomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515110322.2883310-1-thomas_lin@lecomputing.com>
References: <20260514034319.3507315-1-thomas_lin@lecomputing.com>
 <20260515110322.2883310-1-thomas_lin@lecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0033.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::10) To BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJSPR01MB0707:EE_|BJSPR01MB0547:EE_
X-MS-Office365-Filtering-Correlation-Id: 594c7b42-ecbb-489e-45c5-08deb2719ec3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|18002099003|22082099003|921020|56012099003|38350700014|4143699003;
X-Microsoft-Antispam-Message-Info:
 lP+EEbp6ZZbVbfLly4U/u8SAevp6rqpX2I4WjiAnmYkgt5muRos3gvcaRqcfVWUIyvuIcDoKt/0Hu26lEOZNkKt01xG7Rh5o1NaKWW27buErQIuV11lvIUf+9B085qpVAzCMfzAgbjFanlfHxXwobKeQX3ecZxEwVe21WucAC4LWE6An5CegCPmWXKqFMmO+KRhTyL9kUHMMuer5QzIYCw6eNFa5+33op+3+Y6CPKZBCQ91zWAop56LFVSWOoYjoJiipj5d5WloVg+V2L2DECrMaXIa3JEECYRqNK4mnSayZt6T+JOII71K9XQR2nlUzkchsTR0IH7GADDcMRj2ZjcHU+gc1yhF9v84RtyrGs4PhR/YvwfCUU8D/1HbsTL2FvP3Hy+/dHegrU4JmR7nzFHT1MvDyFOyNIwtZ/ZmvTxJF1hIm3OCQLjAMQVIPckc0JXAtsPNJMfaI5XVx9n/zJGz9m6cwu1E6TSNdRv3Nn98PL6dHQyimAelY18ycCw4HtkdKUUKFQGcLWQnKspifLW7A9KcmqhfqV/V0FsZXhh2xwyqaMHgplnNa3vo6lxaKC8Ru5f4Yg0ALPPiJ0aHvlA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(18002099003)(22082099003)(921020)(56012099003)(38350700014)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?irFoC44HA1PPlos/ixsdoHAncgDulvhrUv8mpWPsap04QdrS3cAST1AMDceR?=
 =?us-ascii?Q?sRTiYDf5JvSuTe2k25xdr2OQm/rLd9uTCggTja0IxnjBX/fk0xX+B25bI7ez?=
 =?us-ascii?Q?As2h6kCTNKJlqmcU6men5AJLc36j5ShBYwNgJwgln5cleOjLdQgsJZafJjNo?=
 =?us-ascii?Q?xILRR5q2obUDi23hkZw4TUsJe4m07YPLO5Crum6GvfB1U0tMWg3+wkEXuSfO?=
 =?us-ascii?Q?Jhoetr+ADWpQDPom4jIh6L14Xni9PnGzxUflftl53VSqwCNbPniIQSvA2NcR?=
 =?us-ascii?Q?b7xzCJ8MRWjGu0d3SqfqGgmQalFCH+ttek/etVwpPQhfBZhmohN/K8A9g3sg?=
 =?us-ascii?Q?ZU0Y7TJ3Y6Syh8eRINcMFlZvs/EYpz5/w4FSIFORN222UXgTU9tBd9oqW1I1?=
 =?us-ascii?Q?QgcC24x6ByiuRf5BqbxwxU7KVDpa0O1DihqWS/DqQs1YB3riaDzhcKbhTBc5?=
 =?us-ascii?Q?54jYMliM8ucfHNab2Ed8tB3YbnhRvMs1ONMU4LQNAPCE/8HoWNDYhq8x0jo4?=
 =?us-ascii?Q?jVOC2GSO2TVgCB+4i6bXMkALnJvxs8tIggng6/J//SyAsc5w1IueWZ7gHLQ8?=
 =?us-ascii?Q?gxtS5sN8p9jNarfWd4S9ZTd11TDBQVkZNKGraJQ9rcvgKxdW2xtol1koeV9i?=
 =?us-ascii?Q?Oti9Iq9pODiPX8AlyaygE70w/lBBsfXsb1T5WOBtHvWiToRl6c6xLl0+puL0?=
 =?us-ascii?Q?wkq8SRquyPZcOGT1AnQ1/ez+eVA7H4O44HAaO0Mx0QmBGUcBtrCMyW293twi?=
 =?us-ascii?Q?3edXu7kscBNS7UnDC1E+I7oRIatKyqBnXWNnHX2AjhcpfZvKqPUBQOP6oAz0?=
 =?us-ascii?Q?xm46m+07LlVDusjbXrQGEYq3uYWqOJWxgeawo6M9LdK4hrq286uboxhyshep?=
 =?us-ascii?Q?0SCXH9+Rm6naDaZtr/nK5CAm0dQfiJBYAh5941CuswHpMusPja/zahMl3OAx?=
 =?us-ascii?Q?4nZRMR/3v+jagQn5HRnOgEqhUoPb2L7n/p/375e2wUR8bBn9nOoF0j4kQ4ai?=
 =?us-ascii?Q?DiMDc5Y55Xre2kFXcF47WAe3kvCZAdBEdX9lCPU7pGmGibU7crfxoMJsor9E?=
 =?us-ascii?Q?wUX6tP4/gqbv/46rFbnCO/J6nwKtuQj5qKDtw/46sMOPOnL8L5FhmLNMTbsD?=
 =?us-ascii?Q?CsL2UkbyGigyT599M11xFtlhkv4Q/FBOOEdL8Ad+SjGiRkFU8kbp2PviXm3I?=
 =?us-ascii?Q?A1g+7x3zSveQiIDTRt8JscWfmfs2EPTPW9oPe0QqsEPWXkYFSxAEFoNTUXgD?=
 =?us-ascii?Q?yssqAvAO4lW9IdxAxlWBBqn7Jn/YMttiGtQlDyfObynf4kZ/GgyxmiNahkpy?=
 =?us-ascii?Q?bNfck0V/Bp4wOscW2gdb1M+pIx/71wJucm8gVextuya7OT+SqttZElcE8y+s?=
 =?us-ascii?Q?gQkrCVafbu6XB8eoeoiqF07t32Yss8gm88fbfENyUxAU4k60QrScEk5Kwxny?=
 =?us-ascii?Q?3bpqc0AK+beYbzHgQVow0AFXGVrji72Asf4wBnmqVna/bECrUNlw9RESEWiH?=
 =?us-ascii?Q?gc5c/9v/STnIuanBFRWGC2PL3DkBsT4L81OhJBj+TDMaWXEixoZ7xIKyVLRM?=
 =?us-ascii?Q?OpfsQuHCbzDh4OhbLQIG7H7S4kBrJF6PUL0CS7HfIpZrO0EeCw0+W5YnBkI2?=
 =?us-ascii?Q?HTfkCbb7IFQ/VYpePJU9VzH4wQdctDiCL/GBqXpdbSGmm8vLD7FIFAoUNDe5?=
 =?us-ascii?Q?ICYCc39peWT0tXhR/I2xavnej4Y80E09hHuAkKvSTHP0rISXTV6jxrx78ddu?=
 =?us-ascii?Q?W4achrvR32AsnHt3W3QyH5BBbLsLZig=3D?=
X-OriginatorOrg: lecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 594c7b42-ecbb-489e-45c5-08deb2719ec3
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 11:03:40.1985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3591a018-3909-4ea2-aee8-843d5abaed8d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BclCWhlIZg38eQLn+xUY4A27Q+Ev0xL1yuw24P683UxUzEecGH5O3FeOv8tU2ChLiV9rZcWdoDs+VCae9iC82IONn3KLGg+iWduWvu9CJo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0547
X-Rspamd-Queue-Id: 3494554E4EC
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
	TAGGED_FROM(0.00)[bounces-36917-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	FROM_NEQ_ENVFROM(0.00)[thomas_lin@lecomputing.com,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lecomputing.com:email,lecomputing.com:mid]
X-Rspamd-Action: no action

Add ACPI ID "LECA0002" for LECARC SoCs. This ID requires a custom initialization function dw_spi_hssi_no_dma_init() that sets dws->dws.ip to DW_HSSI_ID.

Signed-off-by: Thomas Lin <thomas_lin@lecomputing.com>
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
index 1bfdf24c3227..e131520fe887 100644
--- a/drivers/spi/spi-dw-mmio.c
+++ b/drivers/spi/spi-dw-mmio.c
@@ -226,8 +226,8 @@ static int dw_spi_hssi_init(struct platform_device *pdev,
 	return 0;
 }
 
-static int dw_spi_intel_init(struct platform_device *pdev,
-			     struct dw_spi_mmio *dwsmmio)
+static int dw_spi_hssi_no_dma_init(struct platform_device *pdev,
+			           struct dw_spi_mmio *dwsmmio)
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


