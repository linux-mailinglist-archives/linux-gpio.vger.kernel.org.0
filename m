Return-Path: <linux-gpio+bounces-37008-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLPVGweUCmrL3gQAu9opvQ
	(envelope-from <linux-gpio+bounces-37008-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 06:22:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B70C5565A1C
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 06:22:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BE7013002B7F
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 04:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5758380FEC;
	Mon, 18 May 2026 04:22:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2120.outbound.protection.partner.outlook.cn [139.219.146.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF3C13DBA0;
	Mon, 18 May 2026 04:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779078143; cv=fail; b=P7x+Adu9JewcGw2KnzA45nCOK7CBo0CggHOZ8gu6mTAt8MxmCgi3ZMLGQ8577dJ6aNwiavktVdl5YdSFpBI9eCUWMzVor/a3chw+z+S8byDofZFBSoKQVjLV4jH8JZ71KXSTl/Ic6NJyPfprAidDFM9HwAMi9H1btPD7irBcVW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779078143; c=relaxed/simple;
	bh=8qWUD2hZiDOcIf4az2uAuMKDe0+Ze7o9ZjmnEJ1u5W0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U7KpnAycxGpkyHanjAvgt90ej8UATDoLBA5fWIVH89ZAKe8h8ts8SFmW4pV5xXSGt0guRIFkAeCE1jEHXepdCZEkgB3Bp5NTykMYWB/cvTwFmNGGYuUtFV+vJR6XZ6pSsjgElYWH6/q0Odv1vuKKihx3aXSy9P71oCLDwKUOw3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com; spf=pass smtp.mailfrom=lecomputing.com; arc=fail smtp.client-ip=139.219.146.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0eXpx8z76pR+NOWVorcuxwtgfGtfzgBmRQtUIMIcYDnNc8+5J5bOapC2e8VJYDy1Fia5jKbg5ulV76IaPuwhsHWryM03ROG6DenIq21iVp8X3Xdh5bAPGLQEd3Q0GzmlETZol1m49bmB7hAFGeuvygc42ywq4BgD+ZKaYa4CHc0ZCR5jAs8pTxebfDPvkNRZAQLKRTF+HNynqZSKS6uVEblK2e+J/JuuBvzZuu+TfbMs/IVIfpXeUhVpYwS8b7ved68BTmlmx63qZqUxad9jCeNuxlPCp8jJpos7dtkFUw+xQvM0JMWLXK8RmL1GHgSGAqwWFiGV+mPTGjZzyS0UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWwss9zTRwKn12EBNQuGPPPMDpNJXKHJGRmmSIjQaxQ=;
 b=eMc+xxEj2FsQQ2SvZUb+NuemEZb6P/hXhMo7g8JyofSpf2/T2iSuZOv0TYgpVG//3/xE0pXoEeP79t/79JbPKH/ZlYfpujV8L7ZVWmJ++NAPjxO5HkwexugxNqT9oRD4a5G1HRY07iz1Rermy36XGggtwGyuAQ1hS7o1YCdNv0OS+eZbwPfb3p+mtjxl9PTbRD967OTabubnPIdq9zhpwL/mfIvcyw+V0/SotOX8Y+YiM3jVsA7ZP6U1aobeEOIYZ7Hr2AEceSqax/GTHUZZZ+cSutW3tS+SgUpyTi9wUOapHwZRf5gclhjw2y/MKMU9rKHXtFzgDv6Us+ysRyM2sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lecomputing.com; dmarc=pass action=none
 header.from=lecomputing.com; dkim=pass header.d=lecomputing.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lecomputing.com;
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1f::17) by BJSPR01MB0548.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:10::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 02:49:50 +0000
Received: from BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
 ([fe80::1c61:86e3:3a75:155d]) by
 BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn ([fe80::1c61:86e3:3a75:155d%4])
 with mapi id 15.20.9818.023; Mon, 18 May 2026 02:49:50 +0000
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
Subject: [PATCH v3 1/3] gpio: dwapb: Add ACPI ID LECA0001 for LECARC SoCs
Date: Mon, 18 May 2026 10:49:34 +0800
Message-ID: <20260518024937.453714-2-thomas_lin@lecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: d6877251-6769-4785-71d5-08deb4882121
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|22082099003|18002099003|56012099003|921020|38350700014|4143699003;
X-Microsoft-Antispam-Message-Info:
	cHSZSxLeLArUMckLCehkrVTAQCYvd8k2o2vnZ8gcAK7iM9fwFaiTXVx3cWydf3hnEAnuLJxqb4MrUiXd0XswlJe47o9v6BaBXt3lPhJQRjvakvRMCJ+H+SuS4lF1SYc8wNFjZF3t3SAnsSrAsl/JRMN5BgQNp1SIPdwVppA9FouotvHRZ4xrKqyvzMqaeP8hcS3szIelAMq6OJPly4CjkHP52GdFVkLScJPUymRuHg6XX98jq0ug6bN4l3jrfImhE6YO4UtHGFbsG3rfMdIVdIUluc9PQ2bT01lQ30MSpVygKGqrghfUt/DaXb9BW1T2+htZNzKvaFrKVBcytxHrfurLFR09Evr4g10PJp88jhgffkxjBrrFsrwfpdGt8PTZ4eGZybrxMC/GjFM/JZ3yjaFjUdWye3C5nIzNUL1sKI5cR+RVDix9L+BcswBE4V61/GdDSGxvU8ea4Ny+wA8/SHcIwOAoA0AH1Wv//7D9vDDcSrvSbsY37xq5pizakhAbg9Pbd/cKUdPuG+lNOYUssjPWQ4aAXYljgVpwhS2WNTE+9apohBjC7dZnPnMvpSSB/N44KmY9H1CAnrESA88I9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(22082099003)(18002099003)(56012099003)(921020)(38350700014)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bE72RGXcwFCoFBKyh1lzejUXfMMoAp/dD3a32ulBQsV8YlCaTr3MOJ4zbxv/?=
 =?us-ascii?Q?8FuakyVY1nf/4PDRWJktixj2wO1bc3QVVZvL27vKrcLgLm598zI7NhsfCJer?=
 =?us-ascii?Q?x3p/BTIy+ZrHs8NJ7mVWWGZcysBH3CLm/QyYyLpQWJYcMJhX7KVqgjUMF/ee?=
 =?us-ascii?Q?wdzADBwIhN5L/VzENpWm3cFYNbjW3tG8ydTmAE/PdX6hr3DDefkoqiSb7mxK?=
 =?us-ascii?Q?+TL9JHPdYTovjZ2AMXpMTrQIiSR+3le9/mNMkGmotf6rDR+StSL3adgXfgtd?=
 =?us-ascii?Q?M7babITK+Bz3XXIIJS6aLVYWomRUz7kfLxtU2IKwOZ0eF7eX6hoqX04bz0On?=
 =?us-ascii?Q?/Giz2syiZgQq++d0tEoS80UP/ozGyiN7x1ibpoK6bP0MM8JxyRXojemwYeXO?=
 =?us-ascii?Q?GPY08HGgGoYmNKLIYkyWEqPv+F2z+yGrfJ3jTSJyGnhWTA18VW1V81YkUgvH?=
 =?us-ascii?Q?3utrtFqIxpouEeuSwjoFrj58bjI4VWIWgKWS/wO2B7e2o9MaJjS2Yet7bku1?=
 =?us-ascii?Q?PlY82rrWh9+Tnaxq8n0Qpms/WtcHbwYWVGmawxp+mkIlknq467BN7Ev1+MCF?=
 =?us-ascii?Q?QWLubM856bjgCkTrxcJX0s7M1IW2sziKqOhScM+c4UuS7tHZ27RJ9SeLMZq1?=
 =?us-ascii?Q?4mtnwDFauqOQnU+r7498h6b6Zklcs7MP1wgs5CpCut2gfubEWKxTJAfxNmMN?=
 =?us-ascii?Q?Uf3qxg1DcjIxJ3AiQJp3vEygTfZn4HBp5V+j9hnqZU3T94mVZWD27PHZgazv?=
 =?us-ascii?Q?NuDRnbxat9U9Tr0Eti1v1tB/73wsJKg1GL9KIs8D8mUlqr2Ty1WE5KGxAdSK?=
 =?us-ascii?Q?1zgIzCDuLLgrI1LzFL1dyAvJNd/Hy37BN5k5cRnP2hWnwH9z+vfyFyxQXEt4?=
 =?us-ascii?Q?6W6sFstSIuwNgu+BO1s6EIluR6rPEQn2lFnEgAzQWJu9kRZPz5WI9CsFm3jK?=
 =?us-ascii?Q?/qdufwDaeUsIzjGlFyp98Z99fDeWGPTsc2YdA/ErJnshHkpmwUCEs0pSB/Kv?=
 =?us-ascii?Q?szRmyvBRC47OmJCFi0QBfhk+WDyiKxKCwRXoZH7WLXZBaLJrpzu7X0hwT/oh?=
 =?us-ascii?Q?IUgoQ/s7Eh3ogi1CiD9nHY/rRyXC0S1wYM5d8W2HAZLjuvbxbMqsA2MYrEmL?=
 =?us-ascii?Q?pVCCoXHheEGcvAXsDltuk1f+N/7Fd2m2xziYKFoxBmTIKoXj1FsHJ4sdlAgp?=
 =?us-ascii?Q?nvM5Bil7erqoTFPy+KQt5lFkvnaBgGDl3NTLAwWyavx3u/jxq3fJxER1HUqE?=
 =?us-ascii?Q?BYjREZXzdD6EBd21fC7JvUFIZxJ/k9fCkHl3I0MmDmD9vxlyI4SCuVQMGoMx?=
 =?us-ascii?Q?UyFFgbkH+Rn6XxCqXb+dRUffTBARcL11gDRnNrqLSJSDOBaqWlD7Vep0uxPR?=
 =?us-ascii?Q?56hsvZC9Wd1xy58+bRTtJD3Qpe7PfGLyqs/eTURggtSaVnooX+suYBFw9/p2?=
 =?us-ascii?Q?9NzT+3x01nIgZSwWElhBIzM1PAChmGz9U63pa81kjeFmILCz+5IRNXoutn1p?=
 =?us-ascii?Q?2NR6dxp4VcGUqDHN+2ENcm9V2WBbKDbxTI8v3gDxgnkVLmlYkRT4eqAOILM+?=
 =?us-ascii?Q?EeEq2QtO9TyBCUal15WaKw1eBRaMELHypTBSkJX3MWn8zpIDSa+ePUzHI6/p?=
 =?us-ascii?Q?pQ4xHBUv+QtuvGZsW/mnp75XzaH9rSJzL2hslu64ej4Jb28Xa7b2TCoNIlUi?=
 =?us-ascii?Q?6pPKoioqjWyoYJhfCNJTTgrlzmM+zF0ZqLLhNP/i7trcJe4eX5COnj//Ppyk?=
 =?us-ascii?Q?ujY+an59VA4BENWdKW8ZI/vOoNlNZrk=3D?=
X-OriginatorOrg: lecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6877251-6769-4785-71d5-08deb4882121
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0707.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 02:49:50.2510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3591a018-3909-4ea2-aee8-843d5abaed8d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NVjtGRnXc7uUl3aqkPqdfihngfqhQBhWvdqMIF5MhlcQk3LMlVq1d/+OhTsPrQKUlqV2ekKZ7vRI2bqrzBYurq/Zg0ZwK4yzbODviui/kMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0548
X-Rspamd-Queue-Id: B70C5565A1C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[lecomputing.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-37008-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[thomas_lin@lecomputing.com,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,lecomputing.com:email,lecomputing.com:mid]
X-Rspamd-Action: no action

Add ACPI ID "LECA0001" for LECARC SoCs that use the DesignWare
GPIO controller with V1 register offsets.

Signed-off-by: Thomas Lin <thomas_lin@lecomputing.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-dwapb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 15cebc8b5d66..c1f3d83a67c1 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -694,6 +694,7 @@ static const struct acpi_device_id dwapb_acpi_match[] = {
 	{"APMC0D07", GPIO_REG_OFFSET_V1},
 	{"APMC0D81", GPIO_REG_OFFSET_V2},
 	{"FUJI200A", GPIO_REG_OFFSET_V1},
+	{"LECA0001", GPIO_REG_OFFSET_V1},
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, dwapb_acpi_match);
-- 
2.43.0


