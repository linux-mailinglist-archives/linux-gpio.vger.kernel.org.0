Return-Path: <linux-gpio+bounces-13333-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CA39DB14F
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2024 03:01:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09A502810BF
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2024 02:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AED7338FA6;
	Thu, 28 Nov 2024 02:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DV5BPpTG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2069.outbound.protection.outlook.com [40.107.21.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C1CDDAD;
	Thu, 28 Nov 2024 02:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732759262; cv=fail; b=b9jCgz8rM2gLMZjCV+VessNMvnXyDl9qxbpavM+88kZ7yayC/pzaJvHkWAHRLTJYPtjto0mO4WW6IFm7dm37gIeIhuBuaYAEjpC0F54DJgsCLjkK+cknmtg5yg+DpeeVoEqHR3RhfClsHWfCAy+anKrdrb4Qs1KwCcv8q6pR2+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732759262; c=relaxed/simple;
	bh=eOk6Diiw4MFmoiZNNwdBURGcrorZt+kWwYAuQPUibhI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=qoLY/75guWZfTrMW6odeHL3qktNdWUiRQccxOaftGhctiNTpm95bZnnTAZ3mzi11sHnv2bQt/CJjJJarYpdroTaw7vtLxFoJ1wGxQQK0ZCWzblZyHmhQWmgvULWdLkgpIRUabiBNOHQUIJSsgRIe2zYUZthSGqW4L5a340jkPUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DV5BPpTG; arc=fail smtp.client-ip=40.107.21.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWOmRukwvpGS/MOTNH+nB3qI1/b/Tab/y4LQGBMsTHfzw3tj6pU4Vy3uKQEu7VlbzylKDee1kWZ8k0UbA6rg2fzVhHK9rTrqE2FSlYvm4J4BiCKGa8frG433db5gnQWSh0ugCdfXLbfiE6vMmoelrephFhlYfGEPAayCFQuEsph5b5KjpPXqN+Jx0BET/gPaNKIpuwmeqSjOKgbUQN5K1l4qQ0Zs7SFqT1gCIyKdRg3l4dTXRJfeiiG3ej58lro8IlGUtev8HlFgDRcTNoj4c8OORM6GHhGrzL1ABHvfVwGBiorprCD9tzIVkbYphU50oHAU85Uwi4IXlEP1QxWLpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HbYzv9+E5Xb+bR9vCC1HuF8NtSHKD3eFYNLGvFihl8=;
 b=nrHOz61zHd+AWf8udbl0HGTXBK1aLlEJWXg+ledHDaXytY23xq2Laetp7d3tGGSvALdltZAGK+OxWi5aS+UmTrC5pWOhI8nKQSPBrS0jyWMnlRuqmu3Iy/FSO3Tbz8I73ThY2/IG96NpC9PLMC0K1uth2rshJZwwIRdvkfqsmiCNCWgM/fctilYvbnYmpJGe6jFl0KgWmnR9KfB/NzjU0iMWrRzpvuQIfCEqS/z2MbX0jQMlV1w3JINjN1eA/4sXjmRWtaS3wuXIuuO0ecb0OXeFHqTrAlUjHr1d72DY3KRoKiOUzzGQd/B00IRirp0meEiiNFDYWNrnjYvsRt9S7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HbYzv9+E5Xb+bR9vCC1HuF8NtSHKD3eFYNLGvFihl8=;
 b=DV5BPpTGLBdJb7C20lrDm+tk+pVJyrlPcmJijjbr5axkciHJoJoEopfUdcPqftvb+WQ2a37IEC6WnYRNJQkVU7O3sARW8UQ5UkHgSwWlODz7Wkk8G6LvjQNrKT3QHIZlvRITe9l+AB8weSZ78qkVA+zorgpm59RMUlVIFGtzPyJU6Oy9P7j4IbDpQ8XP+9U8Gffk0GFqH7rU3P/YPI0zLM0fyHPPV06NSZu8HNaWeEDdTci/UHSpHghEY+maf5ruaMhAFTdsV9BlHeXU9EUrjcMeDDmzEt45xU4PwfG0j3scm34tshfZfzx2Up+3DjtIUE/rJISTCu3WGIGIpp6uYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by PAXPR04MB8391.eurprd04.prod.outlook.com (2603:10a6:102:1c4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Thu, 28 Nov
 2024 02:00:57 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%5]) with mapi id 15.20.8182.018; Thu, 28 Nov 2024
 02:00:57 +0000
From: haibo.chen@nxp.com
To: linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	marek.vasut@gmail.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2] gpio: pca953x: do not enable regmap cache when there is no regulator
Date: Thu, 28 Nov 2024 10:00:42 +0800
Message-Id: <20241128020042.3124957-1-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|PAXPR04MB8391:EE_
X-MS-Office365-Filtering-Correlation-Id: a345cc9d-5dfe-4092-09f6-08dd0f507fd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gduHQWDfAQv6BHCsvcgW+Hx4WkOYa3aLGgeX47WvLoxfsQp1KxHoL3+WMD3i?=
 =?us-ascii?Q?RCr74uxFTXLQ0gbpOX5PEvUe8LH/jfB6MWw7FztGqtGLkHY5noa8seT5ruCe?=
 =?us-ascii?Q?CBnBHE/RLSkuAai5xFmTOeWigBaeSBErNlxav8yK1OaRGNoAuqpm0UO5D5cp?=
 =?us-ascii?Q?5eDbD6Ewq5X50FfiDWrAalpOgCfViHqd+uTi6PvMRV6SaZdo1l5sTLYnog6e?=
 =?us-ascii?Q?kM/mQel54xkYGcP2ujCgr2nkoTA0LjJ1aSHAttyQrHknqen0aUac0voyPTyV?=
 =?us-ascii?Q?pLvmPCbKtrT/gOXhOY5/8MNimLEkAqOb9L7Om2g3RTETUZMhHkI8feEIu+G1?=
 =?us-ascii?Q?Kvjj8AGf6CV2nnnlZg2nu9ZB3K0VusTD+18Mi7i1mmhRpdarb/iqTWKk47oH?=
 =?us-ascii?Q?ftchi7/WvLkYyJ224ggz8J9ZeBLPtOWNpv1RDIhhlXww3fxPQzBvkOxXI00m?=
 =?us-ascii?Q?zouMF9ZyfbVw9HBLomcoXqDbOSXyvGitOWYcp57ce74gX9g6iyH3VmXHGxQC?=
 =?us-ascii?Q?h+oZsqqwm8om6lYvbKMNn1OT/y4isTut2zs8wdlrSLEn58fxhN7UoYzcAyt0?=
 =?us-ascii?Q?17kQUf3jk/oXUnRuYUkeKhr+lNyiIStP6N8hF2Ab0y4jttEg7kwJGp1c/TUU?=
 =?us-ascii?Q?zUgnCdD8tuAH0B2YO5Y0W8v/uMwj0TF/ERzfMLlZhFeQ1VOIgOSJleHlyWGU?=
 =?us-ascii?Q?pAjquDPbw7Pv1thJ4QcQ1m3biK3VcKXITYb5ojUeNQGx5v+i7CneXh12AO70?=
 =?us-ascii?Q?ATqWgxJCV84uZ6iTRoMBbER6w/2sQ/oIUJuyOPZtkDTK9C+v/NrY8IYWxl0E?=
 =?us-ascii?Q?nXNQ1pOjb4pP31Veb5RcC5cu63Hwk1BtphtuB2kJn/hvVX9e5L3UaDxEZ34j?=
 =?us-ascii?Q?LE/9Xnh0w/gcGihE4MzP/l3dk3/VHmCfUhmzc6OZe4b4h3UrFJp+2zuU5vFg?=
 =?us-ascii?Q?07xJu59gxFOFPW/R7mMNMJQy6i2dIDRZUg61Z2EHW/rkUxSEd7c9043Mnkol?=
 =?us-ascii?Q?naSvo/CExkvFX20h6WeLj+rf1cm2jHVHtkTlN6drjr5DRBWFl2glD0SW+sbx?=
 =?us-ascii?Q?NforIu3k4gQRRylh3tkyrEnchm0IwVZfem8H354wwPJwlB1BnlE/lhLukOVK?=
 =?us-ascii?Q?8l/RAAKmBxF6lqa8t3cJLz0locT7PX3xI8/KeBoELoyfQdwp+Amkp/WM0JHX?=
 =?us-ascii?Q?msRzXWliHCR7oPZgvva10i0dtPSDSt1kREJlTqr4DvxDg1JrBjDqMi9PwGYb?=
 =?us-ascii?Q?9h7X33k5JVCr1jq2RBopR+mXIpLDJPvpUBTYysm+UrURXc+SRbX/rePjSKzV?=
 =?us-ascii?Q?yPrHKleKLux7aD7GYHmgqi384ZnGnm3Hv/mM0BLFQVwWHI/69iu4WpNUxqtm?=
 =?us-ascii?Q?jlk2m8l4JHOCAzVhblIpl9Sehbl2Xeg+HnWUMdQUNaecS3yG7Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jxLIF2UGX78yNjp/6XXVkRBwP7Ka/njy3L/Tfc7n+Rwe4SfgpUIiKPZlRaZ8?=
 =?us-ascii?Q?FiQwk1a4MGuLdJcjg/93J4TjD0vKdc/EdpYtEcvfxvnF1S7WGkdPt1iMbHp6?=
 =?us-ascii?Q?rJOPFmKtgdrVrvJBJp1Tje3a2K4xXcDugIuwtVVYy21lpyPbC72U88DWDS5J?=
 =?us-ascii?Q?uv0yGHyu8qhx1RZLuzjKlSl/gB3xOmlSNBfhdfEUcfbjJDfKZjMQLBUYdabN?=
 =?us-ascii?Q?p18VifHJCHipShtjvFVsPugsyB++Q30QPw/KEFm1sK2Cg+giOELwAR0pQMVx?=
 =?us-ascii?Q?O9s74bvsqILo4HlRuvXeNTXXqxLAs3Ggleu3R8gaMQEv3OIpDEBstnsmu3ge?=
 =?us-ascii?Q?Y2z4dB1/w4+e1nN7XUJ6iOvjw+zklXixqlL6OCwoBkcyUrRuEfhJmPGocy/K?=
 =?us-ascii?Q?DVvkjGzTXx3ERTP4QJCrd+yoUDJNERqsLK//dHLN775J0QmWaOQe8s7sS/Fg?=
 =?us-ascii?Q?A/ftzAYZutuBJsoe0laI2kS4UZlkRW/lfDEtaBBUt388eMlINFs1NibhPhSS?=
 =?us-ascii?Q?TSThJj4eIXedoACj3dciORX9V4Lnvjp3X0Xxp8iGfGXgQWL9/Fo4O/IBhH+F?=
 =?us-ascii?Q?qSutAMfxpzVuo+4etgNk4yA3890/dQ1dGpvtQqP1RQ9Hx15zJdISlBVMWDxi?=
 =?us-ascii?Q?ys4rAZNHUrrruEx2kzR/e3IjRp8LOPnnLGYcTs4AdscME1V+g3jE0cLbAeL4?=
 =?us-ascii?Q?z+Wdp0D6V6y+R/wc3oDrLCHX4ddt7Nym0PznoLFm8uqldckhEE/SPvb3Cf/2?=
 =?us-ascii?Q?7EM+Ng/EbwRD3WP9COtrHw/m46Am4Xv4B9UsTZ15mXmdAkmyNib79ThFubG9?=
 =?us-ascii?Q?9RgK5QMGQjtOoIbiph0m4IAZf6Vyl5ABfG++quyEvrRnZdM3Rv1DPZ6+Okjn?=
 =?us-ascii?Q?uig6HI6jPaoyrlK2LTeiAMUtRjMcqCvcgVZh9+xnajZid8uJ67IuCNgmPy/F?=
 =?us-ascii?Q?xSeLY9NgMmfKD7gfGSrA0/8qR63JupMjX4teW8fgoZuBV091fe+Sfjl+ecQd?=
 =?us-ascii?Q?MnvXDd4mH7ubUFt0JKs8CUQIETEgumanw9MvAXb1hJKiI3GZcfrJY9uJi++A?=
 =?us-ascii?Q?NqAr3J9mPRZYag5frZewTkbHG41Ib/lSrMAH6YpJ2SEXzWx1XTRUjMzJKMNp?=
 =?us-ascii?Q?s69kMST4X7ISjCwE7hBffaSqUTkGGFVwEHu+DjrlJsxYHfKnXbJJhCSmCCtd?=
 =?us-ascii?Q?gUV626CD9+bXqy9q6agd0BJg+VOlxJf1BrEGRNwE2ReuTKPTg9qYapme34YA?=
 =?us-ascii?Q?VF77lzDrHSl0MzyKxPDegqiPtSV8vI8ynW2xTTOU41IUdgnDSHFIZtboVkSf?=
 =?us-ascii?Q?P4uH0HXWz2MzHXCSunsdobDVri52ruyOnpQ/pcsi6Se2fgS3SguConzO139s?=
 =?us-ascii?Q?saCy+hPoe5XH/tupcI5CXSgGz9q1pz+H+E1ruAdveBL4BzrdVkmfISZ5n90L?=
 =?us-ascii?Q?ovJNh4Fv5YNSkt4mONUptKJjnt7vw8xO353he6UY337kFTZuogNfJdPnBt8T?=
 =?us-ascii?Q?ZtDzoXVXv26FJxxOnJzLgXXhU7Y+Z02GXGmDHSy2TxvIeNqaoSuAHDfuuj8m?=
 =?us-ascii?Q?om+pFcUrIxE3z7FrarP4kKIvHZWBaaoQrd1bEtAX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a345cc9d-5dfe-4092-09f6-08dd0f507fd6
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 02:00:57.4788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mRmO61rPgLo9j+FI0w+UZ3Fj2mDzKBM+qDbRftGYFVp4jRu4V9yi2U3+2wAygn+tgcC6cf79oA5/8z9O+C/KWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8391

From: Haibo Chen <haibo.chen@nxp.com>

Regmap cache mechanism is enabled in default. Thus, IO expander wouldn't
handle GPIO set really before resuming back.

But there are cases need to toggle gpio in NO_IRQ stage.
e.g. To align with PCIe specification, PERST# signal connected on the IO
expander must be toggled during PCIe RC's NO_IRQ_RESUME.

Do not enable the regmap cache when IO expander doesn't have the regulator
during system PM. That means the power of IO expander would be kept on,
and the GPIOs of the IO expander can be toggled really during system PM.

Fixes: b76574300504 ("gpio: pca953x: Restore registers after suspend/resume cycle")
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
Changes for V2:
  correct the commit head, and add fix tag
  fix some typo in the code comment

---
 drivers/gpio/gpio-pca953x.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 272febc3230e..2ef1db58a6a1 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1040,9 +1040,15 @@ static int pca953x_get_and_enable_regulator(struct pca953x_chip *chip)
 	struct regulator *reg = chip->regulator;
 	int ret;
 
-	reg = devm_regulator_get(dev, "vcc");
-	if (IS_ERR(reg))
-		return dev_err_probe(dev, PTR_ERR(reg), "reg get err\n");
+	reg = devm_regulator_get_optional(dev, "vcc");
+	if (IS_ERR(reg)) {
+		if (PTR_ERR(reg) == -ENODEV) {
+			chip->regulator = NULL;
+			return 0;
+		} else {
+			return dev_err_probe(dev, PTR_ERR(reg), "reg get err\n");
+		}
+	}
 
 	ret = regulator_enable(reg);
 	if (ret)
@@ -1240,11 +1246,20 @@ static int pca953x_suspend(struct device *dev)
 {
 	struct pca953x_chip *chip = dev_get_drvdata(dev);
 
-	pca953x_save_context(chip);
+	/*
+	 * Only save context when regulator is exist,
+	 * if no regulator, power keeps on, can also
+	 * handle gpio related operation.
+	 * e.g. PCIe RC needs to toggle the RST pin in
+	 * NOIRQ resume stage, so can't open regmap
+	 * cache if there is no regulator.
+	 */
+	if (chip->regulator)
+		pca953x_save_context(chip);
 
 	if (atomic_read(&chip->wakeup_path))
 		device_set_wakeup_path(dev);
-	else
+	else if (chip->regulator)
 		regulator_disable(chip->regulator);
 
 	return 0;
@@ -1255,7 +1270,7 @@ static int pca953x_resume(struct device *dev)
 	struct pca953x_chip *chip = dev_get_drvdata(dev);
 	int ret;
 
-	if (!atomic_read(&chip->wakeup_path)) {
+	if (!atomic_read(&chip->wakeup_path) && chip->regulator) {
 		ret = regulator_enable(chip->regulator);
 		if (ret) {
 			dev_err(dev, "Failed to enable regulator: %d\n", ret);
@@ -1263,9 +1278,11 @@ static int pca953x_resume(struct device *dev)
 		}
 	}
 
-	ret = pca953x_restore_context(chip);
-	if (ret)
-		dev_err(dev, "Failed to restore register map: %d\n", ret);
+	if (chip->regulator) {
+		ret = pca953x_restore_context(chip);
+		if (ret)
+			dev_err(dev, "Failed to restore register map: %d\n", ret);
+	}
 
 	return ret;
 }
-- 
2.34.1


