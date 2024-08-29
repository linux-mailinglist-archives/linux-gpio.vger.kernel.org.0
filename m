Return-Path: <linux-gpio+bounces-9336-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D391963BEE
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 08:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A1331C21488
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 06:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DE515B98D;
	Thu, 29 Aug 2024 06:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="pQjYlZ/d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2077.outbound.protection.outlook.com [40.107.117.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ECD145FE5;
	Thu, 29 Aug 2024 06:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724914158; cv=fail; b=p9O0O0od26SewkE/TimimarhOr9T/+EWkRhXK2IbF0npA45Pn9R7Y6vSRUpIBtTbYTVaNHiJfUDwQE57q2IZkJR5Bj6IKJF1pjuyUBmU6b/MN+CdFcPREBBKmN2e94C/pE76Bjt/AnJVh8CEWp0xWOegI85PEDgLfJaZxZMst4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724914158; c=relaxed/simple;
	bh=7623bXi+BHVhuonlzNuDXUD2v0Eyym5D+2hAJPbs/58=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Xql1bwDc8Xda36gA1A8krqh+fMBMJNU3rjTJhn1Wr0FDULOqguTN1uU40BOQmckEZ49dLbXV33xHmLcGnCJ4gRNRJEluvD0hvYN2zgT2RjUzG7iX6eio+x8z6/+DkMd0XYGPe6ZXsjA4BvBIo8I6BB26IZ7pPapLYz5a+5StMU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=pQjYlZ/d; arc=fail smtp.client-ip=40.107.117.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CC1UB+HaYQQo/xeOYpCB00/paQ4H90jbVtwvzHPueR6CpBrEw3xVYC5/dr3O3fOrvfZQocGVtaFCM+eHwWMtYExYtMG6GCeDx0y3w28AP0WOiHBvgemONxYu7OSo9fQjFnShtywskptw76algC6JL4empgO0GwAWBAGZdpuuMwAQ170sYBZIbH2jSTjAiImJMgwOUHwsatoOPxDAklVa0ShnkMETY9uiPRF0XN2yLTeI2RZWxtvwkByDpWarMCWb+T3xTFzcdNF1EXSzddMwrNIEHYZXqjcfbpAKcyRXEXJigxj2sTRSinlkJqUCO1NUFKR2/UkxTP+rYWvOEYZEPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96gY8HaT9u3FOkaI36R03vmlpPBjIJ1u3SZNz5T7S7c=;
 b=UBw+41i7al7IyQGmLqNNmEPbBEbooPYgjpE/QuoBLcumhp4sSe6E+qAVpDcd8JYS9H1iAJSUBfHahZRNHMlLpbRI0IWJ+MwzLmpS/GKJbJdggZM4LaniM4Qd2BNyHSepayJyy5QQDCh9ZaRKyDGDpXB8x13AC14E4FNEJixYq52nJkb/hyv5FKpAgUX2F1GCBXZgqjZiyRT0esmOytX1F88IZY4ir4WoHP3Xv6y8R/V+8GRaqttFLuSJMpN5bguGpKdjbXCNa9eR3/fWWLEEp4fkwIzpwXPxDxH6ZIdWSCbd5dRb6UUPjvf6sJ4oed2qCgH5dqn+oet144smKa3rMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96gY8HaT9u3FOkaI36R03vmlpPBjIJ1u3SZNz5T7S7c=;
 b=pQjYlZ/dY96FW1mTYb+8odTsRA48h4DdqPbjZw0JpSFxoSfYte7LgCZRVlnX4bFBwOE9gDeHJbHhsSzh8HQtJu+ouRz/IXBo8MhT13Fvk6DSXpAuv4O9Obt5YznO8o0eskUSSFzuIlTMB5GnV6b/TzsubYLsp28m8WNtEqDwOzzwPhU4wsfHRJ1Sj8xGQtYnju0j5CxpvVmc2mBZ2+wvecu6ZayofttmE5AYECthMiYi43cwaJrJp0uVCWi+NPeKDE1THaae/6Z2+ZuXh5JFKkhlHn5Ew24F3l19o0e2ziHq/jM853X/JRCDf+dfbYDi/bxAxqcq5y6wbKfkMHex2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4211.apcprd06.prod.outlook.com
 (2603:1096:820:23::14) by SEYPR06MB6822.apcprd06.prod.outlook.com
 (2603:1096:101:1b0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Thu, 29 Aug
 2024 06:49:13 +0000
Received: from KL1PR0601MB4211.apcprd06.prod.outlook.com
 ([fe80::29e8:8083:a2b3:bd1a]) by KL1PR0601MB4211.apcprd06.prod.outlook.com
 ([fe80::29e8:8083:a2b3:bd1a%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 06:49:13 +0000
From: Wang Jianzheng <wangjianzheng@vivo.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: opensource.kernel@vivo.com,
	wangjianzheng@vivo.com
Subject: [PATCH 3/5] pinctrl: mvebu: Use devm_clk_get_enabled() helpers
Date: Thu, 29 Aug 2024 14:48:59 +0800
Message-Id: <20240829064900.19909-1-wangjianzheng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0153.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::33) To KL1PR0601MB4211.apcprd06.prod.outlook.com
 (2603:1096:820:23::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4211:EE_|SEYPR06MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a6e390e-ba7f-4b97-1ff4-08dcc7f6b144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?clrcbGliar+BqH7txuqCTDCw8xVmLgz+MEBZ08/z9Cxe2e7VTCEawACtIiLK?=
 =?us-ascii?Q?lB4EKc3Geo5V3MhKVjAv3hToc+Y8bTQ+qdJ3QpdH8pdtwhLJU4SiB6kBWJul?=
 =?us-ascii?Q?z3tpZnnUMKYDm4r2i51FlKS2tUzXttDbqAPi3zakKGYNWfJPmCQxAaRUyur/?=
 =?us-ascii?Q?fqTzUZyO/oOP67wFQ+eyBEqP8TtqWHB7M6tjwPDhjG8K58uzNv43ZsjUXfxW?=
 =?us-ascii?Q?UMHyx8V7wvFz/5dvPVF4JfB8DWxGX/0kATh5mpRKSGL3fgUkeg2hflO0wryg?=
 =?us-ascii?Q?AywwGZARPYRkyY8v0+IHRg5KwleG/FYonmNY9+6VEDhqxMqWRXytOliF2+Yr?=
 =?us-ascii?Q?hmmZMg1RbaaVNLHNocFTgZdXEMFbkoVTSsj7ka9vkUUNxLKyqpTrRRNl3IvV?=
 =?us-ascii?Q?Fh/y/p4CKnBlTW5Jko4oWxgQhyngP+t5wVaR+C1R+8p2I+5umcitxmYmRJqK?=
 =?us-ascii?Q?XPUOqQEJtgU9KTYyWG0AW4ojzSm8lVH/35V3eR3nhuOeyUcaI/r/M3CUwxZY?=
 =?us-ascii?Q?MOYIeBZ9VdhHwdWwmcz+QmV8GTEE2N+Ottj9p8llq8ZHKtK71OwFtgEOhd8y?=
 =?us-ascii?Q?UanH9Q8Y6b9O/+lj1ug7ElhBi7K98B+oZqp1EDbNbQ1MgBYt0OATpdImsNbw?=
 =?us-ascii?Q?BhTcWEcAPkiC/Zy3QJLws2zUKqfb2jHNbHPs+Xrx50iBz5mxGFizmxnmiLlr?=
 =?us-ascii?Q?DYOrKjeMc63NVLbdDMw/celk7y5divmB/Z0XAMJdSMDm/Xszunv8RBp7TcAF?=
 =?us-ascii?Q?c8sRP34EzoiEBMTo3FJiQzQQCMhY/+Qq5x+cjwPMgN0g/RezizxinauuOA16?=
 =?us-ascii?Q?T9rzxWVj83J42aUNp4PBA97XjKeer2AAD9ArURhjO2ZX9Abp0LuZ0XDc13sE?=
 =?us-ascii?Q?tgjfFqRj/arJLxl5sya+rTrH2fgRU4pVu+6adiY0lOEaCwMaEgPfjmkCuYRG?=
 =?us-ascii?Q?Kgdt0ay6AItK55eTgre8FO2FxQlc67mzP2DXe7iJRq5UJznTrxTxReHnUw+g?=
 =?us-ascii?Q?to2GQE3YOYu3vMyYkBGQGHhb2h/hI/XaMLk+BrQG223Z7Y4XUgWvKUVskuZO?=
 =?us-ascii?Q?wqEnoVN5kPHHGJAHH/6gworJUV0oID2OhGNQLpeL+JjIzWLiKy2IvQNbiUhv?=
 =?us-ascii?Q?hHgcWD8Z1vuh2D6Ynx2N8lWaEX0GsfLNNHVmJgG5hiuxqgtQ6goQLipenzuK?=
 =?us-ascii?Q?ppIuyjoQEdd/QeHxp1bAm1lbDVTdvmBn4qA1XLXO8asa1tv4ca9OuMxVT/Dn?=
 =?us-ascii?Q?d57+NSsf5RtXFXMA0/Tq41RERtR1y2eBSMLiFO/fgxXT2hDo08ZLy/9+TdWG?=
 =?us-ascii?Q?Vw1HPNk2YiYFpIWtxYQCqDQGA9k+TjDFdSYEqjBHCIaMVyxAvAuhDBvyVH4p?=
 =?us-ascii?Q?zj5KzjesppdhOi+H6Nyq+2vRCw+a0yiaj85p+MvFWb9Ac+UM+ukAaj89HlW5?=
 =?us-ascii?Q?p8tFPNZ9oLo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4211.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w2XxC8YWIf52yhXeiiE+vf2leOyVabun3+PDu+eRo8yZupxjDaI1FV0dPipX?=
 =?us-ascii?Q?+ibZJPeMIi4KHnMC9L1MXkFOrpdteK5ZNOj6LGsLRbuBAtotAisEwcKZPXo9?=
 =?us-ascii?Q?udSmhiISoDT/2F2aUNa2kGMVCXlEo0o1K4ZcH7A5Gf6xptmr428pZdoi9G+R?=
 =?us-ascii?Q?kFEFr9pyfTrS520zGdDAJ69AxSs++7XZM4OycKVbcDIJqEr3nGqyZflFVsFo?=
 =?us-ascii?Q?KYa3luzDkjuW8dw0DZz+vKay6ooq91zlLsAkm8f2390PkdxbdolpVNNVY4sZ?=
 =?us-ascii?Q?UAMyp/ECB/WzgJEm4/KaPnN66xJqwwtNQuD0IWZXjkwI9NGQRFPPrqqaph0P?=
 =?us-ascii?Q?7sYi6r9totTpcuyLYLsiVgaRK4LfDQXwSgjv6BfPsv9rR9kSZQXdSrP8Yu8Z?=
 =?us-ascii?Q?QUjXKEh9wIxrJAw7peGKCSxK6PWUSB/ENCZBG8HEkShVR0S+e1lDdKBwexLJ?=
 =?us-ascii?Q?QKd30FnJWdguNsp3WxwpHRLAGwZ63T1Gv7S0l66e5LIdK8jb3OlVejQTkQqJ?=
 =?us-ascii?Q?ZxuogdyxxhRZmj6/xzdOlqeXQg9cAAhdzZ68ciUqnHSJI17VjiMADL6+LC/e?=
 =?us-ascii?Q?FDHP7mfvx8uW+oXBPtl4q6ycJGESEA1xqDoNL2N2yUbJwwnNCh/cO8qReoSn?=
 =?us-ascii?Q?x5ETZgsf9ch358l5a4v+rI5Qp7mKb2OuC7o4lZ7FrN2bklg2jEWER38jORM8?=
 =?us-ascii?Q?ojpbDawy41UkOgVjsqdo63GFCSOv/Lk9V8eQyP8o9D+/Zdgi7km7BcWS8tBP?=
 =?us-ascii?Q?keGoun6Bsf7v70TYygbVmenHox0DzbQLKLVSvw6u6/oyO6rwgZBC8PNwHUpK?=
 =?us-ascii?Q?RHRJnGEpeX8nLmKMx1G3att68YwUXBGTvbgy9lPSNXxku9EdekYOZWH+6bn4?=
 =?us-ascii?Q?1VpTwVvCLMQDFlediY6koNTlprMy06wcFXHT8kEnOXYUM1fqhjVZ0URJFcgy?=
 =?us-ascii?Q?PgQi98AUajup47sSIaUk/0LLBGuZCuA0h3NNYq4h3/6zZT5mpTBkPbDK6636?=
 =?us-ascii?Q?YjCh4g5WghRfzesLntm7o1o4lSgu6PaanxSVe4Lq9x45eKsW5OxT+DGYKPxh?=
 =?us-ascii?Q?B6aBlsUK2ErUtnq37PqS0gnmDPt9YI0Iyn5o3dFphJ40P3S9bGClbfoGwh22?=
 =?us-ascii?Q?dZTmykqbDNTOv5tOp8wzSmdPIz2zWWct97DqWpNP6FhgWU6JLKl0EwdLUI3s?=
 =?us-ascii?Q?4J84AlLbxKUglKic2iTq5DCcCXNY6aCzMQflQmwaFQuLQS7vRcKURx2UYC4F?=
 =?us-ascii?Q?K6BOrM8gdyBXYubljQ9DR/rE76jmukcEUmYQpFkNNiZ6a0jUWYqYpdQot+zb?=
 =?us-ascii?Q?4q3Fifbow/u6zB3gPVIaGCbM9eUX+kDGeFCG40dyIyjoPzCnsKk3IFQknR0j?=
 =?us-ascii?Q?pEwrVkk2qLwhX+ZnABf769QPedOhjazVQov13P993vuhC+G8oroQI84Nk180?=
 =?us-ascii?Q?/KdFfPeSS9PL94opT4IjARUPy/253pInZBQ3As4riqwzjzS/IvfimPoUkBdP?=
 =?us-ascii?Q?GtUmzCW4JHvAjf+cec5mmuTHzw/cL0isHQ/awM6Owc2YfU4ukipCWVT3IDQj?=
 =?us-ascii?Q?EIV6mN4b+dqyaw4CIpSdO/x0kngn8WYUnaZkQElY?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a6e390e-ba7f-4b97-1ff4-08dcc7f6b144
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4211.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 06:49:13.1101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ijgKz2EbttldJU4j36eGYhSRsKYb4U/eTXhEnpCHd5gnGFHN4W8W15sDljaq06FIeoHOpIH+R3RRKdELMNJ9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6822

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids the calls to clk_disable_unprepare().

Signed-off-by: Wang Jianzheng <wangjianzheng@vivo.com>
---
 drivers/pinctrl/mvebu/pinctrl-dove.c | 45 +++++++++-------------------
 1 file changed, 14 insertions(+), 31 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-dove.c b/drivers/pinctrl/mvebu/pinctrl-dove.c
index dce601d99372..1c2a292ebbd9 100644
--- a/drivers/pinctrl/mvebu/pinctrl-dove.c
+++ b/drivers/pinctrl/mvebu/pinctrl-dove.c
@@ -767,7 +767,7 @@ static int dove_pinctrl_probe(struct platform_device *pdev)
 	struct resource fb_res;
 	struct mvebu_mpp_ctrl_data *mpp_data;
 	void __iomem *base;
-	int i, ret;
+	int i;
 
 	pdev->dev.platform_data = (void *)device_get_match_data(&pdev->dev);
 
@@ -775,25 +775,20 @@ static int dove_pinctrl_probe(struct platform_device *pdev)
 	 * General MPP Configuration Register is part of pdma registers.
 	 * grab clk to make sure it is ticking.
 	 */
-	clk = devm_clk_get(&pdev->dev, NULL);
+	clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(clk)) {
 		dev_err(&pdev->dev, "Unable to get pdma clock");
 		return PTR_ERR(clk);
 	}
-	clk_prepare_enable(clk);
 
 	base = devm_platform_get_and_ioremap_resource(pdev, 0, &mpp_res);
-	if (IS_ERR(base)) {
-		ret = PTR_ERR(base);
-		goto err_probe;
-	}
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
 	mpp_data = devm_kcalloc(&pdev->dev, dove_pinctrl_info.ncontrols,
 				sizeof(*mpp_data), GFP_KERNEL);
-	if (!mpp_data) {
-		ret = -ENOMEM;
-		goto err_probe;
-	}
+	if (!mpp_data)
+		return -ENOMEM;
 
 	dove_pinctrl_info.control_data = mpp_data;
 	for (i = 0; i < ARRAY_SIZE(dove_mpp_controls); i++)
@@ -812,10 +807,8 @@ static int dove_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	mpp4_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(mpp4_base)) {
-		ret = PTR_ERR(mpp4_base);
-		goto err_probe;
-	}
+	if (IS_ERR(mpp4_base))
+		return PTR_ERR(mpp4_base);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
 	if (!res) {
@@ -826,10 +819,8 @@ static int dove_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	pmu_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(pmu_base)) {
-		ret = PTR_ERR(pmu_base);
-		goto err_probe;
-	}
+	if (IS_ERR(pmu_base))
+		return PTR_ERR(pmu_base);
 
 	gconfmap = syscon_regmap_lookup_by_compatible("marvell,dove-global-config");
 	if (IS_ERR(gconfmap)) {
@@ -839,17 +830,12 @@ static int dove_pinctrl_probe(struct platform_device *pdev)
 		adjust_resource(&fb_res,
 			(mpp_res->start & INT_REGS_MASK) + GC_REGS_OFFS, 0x14);
 		gc_base = devm_ioremap_resource(&pdev->dev, &fb_res);
-		if (IS_ERR(gc_base)) {
-			ret = PTR_ERR(gc_base);
-			goto err_probe;
-		}
-
+		if (IS_ERR(gc_base))
+			return PTR_ERR(gc_base);
 		gconfmap = devm_regmap_init_mmio(&pdev->dev,
 						 gc_base, &gc_regmap_config);
-		if (IS_ERR(gconfmap)) {
-			ret = PTR_ERR(gconfmap);
-			goto err_probe;
-		}
+		if (IS_ERR(gconfmap))
+			return PTR_ERR(gconfmap);
 	}
 
 	/* Warn on any missing DT resource */
@@ -857,9 +843,6 @@ static int dove_pinctrl_probe(struct platform_device *pdev)
 		dev_warn(&pdev->dev, FW_BUG "Missing pinctrl regs in DTB. Please update your firmware.\n");
 
 	return mvebu_pinctrl_probe(pdev);
-err_probe:
-	clk_disable_unprepare(clk);
-	return ret;
 }
 
 static struct platform_driver dove_pinctrl_driver = {
-- 
2.34.1


