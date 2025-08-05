Return-Path: <linux-gpio+bounces-24013-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 131DBB1B11F
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Aug 2025 11:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C19953BEB46
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Aug 2025 09:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65CAB25F97D;
	Tue,  5 Aug 2025 09:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="Bd0Ihsxg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013033.outbound.protection.outlook.com [40.107.162.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FFE25F96B;
	Tue,  5 Aug 2025 09:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754386422; cv=fail; b=RGp16HcmOX5c2I21ZOfgt3tGcRlj8x6cokoDlKInXgO33IjOREY6joA/J9lYSSIIuk+ptyQsCIIq+zq9bt4MktqSv+eeDyStdh0SLae7tL0q940FKD52NTWcOq1voskrVgMRFVXBxAlJ6Ncaw6F9tOqV6+POEjqBsa+l75U1LV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754386422; c=relaxed/simple;
	bh=LFJmHeaFttKsTMs2m2tTWSq2M1sk7MM5PIVK2L6Z4hM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qYLXlt3d/37dCFUIk4ZOMCFUeFORWTyXTdyvc4L7SD8CO6TGru8kKx22exd7J6FrDZqjYNsayhQt2rS7wfcoNsDa3stoFEh3Xr8fsTGfB+wUWPyzIQyeTnpD2PQgOdGat6TfW5nfjaypj3P7onu4MJ0Xf7GwtlPhz3EIFu8v8+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=Bd0Ihsxg; arc=fail smtp.client-ip=40.107.162.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PjBxE+HPn/BbfisSEldCqy+ZgrKYbflkPIj3Uqc3WnBySu2ugBfcTmsGkgYnxAvLI5PWRl4XDBvQEKWEEdomL23L8yaNXY/wvmSsnohCQicU20mK2fi+ftE8eRKfDQpW1bxqqg/Awbz0YnBRgaJenH5qJoKmSwYIRguj6eQW0fod2aDWAjtjNYXsRaxExkU6oe6LjXqu7VRNXqUC11Qj/4DTHU7GW5+2oDIRHuvFelAYAsJpcfcSx/arl40jX/TVOsZ3xuuoCgQnKr9aeZ0ixntrYB+z4RfiJrlWhrE55spnwxczfcqVCjMiMg1+uptrVPrKtmfdJu4bEOkXSB4Mcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJasvQXqAeIQoUNmCnM+AgmGdBN0duLsOVuX8cKh8dY=;
 b=sVgQPbIDGz/hXSxkHCItUywdxdko2oOhBQdU0s2YBt4vCOpjj+W/uD/wkuMLicj1SvrW6LM4Pb04p34/nNvZsLefg1lupPP9g00wpnxt0d8QS86g73vroJDCMW5GMmU03n0gYVmUryx5rJA06TF4loOH3jcc4ki4ZN+iW+xVesmQo1CHsYaXG4cQ50bbXAfk2S2OfDzVMMWbo1BgvbxsUmQbFCXJaUMx56U6AEIOleAkhFPDMHUpb457u8eYekVc0Gd5YplHEJRqduCo2hbc+vVZQMkhqLie4eEhyOgfYHRn7NDXa1y/edpc9O1AcV6SsM0SaA/Z6DUB0A8sxzzuXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJasvQXqAeIQoUNmCnM+AgmGdBN0duLsOVuX8cKh8dY=;
 b=Bd0IhsxgrltC0r1LK0CNaPff5yrnFBigm9asZ+9QpiRggpOHa75L0q+cSaGhCkknZx1ViguEOmSV6l3I4ARMeF0fZLj/hkBm4h/InwZJDsjsaJfN7I//tXDE+1vIftPOA6qsSoPHW6GOu0dFZvsbjoC3bPtY3lGWm0QgAFUmq4g=
Received: from CWLP123CA0022.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:56::34)
 by DB9PR02MB7997.eurprd02.prod.outlook.com (2603:10a6:10:373::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 09:33:36 +0000
Received: from AM3PEPF0000A790.eurprd04.prod.outlook.com
 (2603:10a6:401:56:cafe::d3) by CWLP123CA0022.outlook.office365.com
 (2603:10a6:401:56::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Tue,
 5 Aug 2025 09:33:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A790.mail.protection.outlook.com (10.167.16.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Tue, 5 Aug 2025 09:33:36 +0000
Received: from pc52311-2249 (10.4.0.13) by se-mail01w.axis.com (10.20.40.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 5 Aug
 2025 11:33:33 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>
CC: <kernel@axis.com>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2] gpio: twl4030: Remove error print for
 devm_add_action_or_reset()
User-Agent: a.out
Date: Tue, 5 Aug 2025 11:33:33 +0200
Message-ID: <pndjz3im7te.a.out@axis.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A790:EE_|DB9PR02MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: 564a60ad-23f7-44c0-34ad-08ddd403271b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YW7iUF9TaFYxGwDgtlpQKHfwpRxyzw6qAAWYlQxO3KAnq565R1f9tqKX/DQ0?=
 =?us-ascii?Q?XpMFjJBerIOo/jjySm/neHmeZzkhgkbHdXqARAcZi9gxLEU9sj+r7un6Pq+0?=
 =?us-ascii?Q?X3n+GCIhCRPC289y0boIysy5zML++utqFUXRvwxjB1oQ0KJiVWoSEFIP5NrN?=
 =?us-ascii?Q?4Xf9ooHkcG+IhG4fqSScSyt/iZ+uxsIe0g0DzH87f6V3DNTn8WJxkWOkqq8K?=
 =?us-ascii?Q?7nckP62nKGSgGgNcMNTlLOwhfPbJopi+Jb9QuI/A1SaO+H6qLY4XXEj9rC7V?=
 =?us-ascii?Q?ze0cm4EoOumCZ6d38ssuTAQh3eTifFd1HRkOwB8/sSd4W8OpCSLKeZPR1T/i?=
 =?us-ascii?Q?pv/Qo2V3+Y31hU7sCGznidGcEp3+TfGCeuILdJAfP650YOrby0nR83Jd7TmP?=
 =?us-ascii?Q?Ktq6qbj4VkfXVyh3dvX5CZHnyin970auyZDSfKs2VbXhjuwjVg3m4KD6OsEC?=
 =?us-ascii?Q?EhmWw2M6TKfzYjIKBX+IuIvKxS54qpHV17n+EcdzNTVj7ExsefBItnnkMm99?=
 =?us-ascii?Q?JZfjFRkjwqR+dXaRahVNkk9xHGk68MxQYGZ+r6i4uVu0Dj2jFRjr7RWhL1uq?=
 =?us-ascii?Q?BRy0vZj7tMDIZkkNlU9Zx0M6Z9fTDeKP+Nl579TFQActFb6QbTMfBmS0Zrj4?=
 =?us-ascii?Q?T0mHGbbWESF4BZOScHiwLSDcuLE43RO+s87OILDAP0Oh2U1ZUhZUX3qx/5f6?=
 =?us-ascii?Q?RwwQrIIbQU32l3TthjVaxV0ewKthJzXHoqGXvqJzgh1Gf1TvfiF5t7tz7ejh?=
 =?us-ascii?Q?rN6E/9/qv1LsACWMA7eh+0xuZG4u4bT1j2IZrO1FQCN16jD9eaUvmBKQgYEj?=
 =?us-ascii?Q?JKqNckL61/cjh05u4Q0gYtsFhn5KVyxMSBsihYFFO/wa8VvAeJs54wES5fSQ?=
 =?us-ascii?Q?u5MGSrqGKYlP0Df5pBC5aWvyKgCzQ9S0No4Xi7vKs7Pj+ePR9beIos04CeK2?=
 =?us-ascii?Q?C5BjKvyvRI/w2G1CXLvzLryYd06tddm+rmqMXzwCDL7Sfr4M3l11FHDa+mAB?=
 =?us-ascii?Q?+aYqM9rV1Taz0U61IOfZVCc8KuMDU+NmF2AiHzc0rZOULdofmzlWhwceJBnk?=
 =?us-ascii?Q?4X/igrkTys/sW0DmyNs2Ij488/XpeXJn717pS6Rv/pDJS483RTY0UKUbT1PR?=
 =?us-ascii?Q?OOf5NLHbr7d10JgBpJHD2XjgxgjfYjMi20ZAuNOM0v4tzG/L9rIGti6xyLI8?=
 =?us-ascii?Q?Zt2YzdeD9RWYDhabaiRg9kcAdyIuaMZU4g0Fn4uMtqEOdMzFWBsMrE42exan?=
 =?us-ascii?Q?qULkAzmdA0TumLtkYnsvY4VIf6gJO/w49P6Qf+/1+LVgKcwD8cGQXmJt38Ez?=
 =?us-ascii?Q?LXDsNgZaX1RwSPj4RSv/sgMy+Kcmfbn92C0llaqCueJSpXLKSrwz0JGRBwFt?=
 =?us-ascii?Q?oHOiebmIDoQKnw6hqPMWKNaMc36taREEqqsgiJPfLAoCAsoREdOhEzmj1w1I?=
 =?us-ascii?Q?bSycYvUL+r/97Ag4OjChWhf/Hb1hr4fIr7nE5KrQfAB0VMPJakhrIhwIIdnj?=
 =?us-ascii?Q?IAdJtpy94lb5cBSP+NKBtINxbU2TAWlSxu58pXyF1o6ladNCoW9Hi/shKw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 09:33:36.2142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 564a60ad-23f7-44c0-34ad-08ddd403271b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7997

When `devm_add_action_or_reset()` fails, it is due to a failed memory
allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
anything when error is `-ENOMEM`. Therefore, remove the useless call to
`dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
return the value instead.

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
Changes in v2:

* Split the patch to one seperate patch for each sub-system.

Link to v1: https://lore.kernel.org/all/pnd7c0s6ji2.fsf@axis.com/

 drivers/gpio/gpio-twl4030.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
index e39e39e3ef85..3a962d73a0fb 100644
--- a/drivers/gpio/gpio-twl4030.c
+++ b/drivers/gpio/gpio-twl4030.c
@@ -597,9 +597,7 @@ static int gpio_twl4030_probe(struct platform_device *pdev)
 
 		ret = devm_add_action_or_reset(&pdev->dev, gpio_twl4030_power_off_action, d);
 		if (ret)
-			return dev_err_probe(&pdev->dev, ret,
-					     "failed to install power off handler\n");
-
+			return ret;
 	}
 
 	return 0;

base-commit: 260f6f4fda93c8485c8037865c941b42b9cba5d2
-- 
2.39.5


