Return-Path: <linux-gpio+bounces-9265-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6779E962678
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 14:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88EBA1C214A6
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 12:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95392172BD3;
	Wed, 28 Aug 2024 12:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="aZE9eW+o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010057.outbound.protection.outlook.com [52.101.128.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666F515EFA0;
	Wed, 28 Aug 2024 12:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724846499; cv=fail; b=mSEzOUa4cvOBKaGGP9TyT1Hfhuq8nRSh68G0+GS7Al3XsB6NZa48H4rR3lQqqvKCzvOK7n7TvygNajT1v6pEWS1Rheb8W4uVvgKUzF6X9tmEKbTmDjqrUh9qu1ADWB2OZy7oMg1/a0/MvhXVVKvRi6fLJiwg1+OUAA12+c5WjyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724846499; c=relaxed/simple;
	bh=94vTOsYQ51erXCpJXhBRs+dJSixogZ5WACyemMxeoa8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=PQyVcCiEbqH3lRUYy2W7r0iomU8hb0rrc7xXC+pGx+82UJrxrnJmUcu8aJsWqBRTk+UVmZoJ0eyNl7vJCb4uXaFCBPhgqKdrPF9ovMev7u8JYsXFNTd4s2gw0HIH1QXgw625ZFD0EJWGu9iGI9AnJzXh58+VvU+ld9xEurxZK2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=aZE9eW+o; arc=fail smtp.client-ip=52.101.128.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mMnGs6xMzCFcwlgOVmDv4fAmmrPb0Ky4IoyslkWWlyrbaGWLNpi9STK+iyIvedaw4wkTsgwns4q1NC9N2O9nat6ctVeLg6916Bg7N/5WEZAchJsDqXzh32uiOTLUNkxptUWqofDJr18G1AhwLkJuroBC2hSewEtUn73IQT6IjezE7/Ri6JkJ/tCkJWaP92aX3cKoQYLpcW2uTT/j1OWYqOKpWCXyEiYTkwU1rDwKIwA2qdyUmCPmMpczKEFtS6aho3FyndIR+7O/Bh466+YlxQpY4NN10eQ43InchxhXBsVj4/VMfdmkMiF/kQ+D7cxrwr0UY7rvezlZ2PqIzdS51g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OfZmIrDmt/OKxFjOUoCFAc5r/YQydXlGRlX2pTpzbVE=;
 b=UHrCw+GfPnzsUlTGvt7qea700ZqA1w3KmhZKrhINjpdwIsPpBKqwLo5YeSai8qdoeNaSDy6yWHTBei1bTBkwi0a8wj3Bd5BYCZfbG5AvuFl58S7FQlhREoi6S9tQxe0N9XgP9T7xMUrIrSlaPt7AC8cvaiR5d3uOBMbB10LmXZuvCMO1j5enIf1fBNF9IaX2AgrpFobrqWHy/+NN/Wn/SPovqCoQqu63rSXIVjs2MMCcNIb72ZGiJeXfr0aVWQGkhDI6RI3a9bw39ELAla4yW+1Br3c10iX9hA5hXt4GANexQN5wUU8p6Q3FnCmISxdPKNHuRs00ozcGlxPdcs3K9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfZmIrDmt/OKxFjOUoCFAc5r/YQydXlGRlX2pTpzbVE=;
 b=aZE9eW+ojmVBKk+Smc0PTZtpuRwZqEwiait0AR1wDy4ADepGfMYtM/AWtSNt+4dGGNMSTnu4jyDij3ODbSl9md6KX7oQn5mrbZFzqxQVwLrSDaj3AQ2FXllKyASxFB8iU7rAVQMZbX7lv3A52OTbIhrxpusgn8V28w9wqmTSVGlAfA5/hckYh2N9FLgMXvKUu9Hgk+ymOR/PkMWIqXiHwUGH4wp36DX7CVaV9ifusn7O72ouxqftWaaoPWCptqoqLCEi+mVxdiMP187imKQlHhDfJA+qsVkKT7gHFU/3+OkU63sQMVibw+zFPS5mRCz0YcC76Y+jE+P4z9LtcXaDsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com (2603:1096:820:31::7)
 by SEZPR06MB6959.apcprd06.prod.outlook.com (2603:1096:101:1ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Wed, 28 Aug
 2024 12:01:31 +0000
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1]) by KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1%4]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 12:01:31 +0000
From: Yan Zhen <yanzhen@vivo.com>
To: ckeepax@opensource.cirrus.com,
	rf@opensource.cirrus.com,
	tglx@linutronix.de,
	linus.walleij@linaro.org
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	opensource.kernel@vivo.com,
	Yan Zhen <yanzhen@vivo.com>
Subject: [PATCH v1] cirrus: Simplify with dev_err_probe()
Date: Wed, 28 Aug 2024 20:01:18 +0800
Message-Id: <20240828120118.1284420-1-yanzhen@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0025.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::12) To KL1PR0601MB4113.apcprd06.prod.outlook.com
 (2603:1096:820:31::7)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4113:EE_|SEZPR06MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: a03f668c-818c-4637-ec18-08dcc75927af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?72ZyFgbnC40OctvxHGbcy6Igm8Ad7ZWPJ3bn++jaENOb1aPtvgZ4yUxFnnkJ?=
 =?us-ascii?Q?OyKL6BfJXJrheAJkWWsedS2j6kmixEHFtYTlHJSeRE7P1b76cwjPTUSFFhVs?=
 =?us-ascii?Q?1ETXmQVAgj037Tb3HmQXcVaXy69GPlw8+MY1+m/YQGRbjsqQ0lOqIyZHXNl+?=
 =?us-ascii?Q?+UBSBhyQWDOgQIymxAb/ZkXoRPX2e2gONjku2zSd5e+1p2gYs/5Qs00IGzL3?=
 =?us-ascii?Q?YwrNRiYaYABS3cvVjBdo06tQBNmLih476Rj6cCDN8sme6HoYyyRlEGz6LIA2?=
 =?us-ascii?Q?wgpiWwiItqITTjsdt25mR7zviXbT7yItdCnw0x4T0hTtMykEXxG6XNjyjC8v?=
 =?us-ascii?Q?i47P9IC5EWkIt+PsJQXAv87tz7fvnrYeHfjWDcp5z7ZaAbryx43YSOgdtc+5?=
 =?us-ascii?Q?9mq8qKv7FpO6Ri6C6Mc5h1EpR/eiLm0xOXePzstEOnHHnjK1EIJeaG2fRTfe?=
 =?us-ascii?Q?Q8iYd5iflYzejNJmYX105Gg+e59hCAA9ZBG0nHaa6dq/Co6ZYPPxO9O9Feqi?=
 =?us-ascii?Q?Qxc/PwuhfffdA+j4zQ1uU797lSNpw1WZ5+sUye0h/4IDHRnAgj9SLqY7gHVY?=
 =?us-ascii?Q?d7iN1FEj4jSKCtxZasvVqh6lmMKYw+3gf4+32ffjzDQJCGdL8yVYoXjP+xlo?=
 =?us-ascii?Q?g6gYNCc9XptrirbDyed5An4Wfcl1gZqxJYlC6OYGifcZN4X+hc+uhJQ7o3hj?=
 =?us-ascii?Q?9qTTqIwT4axBeGNYTXjulVKWsg90Y/sEYNr9ujLxnMd7EQeupBIqa6BhcJRx?=
 =?us-ascii?Q?VWdkYU8zb6g5HVLVV8cRkFBmx7yUehhlS5aQWmEd/7QKrfv+FafRnuh30Q7q?=
 =?us-ascii?Q?2ISONwGO7dTMlLwKNlDfnDqxBoWypW+R5tQXtECXaySYurZqxlwYPsOcHUED?=
 =?us-ascii?Q?6gjVoKSo3qB0H8FOWJfQC2BZsBNKfywq4hdwW4/snVpHy94Tcq3bFzTpalkE?=
 =?us-ascii?Q?3BfaANdAmsLtw4K/9wVRHTteMY2M1jICkVvx/ih8j4aL31S5STXCAUT589Kl?=
 =?us-ascii?Q?2adtQcRY0EeWLhE65vqvBH2oe4gq99j1Oa364ksdPFIQnvUtPGv7nNW+MOXz?=
 =?us-ascii?Q?wNnOmj3xJ2HHbQnVFqPMoO2EgtuC7jKGUaMbbRaQpi7EYsxrpSU6dadDPQHG?=
 =?us-ascii?Q?u5lyIGbwprnMdmWzpU7grnVYJ37Z7l7OTvCYKk7+wi74eE/xBLykK3mpi0Yh?=
 =?us-ascii?Q?UCXXq8FG+LF+trrjpwHsMLLFOrPU6R6uflRXQ2Gli/MlYN+4sS9WQTRUFUYb?=
 =?us-ascii?Q?JlHlFR3+11Fft0fV+CT5Y+e8NQdO20/w6GAHSc7eHrSkVf3cUWKehIBeL67N?=
 =?us-ascii?Q?AmiB1fV3m8zKnByrpBbU6xSXR1pt5By/TkICPPAKnvxMe1MQw0jAETK7mJm5?=
 =?us-ascii?Q?dr4OPsqWYZpKw1Om1IzXASvIhmrop0H/auOfVgrNZxk5cu04uQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4113.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UFfphisynpuj949uQQjJG8yW2c7DyAIq48jRCBamJw9I969LmIMl6vtlkFgY?=
 =?us-ascii?Q?2gQRMQQ9ZfxjPg5igw9ZljopXsSQLyaWZJfiMYc2MeipICXkccnEI8VXLanN?=
 =?us-ascii?Q?IlAwu5bYWifA+2RWeYd67Uu13jnUF6QVgXCZIiW15vi4YEyd9a/Z2DQjBcGG?=
 =?us-ascii?Q?rhdPGcKiSxzB6zF61X30x73ZQHJQA7YWesjg0yhQ0A4PHc9SLLx8W4KpVdzl?=
 =?us-ascii?Q?htl47G2uBXuTGke4aDPKXIX3aPL7NpeNcnK3qE5TcqMW6nk2KSwmCRwZsp+B?=
 =?us-ascii?Q?esRa6W2IgrG3IUALwtchPCaRG/h4QphE//JUewjIfIgdrLb2IG6gPedQeOMw?=
 =?us-ascii?Q?VkPFlWG6NGMWL/55WOH00/hBwomSFseNq1zB/pvz5B3N0UcD6RjQCK5egiQ7?=
 =?us-ascii?Q?czJeOk6AjLbLFHu9r4NwgbLz5QyIWpUwchbVgIpJ7M/37KVf5eAVNiykXAYi?=
 =?us-ascii?Q?wh5sthS+s3NnVhFiGa4mgHc8kWXETKQWHVteu5n7qT1NUy1BNMFw+nwwM3wr?=
 =?us-ascii?Q?JZF4vJ+iGV5gw8Fqg9uf5SXV5X2o0tnEvrREfBNhCLh8aLddQlUu7v6dOMu1?=
 =?us-ascii?Q?IVgpFmXeCqTFW2xfEcbZmqfSTQMgpoeaNHTr4JVY0nwPgrZKb2VmmAP1tsJf?=
 =?us-ascii?Q?paXMBTRVJbwJ+5YUOWENXGDEg9AXKHJj5yJCw7H9QEoJ74lNAUSXMTrVZHjf?=
 =?us-ascii?Q?V49pHPLLuWRC203ipsN64oKuVXtTvXqp+35W8ETQOce5qDl//IPf+WNbL0m7?=
 =?us-ascii?Q?YpnenUbKdLZR6JZ5ChnJX5ZNhqxgu/fHkNMYNUGafIVJvKp0zDs0LQta9+Vy?=
 =?us-ascii?Q?4BD4e7UaDRIpBdZNEdWRtPeuvtNryZKyoR7NvZ4b4TeiA08N6RzPps9JIhhx?=
 =?us-ascii?Q?YBNDotwDra7jj3B+kecdzVa0BuevRSOHDGTGjCMmv5XrXPiUTDUhalvU1qva?=
 =?us-ascii?Q?BSYoHGaBMeH2b4wRg+SLmRabmHmQQ4wL2rybUoRwCSOL9lkcSKAzMOP1jmW4?=
 =?us-ascii?Q?eBT5IuI0FmfmAIET35xoBJoEMk1O0IECFUbRxjf7ChRY/kXHoDZQbJBuCnzQ?=
 =?us-ascii?Q?zljRH5VW7cArwoG9ItXbnmTPAqYY4ts6uL0MPxSw3YIdrbXaRbYIJ0cfS5nH?=
 =?us-ascii?Q?sj8toZLBQdcRDriuX8RHnj9FRKH6f+sWVK2RZi57FaWClCejOQ7+zjURgUlJ?=
 =?us-ascii?Q?gjJiXBvE4R09kdXrxxuolKqgKQ8ttx/7FREIbsp2CSB8PHGX4GFe/vjYjOcJ?=
 =?us-ascii?Q?/YtqYwMt/nw6Ic5evdSO4p2LRJBnwYyE7i7QNeBky9LhdESeZXDRcGFbnyzK?=
 =?us-ascii?Q?PZmmGIWWu0wRjKLUUVKHCPwNaNtHgj1/zHSfrCIxHKGIxFgvU3tAubinVVf/?=
 =?us-ascii?Q?SQHwOVHugjhbIh2gLIrRXkjscNCJc9idBEwQebn1/2ht07KTgFnbNHkFxS3J?=
 =?us-ascii?Q?AnS7YAL0TYMt2MoBNgkmn1YyEkXIOxhyZ5A6fxww/w6Uuygdb0aDouI29Hfl?=
 =?us-ascii?Q?kEsTk20WCG0fLPX+mos+jYZW08cmLfBA1rM3i46QM44NJV5RrbvLB8K0GBJl?=
 =?us-ascii?Q?RFwMfnCV4vc/oBD2ltkG43uSSGM4YnV/g4Zy/09L?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a03f668c-818c-4637-ec18-08dcc75927af
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4113.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 12:01:31.4747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ax6yWqeV0U+R57GYACVzL+3gqCrPP1re+kRnC7STOlfdp2QnSZQYfKbVgZuPtX/lDrz3cmQ+rdIlow/1wbKneg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6959

Switch to use dev_err_probe() to simplify the error path and
unify a message template.

Using this helper is totally fine even if err is known to never 
be -EPROBE_DEFER.

The benefit compared to a normal dev_err() is the standardized format
of the error code, it being emitted symbolically and the fact that
the error code is returned which allows more compact error paths.

Signed-off-by: Yan Zhen <yanzhen@vivo.com>
---
 drivers/irqchip/irq-madera.c                 | 5 ++---
 drivers/pinctrl/cirrus/pinctrl-madera-core.c | 7 +++----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-madera.c b/drivers/irqchip/irq-madera.c
index acceb6e7fa95..68ebe09baaf6 100644
--- a/drivers/irqchip/irq-madera.c
+++ b/drivers/irqchip/irq-madera.c
@@ -199,9 +199,8 @@ static int madera_irq_probe(struct platform_device *pdev)
 		ret = regmap_update_bits(madera->regmap, MADERA_IRQ1_CTRL,
 					 MADERA_IRQ_POL_MASK, 0);
 		if (ret) {
-			dev_err(&pdev->dev,
-				"Failed to set IRQ polarity: %d\n", ret);
-			return ret;
+			return dev_err_probe(&pdev->dev, ret,
+						"Failed to set IRQ polarity: %d\n", ret);
 		}
 	}
 
diff --git a/drivers/pinctrl/cirrus/pinctrl-madera-core.c b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
index 898b197c3738..532fa8ac9a94 100644
--- a/drivers/pinctrl/cirrus/pinctrl-madera-core.c
+++ b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
@@ -1064,10 +1064,9 @@ static int madera_pin_probe(struct platform_device *pdev)
 		ret = pinctrl_register_mappings(pdata->gpio_configs,
 						pdata->n_gpio_configs);
 		if (ret) {
-			dev_err(priv->dev,
-				"Failed to register pdata mappings (%d)\n",
-				ret);
-			return ret;
+			return dev_err_probe(priv->dev, ret,
+						"Failed to register pdata mappings (%d)\n",
+						ret);
 		}
 	}
 
-- 
2.34.1


