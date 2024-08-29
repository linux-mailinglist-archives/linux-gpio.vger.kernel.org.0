Return-Path: <linux-gpio+bounces-9337-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1962963BF4
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 08:50:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D90F1F256D5
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 06:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC4815E5C0;
	Thu, 29 Aug 2024 06:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="TLyovVo0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2077.outbound.protection.outlook.com [40.107.215.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA5415AD9B;
	Thu, 29 Aug 2024 06:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724914198; cv=fail; b=gfv19XhydnwyF+cQU3bjg8zwEP1pObY+wXyXOWeYCz9C+tS1JlE35tXG88qiAY4kCEYAq6J+BHUxJfXCNoT0BQijm3W6FO94AjKn73rq/iynna0zCx8ToJX18HVGOKCZzrnbdY5KLCxjdWToMZb0uAeoPDLU9Eq10gnw0sBD34c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724914198; c=relaxed/simple;
	bh=I9Qy9u+CEvhEOLgLDJAatowLcxt5ow2wKmqXUUFu8DE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=H5kSWEOMVgM1y11T39vEze+kROFAN+jAhSY5KXMXNfnyPqvgk10Zv+k58ZpEwfcx5cm12val/gklN5Rsp0i+eFVpC0tB2onDCYEhAVzFvuy75mVQz4/VBJKdcraetTINAqrlu8i6CyHFQiFl9P6G//medAcu8Ogl/RTelxcZrI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=TLyovVo0; arc=fail smtp.client-ip=40.107.215.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Px6ArrXrS0xViRr8xBI3A58wRHQFE5pHLINCUE8m++UDvEx7KIzQ+lVNVoNek9xGN33KDrQNEXyhRpkdm7vG8KHjxep3rsPtJxnixHFrncUvB24fLwK1mD2BmbFDNQz/SL+bQ2Qjoe7zS6QVO++LfGWEr54scKmb7SC+mpiUBAZK+rs2AmxoIPF+cyVbR9V6KXIFje2IikiQ3zAbkWICULuY19nK/MlTjaup8l7E4/5XObr0+BzPBdvwhAUXVSDLbzWcHh3FPwIMhP+JoaaYPVjc39jSrY7biDdvCw7uvgB1LXArtN582SqzMJBKCX8J5gP0rIe6WZBAYwJV1Fkjew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ERW67835KJU82Kiry6wBE9lAwUEgX1142JZ2NSdtbE=;
 b=DnPsEFDut7MffD93l25/3Bn8Z3XjaBiHVQjSubrm7ec/NPpWA/cjRRl8v2dgRkwUX39pahc99klVuw7H23ay0V6DrAiSZ+uWNIi9DbWqmg0lnov/XNZZi8YI+FJdvSNdwjWkW580Xy6HYVVQU9n2fuawPh8Gd5yH4ZpueKkW2HHsmqptDqvKugqu3FZoGDB3KEJMGsg7RKedsIPMP6RS7XDcrYoZ07POqpLXb8lYsyPUTBf1moDC9S9zWHVOw6uWyld/pk34N68mMlGUxg0JKCjnt0IJ/LZHxvpl56YERlxYyKqUotD59eoHTuR9nqwNOQiY4/5Go0Ad3u28A8D8VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ERW67835KJU82Kiry6wBE9lAwUEgX1142JZ2NSdtbE=;
 b=TLyovVo0ZMTewBlsJ4Lh8T7opJ9xbj7eweVQkE/aaWIHvkOAZjyjxfWS2GRH6+nVP9T2PA9kE5wotK0H5CRjA/8kiEm6aJrsnuI+I5gdOOENn1y1jkUR3N+0+qxZLNjbXXwVcoSKyoadiy5NX2MCDqXHHLFs/nTgw3qkiq6fKQNAtgDFvHyKFMfdOUlWERMO8yBQxeWLmtIVJBBCKOfL1iQPdpPUgBtzO65RKFZfnmrrs/D50g1pa4DgiLic+CRqexBKb8/mzJ0F2swzj46509re+isEOunsRLPXAOORmtrZ5Ba26sDx0Q7Rofth5tXqxfL9Tv127MZ8h9slo0TMyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4211.apcprd06.prod.outlook.com
 (2603:1096:820:23::14) by SEYPR06MB6822.apcprd06.prod.outlook.com
 (2603:1096:101:1b0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Thu, 29 Aug
 2024 06:49:53 +0000
Received: from KL1PR0601MB4211.apcprd06.prod.outlook.com
 ([fe80::29e8:8083:a2b3:bd1a]) by KL1PR0601MB4211.apcprd06.prod.outlook.com
 ([fe80::29e8:8083:a2b3:bd1a%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 06:49:53 +0000
From: Wang Jianzheng <wangjianzheng@vivo.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-riscv@lists.infradead.org (open list:CANAAN/KENDRYTE K210 SOC FPIOA DRIVER),
	linux-gpio@vger.kernel.org (open list:CANAAN/KENDRYTE K210 SOC FPIOA DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: opensource.kernel@vivo.com,
	wangjianzheng@vivo.com
Subject: [PATCH 4/5] pinctrl: k210: Use devm_clk_get_enabled() helpers
Date: Thu, 29 Aug 2024 14:49:38 +0800
Message-Id: <20240829064938.20114-1-wangjianzheng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0310.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::7) To KL1PR0601MB4211.apcprd06.prod.outlook.com
 (2603:1096:820:23::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4211:EE_|SEYPR06MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: aeb346c0-f52e-4f7c-ab51-08dcc7f6c91d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h4y7tzYiSVtysS00k+r8cKh5ZHqDRZlAlOAqiYgYa2sbQwlgpe6Qp2/tMY7n?=
 =?us-ascii?Q?a4hgtYlvo0DONCjxe61+aZj0gb7sumkWn7rDbYvuYVCqEDaLNigtBNkxw3OB?=
 =?us-ascii?Q?RIOITL/LrjnwdjsJAebsqybzu/xtuAKEoo1VHE8BfhJZMychxaHqg59m4Zeu?=
 =?us-ascii?Q?Qm7zm7dk9JLyGWApkWBV+k0n9NglYt9nr2aTctu/R0x8pqrEiff233BE78uh?=
 =?us-ascii?Q?BT/iDzi4X7pqZE8W6MzCJk35ElIWqCqc0u9l1kZOsoogdW11wZaix12+6K75?=
 =?us-ascii?Q?Tk/mGY746KN6qrlVyIK8yDropw0sLHBAbEbg2AYYvlHj0hVz9ZMV0eudL+Q6?=
 =?us-ascii?Q?JOknwEXFkrpUafAM+MaBSsFrbsezyl1Q7Gcjld1jwSt93c+C5323wJWcbFEe?=
 =?us-ascii?Q?5bdC95KPZ0+DA8b0iMXez1H9i31+SD/56wdZb/4vwPAXMVMuaJbpVvReobIb?=
 =?us-ascii?Q?Vtav/FNt5Xa2XUYygfvfOaW8UpuN91P7i70h31HiLyERZXk39iB2kyWEZ3TY?=
 =?us-ascii?Q?9EWbVV0rOvBElXkK4JY3lH+PHkkTqwAJBeSAp2Q7T2ejRnZzKEpsjFaETSIL?=
 =?us-ascii?Q?A0ub8prknMK3IiXum4/oDqkoiH3cogB+RoEx13zknLRN207FRPJrtNiGlbWx?=
 =?us-ascii?Q?pR210BXNSWOo3lci2iBs+8ZSL67+Wmeo4r2Vay2RDDLScx5X/aQyGh5FWJgb?=
 =?us-ascii?Q?cXXQwQNMhoeKxCG42CQzXmE0/6L1CvpmSQpkxCQgKfHlCHUTgNDT8v7KgHxs?=
 =?us-ascii?Q?lLvjS5wVuEitrbcvtDn2uPFn8f0XBE/Ca9yRkQdqfm7AmooMBDl5Gkle7hrR?=
 =?us-ascii?Q?kwSgUyfb1TIcw7xvEUvm/MNN6bwCWSpDUFQdE+f794xK923ujJ/qyySY0sYD?=
 =?us-ascii?Q?OSUX0K9ywXHfwgCaioKaVckxJSd/SAqqZYLICDdnBtncdD3Nsj82T85T+Ms6?=
 =?us-ascii?Q?8GGXyX+l9F5uThaTHVmAd/mjvTRdMJKl3dTOM5wB/FlvrkdDJ+KOyAMqQX84?=
 =?us-ascii?Q?r+0NTZ0MSQ0LOwUdqsTcoPpr8H2H2/Lr5hqyN7vG4tjqAZ2ymXKXaonakYU9?=
 =?us-ascii?Q?V7I7Rbq9ejX+w0tIV1qz6e5VuPd5CKrwetGinWWB/yraP5+f3tnRIn3Uu+oA?=
 =?us-ascii?Q?T6bqQ9ovziuLmrJq+/pDNlIndkknggYbWLfEsC3rQcG3QY6/VEb3SFmbokS+?=
 =?us-ascii?Q?M1PVjlQRoxN3UpXFruKFl8Gm860KFw+YZroQoWOlXgtnlRI3XVsrFdS5QNHp?=
 =?us-ascii?Q?HMrlkNMxHhiZfsIlJJBUtYPBu4KJ4XJWrUDqvaRqxePrcvBoZrp4lgjSrGYu?=
 =?us-ascii?Q?e1plGcmODLR6/D+8OaYaV44qfx7RHo5JT3TZ+169vcMS7k1nSotQLEiDjEEN?=
 =?us-ascii?Q?yOS+RmanqtgYhBRwHKIB3sXkRb5PHq95iO6nCqUND6uGRSHxTQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4211.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6j9YJUGdlom/69klZPow2FuqvdOCG+RROvjQTR5P596xGomcJNJkDszptr+z?=
 =?us-ascii?Q?3Ks2twCZY61mSK28yb49KbAAHsEyaBNMnkOxp8e2I0CZMgnf98DlrjXJKhJ+?=
 =?us-ascii?Q?/GGGXKfxi0bW2jsvgO8GHTN/6dszyUREDl18q2Jk/5aV6lJjJrbefakLdx1q?=
 =?us-ascii?Q?PTvFt+05UkDrerlzFDp4J1t6hs48kltdPcJBzesE9E47hizOtSlfVpNyjs8S?=
 =?us-ascii?Q?JCbsYTJXiChLWKqTQ1d4NOu6eAQxJYXTAWmCQP4ypIFCQskFU0Q7f6dQCY9x?=
 =?us-ascii?Q?TyUVzW9I0lCLvnROCeo/2JEhIITsBxYQXkIMKS3966AFpYWVhBHvFT+kf3LB?=
 =?us-ascii?Q?jOh/87Y8UIZax4Mxs7H+fYptjvncNNUD0tRIpZ37jufeJZU+2mDSdsc6no7T?=
 =?us-ascii?Q?raZsb+a1n+7Fd8berMv6Dvd6QtzFsamsxTOLVbSS0Osqszg8fT80Z15mWY2p?=
 =?us-ascii?Q?cpgnW7SQ6HqUDxRKmZFcnVLDERruWAz5/TcFZGGW5qtNJZw/PWeHQcfDKeK3?=
 =?us-ascii?Q?cnkpy7my+J/nD0b1Y3UFcMjqe7W/u/440NhCX2PNAv93JeB0R2E6LwcY2dqg?=
 =?us-ascii?Q?3TbBp/tWhy944EXH3KKykL31Cms1Htt6HC2Ag3Mwlnd3FmqsnR/C7gpkZPXR?=
 =?us-ascii?Q?g3hG+zayoM68Ti/+qb7U3cm/5crXBiw7MHGpTxdxVi23w4FKwNg0bAgnckg9?=
 =?us-ascii?Q?N+7qsuJugT26AJSYcJXqPs7YNIQc5ozN9a9UDFXQxcoBLPoqHuH5E7EeLGq4?=
 =?us-ascii?Q?BPRJ9s3te5Bi7iikBOxLl0moN7XbpvyIKdLuVEekLqvx069F/Yu6soum9+TY?=
 =?us-ascii?Q?Y0eqorbCY8CWntgCTXMhIl7C3KYB2kPjDn27fP77djjsW/Bn9/wXeqz/OHjk?=
 =?us-ascii?Q?9jVdn4mL9Btyen1pfpFgyylpd9TujvlwbvmKdE/9MRRoEkFxDRqg+pTp1AHT?=
 =?us-ascii?Q?lFniJGIsT9QNVQQ2Hc1z78EPCNP/QYILCaxLL75wUgBy9zOQhIGGksb0ASKP?=
 =?us-ascii?Q?S4sk/I878zj1N1ezCgTZtrSsW4AZ6ywdjzcBWGfX5eSBJ+m4kkqkm3yzvEa1?=
 =?us-ascii?Q?pTV4DJfcYkwGBrJIaVPixveQUwHbOUhKAx0fHY1Mjz1yTCR2wqUqw5H8Fyud?=
 =?us-ascii?Q?AKlJc8oaQygM/fIhc2bToUmFjRS+Z46hYiZGY3gtEyi/1bsdyXhEF8TASYMr?=
 =?us-ascii?Q?Dr6oWArp2l2K6QpXUMev39Zf7HSCOy57NMvg3g2tb5zeBfUcMQQftcZCOGTt?=
 =?us-ascii?Q?Ryyo+RAQPNATYi1Cz3u5vJfiS72pEytgxeI76FkzoVFagTtNZ0nOkbwgxPOb?=
 =?us-ascii?Q?vnASrgM800U+yxFn4UlONQzUit3xVFAmAAAD9r6bRH0JmWwUJ823rL6WXi9E?=
 =?us-ascii?Q?mAYgXbziXp80buYmwZiIP7KrdwvbPeQbl7sLngrI922fuk+Z+KbqWD6DZH8v?=
 =?us-ascii?Q?lq3njBsDNI2XI8o9OPYiM1ByO+Q+LOBBa062cPJDIGQRFMNckSYdBQ9TYHg6?=
 =?us-ascii?Q?bOTTiLiDpbbhywWNewpnXhAnOh/3taouUVJmqbvfZ/XuN/5hlNF0ev50O0bv?=
 =?us-ascii?Q?x/DINx5dEGQc98CE3cG/vUviuAlmS1QM1bhJoMnu?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb346c0-f52e-4f7c-ab51-08dcc7f6c91d
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4211.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 06:49:53.1315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gYNaXTFOuGb9rTOzww2H0qAjirbKru9o6NiCc+67Mi5GBafa3fcnIAs9mcTxJbT4nT/R/afKcq23TqjL6y6E4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6822

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids the calls to clk_disable_unprepare().

Signed-off-by: Wang Jianzheng <wangjianzheng@vivo.com>
---
 drivers/pinctrl/pinctrl-k210.c | 35 ++++++++--------------------------
 1 file changed, 8 insertions(+), 27 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
index a898e40451fe..0f6b55fec31d 100644
--- a/drivers/pinctrl/pinctrl-k210.c
+++ b/drivers/pinctrl/pinctrl-k210.c
@@ -925,7 +925,6 @@ static int k210_fpioa_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct k210_fpioa_data *pdata;
-	int ret;
 
 	dev_info(dev, "K210 FPIOA pin controller\n");
 
@@ -940,46 +939,28 @@ static int k210_fpioa_probe(struct platform_device *pdev)
 	if (IS_ERR(pdata->fpioa))
 		return PTR_ERR(pdata->fpioa);
 
-	pdata->clk = devm_clk_get(dev, "ref");
+	pdata->clk = devm_clk_get_enabled(dev, "ref");
 	if (IS_ERR(pdata->clk))
 		return PTR_ERR(pdata->clk);
 
-	ret = clk_prepare_enable(pdata->clk);
-	if (ret)
-		return ret;
-
-	pdata->pclk = devm_clk_get_optional(dev, "pclk");
-	if (!IS_ERR(pdata->pclk)) {
-		ret = clk_prepare_enable(pdata->pclk);
-		if (ret)
-			goto disable_clk;
-	}
+	pdata->pclk = devm_clk_get_optional_enabled(dev, "pclk");
+	if (IS_ERR(pdata->pclk))
+		return PTR_ERR(pdata->pclk);
 
 	pdata->sysctl_map =
 		syscon_regmap_lookup_by_phandle_args(np,
 						"canaan,k210-sysctl-power",
 						1, &pdata->power_offset);
-	if (IS_ERR(pdata->sysctl_map)) {
-		ret = PTR_ERR(pdata->sysctl_map);
-		goto disable_pclk;
-	}
+	if (IS_ERR(pdata->sysctl_map))
+		return PTR_ERR(pdata->sysctl_map);
 
 	k210_fpioa_init_ties(pdata);
 
 	pdata->pctl = pinctrl_register(&k210_pinctrl_desc, dev, (void *)pdata);
-	if (IS_ERR(pdata->pctl)) {
-		ret = PTR_ERR(pdata->pctl);
-		goto disable_pclk;
-	}
+	if (IS_ERR(pdata->pctl))
+		return PTR_ERR(pdata->pctl);
 
 	return 0;
-
-disable_pclk:
-	clk_disable_unprepare(pdata->pclk);
-disable_clk:
-	clk_disable_unprepare(pdata->clk);
-
-	return ret;
 }
 
 static const struct of_device_id k210_fpioa_dt_ids[] = {
-- 
2.34.1


