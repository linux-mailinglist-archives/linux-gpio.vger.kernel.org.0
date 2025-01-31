Return-Path: <linux-gpio+bounces-15132-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C0CA240EF
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jan 2025 17:44:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A61FA3AA828
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jan 2025 16:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E081F150C;
	Fri, 31 Jan 2025 16:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aev9DyKe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013049.outbound.protection.outlook.com [40.107.162.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7451F1300;
	Fri, 31 Jan 2025 16:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341330; cv=fail; b=oB4i8cv+MEjz+Ay0h0B0RwDJGPdnvM1Dl2y4jwB3p/JNk2sncxkmPkTCddGi2IZGvsI4GQDkKl+Z2VH6Eiy3FnH1Swiw7o7CNF5kL2pMLli3vF24g21cKMq+9n4WFkoGG7wwk8RxyhdtPwoaYKT9JRnEvO52YWoNnXCZYwh5B9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341330; c=relaxed/simple;
	bh=ScbIN9E6UvPErbTjewPQawKMhn7RGAdVDugBxka+uhI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EXzgrZ+tC+O97GHD4Pr6VbwtoQ83HxDsJhQ5udLr2DrAu3+KGsGtN7YnZaGrDA1wBW0qrqitOz/mvwNfUGCUgUxWlmTfXh9glFJ6g1bUIDRybch/QV/RsCx1p5jkDE7mghWE/W3TqqOi6c+9C7/vjwyOYoOa9oSWwSaeq7mdDWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aev9DyKe; arc=fail smtp.client-ip=40.107.162.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kG/eYg9C6eQDO6ToeuMEDEKqSZC7//6QzEnG3e7pK8LIQT64vHLlV/GCcQISFOJq027emrien/zJXjou+Q9nEY1cakf9PBBDDtvFsHhZOZw9X4BDVMpioDWBFu98uvKqo7iCK0O2T3X5jQKdQxT6aCvnV58ejHALfyWmkyYogK1A5GEP5AEDrd6Z22+cySc/MLbj7qFXpzPbmvCVS9fid4oPR5DqT19EPLKzeMhLwrehT9TsPkJoiWgwoIZfSJHH00kdRPxlzvEtig+UejNc3gLdhPEqH0dsfhw9t58BAzbIdjo+AyhABRpwxnx+JHPbaWLq77E0HDxABrvdAb8Tog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wttD6joR26DBTP2Qmp+TYvMnlNC3uk887WLbKZNMnfA=;
 b=kwAsLBgU7QQQ27b7z96Ks40JbW1Dqt3BI6YoehXj0JZDcyOD1Z6Jqs/7gmcH3Ar4bGaBCv0bM2iyVGF3NWQSPmQaawuCvLqKlkwKZq4m6OVZLRGzLnCzuae+GnVOjEDZhabt+BlxRq32U6ju1+PBo6dKNNqLncw1DW5xwNWsKoQ/FvTSm8lJEODQl0/+SkBnyIBjHFTjSKSXstt9OxDCoUu3IkVALs95ThUtyOH8E/SwoSELLKKlqm0BVsdmYV4AWSE38T7c2VlynWM9tPy1U1twWGImV8qC9tzn5eaJe1GPzrLWcNlYBI2bFoct5wAonFWyPZANIyW8W+JQJU9D1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wttD6joR26DBTP2Qmp+TYvMnlNC3uk887WLbKZNMnfA=;
 b=aev9DyKeZJFtE6QJISMd5dLNi19/HwV9+lyOFmWzASJOlrXs2LvwtdDC4LufjYSg0Wa/L1Kn15XxOd3atDwlYijGu9DTRMeQIBC42QMOnpieBnn0qVH8diJjm5pyhfQy3JCExE4RiQEOtYruSh6TkTBBEgnicBiaSNemeJ/cUU0wNxMhj+hmC8fUloju3NQ18jsEcX4JxX0u29xar0JUsL6ZXjiMcZaCslHa7dzyOfqFzExf0dZbQAImzcZAk8c+vnC7EHRMOlKdP0CwCNCYwkZ67qx/u176CYceb+nXuabw6UsEh+bKUdLiOFGhIiZ9V4rakmsyhS6OOfNd37WfrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by AS8PR04MB8529.eurprd04.prod.outlook.com (2603:10a6:20b:420::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 16:34:50 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%6]) with mapi id 15.20.8398.017; Fri, 31 Jan 2025
 16:34:50 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [RFC 10/12] staging: media: max96712: add gpiochip functionality
Date: Fri, 31 Jan 2025 18:34:04 +0200
Message-Id: <20250131163408.2019144-11-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
References: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM8P190CA0015.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::20) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|AS8PR04MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: 74961cd7-17ba-415d-4969-08dd42152e94
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ae9+1W0fg0OTBAO0+coC/nAU+UHiJfrSqzC9aRj98tfQW1+k+OQO8oqkuA52?=
 =?us-ascii?Q?xkQoBY6JO6PhJvkE32OUZeGAhRVJbmuxcTAcvQE8LDRKw6/b4QDMgaqEgdjf?=
 =?us-ascii?Q?BkQOGQdumZ0bu3zye98V8FphInC9tjlEmiwf/Dy4Ts1iRX7eYJn90U4jQ6Pf?=
 =?us-ascii?Q?GKmsSYfIr5E/9WYMyzDtXXTnTaGWQIEY/t4TifymJhUYxltzn1XKgCvU+7r/?=
 =?us-ascii?Q?RjPLLXzxtQpdZB5Nw5+szmw3rtXMvbbm1rdn+xkppqXcMcIgim6JOcVaIPk1?=
 =?us-ascii?Q?v2NSXTJR3aKxfdeApAV6zevLgfmY39UCEuxXKiJaAbps8fZYXY69olq3Vapp?=
 =?us-ascii?Q?S3Lo48VRblAWuLPNgTjsyvuZtRoD0O7d+aQcEOINZzY5iZg0hAXpdtLSHM9a?=
 =?us-ascii?Q?G56yWJIqZlyUpdD3XWMHC+xKXKeWco2jAlS9QqNzGITHvcNNJl4VvZngidW0?=
 =?us-ascii?Q?ZT+ap3d03ZNTvhz45c/uapwL5Q4tLXP9j+8E9tsCEOFUtlQF9PUhpKqz68BJ?=
 =?us-ascii?Q?ohYpRUEhms54RURpUbiHq0MaaFtiNUm7qdil3W4AChWv8RUNSF0FoWlBozsf?=
 =?us-ascii?Q?gkep+g3jQkHFu6Mugmxcwbn+xa1t2TC+rVBKbzaHI7q1EIGy/7Emy0Pm2LzS?=
 =?us-ascii?Q?PBYdeGe6K5pInnTauAQSniryYoDF3H2+3SLmwlnnFevezqCzrnhldXLuZLtQ?=
 =?us-ascii?Q?sZBv/B2W38NZyZmRMkCk+0/rs7jp1e9M8bKTJLOU2Ubkqn9I11M9dxtuQwGm?=
 =?us-ascii?Q?ykaQroDfdrjqpabjlb79QCG5XBkDZfylYRXChXvEeSfdtm81m35Q0SsyE5/h?=
 =?us-ascii?Q?9JCTGrPxNxuvCq1nBpJzW/VN9kO0GyDQ/mrvmzGGvFkvXe8SN1z5D9wamkq5?=
 =?us-ascii?Q?aU6/4yPRP3NESjaN+Xdc21w/71AAFGyGAZ/xR0DSxD5/WYCqfHV4KwulxaOp?=
 =?us-ascii?Q?ji42O3ZOUg459JiCrSLFdqYzQ4ourGl7AEDheoQUw7625zdud4WyaUMU/jnX?=
 =?us-ascii?Q?EEG+aedOR7e31cwOHQzIJTgY7C3AeKUz7MRFvi99MS8c3tvd7vqmByf90Vmk?=
 =?us-ascii?Q?7+cujFtrTIFJoDO6H4iC8L40obOlv0fgdnr/hxq5yswV7Pn4iLmNUzDBNu3h?=
 =?us-ascii?Q?so9kPSaTf8inFhJaSnhyharwycKkHLFZjORQYF3c6rnj/IMgSxGz626m/CyY?=
 =?us-ascii?Q?XNrvJOdaO4W0l8XSzvc6sB9Rs0449GPn92sGVWiJBkuya2Cm+Z/kCgOvwThA?=
 =?us-ascii?Q?NpazhCuMFnZKtb8XGDjO2t6hUO7Ud/1wPYzC6USkIA+pUS5pmQ81EcAvF82A?=
 =?us-ascii?Q?wpgnaFCUCAmzuAHaef9NkglrJVHk1ed4HpPGXOQ4LNY4MVzfa93+aSdd8FCp?=
 =?us-ascii?Q?/KKDn0i/wkuVp3m463GsGe4DaEzf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LFF+JQjb7LeZ1DAhI3cjxzjIrkSq31UXWGU38jaOAnm8EzRh3L5a+YTH8SnV?=
 =?us-ascii?Q?zB9946uOnhDtoedWiAkr25HOm8QQmBV2ekmKTnjIX68MVT08e6ovu+6Fp+qi?=
 =?us-ascii?Q?5NpbXBqMtnrT6hlp3VjQYTfd6Ht+J3snk4OwQyyRB2KHOJp3618sspTWcMc0?=
 =?us-ascii?Q?9pVQFt0VNJrxxM1wSih1xNXkda3igus8kIMomzXgQ/Zo912jSRzp5DFe/yLB?=
 =?us-ascii?Q?WmLyOdBWhLE71lThnC5Tv3/yHW3IpGMiMWmXiMc3zZxy6XHl9EqIkX7cZdLH?=
 =?us-ascii?Q?05ujGBBr/dZtF8NdT5HGf9/W8a2BiL12yy9w98FjGz0cQoIDD3VOtolTYlQy?=
 =?us-ascii?Q?pj3zR2gjIwUlUA9VABaJTi9Q/Az5jLDU1Dm4DNXBgSr/UCxA4hsgN+pTIpZ6?=
 =?us-ascii?Q?wZ04LURqUQXY33y7VT5ZiS0mpe8J0bjz13BGvfOvstA8D0CEltfLzYoDg+wY?=
 =?us-ascii?Q?Op9nOvFM2q08Tx+/oNftPX5EQqVr4VrdufC1pLxC7uylAW4mOPt+LTIX21jd?=
 =?us-ascii?Q?a3w0HKyerYzRtTiHRJdemXIXulmE4heeMuEqgtbP/zRlq97GHKpeOZcqey59?=
 =?us-ascii?Q?J1lkLoPQv0JGPJsVFRl7NmXyPm1lw1qXQR+Mxi4AqHyeFUTjIox8SWFVAVid?=
 =?us-ascii?Q?8Wfzlss3gGoXu4PEOgAMy4rVRq5PjNN7mjx4RPZmfqrRsg2bEtjHftoreCZn?=
 =?us-ascii?Q?ndtpjBctBGPzXlQR1tWZsuebr3D2NMQjicAAQjLnzoAnc4qC3zpEulJGri1i?=
 =?us-ascii?Q?QXXaIKnm4qbYRcYduMTArnvdfTg/3kNceyRr61vW7ozAm84QsnRC25V3tU06?=
 =?us-ascii?Q?fwVlaWUsd9iezrDC3xMhgYrUCS06N+cuAZ0pLv8X1vMPhkT1Ke4uvPu447O/?=
 =?us-ascii?Q?+HidFlzgYJSYKpirto7afoVeNYcLIkLznK5y7Mg1nATaxdZVwJiy/ayA5g2R?=
 =?us-ascii?Q?YRGWpkwK6HCnPNs3PCM4trqvegs2WmtN8wzGI0TvV5MoNdjHHrAAL+TMq53r?=
 =?us-ascii?Q?Oy3VpNsfsimTdu+uETicNseC5ZmvPPs77g9Gof0/RZvYon5k/ENrPWVa1CKX?=
 =?us-ascii?Q?5tFPQmDbb70hmzm2k/L+6Xk4WfxiTwbULJK0d8NDYWscQ70cfIZnZG7ry/aw?=
 =?us-ascii?Q?jz0wDhHg6ksoC8u5gK+3GaoQSMG/ZAfYGZltpMkeESDSyFUeHuIcicIdRLb8?=
 =?us-ascii?Q?Vca6whv+9yND5HDcNEuVD3Grm4Z+ZMWyleQeyKvQ+o2lycrjOnJ9Hk+f5sFr?=
 =?us-ascii?Q?3zgz1oTYPxuYJ+8wO3faQ9Lkc3a4FQaJ1oA6DVemJQvEleKkd4VQWpg0+qHU?=
 =?us-ascii?Q?56sxKTDg44h6kuGdITafLJCWjiamBUV6CRQJ4Ml7o6HU5stocOKbMU+eRXI5?=
 =?us-ascii?Q?zz3kU4zI19kdAicgoatNI5h9GN44wRRT5Szv5BY/ZMrDkbpHQ2cmpPZgei9d?=
 =?us-ascii?Q?+ZUnuyrP4LyViIv3YBylrnSLzDgQASSWNeUjOQZNhff2oHxGEz/BWUimzNDd?=
 =?us-ascii?Q?4z0rH8aMfhYjDhwTsZsTSrXX55hYRQo56a+f7PO74v00Nsd2HV3U9E5qE/Hp?=
 =?us-ascii?Q?Kry1Q/XERYS+EPjbcmCfL0ZPlRGVuA0cgzRDV/y96BkQQTia326tJGpOKZBm?=
 =?us-ascii?Q?lA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74961cd7-17ba-415d-4969-08dd42152e94
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 16:34:50.1329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hS1hFSAwCLtaUzEexipXpBU7fbqR63hU3len48bafvKKslMtGNI7Jckc0fbaugevhjzc610fevvTSDM5iiEbGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8529

The deserializer has GPIOs that can be used for various purposes. Add
support for gpiochip.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/staging/media/max96712/max96712.c | 140 ++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index ed1d46ea98cb9..307b2f1d3a6be 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/delay.h>
+#include <linux/gpio/driver.h>
 #include <linux/i2c.h>
 #include <linux/i2c-mux.h>
 #include <linux/module.h>
@@ -108,6 +109,41 @@
 #define   CSI2_LANE_CNT_MASK				GENMASK(7, 6)
 #define   CSI2_LANE_CNT_SHIFT				6
 
+/* GPIO_A: 0 <= gpio < 11 */
+#define MAX96712_GPIO_A_A(gpio)				CCI_REG8(0x0300 + (gpio) * 0x03)
+#define   GPIO_OUT_DIS					BIT(0)
+#define   GPIO_TX_EN_A					BIT(1)
+#define   GPIO_RX_EN_A					BIT(2)
+#define   GPIO_IN					BIT(3)
+#define   GPIO_OUT					BIT(4)
+#define   TX_COMP_EN_A					BIT(5)
+#define   RES_CFG					BIT(7)
+#define MAX96712_GPIO_A_B(gpio)				CCI_REG8(0x0301 + (gpio) * 0x03)
+#define   GPIO_TX_ID_A_MASK				GENMASK(4, 0)
+#define   GPIO_TX_ID_A_SHIFT				0
+#define   OUT_TYPE					BIT(5)
+#define   PULL_UPDN_SEL_MASK				GENMASK(7, 6)
+#define   PULL_UPDN_SEL_SHIFT				6
+#define MAX96712_GPIO_A_C(gpio)				CCI_REG8(0x0302 + (gpio) * 0x03)
+#define   GPIO_RX_ID_A_MASK				GENMASK(4, 0)
+#define   GPIO_RX_ID_A_SHIFT				0
+#define   GPIO_RECVED_A					BIT(6)
+#define   OVR_RES_CFG					BIT(7)
+
+/* GPIO_B, GPIO_C, GPIO_D: 0 <= gpio < 11, link: 1, 2, 3 */
+#define MAX96712_GPIO_B(gpio)				CCI_REG8(0x0301 + (link) * 0x36 + \
+								 (gpio) * 0x03)
+#define   GPIO_TX_ID_MASK				GENMASK(4, 0)
+#define   GPIO_TX_ID_SHIFT				0
+#define   GPIO_TX_EN					BIT(5)
+#define   TX_COMP_EN					BIT(6)
+#define MAX96712_GPIO_C(gpio)				CCI_REG8(0x0302 + (link) * 0x36 + \
+								 (gpio) * 0x03)
+#define   GPIO_RX_ID_MASK				GENMASK(4, 0)
+#define   GPIO_RX_ID_SHIFT				0
+#define   GPIO_RX_EN					BIT(5)
+#define   GPIO_RECVED					BIT(6)
+
 /* VRX_PATGEN */
 #define MAX96712_VRX_PATGEN_0				CCI_REG8(0x1050)
 #define   VTG_MODE_MASK					GENMASK(1, 0)
@@ -160,6 +196,8 @@
 
 #define MHZ(f)						((f) * 1000000U)
 
+#define MAX96712_NUM_GPIO				12
+
 enum max96712_pattern {
 	MAX96712_PATTERN_CHECKERBOARD = 0,
 	MAX96712_PATTERN_GRADIENT,
@@ -179,6 +217,8 @@ struct max96712_priv {
 	struct regmap *regmap;
 	struct gpio_desc *gpiod_pwdn;
 
+	struct gpio_chip gpio_chip;
+
 	struct i2c_mux_core *mux;
 	int mux_chan;
 
@@ -830,6 +870,7 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
 	return ret;
 }
 
+/* I2C Mux section */
 static int max96712_i2c_mux_select(struct i2c_mux_core *muxc, u32 chan)
 {
 	struct max96712_priv *priv = i2c_mux_priv(muxc);
@@ -885,6 +926,101 @@ static int max96712_i2c_init(struct max96712_priv *priv)
 	return ret;
 }
 
+/* GPIO chip section */
+static int max96712_gpiochip_get(struct gpio_chip *gpiochip,
+				 unsigned int offset)
+{
+	struct max96712_priv *priv = gpiochip_get_data(gpiochip);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(priv->regmap, MAX96712_GPIO_A_A(offset), &val);
+	if (ret)
+		return ret;
+
+	if (val & GPIO_OUT_DIS)
+		return !!(val & GPIO_IN);
+	else
+		return !!(val & GPIO_OUT);
+}
+
+static void max96712_gpiochip_set(struct gpio_chip *gpiochip,
+				  unsigned int offset, int value)
+{
+	struct max96712_priv *priv = gpiochip_get_data(gpiochip);
+
+	regmap_update_bits(priv->regmap, MAX96712_GPIO_A_A(offset), GPIO_OUT,
+			   GPIO_OUT);
+}
+
+static int max96712_gpio_get_direction(struct gpio_chip *gpiochip,
+				       unsigned int offset)
+{
+	struct max96712_priv *priv = gpiochip_get_data(gpiochip);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(priv->regmap, MAX96712_GPIO_A_A(offset), &val);
+	if (ret < 0)
+		return ret;
+
+	return !!(val & GPIO_OUT_DIS);
+}
+
+static int max96712_gpio_direction_out(struct gpio_chip *gpiochip,
+				       unsigned int offset, int value)
+{
+	struct max96712_priv *priv = gpiochip_get_data(gpiochip);
+
+	return regmap_update_bits(priv->regmap, MAX96712_GPIO_A_A(offset),
+				  GPIO_OUT_DIS | GPIO_OUT,
+				  value ? GPIO_OUT : 0);
+}
+
+static int max96712_gpio_direction_in(struct gpio_chip *gpiochip,
+				      unsigned int offset)
+{
+	struct max96712_priv *priv = gpiochip_get_data(gpiochip);
+
+	return regmap_update_bits(priv->regmap, MAX96712_GPIO_A_A(offset),
+				  GPIO_OUT_DIS, GPIO_OUT_DIS);
+}
+
+static int max96712_gpiochip_probe(struct max96712_priv *priv)
+{
+	struct device *dev = &priv->client->dev;
+	struct gpio_chip *gc = &priv->gpio_chip;
+	int i, ret = 0;
+
+	gc->label = dev_name(dev);
+	gc->parent = dev;
+	gc->owner = THIS_MODULE;
+	gc->ngpio = MAX96712_NUM_GPIO;
+	gc->base = -1;
+	gc->can_sleep = true;
+	gc->get_direction = max96712_gpio_get_direction;
+	gc->direction_input = max96712_gpio_direction_in;
+	gc->direction_output = max96712_gpio_direction_out;
+	gc->request = gpiochip_generic_request;
+	gc->set = max96712_gpiochip_set;
+	gc->get = max96712_gpiochip_get;
+	gc->of_gpio_n_cells = 2;
+
+	/* Disable GPIO forwarding */
+	for (i = 0; i < gc->ngpio; i++)
+		regmap_update_bits(priv->regmap, MAX96712_GPIO_A_A(i),
+				   GPIO_RX_EN_A | GPIO_TX_EN_A, 0);
+
+	ret = devm_gpiochip_add_data(dev, gc, priv);
+	if (ret) {
+		dev_err(dev, "Unable to create gpio_chip\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+/* DT parsing section */
 static int max96712_parse_rx_ports(struct max96712_priv *priv, struct device_node *node,
 				   struct of_endpoint *ep)
 {
@@ -1061,6 +1197,10 @@ static int max96712_probe(struct i2c_client *client)
 
 	max96712_mipi_configure(priv);
 
+	ret = max96712_gpiochip_probe(priv);
+	if (ret)
+		return ret;
+
 	ret = max96712_v4l2_register(priv);
 	if (ret)
 		return ret;
-- 
2.44.1


