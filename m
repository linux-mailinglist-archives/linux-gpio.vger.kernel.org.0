Return-Path: <linux-gpio+bounces-37005-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPYtDUOCCmqv2AQAu9opvQ
	(envelope-from <linux-gpio+bounces-37005-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 05:06:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBB65654D9
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 05:06:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8494F3001FDA
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 03:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D46E37CD54;
	Mon, 18 May 2026 03:06:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2131.outbound.protection.partner.outlook.cn [139.219.17.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2A92F7F1E;
	Mon, 18 May 2026 03:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779073598; cv=fail; b=mP52EkLtkGYrI4CFV0PioRGcbRBdA1fiA8xIRLOnFT7z+vZIp/BnNdAkbKaGLEBV2iJnyCush4bkLfSBrVPhZ+ouDBXcT12dIY0w20l9zLO9IZOyPF85fARponGBvp7yvYkbWRITdf5iuSUyt7dqxxq8ZVA/QoAHlCxQzYkOPLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779073598; c=relaxed/simple;
	bh=VKzFfsrQqjuunWTua9fFuQ5U6TxxxbSvfQ6T2nZ3j7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oKiLhCD8MQ3hWAP0985pUMMMTJZYpG5Ko7K3rnWuVu8fwrnHtrkzpSC3kX5gB0w45uhdHkcCdgtynOlXGW56PocBqB78S/V5Mi6GaL3pl9WJqXk9VG7c/fB6lUwRHwns+VkIRSvmrU3nGvcoemT1TeKtOaq2A0DPz6iDRDY2R+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com; spf=pass smtp.mailfrom=lecomputing.com; arc=fail smtp.client-ip=139.219.17.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C42A6fzws2f3ya1VCmKQPmtSF06h+qk1/VZpyvQkF+LSRvO3PIik1SP1Ut7wT+uONvjdbg5swpu8KORgxKkFfX0xkLVePwRsG2fZUJO69/g+EVlep3cbYa1TPQCccEpQhyqdExVbKfwX0peU+50w5e7UQpqUCAR+KaYIAjMdOJ6Ls3LHZCIvkWRzp33ebpR12fNtDb1hEMwGpu3q4+yhkk2vmFRePvYLWG76tgu+7eKqKrhhKc1KO6jO1+oK4N6kyVlnhCLpIT1OMNo9oiT0KZ+CA3CX1m1pFIBsqGtpowWOdvX9qFbOAUhddfWBirpV9ZYfKORqynmujJ+QVIxmeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLSFWYeGD1a1tyIsXtRnywhtqMgQ5Mb6aRudzYa/haw=;
 b=OiLdzK0OdxcqU4m2P+/etuv9SCH55LqQi+hGT8YTuZ6sM+kJX7OEvpH59OSQUum1SDknL2+V4N1XsF3pBA2yaAYCANGWYpQXVYG4EkyFKvjxBwpY8gl95opwjwzzfaGCyFPl7v1xEHLqhvfmJOOtABr5l1qAsnSz+0EmqA4K1/ovzpneS3y8Tmk8LvvgtfgTa2019lLE12/Wyq+3qDK28dzR5/kIPYYMfToUxzic6XIsyqAUxTMDdTlQdbmzT2uqsVBOtx8F9mAIx+TdwcfvuAWnDNmDzNmLjLhKr4eaZN+XMU7pUibEYYv7tOMnVgUf9lwhd5PLXHcZsXPBRkyShg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lecomputing.com; dmarc=pass action=none
 header.from=lecomputing.com; dkim=pass header.d=lecomputing.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lecomputing.com;
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17) by BJSPR01MB0548.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:10::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 02:49:55 +0000
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 ([fe80::1c61:86e3:3a75:155d]) by
 BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn ([fe80::1c61:86e3:3a75:155d%4])
 with mapi id 15.20.9818.023; Mon, 18 May 2026 02:49:54 +0000
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
Subject: [PATCH v3 3/3] i2c: designware: Add ACPI ID LECA0003 for LECARC SoCs
Date: Mon, 18 May 2026 10:49:36 +0800
Message-ID: <20260518024937.453714-4-thomas_lin@lecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6b94a63f-8d11-456e-38be-08deb4882403
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|22082099003|18002099003|56012099003|921020|38350700014|4143699003;
X-Microsoft-Antispam-Message-Info:
	WibGUcSZaggSkYjeOsZmp8I1gyBwGIFFsAxX5LRSLU7NYj8rQHwzomIuq2mnSJwO0L5z3vREE6syUlPDz/Ylj1X6svB+f5m2vkMjKXoZhefUMPhOiVnBlglCW1Q3f2gvoWQOV/2GNf6tPp3L6hyxduuQAhc2rNkWJw4ihxA561OiWlfa62uLRDWl+vuyf5O1UlwmYqzXGtU7NobDEjgOu0F+2uxR1JIoGxoZmEmVSaYMpZLdOB7p7ePiJTltNkAJ7TJRRHGdXxd8ZhMTW9xRuaz2BgfsiGeLGTx6sfasUZM4CJ4kLnCWs1Je5q0oe8xpHL/Qfho2SmNdakK9ZQfGcFSjo3H6wpG/fXrfZfrKYl5FTNXzAUwnR73U4TKMZgOGkUQcPTqUVQAnXiFHsnyOL5B3cDFL/kBOwTePoemiVzuEEGYtB3ETrwarg/Owpnb6eA8FW3RCBow1IjGgY9Z51spUruepkCeap8L13bYvrhB38Tc/NvrnwSjDnyMqxnonAEZp0xcJmkngqKd9KLOV+ZWBrsap5ipPx0TqYp/J501w6oDIFOrRmmo6d87CRZrBtpjzboX+B6PU8eeUJSFKkw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(22082099003)(18002099003)(56012099003)(921020)(38350700014)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dTvZbTi7WGBkus3kMVO+bGLRlm5kWuhXGy+XNNikf1MjLNBJDzGhFuIP5p+X?=
 =?us-ascii?Q?TilxSCeL0S0o2iPy0gflS3aJt04r7f73qMtyT2ylidg1Kb0zwNVqY1KKB3mm?=
 =?us-ascii?Q?/qbItQ/Fm+tyZ4JwLc7PPYWIZB+cc1OuBI9He1GtKlaiYSGSRqmVcrbKGqw5?=
 =?us-ascii?Q?rJc2Wl6PImdP4BLZ15PljL0c5dkDLnlefNlMHxBWdS7N9dgoKLS1I4krl9T8?=
 =?us-ascii?Q?Lu2Glw74t3BGB/N4/EGrAiLGxJUSHQpg8ng44mZqbD4noQx1QdZgXTpfNy6G?=
 =?us-ascii?Q?bFrpnBMgw532tpPzV+sJHZNO4nhmrO7itn+QzCKGtqIv4ggoDY3ORaZjw+/r?=
 =?us-ascii?Q?t/HZqBehJxgDG2M+4v73hS23pSTW+XCpzTyP52bHlQhdm1IVq9FRKACOA43U?=
 =?us-ascii?Q?XwOaYQMSLhui3IGEuvDKwwQ0+BsJdQZt6Ry74j4STMEYl5d9zjdUaBmUXKo2?=
 =?us-ascii?Q?lQoZ+ao4s1k2rdWO7raiF5rlQ+emELl70nykhFLYcoFO06wYOjvFNy6IOOkf?=
 =?us-ascii?Q?cm+8iANr5SdpG1UHQJUgjQvK2CiIVoeUe/prlyYdgmEBDPBCCvb40ehJe95U?=
 =?us-ascii?Q?y+Zxz/E3oUR1FIO5FkE3QnU0Kr5c/oXBSNGXqxtNO+eFB6fnu7nZPiBaRiTU?=
 =?us-ascii?Q?Y0TIIvT7CDOwDDMNtJsfZcUJ8niuHJchHkBEXL4Cht1nMVkyzjzcrB1uBYJk?=
 =?us-ascii?Q?6nA7bfgP606a6FODyCAkBrREK6qxa/lMhNGhEzuYgt7n9GmLhbmT2jwVDmWF?=
 =?us-ascii?Q?GdDcxqnNX0tDobkabWpkIjFO4Otyc7pJzHJ3lDE3Bf3pjk7QcI4EeGTLI6LV?=
 =?us-ascii?Q?uqq7EgR4YN9R6ZrL3ZVuPUjzHo3qWILQYTQp8n095+OpK/I6pHvBlx+5UpAF?=
 =?us-ascii?Q?MYULgyIxQkErDDL5EMDDlRMve2SAC+ZbaiLzaNk7l14AdnF418mi20IXO8Nj?=
 =?us-ascii?Q?j/eReGhY20Jtw7rankeXRyMrjm8xRCzmc/LHSxWhhIv9Hww/n9A/KGn04fbi?=
 =?us-ascii?Q?h+skOrNNm4o288VajA/nzEvjEpOR11JJyReHnV8M5erF6zj3w+a+g/lvMmFK?=
 =?us-ascii?Q?1iLXm50brRMNNqAP9OvQMbDb+POfMMtwaGOJ+dhWKUaUcmen3gd5kbmbbWG3?=
 =?us-ascii?Q?0TflBySJH7KMfNaFvo1zMK7LpNPvhPJ57Vj1GuOOKXRKG1ug2V7uX+ffrS5M?=
 =?us-ascii?Q?E/jsGvw1cGVo2eVYYhXj4Paa1dGzfMt2p3Q1cAkNbD9b1K9Zr52lJb9rLjGN?=
 =?us-ascii?Q?y7PCCP3O53i15hdI02I5W8q7JYiC3t3cKUfyqy19NNfF29H8C0bXe27VwFmD?=
 =?us-ascii?Q?snrLVWL0nh81EMzm3mTj6kpRjGbAEIrUiql7dKtxEMKc/TVBXJ5//R6XUVTx?=
 =?us-ascii?Q?LYPnOOeIg1Gt+NpMb5j9l83AfOnJ15reqdviu+TNSTEw35gWHANj5We08FWj?=
 =?us-ascii?Q?rXazyeCjBffzbp0FvkCr3Nth0ab286s+DtoUofO9HeNki4j/iOswDZJ9vbSi?=
 =?us-ascii?Q?Ew7WqLSiiWDy/ESdFKb2DyBGzJ88vhV9dpQkkw6IK3rtvz3zKZsbduJaj7RY?=
 =?us-ascii?Q?kSwjb5jyjYRGaa6KzsnRd6XzpWWCqoBXV6qSo2BMMyyPr49mMhl1wyOQIhTJ?=
 =?us-ascii?Q?bDb6gIr85gv1hEHN9xJegWuv1MXrY3gKrpw8H+N9E87aS4sDaCzLBZ2Us8sv?=
 =?us-ascii?Q?FzkIwURI7VjHAgMDop1lUeyHLNB18EDwi6zJnrWc6A5lZ8RG4c/HiXp2vwXi?=
 =?us-ascii?Q?Lj79n9+YhyRFhHkIHq9vEzt7AcyaKJk=3D?=
X-OriginatorOrg: lecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b94a63f-8d11-456e-38be-08deb4882403
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 02:49:54.8138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3591a018-3909-4ea2-aee8-843d5abaed8d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EnzDArwke91BBU1xGlCkxCSm4blC8dK9k7rpTl9LE9g0v89hLOwaZKhfcKdmpia42dJgGnRNOwRrlRgTYaLXfx+atyyZWpHSCvkQ1gOop98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0548
X-Rspamd-Queue-Id: 1EBB65654D9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[lecomputing.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-37005-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[thomas_lin@lecomputing.com,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lecomputing.com:email,lecomputing.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Action: no action

Add ACPI ID "LECA0003" for LECARC SoCs that integrate
the DesignWare I2C controller.
Also add corresponding ACPI description in acpi_apd.c.

Signed-off-by: Thomas Lin <thomas_lin@lecomputing.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/acpi/acpi_apd.c                     | 6 ++++++
 drivers/i2c/busses/i2c-designware-platdrv.c | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
index 4d5a51d30adc..008bd0552cb7 100644
--- a/drivers/acpi/acpi_apd.c
+++ b/drivers/acpi/acpi_apd.c
@@ -187,6 +187,11 @@ static const struct apd_device_desc leca_spi_desc = {
 	.fixed_clk_rate = 400000000,
 };
 
+static const struct apd_device_desc leca_i2c_desc = {
+	.setup = acpi_apd_setup,
+	.fixed_clk_rate = 250000000,
+};
+
 #endif /* CONFIG_ARM64 */
 
 #endif
@@ -258,6 +263,7 @@ static const struct acpi_device_id acpi_apd_device_ids[] = {
 	{ "HISI02A3", APD_ADDR(hip08_lite_i2c_desc) },
 	{ "HISI0173", APD_ADDR(hip08_spi_desc) },
 	{ "LECA0002", APD_ADDR(leca_spi_desc) },
+	{ "LECA0003", APD_ADDR(leca_i2c_desc) },
 	{ "NXP0001", APD_ADDR(nxp_i2c_desc) },
 #endif
 	{ }
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


