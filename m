Return-Path: <linux-gpio+bounces-37182-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uH9iJMFuDWp9xQUAu9opvQ
	(envelope-from <linux-gpio+bounces-37182-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 10:20:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A16B58999E
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 10:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1CEFC30FD543
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 08:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7433AA187;
	Wed, 20 May 2026 08:13:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2125.outbound.protection.partner.outlook.cn [139.219.17.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36003A9612;
	Wed, 20 May 2026 08:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264806; cv=fail; b=mcJ5rHpVu5/whvNQJxlo8RRlQ2EJm/s1N+iTnMOUzEVIXyPf25ed4xrRvhSauFaafJwfMyAusQBwpFkhzE0WPDJBrIR/vwdMyeWKydBrv/8cweHRc9XYmcZhy4yqmeWkOPYZQmicKW6J88H/Kii7/tuzKFqK4v7yey6lgKrBWlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264806; c=relaxed/simple;
	bh=2oovYQUKGiofz7Go7C36dtuj74u8wB2gV72vMpqUJyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BZkkzB1E4qlTzBf1sv5w/SrpuzhjhcJL0AuayRmsJmf/DWnyHBrfDgh9O0Fv7MGf8lM0NQ5jlqYJLhPLDvq7hLcpELmAjtFIvoIRdnnU8CVngUmFyH2Hn7+YD77yMhoEfkg78ZUhl+5kd0sGtFveToD27ZqXTuIK4OhCouBiXqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com; spf=pass smtp.mailfrom=lecomputing.com; arc=fail smtp.client-ip=139.219.17.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H9KETAFvqGimEnlxi+Ke7GjiAqq/iVmDmPofDI2+t/LaHnmIO33Xa99wBXmb5uNFKDQ+H0MFzASJ8VKaFWVGWLvK1PvOruRwQxNlUMSEnG2Oa+kTHuwYZZMlGB3f7bibLxDBsw1p67M2+ad585yTiKJrkM2HyY6LxwK+/H7NCEbOPwn7Q0q+rqhwngIMsrl4uLacVAmy6n4a3lHaVz1a8JewsjD/FTJ+ML191b5COem9+AHvydIN6NER2w9tTdcaU2icS2ElSGKYhqpJp3xEXLxHX0v2aiuzwBp0vZyN/PGM9JxqBzfbTZDJDHzzlE9ub6EF/hhCcAeg8CU2KCu/rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjd3OSYGtHwVNS9U33PtcM86MKhtwyMqIQuD636SJVE=;
 b=nwf6PxfDR49xccn17pc+fQLj+9XEZOy0HmJ68SeNmo34G6S6NdNxjVs3yJE8W7/R1tzNAM0KIMiifUdx3UVmcm2LvOf9qCpFSWH946tIr9O1Cet8azr8Q6S180GlURXzMdnuIBtgDcMd34/4BwB9MIk97IxvOeUYcAmykUkWMSZMPn+3po0eUaNWFrDO6SZH37HAaKrEscmRuKkBJOc33g8H8YlA5atvI7ssH+KCnV2z3nd0RdDcGWbgcKxccWA/hhCm2gBBtcEvgjzWP0w6OmTFnUsxvi1FCnkglhkgN7xE3BoEichd3sZpQFPn5bU5i2UGCORJ1RZRRTOyptegwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lecomputing.com; dmarc=pass action=none
 header.from=lecomputing.com; dkim=pass header.d=lecomputing.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lecomputing.com;
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17) by BJSPR01MB0755.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.15; Wed, 20 May
 2026 08:11:56 +0000
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 ([fe80::1c61:86e3:3a75:155d]) by
 BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn ([fe80::1c61:86e3:3a75:155d%4])
 with mapi id 15.21.0025.023; Wed, 20 May 2026 08:11:56 +0000
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
Subject: [PATCH v4 3/3] i2c: designware: Add ACPI ID LECA0003 for LECARC SoCs
Date: Wed, 20 May 2026 16:11:36 +0800
Message-ID: <20260520081140.637637-4-thomas_lin@lecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2e48f1be-1c24-47e7-7da8-08deb6477598
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|56012099003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	OccCZbXwzWny/HJ2z2+4eljSSy3jPp0LOWXir6jIPluaNVqSBwvCKVJL3z5x20BGutEwsEv7ar4WC/eFvut1xxo42B1L/1t9IHcnT1CVu4/5n2lR+ZrR2DMV4cPDojgVS9yZkhTgRwpuiB0hoiqBpEP/6OWbHoRk91z6+RBx/lGIm6oanblLSdLIi0/CNvuvuwUu7lVnW/uamF+LV2Q78uaqSsFcic+PYJn1RoDsmOwVmN2ZYXSikfVTjaMqYsWOxJQTPg9ZDIUxThS6zQE+KzAYIXp/hR7+uY+7Ac9A1hhf7bP2mqVz9bErSrvIInLSjk2sz7ZPCdLB7h9xKBZRXbBHH1MiVybpJ4DIR6jdqSIOfqxjb8FbRKMIL5frULaFqp/7uPwciD4cAGJjzClNoUV8on8coi7R8kOITgWgWVoDj5WFyKeRWcMYXx1FLJvauQThITx8rRIbAXj2CHz6yBeSv5pMI28NFiib3DZmPDFHTLDzhZupx3vpvPTew7fOWH2WNLUWDCGH+GthwyJda/V8vlXE2Pc1oU+lGJiPkN3PEPU6G5CcoTTPWiV631akbmLVjRkmMmkzxwqJewfUng==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(56012099003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WqIzrvReRj1vnaI/XSeu+5rYy+ZW3HYDh5gH6AT0IJv2Fa+f9t3OHn5VseNu?=
 =?us-ascii?Q?N2HigP1J+62uMaxC/oXJi8ZDExDtYh+FAhiTaVe+OMKqfhQIXL3bJ5YTVfKf?=
 =?us-ascii?Q?GMQlSEskvN3/bTeKzEuWxV3UYol3X9ofFvUCDxSr/DlAWFGPUmkjlEvxGkRh?=
 =?us-ascii?Q?y+9dzTXiwqsgMPdnsiP6Rr1bt0p2Ish8dXp+w2Kgr74+bJRpGHZdvTdiMKez?=
 =?us-ascii?Q?ZHh8u5JAVeen3YPqGDqtDxvCIoom/CYmVVQoviJZDNh7q2w+W+737nsDkZWj?=
 =?us-ascii?Q?LbV7K3qVgWhKERSy0WMWqGooo1erONue/G6HKX3pci0/Q8VDWd1ePnztGPFM?=
 =?us-ascii?Q?K2M5RHCBwzgHA+CG6O2PUTgpqjFVPtHhf5+vv16SK+43bI5bdS+/ixohm+TC?=
 =?us-ascii?Q?tSBSaMqAA8lMaGdan64hS3Fl8O8pvHtQHdUVBhaCzTGp93LzibJKskgapETJ?=
 =?us-ascii?Q?QZkgIyjHDwf5RbrjK06SqMxsyZnWOZci5AdylVm7NV4EN1wqRtlpAQ2abZ2Q?=
 =?us-ascii?Q?D58WxFUjzrC20CRITxHVY8pIozW763ApkOxtozvDAPJsSpat6SH6/PX5MjXq?=
 =?us-ascii?Q?/1NJxjMXznuU8KgEGa5u/F3H8bQmhFOqTYt/8u2VXxFN6VNWhzsNE+wtRhBR?=
 =?us-ascii?Q?AZpmSaR2ESxoJMNJpAgBci0qRjLfedvSeltY/necp8WlSc9x5AB+GUIazsJn?=
 =?us-ascii?Q?zDC59RvqRtQjwPKWl6ksJHguAUiO4G8jhmcYcs62Nob4aUcqd4AF5xHABxTg?=
 =?us-ascii?Q?OFWgRECN3A58YnI6FIH2dYnFMe7pdCP7XwgS8eu7hlITfFl6n9xy7V9TksF3?=
 =?us-ascii?Q?MjvrOcsuyYbf8Pi0Uib2+X84FR9gm+wQKf2jzVLf78pbNf9WtvW6N0gO8Ksu?=
 =?us-ascii?Q?35kkYuRzYSsaIo0Humwz1ZITLHbmCru4+fLbpbkrIhm06zy+pj2lAvGpEhUJ?=
 =?us-ascii?Q?WIOv+MXjMXrWEs1mOzZ5bMNZ35xY9vX6awwKK5q2JZOD/BT6GEcwDiNLqpLJ?=
 =?us-ascii?Q?IeuQM+Xy3WaHyZjavY4gyXwL1PctC0dIYLYvOCLp8aVULJEZT2ejdJusvNfy?=
 =?us-ascii?Q?Od4WAkSA4LzgQtUwihRY6g9FXQlCO8H6WWyiUC9XA3h1YRHyIJFgPMOuB9+z?=
 =?us-ascii?Q?lfhsYJykqcIRvSdPsevfD4ssTP4cvP/niE7dmVx5j8tmJUMHpZB5P+s7g7bq?=
 =?us-ascii?Q?o95WdVREswbEMrWJWWm12icgvH6eIKNf0M0PlZY/drFspny/C4VH8ctSjohg?=
 =?us-ascii?Q?Vuq13OUqB3oaNY6AL4rdk5OPyY2bjpnF2jmHCoZQmFtepWZKv/NmLuP0Emnk?=
 =?us-ascii?Q?pb/TC7nH1qfB45TD5f11GzfWIhAqPI83pxZrfeRErkj4yv4kf00Dlticez0C?=
 =?us-ascii?Q?j5ONaUjBvr2k7ky5qzVw2Nh/956scEJHHWlj0Dtr3mefjAENylsIYdFphNQQ?=
 =?us-ascii?Q?c8koi47qlPoqF0Uojfg7Asun01wyWUqTkCwd+Ih0s/XtLx46/a92bK9urQSv?=
 =?us-ascii?Q?F9jCY6o8F9SBRLNhNwgPFS7+1OykKamSfa0WL5zW8xegAtl0l+zoshNpa6ZT?=
 =?us-ascii?Q?s3pz010ozUVnJTnfGbA0ZhEsz7Rqn0keX2+aO+ehhODC4uiQKa7yPxrL0zUx?=
 =?us-ascii?Q?I/o/xs9cY/YgOUxSeuDVzFcIDb9+YghSi0d4ulnz62qk0mqbudTaMGGqCXOQ?=
 =?us-ascii?Q?WbU/mEcZYG9grCfZI2wDK1uZrsswi74KlrIPSKbfdVY13eGZMWkWLslv3kOl?=
 =?us-ascii?Q?529fJji9n8yr61uK3ipDcbPi5Kf201g=3D?=
X-OriginatorOrg: lecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e48f1be-1c24-47e7-7da8-08deb6477598
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 08:11:56.6206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3591a018-3909-4ea2-aee8-843d5abaed8d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qavwynSL4xM8Dz5Sa6JKh3KoV+NohxKjiVAZdMR7hutX9Otz0WT7L9unVS5ikhmpnWpKLPyulOq31Jp6Od8GZ59WoSNu5TLaidF2ZTUJe88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0755
X-Spamd-Result: default: False [2.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[thomas_lin@lecomputing.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[lecomputing.com];
	TAGGED_FROM(0.00)[bounces-37182-lists,linux-gpio=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 1A16B58999E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add ACPI ID "LECA0003" for LECARC SoCs that integrate
the DesignWare I2C controller.
Also add corresponding ACPI description in acpi_apd.c.

Signed-off-by: Thomas Lin <thomas_lin@lecomputing.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
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


