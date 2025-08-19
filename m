Return-Path: <linux-gpio+bounces-24569-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B41CB2C759
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 16:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACBDF5C236D
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 14:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1F7279351;
	Tue, 19 Aug 2025 14:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="hUF6hLeI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013010.outbound.protection.outlook.com [52.101.127.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C8C27BF99;
	Tue, 19 Aug 2025 14:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755614401; cv=fail; b=FtbGmuIqgSvBosgiYvEDDFfItHrx7CUF72tXPZok2cB34pS+QQ3vK1HO5+VC66Eng6VjagV6pCeq6wB+enq6tafbVWI/0I2Bkb1e+fVxRA8mpqX2iO+M2/aCi5yBFx7Ku+iah59wEKLzz336SoR8BG9CpX/Avyhz6iX32dU9FMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755614401; c=relaxed/simple;
	bh=UDZWIh9JPXzDVGmHQidhQakEYjZscB5/Cj+S//i8OP8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uqFnXpqGjL8MnAvUpPlDG4CGZmm5u33CyWCuy/A4+Po63RKCwYryz2aWptRB3N+1QdO8HyU2guYPT06k/W5d+eE95c5xPeAlVOvMwWvaL2dPWieLO74kFA0/nOF3qWol052rbJ9I3dy05GZcIVNY62udzw7L/htg4JmNUnQ6eJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=hUF6hLeI; arc=fail smtp.client-ip=52.101.127.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkdaSqpZViI94YvBjdwKF+cAt7AFvD8E2h+eBzOQ4keVFudMm5T1k6vA/CdsLpU7Ci97CZsM+824z3fALaekTAj1AicWs4ywVcZ0udYWdm1JrBwmgc/coH4PU9ovBe+Pcl0aLR2JNakQ7TMwRPeZHQhoHlEt3+IcqXDtyq6boZcpT5h/u/Y9fya+JHb1fVwLKN7AQjVx6OZRYtS6Qtywwz+lHjjF4lTajnlimWAgFszyHR/GftRrfDgwHyBMx4hrHcjJneNIlkFVC/KzLdwdUbX4hnQJMrVK7B55mpAxCBOeNGuzyLKF6XfhGLyX13UkVKfmD30F4K3zBvIk24eBrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcczwha1Xwsc8BOlBbwnV3nbnMsQlQdW6J7zZkRXfas=;
 b=YPasuQtdfKKpetPhc5XviIvq+4krHkHwggZdDyvB7jmlnWNfy8nLsr0/jpA72tHSnfYz0zrKvi9mDxH5P+XwCt6N+RCKq17LNRURYdTdJ2w3u+jn9YA2IXGHGHAgpo3cJlVmyxIliC6wJgwjG0nCOdQ7K8vqVRXAXrlSrl7Go1Id0JG2pOqmPU25ohfFg7Nq6Ny6kC3qTKIZtk4vHfBK6IuvRU9ukg2v9QGUaD89XXLhu7gQjWSXPxXSXrsPj1rNgTXQdkpSSlZiCLnwvzaOWVLGGsm98QG/8gkpuyXELZ4m62//WaxlSTId/cFDt1zJ6nKyNIv4Dbr6xGhXOMYrzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcczwha1Xwsc8BOlBbwnV3nbnMsQlQdW6J7zZkRXfas=;
 b=hUF6hLeIeqWOGfeTYQ+QfEdKbcJRDYg6ctJKTnwNi+mG4ozh1ZEQseXgjMfo/SyLe+YO4vu3hGP1FwXFwAvngHp7gdLRtCx4TmrTyzT9D0jJR7+v5vGkM1QYKxDzAqN8aOiWAs7rIoaWJT2H9kyR9i89rwqMyfbjAatYOEBN3yiqStm4qpTwDhi9Box1bFwpDkI3SaFdrCcPtuoW1JddezJ3V3CqQ8mXgxX1d7gf7d48L5LyekenAZZ5arA1si1BQrvze+Dgkv1GK9kqmIW+8m4VuSMQKcPqhNuKVQEblsgD4dpcpX5484I436VJQ43e602/X2GbCiVz8XED2mXZXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 JH0PR06MB6679.apcprd06.prod.outlook.com (2603:1096:990:3d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.13; Tue, 19 Aug 2025 14:39:53 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 14:39:53 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH 3/4] pinctrl: qcom: sc8180x: use kcalloc() instead of kzalloc()
Date: Tue, 19 Aug 2025 22:39:34 +0800
Message-Id: <20250819143935.372084-4-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250819143935.372084-1-rongqianfeng@vivo.com>
References: <20250819143935.372084-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::6) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|JH0PR06MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bcc7a8d-dc0c-4e39-a107-08dddf2e42b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/9vM02Cl7Bx5CrfUWOVeQBMGhfSlGufigy71VZkZ3EgOXiDgt7qgmGxFsV71?=
 =?us-ascii?Q?mJQD0YCf68HnTeTT/BzsNP4u/iPGwlMFXssBdjkH+8AD+P+ejQhVVGcDyuyR?=
 =?us-ascii?Q?vGEDlZworshIYknZkdxviaSv2/w3Xk0M0cDKd/Fv/MXju7a7j95r30c2Lw61?=
 =?us-ascii?Q?nmjs+vyZRaX8hvSFFUvTMr2UbI6jKmAxSH9Q0ApPH2uZYIbr+5aUgbGpjX+G?=
 =?us-ascii?Q?dWaWGwhcO5mK8HamkGBKE0XPKsIsOS1elUcNHpLvbRxvQ12zW8M8kJPS9dgx?=
 =?us-ascii?Q?CMaoXe7CacjO20Ls446aLuJEt9y9kEOrdjl4ftfjrh3faaoNd7HQv4P4URl3?=
 =?us-ascii?Q?jL+TXf7lbA9cVtcpwA/zw8tbyTlpA3jH5+AjUwvVeot7JRIeN3etOmhi0ExG?=
 =?us-ascii?Q?U3gYcynJIXRTJ7rVPgIP/qu9Q6/+7WkeWm0AKf1kK9j8rvnK/tKsuUBLnBqJ?=
 =?us-ascii?Q?JOpvCHDmD5Bt3Th3xUVBWCxE8d1dWR5Z2BX9EElNkmLbzwe4A6UNIeRUvOia?=
 =?us-ascii?Q?nzKJZd5Vo02EqvrT4mGPDmdmA5MB7JgdkQiJcweJXu103+CxZb0zY3NeByIF?=
 =?us-ascii?Q?ELIZOcKLQ/ISEyJTiBXXbXhQdFNSSBfUyWgRRyof5rBvakHmZM+76UOUBM2J?=
 =?us-ascii?Q?QQSgyYXkY552m5V8AGBqHw7U496UdPaEMFO1SHyFIE89IsflcISazTpwAexr?=
 =?us-ascii?Q?DP1m1sfK8LpITqdzRKc9NtyK/HMtAwR1qLO5Uen+0p2nb2t5j91e28pTuz2h?=
 =?us-ascii?Q?3Q30rzl05yzvXTBbbC1LG9OL+1tY0xYn51fK9Ic4V3gvv8pgUhNxMd/ajktm?=
 =?us-ascii?Q?cs53IeTJChR5QSlcMVFIEDegQ5QXJhJZtFptCW66JulNzxb/T3bq55Js8J/3?=
 =?us-ascii?Q?v+2Poie9MjtZUN0lWiyqlWXiJJCexkMX9w8v5J+jujXkF40/13s+SDHBQE9W?=
 =?us-ascii?Q?SQruC5buZc97iSsRagWwYX+nvcljx7NUnV1Pgpi+ETr1zTDaEQd35cSjJJlA?=
 =?us-ascii?Q?rXTaKuvGtRxWQgQvfOTsCjILCcIdutTwVDI5+0Pwc/DYNWIUMwEFI1MCrqlg?=
 =?us-ascii?Q?Ey2TTImanNtjuX8uGvol5yURnQTFp1gML9lZgnnSy+e9JYIqmDYLneBNkHM7?=
 =?us-ascii?Q?vt3Q3XgqIWBWN9zWGfLf2csEPVQp/Bco8Uyd27Th7hLiI5socl8Dej8Ujr6O?=
 =?us-ascii?Q?ESmR7nrZB4uP0OqAp3jRC1VU1l8Kyu8p6SVRfEUab6t8RTt3f7QrjTNqbw1a?=
 =?us-ascii?Q?K3uA9UfxIMUu5C2BgjXh4dv/jrYuVQL2dM+FKBlN8N+LP5kTrL/2Pm6jHvTI?=
 =?us-ascii?Q?qYXB6jDJUWvSo+T8W1dXdEwmMZRCMQjbFmMzekOAnMn8lDqf1Qp6g/4FWg9u?=
 =?us-ascii?Q?bi5+B7/AiVHT2J6BGZT/G1Y0Yc+HWdxjLgErB6R/A6PNncx0YY6kikCAq3VO?=
 =?us-ascii?Q?zqTlyu+bJ593WcnZlY+Hft+NWBlFe1CSCY/se8nCaAUOSSnEIL/L2/OmufIP?=
 =?us-ascii?Q?DEhWJyMcJJ1gty0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1FHCl8+iPzc1A5qRsMfNDLa12TJcopebxBmUSGxelIToZlfyg7bJ7iI+c8fR?=
 =?us-ascii?Q?Zej+a+sInJaeEw7crxOPcAqyAvgiv2+kReJWnhL0B6pZE3+srkzQTjxZcUUy?=
 =?us-ascii?Q?ZLPTL8z8ALfgJWCUB3BnoqmKA9A0Mco2WrPWQMBOT5IcZCKL1tsJXGlm2Jgk?=
 =?us-ascii?Q?ASKjloatf1eZ+6FXS+42d3Hg9+sSr6esZQ3fupHvlS01RyJBu51QgwCXrh7h?=
 =?us-ascii?Q?ICqCMXTmNFoIqieVLjPk655nujmakv5JL5WT3gl+usalXsKQlUr6uVxAiXuM?=
 =?us-ascii?Q?3nPJfxsrEn/ggbD02OAuQHizxyBki9qizzu0OZpRMka5gBOJIVm71v+pWgjG?=
 =?us-ascii?Q?geAiRjNbCDL10MVXjY5v/knZH15+fpaH/kUby6lMAQPPTOpMErsqNIGNAj7X?=
 =?us-ascii?Q?caH2icZCf+LxfZJCb7GBMk7Pnx1M9NxhriMmAWdvRFKOpdb6Jvn3DlsPdrcS?=
 =?us-ascii?Q?6tLG19Do5Et1S15yh5RYD4ch72slAwHKwPd2cbAnA5vLIEC4Kka1mx+PmRMe?=
 =?us-ascii?Q?emQlpxu1n9GQIR4MP6Db6puo0tc7GTna300z7Jhy0eeUeCRdU9z3poVOXD19?=
 =?us-ascii?Q?Py0HAgmgoZ/AzOV7BfiGT4qBowdS4cg+bS+Q9lL/bCF3cPboxRYsei5KgN83?=
 =?us-ascii?Q?VjFmIz4Ty9UMTbzbCpUwX6LU74f75emN+cETzvg7yeH1RvDc766Xjlr4wflT?=
 =?us-ascii?Q?MbxHHmSZCPFVRYDjqyxuxtSIHQ1skNEBKvq4NJGKEHjdPv4/xwMHaEkgqMQu?=
 =?us-ascii?Q?OfM4+j4SP9bI+EYo51NwqCzVCS8aaJFqZv0gNErZ8+k7yDQ2D0YNgSWl3Psy?=
 =?us-ascii?Q?fQqdjtBgW/JkpQ4oEEH77kCMn5hjPWGeNrTjfJehi5q6395pd2l2quzqrUuG?=
 =?us-ascii?Q?QQLOPU8/hCpBxECrffWeIh/YiTNGMZu28JznZ0+niEet68B/72xS2yKg+M/H?=
 =?us-ascii?Q?djqcqTLIbt/9/+bK7tJpHOY9r4ZkLNfHaAMsyaEec+vqf7BR43yuvyT6s1A7?=
 =?us-ascii?Q?n3hOrp0vU+gkTx002VtBdXnR6omZaRH0JDWQtWTR+0HaPfH9VCPcypSsBwuQ?=
 =?us-ascii?Q?4jLG1KZsUCD4PyKI4y3vUmcF9aFXIO6cqKcntOX9dwEyNd8tguySWzdnTshq?=
 =?us-ascii?Q?oqdYPrfojsWNRiEL/KYhQbFEArghQ47yLCLlMKtYABIiazCVZBHyfux4SVH6?=
 =?us-ascii?Q?ZJRS6ZN/L90tX8TYLPxjhd4S0Pu2YbPiFuqa5zm4T03/UH0ybITWUwjG4DCf?=
 =?us-ascii?Q?WpvOIPtEfJMTwgcURUHYRIUW80AkDmvskZE89/2iC+A5nzXqDxySVK3oFg0F?=
 =?us-ascii?Q?h/wDpt7O8orPoPpteCkGP0URex8HK/RWuQ88Y+764EqoyoYf+NSZ9uOQ0Cq5?=
 =?us-ascii?Q?/81Fq1HIffa3fNH0UvWH7U1VlAs106nNSdxhRXJH+3vAptQypu7SdJzez3w4?=
 =?us-ascii?Q?+kr8W6S0HEWrLfhmt3Iq49WKeAp2HoiGzw4xRF9tNf05Q36qt4r/fOXIUGjD?=
 =?us-ascii?Q?QexZi0MZ82vLWGZiS3u2eumZTTVVrLK/EMate1RGlpF0qfCjewOtR/7SweFE?=
 =?us-ascii?Q?QwIAJO2zxzUBXmbGkNhkkgJ1EXWrWKE1HYQWpN2v?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bcc7a8d-dc0c-4e39-a107-08dddf2e42b2
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 14:39:53.8737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gtY6gLTUDBI0APO5SHhUHxS1uGhTZyfZr1q7Uw9gKFCoN+uynj4m09MQRQ9rw3jGhmiBcpadYzh3aT9QTnowxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6679

Use devm_kcalloc() in sc8180x_pinctrl_add_tile_resources() to gain built-in
overflow protection, making memory allocation safer when calculating
allocation size compared to explicit multiplication.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/pinctrl/qcom/pinctrl-sc8180x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc8180x.c b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
index 26dd165d1543..ae5134fdebd9 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8180x.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
@@ -1634,7 +1634,7 @@ static int sc8180x_pinctrl_add_tile_resources(struct platform_device *pdev)
 		return 0;
 
 	/* Allocate for new resources */
-	nres = devm_kzalloc(&pdev->dev, sizeof(*nres) * nres_num, GFP_KERNEL);
+	nres = devm_kcalloc(&pdev->dev, nres_num, sizeof(*nres), GFP_KERNEL);
 	if (!nres)
 		return -ENOMEM;
 
-- 
2.34.1


