Return-Path: <linux-gpio+bounces-9338-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 136ED963BFC
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 08:51:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58ED1B24FDB
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 06:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD2114B94F;
	Thu, 29 Aug 2024 06:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="JwjPwu8e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2047.outbound.protection.outlook.com [40.107.117.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F8415DBC1;
	Thu, 29 Aug 2024 06:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724914236; cv=fail; b=NuE0BU3f/Pp/8Jzd6dbmhwF69XgNRQF4MD+9G2wlL+ZOzltNEvrnd4SeDGqzkvwvl+gCpxWNhD4hBAFOPadGI4DyLpIeo7hKk+9Kk8zoa0h8NANscrk8OQiLQz5nmuYtLrxsFJ2rwvwNm7Vncbsfdqw5OCHRbn80YUNkl4if1SQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724914236; c=relaxed/simple;
	bh=1yagkEzQYkz2DFs/OW/ibHujPyLn9Y3vlRgDdUMEFmE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=V6BOKsuRSDTaFBYNQTkpj4B+7T/rVu6pRjpzP/6vYVbCjG7uwp7GPyWe4ey0wU08LBoD83cY+jyJx6ZfWeaFJ9O7+IedvpWXmI2wG+r0l1cHxKVxoHNBheA0DDgmxrPiVe9ZBz9OzyHRRq4G4dtmPixzyj8ytaCNZCMe6eTG1dg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=JwjPwu8e; arc=fail smtp.client-ip=40.107.117.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X80ZdhkdRRljyg43zIRhB9NpA1UbeufDToZqTpFl2aTG7auG7bWu+rzJALny2ol4l4apcwwtyVdHTUtrOtMScFMGA7EdHZBgOE8Q1IJ5aJtklLj/D9JHSDDFmW1NYY3CJn60S9oJcCFFve9PNQbfqY38FAd8zJiP8du2Cl9ewV1IQJ7dTOGn0477HzZrGjowRgL0s3WUnfltHRl4OLMQeJzFtb9rhbAY3cuO7vtOln1QQWGVYII6/Nj8NcUVHh6LLH3ivMLoA9pgQKOejCITns8zDFBhVya30Egsp84B3UFAFWMqciV1b5shly7L3F574B+wpLNXF5mJ6YQ2m/lWQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4TpyFjnQw/ov6d0N6SzkMqv5UL92OEkGLab5JYV92f0=;
 b=YkGZEzzzNGPCUPy485IgK+3Fy/H/HyQc58ajI0blUZwGuY3EJZlPCoj+nmNezXTWbfkY7VMb/rJ2mdXnSPEOvfHAwLmtdOjueWflxAYweTEcYAmUGHPJfD1fBOEE73RKeZ6p1w6m3XPQMMZ9bfE1Xu5ALVgPYYPMicHX/esDL4eHwLzHCFWpEAfDDWAKj2OA2l0CUAetRu9L3nqbEG5T5Gy2rFaqOU+ArZBGXxcuWphRN8JxjeHqq5TN50BLCM1nzpFfcxpK7zaHWg/e+FYHAcaoCTMmGh7GO5tAfkLHutIxlje85fp34UNymRLdDi+U5VI42nT4vKZeHr/tGAc7bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TpyFjnQw/ov6d0N6SzkMqv5UL92OEkGLab5JYV92f0=;
 b=JwjPwu8e+oYgc/VDUqqgPy2xgKIa73TVVKj/xQhx0xFwLX8cs3a12jewnRaLxEnFyfB3/I0A2jy9SuR0g3GfQ3v2GhKwMF3XLOF71S5vbfVrqmsYFchrfzm7cy6kqjaoD9bzmn39BS5v6k9JvDl5Lm9bW5TkNx2oJA2Kh76DyL0LLqf7IY70HikLsdSkg8zX8sxQNJnim81nref3O6LF2q4OCh0OPKKXziKmNtnI4ENESrgUPyy1rPzQm/tibYQnpsdBEPph2XBFcvcM1ITCRSuBPMbyAbrzn3XlFl4Zl4Cg64xMsSx9fZBSh8X3UKzl93WPmCeho1l+yzznRO8p2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4211.apcprd06.prod.outlook.com
 (2603:1096:820:23::14) by SEYPR06MB6822.apcprd06.prod.outlook.com
 (2603:1096:101:1b0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Thu, 29 Aug
 2024 06:50:31 +0000
Received: from KL1PR0601MB4211.apcprd06.prod.outlook.com
 ([fe80::29e8:8083:a2b3:bd1a]) by KL1PR0601MB4211.apcprd06.prod.outlook.com
 ([fe80::29e8:8083:a2b3:bd1a%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 06:50:31 +0000
From: Wang Jianzheng <wangjianzheng@vivo.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org (open list:PIN CONTROLLER - RENESAS),
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: opensource.kernel@vivo.com,
	wangjianzheng@vivo.com
Subject: [PATCH 5/5] pinctrl: renesas: Use devm_clk_get_enabled() helpers
Date: Thu, 29 Aug 2024 14:50:17 +0800
Message-Id: <20240829065018.36863-1-wangjianzheng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0077.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::19) To KL1PR0601MB4211.apcprd06.prod.outlook.com
 (2603:1096:820:23::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4211:EE_|SEYPR06MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a1cf53d-ecfb-4edc-d264-08dcc7f6e00d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P/8SS+P2G783QD3mI7Com7MTUfAL4SQnP3kWRVZi3+psM0+AqzgmqDTG//pi?=
 =?us-ascii?Q?62wIppTt+Q32YHC57Nr/B2i8rECEg0PUeHRuap0xCChqhGVMfKuySXRSqVIV?=
 =?us-ascii?Q?16s10C8Pyj9y+pqJNv/Cri+nrXIvfUnqP70jA9xjEWdLMyWoHkBm35JZ1KDj?=
 =?us-ascii?Q?BQaUB3Ay6go7xCWpWTDKAlvPLA7X1qugYaQuzAwXQeLV+Xl1QYdLBmSvY7W9?=
 =?us-ascii?Q?JiIEr/9Za+xlAktnzWAcRSBkokQ8NstWZTImg/7w0eImTjGg+maoj42b3YD5?=
 =?us-ascii?Q?T6k37keYdhEqMz7Ol/iS7ou2Qc5vt1IXOoWy+Siecr9CKXqyZCMbo1kpC2Ex?=
 =?us-ascii?Q?aIpK1gmZtEBfmk3mw3Klb3VpCBsi6DQOr2QhTLX07pkBVAsFZVIoODLnRWY4?=
 =?us-ascii?Q?JWG9j5Iit1BMN5v0pn9nbrCZPVdRavX23qVA+bJZlrRcTQ96u7JzoybDnVVU?=
 =?us-ascii?Q?WhPr/eyVUCCMwX9emsoFYaC5sS0gGYezC9MUIMANUmLMQGAFmLtI46ZiXUOG?=
 =?us-ascii?Q?gDPEAz51pd3IXZMahtEXCdWgL2dl73OvuJjEB0hOBsSWwv1CGAXbA1K+ak3k?=
 =?us-ascii?Q?m8xG+FZok4yV03NsUA4TjQmenGrFTzGXfymVsRUmUTmBr8g7fxSCnFOs0cXb?=
 =?us-ascii?Q?DqRyQ3BQclob95zRDDIHTvwsOfzEeQYv67Nd1yapirKWU8sIhWi9JCSb+ALW?=
 =?us-ascii?Q?56B44LoG3y0vlIQGJLb3xrwtSzMVRBMTRExqzYbagoI1rt0bSdZjUI15ak57?=
 =?us-ascii?Q?h7J5AjBz66zqKikA5PvilGKyHYWFT75Dx775F1NmTFTUtRTytqFp1DhQHsj1?=
 =?us-ascii?Q?Rl0YK7vTfM7j2kaGYhQn3pGjSwFFmRdQXin+60cDXxZyNWSnSIHtuEGmaKf0?=
 =?us-ascii?Q?Nhh92xaKD4ukV1SstcMh9LZK1VoKMiFgjRVNeaT7Np0mYj3gzYe1qN1t5s0j?=
 =?us-ascii?Q?4r3Rvy2P3DoWUFLwHJ2M9aT/PQ9k4gE3YcuSmpY/XKH2ED/g4XGxgn97RZWv?=
 =?us-ascii?Q?ssb3RPrYKbunPeC7rLNqY1dHmMGffpATSQkn/neI/G6EW0ZLfqU2aFlEi5to?=
 =?us-ascii?Q?qXKRePXZ4Mlg2WoaVDKKoLIcSpV7EyQl/255cOmE356xs9XLd7i3RQcJaYn4?=
 =?us-ascii?Q?WRddutZtYr41a84ieXTxamkLMg2daxbSCZUwfKELBfU2Z8qzMsWY9fXpmjse?=
 =?us-ascii?Q?+PLo01qgQPa3DSxamDP79tR5lz0DV+YxaUStpo5nv9Zuq6ReybtYa1tmm4D/?=
 =?us-ascii?Q?Fwuk9ePHmFoqdbs3hUwmanQaCp7wcWnqxSIRqvYTbuAZ9SZTQOVgwEq2yNLi?=
 =?us-ascii?Q?Vqk8opSIRqY9m7NDFlInRNvua1W+3aMYmt/SaHUF0e/kJTeEY7qwfAuuJjP4?=
 =?us-ascii?Q?vTAaCZDQg4nIsyHhO0Hpo6SE532UZge1vO0RtQUBsg3MHw3atg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4211.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ubHaj816oI7ciWTstmLSMiJNh1/vhehI0W8+fLSAQ/gzoEf2mVXx29uvPmBW?=
 =?us-ascii?Q?h4akoe4RiFrTD9XLqtZxj1HhlURaOAjuPxaWjA5/WK/WEHstZ+xfAicDxMWd?=
 =?us-ascii?Q?TvR3VZ81jph93dUqd+oejPRA+oBf8nvvfKhdNT30vcwIq61PI27ex/mCA9U/?=
 =?us-ascii?Q?zxGlil5YbJ1kj71nbpMG3mj++XjDwdygHk1U5ybNmMMECMbAwdhYuCfBQnhL?=
 =?us-ascii?Q?PtNZkG7RbRsbONb5L+qD4WzhZQpYolLliNYuRnyVGoXg6FCEmJ54BxKetmso?=
 =?us-ascii?Q?7B7eEHH2DX55uvdZvxv1N+R2EB5HgO+jMloEV/4lUiC86W2MxvuK21BYWOXk?=
 =?us-ascii?Q?rLlD5RelZwk22RSx/Hz6XEfn9hl5jr+wPdy469hJhB3ovGUry00px7e5zJGm?=
 =?us-ascii?Q?iRdQImOOf5ltEH5A5tGjfnTfdXpQ3Q+YADhfTNAK3C/TAPPnfAjkPhuKsYmc?=
 =?us-ascii?Q?ddKCbio505/gWSx7+9hrKJlEkuH1BF/RsQiwd+XVET8yI8K1pOWlFf5h7p/h?=
 =?us-ascii?Q?Bf1Hh+nwl/C5FD1jU/CrTZt8EXUKVS6r+DSHxxSObAIlStQWNmsfeDYGB/cm?=
 =?us-ascii?Q?39BNDYpnb1NwoDpOcqTLP9jeM2bslaeIT3Mzq9JjMatZNaTq2OjnFPYfwr4K?=
 =?us-ascii?Q?fbe18GEHpXSXQGe4xm2Gm405dEpNiKWIHz4FbKaMn+6TVdNm39jc6Ys68U+N?=
 =?us-ascii?Q?AxacozI950fhufpBlqRYtEl8MvNBDzdZIj7FKYPaNtD9Q5v7aGXSwYbcKuwl?=
 =?us-ascii?Q?skuBL7osB4nYuvz68wV/dNOwKl8XQgBxkp8EHxQgAtl1HXVZu0YsGU2RasoR?=
 =?us-ascii?Q?+I3K6lFsckwTQvYgNXpIAWOFMG5WWP5YnOFhWGqjfAx/vXjb1RBLHRg+/+OR?=
 =?us-ascii?Q?Da7t51UjLaml5J5tjawrj5Tx/7cyzVuq00b0F6YgnA4tCNTKQGKMHK5aw80c?=
 =?us-ascii?Q?35XdV7LGMUiv5VNTiqR4HE+WMwLFt1dYX8y9SbIHEeeR9ywJVcVVW0EEVdks?=
 =?us-ascii?Q?/yP7NMdt5gAadsGF8wVsu3YnR5TSf2y4g58bPJMVnqeke1Qq4rwG2arSxXqy?=
 =?us-ascii?Q?3VV/QnNENdXihfzhKIvi4F4gMRI9d5TJALkPVLs2v5TQlYxW2yz8fa6wU2Az?=
 =?us-ascii?Q?5dAYwQLL41ygJCLiKOrBgL4AnJU0phPu5rGXDQEtr9Wt6bgNlFJRoaXtkJbm?=
 =?us-ascii?Q?bcqGbO/Bdr5NZegpwN3E1afbtqBeBGc6A5baxzaYmRhMrvo+Xz8wNVDHL1/N?=
 =?us-ascii?Q?8tTydF0/lQH0fCzMMasbKqo2wRaFAA25x77SPtKTVi8TlHdlOALBOvWvli0z?=
 =?us-ascii?Q?on3+B/udRuGVxfbPAUWWZxAJos5isrBDifMDslS49af3Pm3d88/K2frYWWLp?=
 =?us-ascii?Q?zaMB7DJwAzJhFh87YEq4BjZeBj+Rrkzu7lMpVvk98ctV99mF6wlclENK9yg9?=
 =?us-ascii?Q?gMzzRk5aKTbhbmDVSM4Ddz9tN5cSq3r0VWxEAxX5bElHe2epiWJiwwO0xPAj?=
 =?us-ascii?Q?H6mZ39MmWE4DLAZCbnupfPJHUNHOg/gWMwYg0c71K+7uIHL/oYRieznlDYbX?=
 =?us-ascii?Q?AAb9WXCKD9YlslEtnQwyOW78kYB/2GedF9MKoWLb?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a1cf53d-ecfb-4edc-d264-08dcc7f6e00d
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4211.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 06:50:31.6766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YisNLIhQwlXylABDjTLa72EG/D4VDA+r+nLTxkN5zKpbO/PQOt/apqEQGUVr0vyUqU24gpIourvrt7PhDNRJ7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6822

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids the calls to clk_disable_unprepare().

Signed-off-by: Wang Jianzheng <wangjianzheng@vivo.com>
---
 drivers/pinctrl/renesas/pinctrl-rzn1.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzn1.c b/drivers/pinctrl/renesas/pinctrl-rzn1.c
index 39af1fe79c84..6a3616944b37 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
@@ -869,12 +869,9 @@ static int rzn1_pinctrl_probe(struct platform_device *pdev)
 		return PTR_ERR(ipctl->lev2);
 	ipctl->lev2_protect_phys = (u32)res->start + 0x400;
 
-	ipctl->clk = devm_clk_get(&pdev->dev, NULL);
+	ipctl->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(ipctl->clk))
 		return PTR_ERR(ipctl->clk);
-	ret = clk_prepare_enable(ipctl->clk);
-	if (ret)
-		return ret;
 
 	ipctl->dev = &pdev->dev;
 	rzn1_pinctrl_desc.name = dev_name(&pdev->dev);
@@ -884,7 +881,7 @@ static int rzn1_pinctrl_probe(struct platform_device *pdev)
 	ret = rzn1_pinctrl_probe_dt(pdev, ipctl);
 	if (ret) {
 		dev_err(&pdev->dev, "fail to probe dt properties\n");
-		goto err_clk;
+		return ret;
 	}
 
 	platform_set_drvdata(pdev, ipctl);
@@ -893,28 +890,16 @@ static int rzn1_pinctrl_probe(struct platform_device *pdev)
 					     ipctl, &ipctl->pctl);
 	if (ret) {
 		dev_err(&pdev->dev, "could not register rzn1 pinctrl driver\n");
-		goto err_clk;
+		return ret;
 	}
 
 	ret = pinctrl_enable(ipctl->pctl);
 	if (ret)
-		goto err_clk;
+		return ret;
 
 	dev_info(&pdev->dev, "probed\n");
 
 	return 0;
-
-err_clk:
-	clk_disable_unprepare(ipctl->clk);
-
-	return ret;
-}
-
-static void rzn1_pinctrl_remove(struct platform_device *pdev)
-{
-	struct rzn1_pinctrl *ipctl = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(ipctl->clk);
 }
 
 static const struct of_device_id rzn1_pinctrl_match[] = {
@@ -925,7 +910,6 @@ MODULE_DEVICE_TABLE(of, rzn1_pinctrl_match);
 
 static struct platform_driver rzn1_pinctrl_driver = {
 	.probe	= rzn1_pinctrl_probe,
-	.remove_new = rzn1_pinctrl_remove,
 	.driver	= {
 		.name		= "rzn1-pinctrl",
 		.of_match_table	= rzn1_pinctrl_match,
-- 
2.34.1


