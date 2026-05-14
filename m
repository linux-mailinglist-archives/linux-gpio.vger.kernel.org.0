Return-Path: <linux-gpio+bounces-36799-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADDYLq05BWrVTQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36799-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 04:55:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FE953D345
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 04:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 57D1E3018D61
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 02:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569E5303A35;
	Thu, 14 May 2026 02:55:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2107.outbound.protection.partner.outlook.cn [139.219.146.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CAC2E7BB6;
	Thu, 14 May 2026 02:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778727336; cv=fail; b=H91OTeIf9ZswF1d8GJhykpoTnDl6QoRYZBMoIgCIiNVCV8fJrhZNVnzCUYXTcl1/22/ws0tSUHl/NGNg63jqtJMF7sJQPqYafiTPBTGyw43Vmyp1ktOSocbs8HACmJoe08xU4jiIk0Kthlkf1t44I4zsEusGkeCSuxnZphZF0JI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778727336; c=relaxed/simple;
	bh=mSspJtWC7piM3zpLY2zjJLnjdlxGddJaWHld2I/HirU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pxLkuYQfMB5sFx7uhL5D/jFmXPdAo0eGu64onphxER8Iupp7xFS2FCjn7Eak/lSxCLU06+UxrRuExFWu9YzuK2SONY0pG3CFl4lo6JsOG1IXHJMFgly0ykCxq5yznYtG6b3sIblEx7p3v8Iwhdr11BvibTU3idy8FsSS1+SW+Dc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com; spf=pass smtp.mailfrom=lecomputing.com; arc=fail smtp.client-ip=139.219.146.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EsEn7tUobO/Dji6yNNX5W8Q2jckRA2Uik+LSEWiOxQrgcoEZVWN6UYT0J2Zz7+yLsfRfTZCiVpsxnmEGUikYV/W3al7vQzZmhkCf/LSZMhpfEmPgzDz1enF7JfLyC3VdOVURqmDlLa7XDh6KiFcPpjRZ5Vib+hxdgxc2+jHkkiacTMx5Hki+TXxo8SkFQuV0dioj3t5HzWvoxI9wYbtegl7WSGCuU7VCKUIJEcl3KsIl7hW0W/iC/Q2tLt3/EIc/fiuDZHkCAn3wg4dOrbmVo2qe4kV8QXVfRaz3rRUrFZ5FKzjRt8G4KuleqnJDMsdhZ38h7rMg6IaonLwffqrcgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StNKpvhv91Mbo52jKH/5M5jx1FVcWU4emDZEDoGVXas=;
 b=YVhC8cjxH1c0wvCCM2pFhta85s1iOFTWfTuSrwn375h5aTQ7QXFQCrEbNgM4bmuuiY0QabIkfsPkESW6+pKv01CNN1yFZoEabBIofd4/9HDM+XS/3ou2bnT5rknTWBbqqaCgBQwSMSgQUpAmikwqt/V8Iq4XQ1auiJPunBmYT1LZK/Z7PZsvQDYFKRSFk3LiD9X5zX8sSgnp9AbIxeiPDrbo5WR0UEq3PIaKjEREVWJg9M0SouTGCY5zKwoEx2rf/8c0LQI6QhV03y1tTG7kKTRdVNsoF3FAWlpflBd1AE2nsgN1Q4iLar+geb5CK5h+PBe64wbV8bShELDHG1BqyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lecomputing.com; dmarc=pass action=none
 header.from=lecomputing.com; dkim=pass header.d=lecomputing.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lecomputing.com;
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17) by BJSPR01MB0562.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.25; Thu, 14 May
 2026 02:40:39 +0000
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 ([fe80::1c61:86e3:3a75:155d]) by
 BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn ([fe80::1c61:86e3:3a75:155d%4])
 with mapi id 15.20.9818.023; Thu, 14 May 2026 02:40:39 +0000
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
Subject: [PATCH 3/3] i2c: designware: Add LECARC ACPI ID
Date: Thu, 14 May 2026 10:40:12 +0800
Message-ID: <20260514024014.3376511-4-thomas_lin@lecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0ffaf2cf-ff83-4106-2e4b-08deb1622f9b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|56012099003|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	+Wa1HaELurdYbssDaruKY3bUqdCKCCGDA7f+NFVs/j6DORtTy75DvF8FqbeSHKMNn8vgD/l6J09qBbdVtUjzC8OoQMBJ615F0X9DHDbIbNm9Kf6ERUqrgn0IyQJOACGrEqRwAeVdX+uldePh4luWrq9WRCJWVA7hLCTzlhwi+vAq8eJcOUelGr+qrgVZynqq39B8+mGAUPyOGdeBDVa3sIIGkMPqgK4jTQxsab8YUDN+9tXDxNW09LcHcP4t1a90SyK5bSPK0kkF9amDnVBnN9tvB+rD5YQJ+cvW6hcstthRnN1mhYWAXkIclA4B2E/YoLhVL8hAWzYgNEeVEifsyM4MgCLhysnAUarQMedLAno9MIWVMJsvmNbvVL7Rp15Kvq9LxuzsoD1I0G5NtfisH8xLsUTTL7sayHzFFhSzjbBzH/1WXIxDq9yTMt9BuxlyWubITw6gwCbYw9gshk1UEhOd0cOZFU6iklXoyx16MbDexQW05IB3x1B6DFCRAwUMX2BB7zHmj30jRty60q46IzimGkaxvOTfBbEolPCQMsjVHLYWRWxpb5geHutZWV5nNX+/jlkdQlu6+6PpZ4KcLw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(56012099003)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v7kSDeFGFDdRn/A7O10gs+/xrDvjNGnvA3ep6y/40lgBc4a667eTvtEAB/BM?=
 =?us-ascii?Q?zsPoYRIcBCn2HWz/7nvNh8lN85IFgnul153DBTJgApMcxk0PScuHbBp/6vxa?=
 =?us-ascii?Q?A0RLnOS7IeYLL5DrMhK5RhLd1+Kmztak3G9/J4mtAkzNEpwz4A8kH+t/01Pi?=
 =?us-ascii?Q?wYgEAyJjaZUYkcOmckF+D3ZShuBljOwwN9eCFK+SPulqjJmbTVwCyEmZ/5fr?=
 =?us-ascii?Q?SUZpVhrICMQXGXXAGNvoGt5R2XcjBjDijs0LDYjLQTXrY2vGQbZ/ymiMrtQK?=
 =?us-ascii?Q?5hCT+/VmqbZuEYUqKHAkHpz4bGPettrL8A2txnBSyj799rPMxlB9FM18JK2v?=
 =?us-ascii?Q?qoxo+CGgC2j8fkGxwHhKsnameR1JKDubIk4sYVHa/o36W4dxNS0eGG+5ANfK?=
 =?us-ascii?Q?ZV0uh8ySQb8eQrhkOgaoS2FpgV/gpPUPDGZs1Auuieo5q7f+b9fbgw0locMh?=
 =?us-ascii?Q?qpA79q/duk5m+l++qPy+DbRpnSQ6ERy2gRGXFXnCNzR2ptq723AbhrUByYE/?=
 =?us-ascii?Q?wn01MYqIKYLrMlpqVFZPJ1r6vlD5G2f+26y8JbxdREnYgb3c6Ds0deJZTBbe?=
 =?us-ascii?Q?q/VfQkgHmhTGnRIvn3NW0CJbgkp/aoLLdVH1aB6id/dERCiscZts+qW4QzeK?=
 =?us-ascii?Q?SzZQNfJWZ4mboN9OnlVl9nbb5j1dWi55V9xVPXv45imny29VMVDPjt2WlGKp?=
 =?us-ascii?Q?4e+jgUA+SgmJW1toM/M83j+qfNkLzdh7WFPhJ0zD+8A7HlFYtsj6ChiDwjIy?=
 =?us-ascii?Q?lVpW7SXqSIsqsxNRa9nGjejefoNaPScF8kA18CvIBWaiK1Bp8QqExwoVwGsF?=
 =?us-ascii?Q?675pZEJPYUVCXBvQWPIbCEgR5NiM6kVK/lmyLU3bHD5QFEE7Zpg5ZFcm8hAJ?=
 =?us-ascii?Q?SdEEnA2unmd+Nsiyb9YD5mcwo3vNNTvfKGubLTChVKXGQVieKj8Kilwix3jz?=
 =?us-ascii?Q?dt8hErulIwGSbbg0qbPzYokDxk63c0L+GA6+Z1qZLOo8xqkDkmJOF4sJdq0c?=
 =?us-ascii?Q?0Hmw4A8PVtzFDG6AgeNi3Rvj0E5AbJsgXfJM0tU4VzjO3Jbe/iA49sv22p0a?=
 =?us-ascii?Q?ZfkKLOfx1VmXuaL76/BLCQBPtE+crjE12Khs9bG/JL75XJE394cASzawWrlj?=
 =?us-ascii?Q?UYwnWDGDBJPFXKW6bZhVjBOGZtD7rPs9HxKDbIfILwNdYoKxp9eaHRskwMHg?=
 =?us-ascii?Q?0Pe7gOXBryn0RY/X+n7Jc0yA6C1lS2jlbjmguH6zmBf6FE8QsBi8o9NVUAc+?=
 =?us-ascii?Q?/xTgOODhr4eYG15B2bpHJzESxir0kfwqhNhawLZUnvrHlUUajeJAxG0giEvz?=
 =?us-ascii?Q?QpOX7VTSfZd1np5A2B78GfP5Zd/xe6Uy17Pt++dX1l+zCWuDLct3INY8Q7qW?=
 =?us-ascii?Q?inocJSZ/CIh6/BoackuNiAlVMQJURrcPAuBdlSrEq1PQ9fRnTox3DL5x1nW4?=
 =?us-ascii?Q?IIBU/+X/ag+i6tHkvELWkPiSVVwgayQGWrPy51OUizJvJJ+UCIRG+IwH5PXK?=
 =?us-ascii?Q?0x1TZkomJhFsGG6ojsD4gWbB5xPo4LbBGV2vQFRIGagtFfGSF59e/tnp1gbr?=
 =?us-ascii?Q?baTfNJH6XN6PXTs9RAhp/bvtCwLEQAxvYnJv9S4TkdizdARHsUxfAucR1wKT?=
 =?us-ascii?Q?+TOCYAmVa/tFcZ1pYKXHsKg7smOvpcr13KnBO9WOn8Mh8tnbkXZdNApMhnFl?=
 =?us-ascii?Q?JU5yFfXZ2YVb48CwS8Ct1PnMlErv9sLHdCrUAr+8TNTqSIb2omm8QAnoHoM1?=
 =?us-ascii?Q?IeWN72h+/3ipGDr7sL7WP+Bj+Hv9DAc=3D?=
X-OriginatorOrg: lecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ffaf2cf-ff83-4106-2e4b-08deb1622f9b
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 02:40:39.8393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3591a018-3909-4ea2-aee8-843d5abaed8d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vikP8QiTT1lJEvxkVQk8nPNerb4aiIv6KUYJ+g32zbrCU0n73t5NCYMam01VxwqZ7CfkgC3bCs59MZwL4Tjf/X7kv/oE5g2vjxqcokdydQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0562
X-Rspamd-Queue-Id: 67FE953D345
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[lecomputing.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-36799-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	FROM_NEQ_ENVFROM(0.00)[thomas_lin@lecomputing.com,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,lecomputing.com:email,lecomputing.com:mid]
X-Rspamd-Action: no action

Add ACPI ID "LECA0003" for LECARC SoCs that integrate the DesignWare
I2C controller.

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


