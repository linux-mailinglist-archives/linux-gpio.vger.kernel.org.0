Return-Path: <linux-gpio+bounces-37181-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBU4HqZuDWp9xQUAu9opvQ
	(envelope-from <linux-gpio+bounces-37181-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 10:19:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 30971589964
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 10:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 704EB30F7508
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 08:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF8D3A7F7A;
	Wed, 20 May 2026 08:13:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2125.outbound.protection.partner.outlook.cn [139.219.17.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658493A8FEA;
	Wed, 20 May 2026 08:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264804; cv=fail; b=YtQiZv+9Zr7xlfklCJzJR3S7B8CXNK3UDYji1pIGd19rqljto5EaSp/XNgrDtvUuY4N3C6pH7G6qRAIHSHQoNe6YmIuH+12xm0JW4T7Ap+NXqkGu4S+ptyLO/YJYLJZsCyQJpHDx7AtUv7GNZIX1ywUqQ4v1NZTCjGCVml2GPMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264804; c=relaxed/simple;
	bh=+Er87ChW9xID6/aRhQemZFnnt60MWTwvfwiF8dYDo2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z3gjJVbKyzL9iVX8IH7/IXnaottU8aNQg3XwJlh6aDm5yaAClKhCegFedEQPGXDAni5tTzLbZYotFO3j633ucwnhYbGkW/7JPWp8PQtG7tm+S64tdWZn55RopgUPPyqtPanwPXpukrkVXCDImWWdmyWl5XjAppoNp2m3f8o3NU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com; spf=pass smtp.mailfrom=lecomputing.com; arc=fail smtp.client-ip=139.219.17.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y181cZH5TLc9NET8iQstQ7+XBy/Jyh18qH5OeZ7QCWCOXCJ4vyUa4Jaymf7pJOvvi7vLIutUVYjGGB4CX6GRRJUNmYkvf7PsR01aTNBnVLhuF+WwdxXxFUGGp1mGW77M4okAG5dDqWcOH8tOxwMJF1P5WJ43/Jz+IHD7lDx/AR4A+iUu1rwmK2+GmOKkGOlXJMfVSotY4rq2vl5uIgoUl3f7Ydg3r82N5ZdGAafX0NGQW+lWD+H1v9f10z7oe7aYg+x1PmFgbGRo5z0wIomBPxB+FbsWZGosb2E36+pZ7H8IYo6J3p7x19VLqGRnnBCD6f7U20RL4GhGG3kBpWnIZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LeGdcwPCWebxeV0ZyocXxAswF9IcvsUt1jqTrBza+ZE=;
 b=gm4wSZWZtCUdlc86H96PcMqMZJYupqEJX+MrYNc8EsmjNIJUizsoGKZYTCn17H725O8jyC5MRA5eR+dyn8Xj/whyyaETwfKF2KV+WIztIdTQNxoMyKfU/C02x5D1gQ78UmntBuN+scmJiQB90rsc71/td4a1fY+o/Ne00Y0CFUAgWsaHMWzpsyyNx08GaZUrYYHlrrZzBrc/PLhkge+9JMlA+4Sc6VAyrgLxsaLttKoaQ5WeIF9njTFWsqA6ATea40iawvGZCtTmQEZNgWQJ7W9ZAeP/l8VIOre08odjEPTKUmhsUZJq6TxanUkY7e7jSwOcGYoX8TdStzihGGeJcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lecomputing.com; dmarc=pass action=none
 header.from=lecomputing.com; dkim=pass header.d=lecomputing.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lecomputing.com;
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17) by BJSPR01MB0755.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.15; Wed, 20 May
 2026 08:11:55 +0000
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 ([fe80::1c61:86e3:3a75:155d]) by
 BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn ([fe80::1c61:86e3:3a75:155d%4])
 with mapi id 15.21.0025.023; Wed, 20 May 2026 08:11:55 +0000
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
Subject: [PATCH v4 2/3] spi: dw-mmio: Add ACPI ID LECA0002 for LECARC SoCs
Date: Wed, 20 May 2026 16:11:35 +0800
Message-ID: <20260520081140.637637-3-thomas_lin@lecomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520081140.637637-1-thomas_lin@lecomputing.com>
References: <20260520081140.637637-1-thomas_lin@lecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0024.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::19) To BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJSPR01MB0707:EE_|BJSPR01MB0755:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c620fe7-972d-4d09-834c-08deb6477493
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|56012099003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	+iCM91oJtienKgJ+IJhpEnOUex0rKQIoXxKsLYIlEwwFUl2kbWC02YlpG0frOAsGpVG408/P0Nj+OIb7YgLya7bxUKNSl3l7oJQQBQXPVN7Bshu8yIQfBAkBCT773W3DgCz1Pr/nS6QXUis59uOK32mDJF+0Kbu4jkxt+Qr0VEnVS494CYAZbkMczp8dG0IjpwOj05ZdjlX9tiEAjKCeqOFlEGWa5I51/xLEHZSuSmYhgzDOFxQA9mckrQqPzio5JJDlbESUZ+qBC9F0GSLaircdk2prVHbaTgUVH6r3hIBAXqiEgzPy3fW3e9KIybG5R9fxSsEY0wpp3RrWHbkRJr1YVqirHCsqtOxE72a70EjPn5xItLkOM+/VJORVa65UHc+FZmiDtDUH8u/UkaB5k5vsUIgmhAHVGLOGy4lTh0ufWPCsTQsfsJxpQ2aLOi7C0R8WE8sDiETjMtTU0evNpjPRlkavw+ekK7XuUVywBChfcZko2VcwxbIkEaBsWxNYiZD63ioIIi1xGMipbAGsdFflgj7YzffxoEi6GMxPSUPZHdd4XEouO/caQCJftBi5Q/A0IGIFCkDn9GdaVrWcRw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(56012099003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ABypnI1csWQfDzxLleFklzQVYQVNJTf2RCU281W2dH7jY2a8QpH0X6cEC+0Z?=
 =?us-ascii?Q?oSy/G6KFPYPGN/jYldyXSRiTApQt/C6SxqSnbE1LrR5/BHgfog9iaL51OvA3?=
 =?us-ascii?Q?AEo8b0n2tlPHuHC23bQpR0eM07JGQanE/Yxg96AL07dBofK7qOG69IN8Ntiz?=
 =?us-ascii?Q?Y6eCPQpHrbghEmYbxpCNLN9Of4TuFntzvMfQunC5hmWCZVEsn1B9XlOLek+b?=
 =?us-ascii?Q?UlkIGm5yT5pZt6PoHOMcuLuaxKQuKo/5pM7IDPBU/5bicWrXp/h6VKmSgwji?=
 =?us-ascii?Q?Aomu1xzsIChvZyekZayv8qIc+3YZSzdgYMUrIB8bf8rybfIpVzTuciNtSVDi?=
 =?us-ascii?Q?51DczQQRmWm1WJyZeiAHR/67BLV1RiR3UGnSnNKsFc2s/DprS+gpzAXKaZTp?=
 =?us-ascii?Q?zO2ezoRy5c7K7KafJCB/+YfkBb/+kKmzfOBMocWumWrWFWXn+9+FvjSuGZjA?=
 =?us-ascii?Q?b3w6f7wX/Zw1cwLi6Vg8fIvry1OunY5Wb2JGrsQrpwg75udNOvSiC4PFEKmr?=
 =?us-ascii?Q?MVS4ed5DGyD9vU7bO77A8/Q2mU+KvPQKYRrqlLTT+b6g6/uo1cBRNP8ObweG?=
 =?us-ascii?Q?c+coTm34/Yp8MQlQIQmgPA91rSA2AcJ0HNY35a/oivbngGO2Ny0Olm2BEG0L?=
 =?us-ascii?Q?iLC7cR84VDB72K8BDdkPvWjDe7raaePG1YajgrRTme3UBV8MWdYTLq/wLwZY?=
 =?us-ascii?Q?ekJuwAEuuTTlR5e6C19pF1DLVzluezw8C0kfoz1cJxiF19ZsFTcuJirKwTFa?=
 =?us-ascii?Q?8IwtjGW/D4PHxvJLyQzXmAeVyv5q83LnexjENbXrh76NVky8SYpkBczoDk27?=
 =?us-ascii?Q?TSkQvrcLaWOLbskfo84I3T0YSOmyWp1LN8EdifkCPymJqnMGzIBNw8tIQ09w?=
 =?us-ascii?Q?wKc2ursHkm9R9XW2fULBUS5BCg2f+uOEWOIUKxpNHRQLDYlfIU+rXvOh3p3i?=
 =?us-ascii?Q?1NyVJxG//KQ05WmPYri18b9nHcEgR+g3sHKTRoEl7++wJsh7WgJxinb9DSBh?=
 =?us-ascii?Q?SMxTvRkY8V5C/LshwDAuCcrRtHBPqIXj8kkmpq31o5CLBQtFp500hPQ8FEKP?=
 =?us-ascii?Q?l/CxKLIJ262qFBXvF3KYZ3aP/0fSaEXp2GySeIDDNRwPioikO8gWkZzfAZ64?=
 =?us-ascii?Q?AgXcBbvbbVlQTc72Ebi40b5AVekQv8clds0xY7LyIZvWQcVpESF+Ni3Sj2eE?=
 =?us-ascii?Q?4UmeIx2lbplriovEikH1OjV0FkaQ1xUI8zny7jks/4WZMQjnvCrEhvx3g0Ha?=
 =?us-ascii?Q?f7sj4rdmVLpFdjypI20vXZOUtZwFY2fu+Id4pgazo5izsMfQp7UsTHlY+cte?=
 =?us-ascii?Q?zc6zmmi0Q4bB4rrAMz+0Tn2ra+8lyopE7utBXC9ZEwYvuBD6A1CdEVkbtv/G?=
 =?us-ascii?Q?DgUJtckuwb7DRlJCVFZFjiX3svYMcezWjsK+DlIosqt4f7xlGIsXzA+C0V0h?=
 =?us-ascii?Q?7ZPy7pSNQws+OQvJrh4huWmwTqEBZTCofHjRF2uHYVcO2Ola3QsbPcXHlWrf?=
 =?us-ascii?Q?KbE3Oh2vuiuYEJkM41NhSy5QnEdqL8x3tJaWONT5j3pzo0cKHo0UFIlPoA/3?=
 =?us-ascii?Q?GDAEQ95vNE3lfNWdEJn6g5uTNVLGS5t3stq6rLC7dNr9Y20PeN8R+ayNfZXr?=
 =?us-ascii?Q?qmUPFxp+MtKc526kGtTfTgwuYNt9Wbn6+gIjCG+Rj+EUe04km3euV/vse9rq?=
 =?us-ascii?Q?dlF8ZhoABa+FSW5qDPCo4HfqZHXCXoe8FrjXeTHVmz6vYV1H9FQp+siTg0ca?=
 =?us-ascii?Q?qXY/cuvF3edDjXQyoYGZt29muBVTy2k=3D?=
X-OriginatorOrg: lecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c620fe7-972d-4d09-834c-08deb6477493
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 08:11:54.8750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3591a018-3909-4ea2-aee8-843d5abaed8d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: txdgaytWlSw3di6nkkDlLDf5gb79LjksK1iL+biIvCjsWYA8iqx6kgJdasfY2H7Jp1pqc0mwNfknxBbiUDswtS+PlA+I2MyYG39Y+iJZ1Z0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0755
X-Spamd-Result: default: False [2.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[thomas_lin@lecomputing.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[lecomputing.com];
	TAGGED_FROM(0.00)[bounces-37181-lists,linux-gpio=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 30971589964
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


