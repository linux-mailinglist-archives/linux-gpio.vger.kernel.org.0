Return-Path: <linux-gpio+bounces-36918-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJ4wEaoDB2okqwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36918-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 13:29:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD0054E768
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 13:29:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CC9930CEFE8
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 11:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B61478E26;
	Fri, 15 May 2026 11:05:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2136.outbound.protection.partner.outlook.cn [139.219.17.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6564D4779A9;
	Fri, 15 May 2026 11:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843104; cv=fail; b=cMH+oP1vnCqVOJvJX/dhH31W6hKxXVBER36SxB2uwalleICPvfGtcWgJIhNexmdd0pa1UAf/Puu3TTA1wFCeK8W7hX63nV+lSnm5AXl9pwop3AFoVQA2xpZHhY8LdabTYWvzcZijKsUQbqKuSLYiyOMYPYXzVqa4UVhOp+Hs3H8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843104; c=relaxed/simple;
	bh=p4ZYH+0OohpuCUrY6vYLdN72IG/nG2Pgaftu4Tk/w9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qu9i+bk25mxPmSJuh07rqJDF5xnG/hjjSW8XHEKGnn2Ey6jI4YksooYduUF4DxTRj035zKXuX4pQA7bc4fz91TkqkdztRzRmwnZ0J0L5A/Is1edcmOBto6MmymF3sijlpJP3VuWM8MVc8lOKCUnmOWUL7lGxrGmcu6GDdSROrG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com; spf=pass smtp.mailfrom=lecomputing.com; arc=fail smtp.client-ip=139.219.17.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QpU88ihkqCuIXrmy9LqvlX9KxSHExr/GNGWdyn6BM+Jkhd/GOyDNOmrd3kBeOwO+CYuA3lDHuM5i/qJ28YIsBvtcgZP+bKZ1uDtxeX+E8z+HUnXyQCUQ16h1xYoLOtl0Ev2BW4jeME2psdx9XfOvNplIx8UhX1qmFziyBcfWYEYHuaJ7lpW/f8mMW9eNdg4yTfTkJK/jCg0YI4hGX+PabbVFSgPtD7o/szRREdn/rBd+AKxLjfzUU8QJa9cBTZgGjd/5Tf1QwTLlrPh6pMFo4C+fS2emw/zto0cC6XV9QdVJ39htLhr2rWG6oYylNfNJakzkJjuV/VHZrpLmRm5PWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vp+0hczSbhrDxDNWqpy4Xke6OsxYMgSZtOn0wW/3ICg=;
 b=IouRrdNSaGLJnRHLLdf4PZar1jXp7ZCiucFLp4xnq3ptB/IM7TwY+f+k8p/zu8tggprbCFE0KtvoWePIWjk4Qf1vmCwszKwWLzkt6Ymnx1IxgwxBHReheO8B+5ZJKPstUn+Ryxkj1DbsypmUS3fbNOYwUZRm4kZlfPFP2y/7MpxSKLH8NJt8ETt/3TYva9d38RdrwiayuxQX3Br7IZ64n3GgLQ+qCJR33m08/uUYt1kNJQMrZ7HUqTbGG7p7DmyxU2uk0WBnRpKTOMhsXqxj0fzl0V+IZVxclqudI2hwhpgF/3E8E8uYZRQOQ1BAJEAaSZ62yApk+Ha7jDINTCzBEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lecomputing.com; dmarc=pass action=none
 header.from=lecomputing.com; dkim=pass header.d=lecomputing.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lecomputing.com;
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17) by BJSPR01MB0547.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.30; Fri, 15 May
 2026 11:03:43 +0000
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 ([fe80::1c61:86e3:3a75:155d]) by
 BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn ([fe80::1c61:86e3:3a75:155d%4])
 with mapi id 15.20.9818.023; Fri, 15 May 2026 11:03:43 +0000
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
Subject: [PATCH v2 3/3] i2c: designware: Add ACPI ID LECA0003 for LECARC SoCs
Date: Fri, 15 May 2026 19:03:20 +0800
Message-ID: <20260515110322.2883310-4-thomas_lin@lecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4a4fc651-740d-4aff-6230-08deb271a0d6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|18002099003|22082099003|921020|56012099003|38350700014|4143699003;
X-Microsoft-Antispam-Message-Info:
 aN1Zg6eP0lO1NEV2ZZIchSfI8HzEdc26JXQQ2QVtQxGN0RqxLEXaIslCD/uHeJDZ67Q45vLyNCqgPIozCH6MQlQTgjoGAtvud1cK8ojeVg576rIyfPro0lAXo3dW0iSCNxyMSEcvFUrjUqSblQt0IDtvj8aD3SGNRLWeJuMeKBgKFpWXy61qalErM+lfsfcy+SgWaFb9DrCl6C/rvCzUxL6FJJ+Uq3eGBqL0TyCFQHkMfcRY2vdmA98OqTo56zhtszi/YK29BOyxAzVzN7ZzV16O1ZkfHOh15ojvj2p2TR5lbbEiQTDalnUx4Env6IqvU7BVxjwY20f0RZoEPQgzTOmRxRkQD7/Z/a7Tqi5XCTKm22kmC9e1o0uLaroNYYzzO19vsf2tfm2RZRxKaKdua3B6WaqlCHrcT4Yr+aS7SeSzGV1HNL7CuMRHCqHhEeamDPA3qqSgdEhBXNzMpSNDs6njrMne9j55JhVyOk1q4DE36XH/1dht2zouaB/EGbq315Y/ehKrD8PZexki59Op6oaSRltdPCn4cW2vJeoxWZsHelr1DDWl1kBG2u4m3BIFkQQ+RXmBCGHxsvPKEOZhVQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(18002099003)(22082099003)(921020)(56012099003)(38350700014)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?a9o2yuur8IDx8rSyLQDp9YOCLsjtLS5JW8wf/e7/SZTQ9/YgM3V3mjE0TF85?=
 =?us-ascii?Q?4HIHPZnHeODydq4ecSo/qDWxgAwd/nFOg6UU//GmOSSrSXbWqC5thO3M23Z9?=
 =?us-ascii?Q?MGt0JwI+UUiKD8CZOdIBzOYMOcE2xQw4es0cvbvQXCpWIUrtWixZ2aanFk+o?=
 =?us-ascii?Q?OBkyhVoot2+PztylsxhZhaapdo8qC9EKJWE1I/LXsuKUJxf2/97MD/w85xc4?=
 =?us-ascii?Q?u6u5274noX4ArqOBLnS5d4+q+dg8m26hs+LbxXiw7nOtkCVW3oFC1x26iSpj?=
 =?us-ascii?Q?MqxclFFb70LhYJgwUqVopw2FKKlnWODQi2t0HFRK0L1xRCnFUTKXojg3IDM9?=
 =?us-ascii?Q?IM/bxK9CCB58LX77KtuZK7zvulfndZ6TajIqvltCut2gTGa5vDv0j5GXuJ4d?=
 =?us-ascii?Q?a1+RVZzi9sQYMdeZ6RA+xLOTokvY8gIpEPo6T58G+onREYJNWENAq4hChFrs?=
 =?us-ascii?Q?F3PWNRVZW9izPSd/Zncst9ZrktO1/eThVUm46Qcw8b0afQHUla+0+7WfLEvW?=
 =?us-ascii?Q?SnFw5W+ni2gKHAxAP07CXX/nn4lHu5kBNwFhJs/Q5ckXvms8M4fvMY1Tdg5r?=
 =?us-ascii?Q?yWbnYs+US9sQI6souD/8igd/093D2hjrdA3T71vURI9ed/DAaIcoscspA+zT?=
 =?us-ascii?Q?0nA0FtPIKVWL0AP06PEZK3ebP4VG37Z6bkFfdHT2vpN49R2PmpXgVMn2sxOE?=
 =?us-ascii?Q?M7la+GYuMIaxgyUNWGxCkafSG6ayOwmvrmPNIHHKQIAevHzKf9ueJP5dPlp1?=
 =?us-ascii?Q?4x7hT+FYu+Zx7Ut0ViusHH3M3ezHMRBW/fNEiFgYDiEJ0RB1zkljvdsjmtxz?=
 =?us-ascii?Q?NHgY3wke7bO5eu4aqX/bmCea2Z/vXPLuN2W83Z6Ph8DjCBFUZ/J2QAqwMz57?=
 =?us-ascii?Q?3f4pNntBlKURcaH6t7/VQeTyb/5wXZMoZQue9GWSC9mMCBJnxasetbVunU8M?=
 =?us-ascii?Q?S0A+OjotthAZgYKISaowDMt29mzYgKtn3WckRQk8GvYiZKmaQl8wzKKexTU4?=
 =?us-ascii?Q?4TEksvv8Gky2Cw8nD/G3/6CIAkqFpZOxkOSDbPYN8OH4ed/H67TnKL8ABUck?=
 =?us-ascii?Q?zrw4dFJjdgh+J+l8sxVKVwnab//XTrp3VbA8vmbQO3MYcRCjqVQJHcljaaQF?=
 =?us-ascii?Q?CqkVBqD+etXte5Z+1Fv+HclO0V2pjURS8WR9+R3hHgrt63CutYyAszufojaa?=
 =?us-ascii?Q?/Q2/6ptyYedRF4lgjBTE4mDHd0mlp1hgqOxiI1qDhXhJMpUgfdKuask/qb/Q?=
 =?us-ascii?Q?qKu1/21Dbd0OVwy1fdXv3l5hiVK0Zr+0FbvcLY1PaRemZoYEenGlZ22s89wb?=
 =?us-ascii?Q?pckQFBZn8ISQuvVKB+Tz+moQoO91ZzSfvU/pAvIaLnyACDttucLQWGEmEMJN?=
 =?us-ascii?Q?bNElyNkUQEo1PiOWTnRUqhtbRCBSuvLOnb+xaUvCWIbqaMkmGpxv41a9CfxT?=
 =?us-ascii?Q?pySurkpLdUoU5hwakcUh+sw3HLZp0Cnhs7W3x6oxO/0sH1qAza2CvoZ6/FqT?=
 =?us-ascii?Q?iFlqDwt35TUrs619Q21nnQRnvPGnns436C7XtRGPH1VMQEe1gO6gP9k5iAEG?=
 =?us-ascii?Q?xBLF7FaRXAuQ3zB82oNtSR8W2Rg7FCS3F3zzV0AO2N99vvYOBXf3xxts4vqa?=
 =?us-ascii?Q?DgDWkC5e5qUlrlsVj7eZAO5KmN0RwsJ+ILUAbce+BmcqRuF4POnH9xp4eKQG?=
 =?us-ascii?Q?OEUJtAEQf53Uj6L7s5sQHlfSOFsZ5SDJG/qH/czgUZnCLyxG2wb/qBkTPr1e?=
 =?us-ascii?Q?EG7L9yg60Fm3tnxcrvaMXi4X83sB9r8=3D?=
X-OriginatorOrg: lecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4fc651-740d-4aff-6230-08deb271a0d6
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 11:03:43.5398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3591a018-3909-4ea2-aee8-843d5abaed8d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WAudqNZH8PuPbRxRaGIGOrZbDQ3gwUQtJNEXfu53uP03Y3SvSbewDk5pvf5YgRjEy8qnFD4kUOIWHbZFqEpWWrZOcXhoeQ8b4bvZRvT79wM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0547
X-Rspamd-Queue-Id: 9CD0054E768
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
	TAGGED_FROM(0.00)[bounces-36918-lists,linux-gpio=lfdr.de];
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

Add ACPI ID "LECA0003" for LECARC SoCs that integrate the DesignWare I2C controller.

Also add corresponding ACPI description in acpi_apd.c.

Signed-off-by: Thomas Lin <thomas_lin@lecomputing.com>
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


