Return-Path: <linux-gpio+bounces-36805-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePD3HHdFBWrmTwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36805-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 05:45:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D8453D638
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 05:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B4313057D43
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 03:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A373A7859;
	Thu, 14 May 2026 03:44:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2131.outbound.protection.partner.outlook.cn [139.219.17.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214103A6B9A;
	Thu, 14 May 2026 03:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778730293; cv=fail; b=eJDTMst+0AB1RDMxuaiWc09TZRklCjTteIYCZRgmwUIg16ZknLp7Z5ohXvIT9+HsGzw11Z0RwHMGqsAzdE2Oz0rZr99Ie1g9tP9qmaP7VxHmvdbZ0eEDnqVhSQnsN95uDTCE1CtOM4evQdP3Q8TFM/rbHqNm6tfL+aUQQ2DagIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778730293; c=relaxed/simple;
	bh=pkHbP+uRD8dGVm51+8HNxot3xpbuNnhQPuvTNVKb6Ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZreWv/JO8UDh0pe/0pTQ2gfNAyVl0K1SKafzuX6GNuz1zqRw5oOZZsczNr17g6Hrrl3vXmm9o7plRz3VcUd6XkOv8YE70Eb+w5QWh165BO5mbfikG91vhe/B68eUOaxYY0d9l8/LA22kYQFVRnRUb2yaKUP2G6/zNHvmPH3fHe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com; spf=pass smtp.mailfrom=lecomputing.com; arc=fail smtp.client-ip=139.219.17.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hI+6Ax1JRpqFmItD0ZJcOfIvWc7iqaNFK2U+qYcTbO7exx/4FeVOTI9/DIotQ1SiQoY4WyUcnwRP4R3r/KG7y64hGaNvdwfEUp3NeBCiR5lhcqAxjXLpRWj6c0ljoUnoZkKX74oEM5Sbp4zGidEtjbR1WiW1evEze5FIKVlTeVDFLFR064oOE1IDD0aNdxk9xbrGbUvNl8/hu0uF+Mp+VoOa56iqCy4NiZvKJbt87hckAPSgNkbMcbrPO2HQMJ/MltVfPzy0hEw914Tk/QTc8gzVHfMcEnFQdjzw8TiDVHjVRVa4NWKXKWi2nfbhA+fw1YlC37ubFIHc26pW/A4Piw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZGrR0v5tqPh2Hq3e4zobUv1G68iVyLgn1RaHANYgQc=;
 b=Dwm6PQKbHp4Q5EcfKNniMgO8BEsru4IMatxivOwxyoUv6oRBq37/hu2+910h69bA5mFXPOPz3kL4CLhnHoP9v3YaxZ72PQckVbdZQD47pMc6UJGPooSLMa3mQkRU/NuMjK9TRHpbg9KNcuyqkX/vZfcu/2NGm3i5sQLDNvENzxhme0NAcM8XeqOSfUD5We11Fvk7BsD4Xd9+obmtSxVLQVYQuLr7gAcgMMikvDymWnfnZPmVUgQYkjVoTIriV+F7p5Cv/+UY8ncEQpXZJppgsgDPWvUmYYU6tPxwJMfMkmmaf03jzKjZoZpjCV7tLNpwtD783C4Gmt1Rb6Hu1i9Gwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lecomputing.com; dmarc=pass action=none
 header.from=lecomputing.com; dkim=pass header.d=lecomputing.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lecomputing.com;
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17) by BJSPR01MB0515.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Thu, 14 May
 2026 03:43:37 +0000
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 ([fe80::1c61:86e3:3a75:155d]) by
 BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn ([fe80::1c61:86e3:3a75:155d%4])
 with mapi id 15.20.9818.023; Thu, 14 May 2026 03:43:37 +0000
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
Subject: [PATCH 3/3] Add ACPI ID "LECA0003" for LECARC SoCs that integrate the DesignWare I2C controller.
Date: Thu, 14 May 2026 11:43:17 +0800
Message-ID: <20260514034319.3507315-4-thomas_lin@lecomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260514034319.3507315-1-thomas_lin@lecomputing.com>
References: <20260514034319.3507315-1-thomas_lin@lecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0067.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::34) To BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJSPR01MB0707:EE_|BJSPR01MB0515:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b2e61d7-dc91-4d28-81de-08deb16afb6f
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	PCuYCzQlAhfxaEzPvZtvHBy/DrAueBO3aP9vK0LQrsuZUESTvDIJt1aRRNjmUG7jmVLYfjCzziF+S6IrKO/5v8mQUwf/4YHTEq6h3NE677ZVHmnBQrE56qCHM6yrRU1twJhiOQNN7My6KOAe34Y4pvlbN+i2/zYiEi0p+FQD9Z5YHFOpvVbsIzyYNzBddU+8FRnQAnncrsYLKNPXyxe6u+v/WaMOxHO4a3M1JiUfXGQ3Nb1EzbLqVThtes2iw57kMnyhTK/EeBLIHK9cchC8KH57iI+5yHm2n3KWQzQkB+l0ab71PvdcYqrgBwHctLsV0TBirXjV5MYoeN4/nkN2yZxoVmoVeVF2u9+STO1rrluM0HGJ32mlc7I/tIf37g+i+g3Cy/kOj30NDacAZxyw+JAA22OVqb3PDU/WxY8qGxYP2dhwMt34hOD0oKTWc4AjURCHPSlQ8kXT43PJpI1SnTICQwKHWkuQK8vGpbNPrOuCfZbC2nPnrfrkax0UMjvkWBtS2zxQWo4hC6d3XE4BPo5TeqVY9ybHr18v45P8AwiiRrfD171TeBhxnLWY+UiLnUED6T7WjkD0UmnuWhFS0g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7tyqmPPCFjulTMskRWSQf1QS/MCiqt2CnaTN8LZfufsAmKRZez8QY/OFRTRt?=
 =?us-ascii?Q?A8Lsxm6G7SO7JMmN08dCGv3tim50h1WjXe4j+9PDQRSzxSRiKjNm3UVc6ZJY?=
 =?us-ascii?Q?bt8GT7YQPA2uKMqdVMJ1c5LrBtzbYPS+KAmPx6aUa30fqihyCPMtH/rlf8OU?=
 =?us-ascii?Q?2UXfYAfo6eO2z0oIrIiG2Ql07UTyVwxjYIro2DEWxAEGqO4WN1Bc4XGg9LCR?=
 =?us-ascii?Q?2US6cMSRTmbQEC6sy2kW4C4QZnFlJE2AcXhKwPL7bGNtthZB+VV8Z082TWxX?=
 =?us-ascii?Q?FHU+2/8jotoNYWdeULEfTXneGnQpwDGwzt1X2pdLNOS8Yw4po5sHq1AQkHiu?=
 =?us-ascii?Q?TpBnAhdjuonmGIGIcKPZ3xHr39Qdc4oJ5rG713tvGQXM1fzqLjQCdVUzr5vo?=
 =?us-ascii?Q?zN98Qz6GdGnp8CiZPergPKFtnbd/0kEFEEB7EEs1TfyyIEJFO3ZTprgVKqpu?=
 =?us-ascii?Q?yUfxgOyDBlPhPXi+pg56+e9pTwJFVHVkY+rwZNPZPhEqLxig/flq0YVJATLF?=
 =?us-ascii?Q?ilYutrVRd2LQmeCzXbPJSE7sJLDZY/UvEc2+F90a57/ZhTz6fYkmr1WyYrJY?=
 =?us-ascii?Q?dfMmy6Wuhtk5KLlPYDUCf0FMWobLA0J1BgKJGLMz47Rf/FtdTJsCMDF0S0uv?=
 =?us-ascii?Q?6rfnQCVRshPjXM32fY/yUinMWgdVa7bIn8fGUC2jZRN4HSQbhDz2mrbWArJq?=
 =?us-ascii?Q?dSexl46qcG408+7nJYTFdR2oAo/NoiWpJ3bH7y+qD25Ab6CGF3OgMGXLu9YR?=
 =?us-ascii?Q?JXj/mpaayz1jeU8SsoN5Mz5EEU+wFwEPOA35Wl4EPOpZvE0X10xv/5zBzHGl?=
 =?us-ascii?Q?8XhMWqz9FQf9e/QZSu9Kr+gTY8bkUJ+GLbQurL5l87qdXKQpuD0xXTr0Rp1e?=
 =?us-ascii?Q?7ReiZFEh/E6GtHdngdUHbF1QxqbnhPH7F9eZV2cI/2lQjePepJP7XOzaB1ri?=
 =?us-ascii?Q?S6qI651UtY4cCJ+QsmJMCHsCUtE1KoOo4MX18xpdTYQ3tnC0+WA0DsVxeD92?=
 =?us-ascii?Q?7MnKEu3sijJQRifGNgagib4LLMzU52+GaTFlGrvywB/myk8p9D0X1orXJQep?=
 =?us-ascii?Q?vlXyPUnfpUb7s5hT75txvu5B+im5PGJryck7VPuoD7dIpeTRb2+E1orj3p1Z?=
 =?us-ascii?Q?uCyL3psKcOFeAb2U34cTriSkNNHP2cu2/VrluuDE/B7NkK7GUIFniwMfmh73?=
 =?us-ascii?Q?vPMssJqudXeDwaxttqMzkZ/srYmz41/rwMQqaagow/9xWyLJLKqYYxskyXfi?=
 =?us-ascii?Q?qTptYOPE4cdzgn2ehyCqigQteqjFI+uzeAazvY0KkHTe7VgAYRzU+sT1G3O+?=
 =?us-ascii?Q?NZXRe5B6w210UYohdqv8IHb1hfCkb8VCdLlbR11h/NISsk67c16YCjaQ3H6c?=
 =?us-ascii?Q?9s4m1UJm75Yg+6XBMCZShMTVQ7vDoPzEDAI0LAEwtf6KyiLOuDBPC5O/PzjM?=
 =?us-ascii?Q?4vTeW5U8ZN6b4xEFKcu2yawb/c2gslEhvD2JUE8d4sPbAIZTvmpppZWLLOkZ?=
 =?us-ascii?Q?Xyz3O+nFuUIqQVg0VgAD1xtVyNUJmcqWXI8Ngq2HeBC4v/8tGtmpjRR+JvM1?=
 =?us-ascii?Q?W4tDciF0Nz3sG7QhPZ0C0swO97kxg4YlJ5hMWonRO4Zq0kBLCxDRWzMUbl1G?=
 =?us-ascii?Q?5ns2gkSLI0tfserNjhPLNfPzPAS9V/orHzmfY9drYW7hzM9Bh+Eo8tntZjIk?=
 =?us-ascii?Q?UmNA9Dxf5L03mllwEhP+ttLoGC3ci09CKbI+12ZErvsTspZI2y45WA4denxG?=
 =?us-ascii?Q?bnzAAVVwGAMRgHidwrEivvVSI6iLrOY=3D?=
X-OriginatorOrg: lecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b2e61d7-dc91-4d28-81de-08deb16afb6f
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 03:43:37.7960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3591a018-3909-4ea2-aee8-843d5abaed8d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FqjX6W2iKbb0TEK5+K3GZappmtGhCA7NmSWD4aNtSXOb7vxcJ+MzFsTLQGxPuwXeMwXge5KlLmOZkCmEyTh3SeYSfnBBZG5k8KrkXR0878k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0515
X-Rspamd-Queue-Id: 15D8453D638
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[lecomputing.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-36805-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	FROM_NEQ_ENVFROM(0.00)[thomas_lin@lecomputing.com,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lecomputing.com:email,lecomputing.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Also add corresponding ACPI description in acpi_apd.c.

Signed-off-by: thomas <thomas_lin@lecomputing.com>
---
 drivers/acpi/acpi_apd.c                     | 5 +++++
 drivers/i2c/busses/i2c-designware-platdrv.c | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
index 3a80e833215e..ae6a7da56e89 100644
--- a/drivers/acpi/acpi_apd.c
+++ b/drivers/acpi/acpi_apd.c
@@ -187,6 +187,10 @@ static const struct apd_device_desc leca_spi_desc = {
 	.fixed_clk_rate = 400000000,
 };
 
+static const struct apd_device_desc leca_i2c_desc = {
+	.setup = acpi_apd_setup,
+	.fixed_clk_rate = 250000000,
+};
 #endif /* CONFIG_ARM64 */
 
 #endif
@@ -259,6 +263,7 @@ static const struct acpi_device_id acpi_apd_device_ids[] = {
 	{ "HISI0173", APD_ADDR(hip08_spi_desc) },
 	{ "NXP0001", APD_ADDR(nxp_i2c_desc) },
 	{ "LECA0002", APD_ADDR(leca_spi_desc) },
+	{ "LECA0003", APD_ADDR(leca_i2c_desc) },
 #endif
 	{ }
 };
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 3351c4a9ef11..b435b4015f02 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -279,6 +279,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
 	{ "INT3432", 0 },
 	{ "INT3433", 0 },
 	{ "INTC10EF", 0 },
+	{ "LECA0003", 0 },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
-- 
2.43.0


