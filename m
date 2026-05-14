Return-Path: <linux-gpio+bounces-36804-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AdOCkxFBWrmTwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36804-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 05:45:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C772C53D621
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 05:45:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 109A83041A4D
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 03:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4393A63EC;
	Thu, 14 May 2026 03:44:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2131.outbound.protection.partner.outlook.cn [139.219.17.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819B32D739C;
	Thu, 14 May 2026 03:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778730290; cv=fail; b=D+PQYqtfoTVJEzg7LI5mi6Ebqlh2j3MtfimyMI3ZrK1abNDLxaXLceoaqJNUJMiMLCiylJ1X3rcO+qqK5QDYBYl75AV19MS2mL35WTyh97/Pz3tNi1HIjlB8eKnY8TFA/SAaqsHIHJ6XOnEUSqF64yg2P6M3IqGxSBoJQlBzZaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778730290; c=relaxed/simple;
	bh=1/eJ8J3mM8dv3JIHBdNDuXIGXe9pzhBY59unkLGLq0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uOZ0X0wusdAmGsTxQIYvGVraMPCVsbkHAns1nHR5a5GjFR1aCmrL+zVhI4bzR/H1iGqYsRWec2+ucSfZC2+QttXs4XcMX+zm+VKROoYMS0U/CSUmkTq58yzFZD/ZtW3mD+4ED1CFKGTtjPjAeQkZa8ay4mY9MowFHcBCDpxIFt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com; spf=pass smtp.mailfrom=lecomputing.com; arc=fail smtp.client-ip=139.219.17.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVXiqIYBiiUZZWE0cOloN3TSqIqTYNIZHx3Id3EOFzvOAUVYvepYHB8VyMhNY2gHXWuRuSFbhYzpF5qbKtQU3kkK/YClLhJjUxBoqjCyZOFrffURDdkfIQs7+TvMS1A9Vvm26vC3BbMQRXbfJjPOyz+Fl60J/W2gxvYBjFiZQVuP9QwMYxc6b+c7Hz4WzHvL+gZvO7/X3Yy6bqh1NArIQHFGpndY/a+nzPjvboOYVN62/0NqFxjguowH9gGTrPPXPE50o3Ob12BBfQXJgI3hmcH5NqYm4Y/n7PnkxPle7H276aUb/eEvg0GBlrIquw/3plLWivGsSu6ihxCOosthyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//a1aFG82GY4k9F6LaiZ3hbHrvAAVlpzESOyA/x0jSQ=;
 b=OnohHsB/fCyfXp9IcAn4vbF4qSfp2Ufo07Y0aHffduBUGeqm9FcOVI25/4k1C4Gc7OUtfbimtv9SAg/+yMPn29oc26GFIxov1WMrW9N14K2rnaYmgoGVMO2leyf9Rlu078sFq8fVIg6raVnu10mWbeN6t87tjT1shWqM93g45v2A2fwdVYKhRaiWmmOqKjkAWhytKNIsmtJ5BsuqAJwkEigZ36w779FiXbcQ3jhTb5I5o/5K0L9K90c8tK17JN7tVNodZTiFxiRPJ04ibdCkvGMPYSwBPiwaGlvWgiaYofLoF8uzRwBoOAh0qVSTF+odDfFI96lLa8F+8+hKYsfCmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lecomputing.com; dmarc=pass action=none
 header.from=lecomputing.com; dkim=pass header.d=lecomputing.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lecomputing.com;
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17) by BJSPR01MB0515.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Thu, 14 May
 2026 03:43:34 +0000
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 ([fe80::1c61:86e3:3a75:155d]) by
 BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn ([fe80::1c61:86e3:3a75:155d%4])
 with mapi id 15.20.9818.023; Thu, 14 May 2026 03:43:34 +0000
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
Subject: [PATCH 2/3] Add ACPI ID "LECA0002" for LECARC SoCs. This ID requires a custom initialization function dw_spi_lecarc_init() that sets dws->dws.ip to DW_HSSI_ID.
Date: Thu, 14 May 2026 11:43:16 +0800
Message-ID: <20260514034319.3507315-3-thomas_lin@lecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: e3553ddc-9193-40f5-709f-08deb16af93a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	9Ve4yRChoxGeBZUq9yFhl6lXJEr7XpYv9KGCKSjVsw6WZ4E9+0qXSFNr4uaNgF1t/4Vsg5LHJcjMKFu5xeF5DC+T6UN9GnpxjRmGSjuFE33Rc5i3uwPLU+XCc5sPsLQP2Tn6PJ/qtesVsknUEhf/TGTGIaUszSF9cOHoYIETeuOpZEM8MXKnShGDJoSxlXbnA8jovKHU1WQvAtx61h3urrLGUooY1sdc6tn87BHjnBXfWIunlMwnvsSOio8Tq9vJwKgyWte23QWRkj/hnvAKfgel/NoWk+fe3xj82K/a4T2PtPSCHjGTix7dpsWHBjmMdtQnHkFxOVTtwhcXrnt00Ionx/pYw/cJSY+F7zXz5xiJ8ag3ciXsNXcpG7aeYKkDlN5UM5zz/+8WZUnKSUVzOfVcbcaV7NfPkzrDlco2micxr8rPdQ4Uvcm9YJn3Lk8pSQiVmmvgwMQOKTEhuYU/+AJ356cKo5/MzJpFKrOJDzIFtk3esHMIyny1ugvg9zrmjbXD8W2IAXzoKFxGTkRFOK+IJz5okSVb90DSsIAg1GcyvxdRDs4MvCkXLEVcPRUKVEvl7bRRXX3tq6rzlg9i4Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5Ncvz7YBek4rwaD8k8biwj+5a5IgjQHezqIKq0+qbbRvHxK7fklASPlw26D7?=
 =?us-ascii?Q?gHYJclZpQvaJqlgqf2cgeIpNSI4hPztHEQZPMpuTOy1n2ksyYNtD5yG/op3V?=
 =?us-ascii?Q?dOfyy4nUQ+RqIMweHjWDl+pO7965cSuEhcWzqh1p/EqfBkeWPejJY3cQ+ezs?=
 =?us-ascii?Q?SuzGzFz5tKIIIM0DxBPPslGWjRyvB27KvY9QABq2N+uOM+xmZZaediw1PjM+?=
 =?us-ascii?Q?Beq/dnsounIlq9cV+hUzCIc40cTfIPL5qNhlsV6xiTxpjMwNaYhISFmoP8QB?=
 =?us-ascii?Q?PuuebqLPccTqGW0A223h2FJS2tRS/mhjYUnuyLR4yOunUpmY8Twvx2t1oUSH?=
 =?us-ascii?Q?1mpEQJhfXr/B4Hs7t4RM9rwvqf42V7SPBWk0/J6huKeodj+ps9Rhaoioha+3?=
 =?us-ascii?Q?eo8Hmn8YU6CXJgdCLaEWaS7fQ12nybU/4NNoxnBK5ctbym2JkmbbALD4+30D?=
 =?us-ascii?Q?Dw3WEbe8t1UFRimuj56Cv73CRLElXuYL1Uo/NJy4hJjtpLJqHbkli04VBN8H?=
 =?us-ascii?Q?OXOkxWgyeKxETCC1l0dDjs01RS9E97G717sLtjORVE0OipEDE+wVND8rf2tO?=
 =?us-ascii?Q?ijcN0ZC1lZe/5HEacWNi+s/2jSijvOmCQUsL360TwTllyi6JGx8s2rZZlHuU?=
 =?us-ascii?Q?hKD5k1ZIfWgYh8RufZFEHcWBTyWjHE4ZJTzwLceZaq2AcQjyBv1hO6gUQ68w?=
 =?us-ascii?Q?UF+DpBQuIeJ0dvfnv2lsXejSTZnZS52in4LpgTISBn9ysbBdtafnB6YhH4in?=
 =?us-ascii?Q?QrqAWrtaGE9qmsBaAyNaw5WI5TpFrcbPAYm+xFF1g6FmyoohWvL1ryXhbtrx?=
 =?us-ascii?Q?/9HCDF/yGa/esyDvL42SfU3hX5OzOUQ/My1dyNsVyh4KEV9UFU9iFTZopuOj?=
 =?us-ascii?Q?LmluOPoecaOku2Ih5PFF7Kb/5jt8AUwFVDQ8q6mqmdXWdDAZShuqnba1bXfZ?=
 =?us-ascii?Q?i0/W6GDgnkgV8yDOMpG9kQDRSZWzSN/vcbxYLMhnfGFhC5zLtwQ/oimU4TWa?=
 =?us-ascii?Q?qtTyw6OlQspr7VCR4ivUH5pX9BhCrmr9OITZnWbH5a1tohmUcw34h/nitc4q?=
 =?us-ascii?Q?t3LUJx0dnEaKhqufuXP3hMsfQ8lbnASdj5gsnv933C+AIIYsKhI2LMa0Vcqq?=
 =?us-ascii?Q?GxxVKFt0x6LDSNgQLbA3RFMvI/DxHrmb1FIEFCJGNtjPw0NNyEm9uvYLvK8x?=
 =?us-ascii?Q?w8DQB+7uQqlIQvAID+X/Hs/dHAcWM/R7XyTEq7GLLjW3Yf4/d7PI2iJg+6uU?=
 =?us-ascii?Q?/SzRk7QqjgLleO6wKGmtf28VmfjXyDf0L7KnMF/JbgsFrFcrk4mXqhPx/S4Z?=
 =?us-ascii?Q?49XU1nA2PcwA8J8jpBJwDICmPKh4ZjMWAw4f9lgmXfJfKQjDD/h6AhuhhZ7N?=
 =?us-ascii?Q?Lesd+afID+mhqGlfJKrEUVPAl6V5pI2fNy8eAhtcHUkCEbSXZ8epzw8fsBMe?=
 =?us-ascii?Q?cWPtrZY6Z2h5oT2HsRjydkbn448hqBSHyFMzXbM6tXTjFrV+WelDGwrguILI?=
 =?us-ascii?Q?T4X6BSXr5ywKcIUAZp7bh4+zFHnHwCrV69rPDrmpyevO+dc3LPQhIpzEtgnk?=
 =?us-ascii?Q?yrKCaYqa0qyIHVn5bFrMdHyNqzKkbcL/6Obz6FyhFSucWGI8i/Z7s27KqK2v?=
 =?us-ascii?Q?OWMgNjZnrozhRY4hLECzryBsfyV0bAGSxCyhW69GjMdxFFelPMfw97UDIyP0?=
 =?us-ascii?Q?kH0PQRi9CF0SsaGo9gZa1JwYOk8gP+gdU3rGyrABP+AadEksWrbC0diVSBH4?=
 =?us-ascii?Q?Vuqxo3bV57HvBZLJqQJry7JIApeIhss=3D?=
X-OriginatorOrg: lecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3553ddc-9193-40f5-709f-08deb16af93a
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 03:43:34.0938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3591a018-3909-4ea2-aee8-843d5abaed8d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mTeNrb7DYObHOlW4NKFmJC4rFRpjfltQkcc1nkxNtTuMfk9J8Hkdlt8GMKJk00eNJnWCFmltou2uKPzONzOzZXr8HozodX3WAVWyn03I+7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0515
X-Rspamd-Queue-Id: C772C53D621
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
	TAGGED_FROM(0.00)[bounces-36804-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.974];
	FROM_NEQ_ENVFROM(0.00)[thomas_lin@lecomputing.com,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lecomputing.com:email,lecomputing.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

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


