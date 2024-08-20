Return-Path: <linux-gpio+bounces-8859-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0969586BF
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 14:17:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A849A281CB9
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 12:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A4D18FDC8;
	Tue, 20 Aug 2024 12:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="eqawLTre"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2086.outbound.protection.outlook.com [40.107.215.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5937A18A6BC;
	Tue, 20 Aug 2024 12:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724156255; cv=fail; b=VDvQ8DVjp/60Rg7JBJlQQ99KtBs9VUlbv04aESQduQPc+LPUk4JZ0kwCCLiWcXupVq+LmbQuuLF7ynP+//igDmknwwkFZILLKKyIuZDmvoNHh3YNAgWCUYGQvSX7DzqbIwIaFRbJZIK+CzEYRFlXQagIC3LcrH7tGb48hUVT9mo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724156255; c=relaxed/simple;
	bh=xtYHtnW3Cvus2ZUNj/ZD73lscSyH0t3YKJzXTCzOjBU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IKRJSnkl191ylqcfaq8N2pdA027jcjgpoW4+YyXjRcj8jg89YanJvY8KM7k/nFvbJNmNm5VsKX6Chm2jgwxOfdg+5A7FmG92ap5u60GA4ASz7b+lri+NBqAeqnmBE43M0+WLtj2qPVWxfDVUOu+BrDk5FMKYTbis13qMQfNZ5vY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=eqawLTre; arc=fail smtp.client-ip=40.107.215.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQycSoH6YiJ6kur2uZ/d/BZKiW6OuiiQkr0NON/N0h22EF4TP50/4RsRuUgriEs30gFsEkVBy3gsbrjTdvTSK1eT/oGG1GSzSwcw8lbB6ve1SlPpxO8k8JYScNaYTJ+Um/nKyHU0RW+Blm0Kf/H/f7vZWJbD7msgB8m2YIx5zQ6ZxE+/DpImkQ9k3NBX7Xl5vYXDzOgBph14EBAvezwRk1S+1Ywv6ViLuvuZxOyGGgZ7xLRGPnIVuvy0j0IY+BBlhEqyedgO282OctrpptQWX7h78r1YjjH3KUN7c3txzsYzlQYzaeB9jSKSm9/p2MRieJ1i/GZMZSxtbzqAJS6dHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHP4teSQ5F5zOPyfclpHySQ9EVrCPdichgnicjDfqjg=;
 b=LCmdrgu80VdKIs8EwU1AxAVM0bRpTVMWfH3OTEdS0klQLZhjv1IzTUEzYxL6ifVEkzo5WDTsl+6b3tryiV8c96In0LdRD1XCgkJzOeSvj09+ubB0bu9f0FibgJuo3xZOjeJNwjJge7J4mv1jyU982+D3KoBNzUCsNOrHBqs32e/SGPr/Z4vx5z/CtsMB0khROZFW4Wcp4aiTxYwondRmMH9hMLDZnMtRaaH8VjMcWbytplH1vvOmw/WFq6Jns50LfvV16RYHLXNeT6Ljb4YGL4jaGdrUoosnjNvwDwP1z988TS8gyyAPQ/3AYMMZoQ5e8f9rw97FxFUFaBmgGAV8hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHP4teSQ5F5zOPyfclpHySQ9EVrCPdichgnicjDfqjg=;
 b=eqawLTreUn6U+GpjSTbnOO+zJq0Z5V7x/hmzAp27agd/RHJ4NfzdxAT7C4SM57pdyPuIei8L0ozFqHHtM5jwYKEG1Sg6N+oDwz1HXX49z90jvDNOR4N/O/LTEFpBhTxzVSEgvozbXVRM4cducexTsDaRA2vzxQbjK2R7tVFCG4wTz3+yOsWj//0m5RR6tLai8TFZGqrjo3EOIylZa3dh9yJOHAhc+kHgOZpPj9WMMJz7v0lcC7R/IwgavXx+SI9JPJdHu3lhTp0caxz6OyyYLr5CaYsqpEOngEZduq3QgoMCN0SjkFnBOVxm3GPDj+y8YnmHzdbysLcsDCsLBPq8tQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEZPR06MB6285.apcprd06.prod.outlook.com (2603:1096:101:130::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.21; Tue, 20 Aug 2024 12:17:29 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 12:17:29 +0000
From: Rong Qianfeng <rongqianfeng@vivo.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: opensource.kernel@vivo.com,
	Rong Qianfeng <rongqianfeng@vivo.com>
Subject: [PATCH v1 1/2] gpio: stp-xway: Simplify using devm_clk_get_enabled()
Date: Tue, 20 Aug 2024 20:16:50 +0800
Message-Id: <20240820121651.29706-2-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240820121651.29706-1-rongqianfeng@vivo.com>
References: <20240820121651.29706-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0063.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::8) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEZPR06MB6285:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d53f3f8-dc2c-48cd-f901-08dcc1120fa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZpuIU0b9WyTkZiZw016IXml+uKjvuz3jymAgRjtZCUjhTClcX2aiCJWUOROM?=
 =?us-ascii?Q?l6G31O6tw1kyrdJqMwiSp+nsXw3ZnY2SK9SWFm1FnGYZGsAfcg+kMvDdULG/?=
 =?us-ascii?Q?ORkp+y0ExXtlMj3oLo/6Vlvk/WWmsriXiB9MIwEMZ6JlfVSfXa3SvZCXEH7R?=
 =?us-ascii?Q?rVy4RtfORbb3crbdslmt8cKP3j8w34qlN1s0Pf/PVmLQftKYO2Y9b5XXSg/R?=
 =?us-ascii?Q?9dpJBlkkvgVgmaMwvMbiEibZRSRiPfpP0S4fCDgYGUvt3E5X5C4pTmB1subl?=
 =?us-ascii?Q?Bn9q4VagzZ7VK9jjHDISuGL8cRDI9phDRfrNAxBiKCnsamF8Am/BWVdwKpLt?=
 =?us-ascii?Q?f6muiUq2EId2di/hMJePa4fbAOrDE+gMPYJMVzrUGR6w+qTaAkIgCqbX55+Q?=
 =?us-ascii?Q?1NGGHCik8WPXrYdPhC58nw12ZquFIUwfX6ve3gjC1UXG49yQESAyiYJIGhO0?=
 =?us-ascii?Q?1iyUOXX70nVxudD4JMeP+Eyewz3DuaQEjM39q5jzSKeS4ABNt4dutDDQdcb4?=
 =?us-ascii?Q?77UCCMsW0RdaULTghZ1Bh18iacSXxe4hMKQ/Fw1ljzuLuJ4lyX2f6xCKakDF?=
 =?us-ascii?Q?8FCpzM0eA4c9lpaTNMkbONlQ/rJnFUprpojnwL/2o067QklXNZQxR4eiU5Ki?=
 =?us-ascii?Q?HQLn/C/NEr3+B9m3lBfGPG2jCkFZrN0SKBzvOnW78eFs5Jenuta+4f+87Az4?=
 =?us-ascii?Q?xiukRgjZCuAkRiJNl/rCTtS9re/wdUdV7eJ9YAIlj/93lBJU8P4k7UvI6goN?=
 =?us-ascii?Q?Xuunzn3TC0BZmJu524tZJeRwedgJfs432sVw9nfbr3NCf8ef9zJz5x8XDBk6?=
 =?us-ascii?Q?agP5IMBf6+h7HX46VBTP+gkq1DTLgsGe2TI6kPjIseMMzX/5HcG4Dec0i+IP?=
 =?us-ascii?Q?noc73dxrwWSC8MFz5+JxPls9YRLGkASvaiESzmYWg88gZ/ChzicPvWoKnV2I?=
 =?us-ascii?Q?E2ysg6oMZTxWj3rbN/Kn70PSQJGoqKgHruz2z0u50QhlO7sf7mGJ+GieP1Ov?=
 =?us-ascii?Q?xqbICIMZvq46hjnppgXFEGoQ6Pjk5iItNctLTpDw0bil/Aiq2V2EAr163Q97?=
 =?us-ascii?Q?o0Vkx2WA85Zeq8if4UKJB0m+sF2Y1TrkQyUZbEb/T17fp1kn9IuHNP5DcG7d?=
 =?us-ascii?Q?8zgd1g+XmROt5uO6nVKJ6XbepyUeHHM2redq3MbHzhQFIHoNJ1i4WhSc/g0N?=
 =?us-ascii?Q?pu6yylR7KSJ5dOIIWssoZR+emhddJJSU+fz4jh5o98L6Td64Kr8pPxjG8ubt?=
 =?us-ascii?Q?15cNUMLg2rc1wgytGgrBzbX57NXSdgGicewh5kqSZ+aHWDr5w73kGjOdqxg5?=
 =?us-ascii?Q?7dLnpByZgXKYyd2G1k1YGKh5kq4/kyqkySzDMD52WaRTqrarj++G2fP12gp2?=
 =?us-ascii?Q?BSSsGkBm6SnOk99yOpE22sXdCFTiIat3ByyNX7HjnV4lOaGzLQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hlF9GTvuGal0K4ITNFcZnFrPkXaMHBrhAmKe9TAeCkytrR06NYljWJ4dk1Bo?=
 =?us-ascii?Q?ybmD5XbSMsLiXBI3gMLOQ9vlofzvM2/QNu8BFlhnZwOrVUWDYTka0B7YDBuA?=
 =?us-ascii?Q?5WGIDeQ3dU3/NfA8nbyQpe8MBpCeyYPgeBDGaBQv84wg1TRxzhyPOB9uheZX?=
 =?us-ascii?Q?2iIyzfUZ67bt/GMj+9WVwtu1CB05WF2TDzGACCxIn4elb+cbR9K9238MyDIA?=
 =?us-ascii?Q?akWRuHQ9rI9lAcELYPHyO1EM9knW29zrGY059WY8FcBqZXEuRSSq214vCAuB?=
 =?us-ascii?Q?NFCRgu4oIZmpI92ynCdS8kMGCWUX04pXNDk5jA+dB1/V0YM4NTWOQ+mkTGm9?=
 =?us-ascii?Q?c/gycHeJhRL/xO3tYkmf/sMXqmujo/iR6jv4eB7run8GlVftQmbKMyYDapI0?=
 =?us-ascii?Q?tNl3HyD5e2bydjI1piEmEpQZpjfwq8nRsowYbOs0ZhWMF3yHdpPRX5oar7Ky?=
 =?us-ascii?Q?l7JLdGs7TyOCFY+GBkJ0NzUv/2bIXC359SIhyvspZRhmlTrbdqDcJMN1dfDa?=
 =?us-ascii?Q?PbaHuSFuxXPhyajBe9UDgK/hgckFOA6CLEPm9NcAQjnDrPOR56puoTJV9hEy?=
 =?us-ascii?Q?Xg+cw9zFi9G72RM3tTlgxsiTuAwV5gpnn/KxAHyAxu1YoCoxuuPp+Ns7CJH/?=
 =?us-ascii?Q?94iuU1xvi49McB85AeLMddp8CzxWCAhag8ZG6ZkSYlFVRFwUBcbo8QsqGK/5?=
 =?us-ascii?Q?ejyunveOW2BaK7kkwoRGnQs9dQmJ6PSbechOuWBGI3EXFqz9oinajMGCUuIb?=
 =?us-ascii?Q?f9Kb13sG6ca4omVt0zZH/ysa6V3be1ZHHoS5PWkSAAh/az737pNNzZr/p1DA?=
 =?us-ascii?Q?GEkS83hy/ubaHMjwMUT6X9yId90AVYxCqAjgxVgO1F43cGdD/K87BBssQvoJ?=
 =?us-ascii?Q?cM2LggPGmAN12Vxb7+UQvrqXzbekMRNJmM5ISgmjdJhAJcIRgRahzsiGlKJv?=
 =?us-ascii?Q?3B7oIgNS4M78NUJDlnWj82ljbuzRDaqzu9jwpt7KRAELHqxidmQSZTZemGzr?=
 =?us-ascii?Q?ztHVnp9zqc2//jEzcYTYgkIYr/7hGal40lTQzG22lddw9DYmH96Qhs7j854I?=
 =?us-ascii?Q?kxF3iOWGlO99AlMFBmEpegStGnKZ9jO4yzbuT2IItHZsOmYQZMSdhr6rctFG?=
 =?us-ascii?Q?HQz1gbf2xIw546p4TpVq/WKRob2DA1lytezJlb6OoP2vWhIdodweCqwByoC/?=
 =?us-ascii?Q?tOxk1wdhtMqAzZG9UiKrP/KZ/S2XUrfFWOX3koGNLMtdvDDK7AirKeUiIjTZ?=
 =?us-ascii?Q?8ZEZyKihQiiTMWXfMQ8b1v16saOg3fUW4EhmqT9mvidXeBf66xkZ2mGEtt6b?=
 =?us-ascii?Q?gkyZjECx5KzMFCo12m5QkoX/M+GV9vTM6ptamdBkWZ8w39R+3i+D7knW0ejj?=
 =?us-ascii?Q?aRtGo7duKDJOyhN/S01vVDa2Q8bshXj+A7ktZJgbfRFPQZ2/RtQLC2V3sm9k?=
 =?us-ascii?Q?6tiTu6Fiz3Fztp5yf6Ji1R3cgWPa2H2jsPtuHUJTNYBa++OKTDgwE2AlNsZH?=
 =?us-ascii?Q?3Jj/t1kaQZR4sP8pSw231O5C0ZVH6hbngSFqzWEYurJficsWTADTvI7ajQwA?=
 =?us-ascii?Q?yH8S0qM6LPx1QafEQ6jsqLsptUu0mooCNM3KQ7ks?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d53f3f8-dc2c-48cd-f901-08dcc1120fa4
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 12:17:29.7749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RKdlKf3iJdYFiRCh2XaCH7e85hMIflcD7OcAIoWdeAHPsQW381gm9I7N291TpMv2knMqNGUGl0WdRHlVL4exOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6285

Use devm_clk_get_enabled() simplify xway_stp_probe().

Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
---
 drivers/gpio/gpio-stp-xway.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-stp-xway.c b/drivers/gpio/gpio-stp-xway.c
index 053d616f2e02..5a6406d1f03a 100644
--- a/drivers/gpio/gpio-stp-xway.c
+++ b/drivers/gpio/gpio-stp-xway.c
@@ -296,23 +296,17 @@ static int xway_stp_probe(struct platform_device *pdev)
 	if (!of_property_read_bool(pdev->dev.of_node, "lantiq,rising"))
 		chip->edge = XWAY_STP_FALLING;
 
-	clk = devm_clk_get(&pdev->dev, NULL);
+	clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(clk)) {
 		dev_err(&pdev->dev, "Failed to get clock\n");
 		return PTR_ERR(clk);
 	}
 
-	ret = clk_prepare_enable(clk);
-	if (ret)
-		return ret;
-
 	xway_stp_hw_init(chip);
 
 	ret = devm_gpiochip_add_data(&pdev->dev, &chip->gc, chip);
-	if (ret) {
-		clk_disable_unprepare(clk);
+	if (ret)
 		return ret;
-	}
 
 	dev_info(&pdev->dev, "Init done\n");
 
-- 
2.39.0


