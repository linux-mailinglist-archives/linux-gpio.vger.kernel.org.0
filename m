Return-Path: <linux-gpio+bounces-33290-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MP2yJDkMs2nURwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33290-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 19:55:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2E4277667
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 19:55:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C4F731FBAAF
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 18:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA57D4014B2;
	Thu, 12 Mar 2026 18:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="iyEjXZBV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011056.outbound.protection.outlook.com [40.107.208.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AD53FFADE;
	Thu, 12 Mar 2026 18:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773341415; cv=fail; b=Fhqegoqwv7B3/thZZ/yBiFYSIwmmVZ44tElQ+ggqWBOjULHP0S8b7+mv68TY+8e1H6AGFoYD2E5s7fUt+4s5mZUaGyhAU78QRL/XaifKjAk7Rt74eLxnmr/AEE2WkBnbmlMXB74p2ma7bGID5RxQR9q3ke9t1/U0HcmV2S6lsok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773341415; c=relaxed/simple;
	bh=YGAMufwsWgQFuNaTGHqJjCTQx8AgrPAbI6ZfBwi+8W4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sT7PhxCEspnjx6JCetR2DJxdca+kfUVzs648aSpTbJ8YWN0L3GBiaMaNhk0DkSRfuRh5TjKLjKRQNHwHfe4H0PknNTi6a97NFQ2ZVB0drrSTykfFvNAQ1CgO7gIpBO7jFsYk9qZOVf56QCN8dtgs04L5U4k5EFSTPjFo1I/zHAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=iyEjXZBV; arc=fail smtp.client-ip=40.107.208.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFsAI5Jb5L3mUJRW2sV9yMc9numamqPtFhuNPs8ow8xPGnLAuNj1lPScbSsejVH74VLazFSiEn8x2Ej/qW4mN5g+iE9I/aPgfrjQ0+76U7OKKqv6k55odKq8XPVkx9uv09FxhElqnFScBbVBdIuLuVw7/REIIOY0aFlZcXaycts9cuIS7vA3RdgI/pi2RYwDNKOg4ST2mKVbuIoPSYaJ5/SaWvi/26f0iIAAdsVCnR9RIfFQPYJoiLp/tGZ+4ZOUn7fg6QbxSAEwFKEoQlDDDFqbYaVnxhNW1Sq1/dqIaz6jgbNfnXW6p6XqYVCkPHNLU2NQEy9Tqs901cUqcpedtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=laOvCfLAi1HzWDEwzmcRorckvmhKXrYhhW9NlpJ4EQM=;
 b=V8KAsOm8SKvqi9WfYpk9tmQwA6UIuE6dgMlCkKGCH4SDJSAR/fJrMNXw+hg5dknMO/LyteATBj0ai10zWtmkTo/gVfh2Z2k0wYsy8+qy8KGq4xhnaITzm6FNvFFX18m1r7urGpP+f4U4JLzcoA6rF9eHb1HTuq60ra4JyTkWRvbhViBot/lxx/IBid2LtAoQFoLeoNPo062Rk6TdAz6xVx0fLunOs7am76VmLxD7O2uHwgJAfqjyxbiUmiHt3ooyBkqFmSWZJT8oU/BjYnrVqx12G/QWxLXiY27X+bo1XNxdJ93LWqOJCb6pSFnh5etN+GbRcPnEZKDYduDu7YVf4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=tipi-net.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=laOvCfLAi1HzWDEwzmcRorckvmhKXrYhhW9NlpJ4EQM=;
 b=iyEjXZBV6szk5PtFXWpTt75ovJTnY8l8U2ZnTwuCL8qC2UtLLSYbNvnzhHKWG5D/07zsiNkrWuHYPNfehTXlhxsBN4T+x+G9Zjkc53Yhtlg4hMJIaFas+/RGWfht2V+3llC67zPxW7FvGvfGtquH4V0bUTfVdBSHyNEPabc1jtg=
Received: from CH0PR03CA0286.namprd03.prod.outlook.com (2603:10b6:610:e6::21)
 by CYXPR10MB7973.namprd10.prod.outlook.com (2603:10b6:930:dd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 18:50:09 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:e6:cafe::e8) by CH0PR03CA0286.outlook.office365.com
 (2603:10b6:610:e6::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.28 via Frontend Transport; Thu,
 12 Mar 2026 18:49:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 18:50:07 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 13:50:04 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 13:50:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 13:50:04 -0500
Received: from LTPW0EX92E.dhcp.ti.com ([10.249.135.133])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62CIn54s2829533;
	Thu, 12 Mar 2026 13:49:59 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <lee@kernel.org>, <linusw@kernel.org>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <niranjan.hy@ti.com>,
	<nb@tipi-net.de>, <navada@ti.com>, <v-hampiholi@ti.com>, <sandeepk@ti.com>,
	<baojun.xu@ti.com>, <shenghao-ding@ti.com>
Subject: [PATCH v1 8/8] ASoC: pcm6240: remove support for taac5x1x family
Date: Fri, 13 Mar 2026 00:18:33 +0530
Message-ID: <20260312184833.263-9-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260312184833.263-1-niranjan.hy@ti.com>
References: <20260312184833.263-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|CYXPR10MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: 98ab4eb4-4608-4551-0202-08de80682e22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kzcE6pRnRFRrcI4AUHUnvG/BF8Rh4oJd8PuYOwMXKycup8WzO3EU/iqnLft2qBksLk4QpOsMd6rPP3CeXvZuP+uXCf46isbTaQguwK1h7xk+4QknIjVsbtRfOoPoI1Cocb2kn9uJbMsjnurBmwS0mDsPzoiZwkva3J9KxX5ZVxG8/rV+dbxefxE7Lpq3WNr+yvm4iuiuN3Z7mxTWM56J4gY2ckTJYDiRuZSH5cIPe08aoz4C6Q6o5sbSoj0uen9eUxueIrOZlH+uxy7QlpYGhlClJWm3MdvAaAIl1khi28zsFgrLstt+VWAadnIShzzj9/i+z0dvblYgVzaXbZoVZzBotAnSxihnW1YcNOoHshzO20bfjwKFLjsZyOh6RME1CCgx/RhKaLec2vWU2OWq/y+hi1iq2y44BrrtPkAAOTQ65Aa6210U51tY9Hb49xW41IlON8z3eK8fhHskmUtWKXVElkd6P4R/qLV6Har3a0aOq4T9bpCsQ2X3nKWHKYTFeRaKWUfdpcoref160GC6UQMfGh1MNiHXrRojsX6zbCD1ytFkLoqGn7EASnf4CDBluavXO6cP2dGudwKR5IqdLPEHj1s/Am1Xi1flRy63ggcePS91V5R+tKECon2O8+J7pKU+TESrqIrI0nP+nk4538mrIVZd4mH3s3AnS8u90uy1UPXCnn9z3ab/neo7W03YPmAYR+kxZkCUMotb9dx37jXzoWZbHICCrIXTmDdj0t3obEepkaxOb+Qirjo4KZkcg/UD7WdVipKCV16XWqzgBg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eanXGPj8/DaLIQPPT22rtrC1r/UgZPKw6tovT/y5cve+cwHQAHmJ4gj38BrGQOn/Zk3fO98AYIxQX6J2w7Ym12TqqBSMewxHstkxeOwe04btqPJ3wloe5DPMe2WhG3ii9MRr0MQrgCWz/tnMzYPFSszPlo6CEac0J5hWvSJT/VZH1EUObN/52CB3y74WVic/KFCV6lSo3vJ3DPWkkAw/Rsa/pmE0IIeMgUf0xFNzJ5kFLQyk3guZ4vya4bdvlWDURZfUtHZsoLSXJzpBocujzt/w8H4kLr/weyyxX/VwwLC+QExUom8fRhoznIZu2XB3KigUtpwWzS6ZVgdSSwaKxSO7yGVGFkHIR6BiKgL/SRerGNHqB62CyoAk0OGym4Q2n/l2+Krx2tffqGOkoaCpcqaLA8wOX2baVCuVYakk6LwruUdkuSnIZ84SawFcBflQ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 18:50:07.1074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ab4eb4-4608-4551-0202-08de80682e22
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7973
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,ti.com,tipi-net.de];
	TAGGED_FROM(0.00)[bounces-33290-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niranjan.hy@ti.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:dkim,ti.com:email,ti.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EE2E4277667
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove TAC5X1X support from the legacy pcm6240 codec driver. The TAC5X1X
family now uses a dedicated MFD-based driver for better code organization
and maintainability.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 sound/soc/codecs/pcm6240.c | 126 +------------------------------------
 sound/soc/codecs/pcm6240.h |   4 --
 2 files changed, 3 insertions(+), 127 deletions(-)

diff --git a/sound/soc/codecs/pcm6240.c b/sound/soc/codecs/pcm6240.c
index 78b21fbfad50..b1902b9e9f32 100644
--- a/sound/soc/codecs/pcm6240.c
+++ b/sound/soc/codecs/pcm6240.c
@@ -44,10 +44,6 @@ static const struct i2c_device_id pcmdevice_i2c_id[] = {
 	{ "pcmd3140", PCMD3140 },
 	{ "pcmd3180", PCMD3180 },
 	{ "pcmd512x", PCMD512X },
-	{ "taa5212",  TAA5212  },
-	{ "taa5412",  TAA5412  },
-	{ "tad5212",  TAD5212  },
-	{ "tad5412",  TAD5412  },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, pcmdevice_i2c_id);
@@ -442,60 +438,6 @@ static const struct pcmdevice_mixer_control pcmd3180_fine_gain_ctl[] = {
 	}
 };
 
-static const struct pcmdevice_mixer_control taa5412_digi_vol_ctl[] = {
-	{
-		.shift = 0,
-		.reg = TAA5412_REG_CH1_DIGITAL_VOLUME,
-		.max = 0xff,
-		.invert = 0,
-	},
-	{
-		.shift = 0,
-		.reg = TAA5412_REG_CH2_DIGITAL_VOLUME,
-		.max = 0xff,
-		.invert = 0,
-	},
-	{
-		.shift = 0,
-		.reg = TAA5412_REG_CH3_DIGITAL_VOLUME,
-		.max = 0xff,
-		.invert = 0,
-	},
-	{
-		.shift = 0,
-		.reg = TAA5412_REG_CH4_DIGITAL_VOLUME,
-		.max = 0xff,
-		.invert = 0,
-	}
-};
-
-static const struct pcmdevice_mixer_control taa5412_fine_gain_ctl[] = {
-	{
-		.shift = 4,
-		.reg = TAA5412_REG_CH1_FINE_GAIN,
-		.max = 0xf,
-		.invert = 0,
-	},
-	{
-		.shift = 4,
-		.reg = TAA5412_REG_CH2_FINE_GAIN,
-		.max = 0xf,
-		.invert = 0,
-	},
-	{
-		.shift = 4,
-		.reg = TAA5412_REG_CH3_FINE_GAIN,
-		.max = 0xf,
-		.invert = 4,
-	},
-	{
-		.shift = 0,
-		.reg = TAA5412_REG_CH4_FINE_GAIN,
-		.max = 0xf,
-		.invert = 4,
-	}
-};
-
 static const DECLARE_TLV_DB_MINMAX_MUTE(pcmd3140_dig_gain_tlv,
 	-10000, 2700);
 static const DECLARE_TLV_DB_MINMAX_MUTE(pcm1690_fine_dig_gain_tlv,
@@ -510,9 +452,7 @@ static const DECLARE_TLV_DB_LINEAR(adc5120_chgain_tlv, 0, 4200);
 static const DECLARE_TLV_DB_MINMAX_MUTE(pcm6260_fgain_tlv,
 	-10000, 2700);
 static const DECLARE_TLV_DB_LINEAR(pcm6260_chgain_tlv, 0, 4200);
-static const DECLARE_TLV_DB_MINMAX_MUTE(taa5412_dig_vol_tlv,
-	-8050, 4700);
-static const DECLARE_TLV_DB_LINEAR(taa5412_fine_gain_tlv,
+static const DECLARE_TLV_DB_LINEAR(pcmd31x0_fine_gain_tlv,
 	-80, 70);
 
 static int pcmdev_change_dev(struct pcmdevice_priv *pcm_priv,
@@ -981,7 +921,7 @@ static const struct pcmdev_ctrl_info pcmdev_gain_ctl_info[][2] = {
 	// PCMD3140
 	{
 		{
-			.gain = taa5412_fine_gain_tlv,
+			.gain = pcmd31x0_fine_gain_tlv,
 			.pcmdev_ctrl = pcmd3140_fine_gain_ctl,
 			.ctrl_array_size = ARRAY_SIZE(pcmd3140_fine_gain_ctl),
 			.get = pcmdevice_get_volsw,
@@ -1000,7 +940,7 @@ static const struct pcmdev_ctrl_info pcmdev_gain_ctl_info[][2] = {
 	// PCMD3180
 	{
 		{
-			.gain = taa5412_fine_gain_tlv,
+			.gain = pcmd31x0_fine_gain_tlv,
 			.pcmdev_ctrl = pcmd3180_fine_gain_ctl,
 			.ctrl_array_size = ARRAY_SIZE(pcmd3180_fine_gain_ctl),
 			.get = pcmdevice_get_volsw,
@@ -1025,62 +965,6 @@ static const struct pcmdev_ctrl_info pcmdev_gain_ctl_info[][2] = {
 			.ctrl_array_size = 0,
 		},
 	},
-	// TAA5212
-	{
-		{
-			.gain = taa5412_fine_gain_tlv,
-			.pcmdev_ctrl = taa5412_fine_gain_ctl,
-			.ctrl_array_size = ARRAY_SIZE(taa5412_fine_gain_ctl),
-			.get = pcmdevice_get_volsw,
-			.put = pcmdevice_put_volsw,
-			.pcmdev_ctrl_name_id = 2,
-		},
-		{
-			.gain = taa5412_dig_vol_tlv,
-			.pcmdev_ctrl = taa5412_digi_vol_ctl,
-			.ctrl_array_size = ARRAY_SIZE(taa5412_digi_vol_ctl),
-			.get = pcmdevice_get_volsw,
-			.put = pcmdevice_put_volsw,
-			.pcmdev_ctrl_name_id = 1,
-		},
-	},
-	// TAA5412
-	{
-		{
-			.gain = taa5412_fine_gain_tlv,
-			.pcmdev_ctrl = taa5412_fine_gain_ctl,
-			.ctrl_array_size = ARRAY_SIZE(taa5412_fine_gain_ctl),
-			.get = pcmdevice_get_volsw,
-			.put = pcmdevice_put_volsw,
-			.pcmdev_ctrl_name_id = 2,
-		},
-		{
-			.gain = taa5412_dig_vol_tlv,
-			.pcmdev_ctrl = taa5412_digi_vol_ctl,
-			.ctrl_array_size = ARRAY_SIZE(taa5412_digi_vol_ctl),
-			.get = pcmdevice_get_volsw,
-			.put = pcmdevice_put_volsw,
-			.pcmdev_ctrl_name_id = 1,
-		},
-	},
-	// TAD5212
-	{
-		{
-			.ctrl_array_size = 0,
-		},
-		{
-			.ctrl_array_size = 0,
-		},
-	},
-	// TAD5412
-	{
-		{
-			.ctrl_array_size = 0,
-		},
-		{
-			.ctrl_array_size = 0,
-		},
-	},
 };
 
 static int pcmdev_dev_bulk_write(struct pcmdevice_priv *pcm_dev,
@@ -1998,10 +1882,6 @@ static const struct of_device_id pcmdevice_of_match[] = {
 	{ .compatible = "ti,pcmd3140" },
 	{ .compatible = "ti,pcmd3180" },
 	{ .compatible = "ti,pcmd512x" },
-	{ .compatible = "ti,taa5212"  },
-	{ .compatible = "ti,taa5412"  },
-	{ .compatible = "ti,tad5212"  },
-	{ .compatible = "ti,tad5412"  },
 	{},
 };
 MODULE_DEVICE_TABLE(of, pcmdevice_of_match);
diff --git a/sound/soc/codecs/pcm6240.h b/sound/soc/codecs/pcm6240.h
index 2d8f9e798139..86b1ef734a3d 100644
--- a/sound/soc/codecs/pcm6240.h
+++ b/sound/soc/codecs/pcm6240.h
@@ -33,10 +33,6 @@ enum pcm_device {
 	PCMD3140,
 	PCMD3180,
 	PCMD512X,
-	TAA5212,
-	TAA5412,
-	TAD5212,
-	TAD5412,
 	MAX_DEVICE,
 };
 
-- 
2.34.1


