Return-Path: <linux-gpio+bounces-13306-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5BD9DA2E5
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 08:15:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BB2716912C
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 07:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BACC014D433;
	Wed, 27 Nov 2024 07:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aTM/JntE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2062.outbound.protection.outlook.com [40.107.105.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4455E149C4F;
	Wed, 27 Nov 2024 07:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732691707; cv=fail; b=GBGY3mTyr6Rq1211rxtQBKwKqGGwEol4nD4j+JhIoBX0V+bijwk6DgfZhxgez+WAkMDV5biSvOAVwiCgiOnOlBM81CTvGeTCsORq1+cqDKHG800szng0BPeGIlyCvxUzdSairiozluroL9oGf7yS91DYlx3Z8bbN0HdtxxUeVnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732691707; c=relaxed/simple;
	bh=qKBxq140XYY997ZMf5duMh2872iONVGgTIm8jhD77Cg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=PgELZ44KK5t8GwAPuCPc/mWwfHg0kPbW2MkMa1lVh1xwR6SDG2bop8I5YsxNwGnMmkP7fpSjBFohwjEU9wXaArierCqr72VyeSVlxjqBExtZGrBu2qbxlhy1Ll/GnwHtfO762zhx1UQ6209VK8wWTDw4VrelZTXCqf0P/pDStGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aTM/JntE; arc=fail smtp.client-ip=40.107.105.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ApUAm60K1Ix8PXv95IiTkmk7ZBh9Uq2hmqINOtXnCwVIIXthdw/Ln/AarJ7JFbTkY8yOFLOLh6+RyJe82k/xgjCgi+ByRKBNw0yxU6bjQYOzyW8nxIVhCxHwZqIi4qsvlPVlOqHk8kvgZm/NY80kuQfh42KgNSEKIMAsv1fGnia68CD8V6f1/H7TeKrMr5TrQjq9FGZ0LSZeZm3be0+ajf9fN3efaf7Jsa1YTGn7rziG4o4Z6+Cxm4ZjjBDHmiAwaNXPySvYCARFSCro2WR+yiDHzrnb6zZOYfi+SwP3fD9vn0jaHvcHmUuNKcaj9Qs1ML9uARznEO8f6lliCdEuTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqIy6CyUvzfxxLO1cOIkvmHDge00OihrnPHjxBvM/vc=;
 b=H638eE/bMzZ4AAmQStEYJvzT2G29BEgbQZvknj6n8lmFLv5Aqz7hg3TL7YQKFmxYuyh+Xxq0qo8EWVKrW7jZR/kbZlNZkoqkZgztr5vU9zPn+FLeFB0XBTolSS8czjRsQCbS+MbyFPErPyk9bxiG3gKwIf0n65vJml7syu6MMcnXUEPV7bdhbDRFZutmHXtjqCa6xdim7DhS1+kyrZf/KnoIDppzfszZuSsLC7qi6VLts+6c8J+c7nSWYfEwM6S+Sy+EVWJEBk12PK8N0NBH2PksAd+AWk2npboCmu83604XM+pqiUYPI+edZ/Pm7TnSdSS0ufLWsT+/N7Bkp9JUpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqIy6CyUvzfxxLO1cOIkvmHDge00OihrnPHjxBvM/vc=;
 b=aTM/JntEKL+ZTE7DGy0H8jIBqLzt7EaD2DzqniOz1AOtVOLe2EEkR9MEPtvDnGom21YJXXKNqN5wvj1bYS/CjKp62wlN2BakzhFJCHcHfL3yfSIlYfUpZFhtCynamopduLTWuaVc8tMXVr8R8M5IVu2hipXe4cOEV5LCp/lAeMrqWHA2EId/pa8XL/OGSezICAjmTUg1lFwJqV49VYEfy5CzuTwvVVdd3WOvU1SCTJ2vZTNVCzrtyqTpHkKX3xdQj/MevQYDmtQHykrqfUXR57e7Q/nsH5bn7Sqk4jRFpf4FZP1siH7zC5Ghv1a832M0mCHxdeeiXcP+Ii+AWNkwlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AM9PR04MB8809.eurprd04.prod.outlook.com (2603:10a6:20b:408::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Wed, 27 Nov
 2024 07:15:02 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%5]) with mapi id 15.20.8182.018; Wed, 27 Nov 2024
 07:15:02 +0000
From: haibo.chen@nxp.com
To: linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	marek.vasut@gmail.com,
	haibo.chen@nxp.com
Subject: [PATCH] gpio: gpio-pca953x: do not enable regmap cache when there is no regulator
Date: Wed, 27 Nov 2024 15:14:50 +0800
Message-Id: <20241127071450.3082761-1-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0082.apcprd02.prod.outlook.com
 (2603:1096:4:90::22) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|AM9PR04MB8809:EE_
X-MS-Office365-Filtering-Correlation-Id: d958c854-7142-4864-98ef-08dd0eb335a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+imNJU87wWBOuuGKiceSxb7kkzser6Ort5UvzuloMensirhCCVoZ9zKPt5Kx?=
 =?us-ascii?Q?9U6K7iAHzANktehXPPu37gUx0tyWualS1LBfj035k/L0FYvjfieAoiGbWAfU?=
 =?us-ascii?Q?QlHATpAE87aP8azPq26ZVM+8Eb4vjTcivnRKQr741xbQMgzeLPT63GQWGUW/?=
 =?us-ascii?Q?+3/vwwPOIdiHl2GQ573+i2ICo4Ro0XAkrp4ZJKWCDYu662tt84J5CE6zvpUp?=
 =?us-ascii?Q?/osY/iiWk5vXP4PYhyV+3AY/F4JSyoG9GnSNcB2gaQUWyOBmCmgno551wD2z?=
 =?us-ascii?Q?VW1kxSccB/TR/c9uGl6TLfcISOkyUDBy0TKAEtqhHS2FbZDsbUN3soAUXgrl?=
 =?us-ascii?Q?Jk7o4oZXVYnWlA7cdUnprzE8jl1virF3q7ko5yN1u1AYSfTAc3y6Kg7cbZ4m?=
 =?us-ascii?Q?gMflz5oNTOnvX2kgPNUoG9+rSDAR2gmKXpJK1TMcU8HE71aZ9C4VAxTkxcqN?=
 =?us-ascii?Q?WRHCjnXNCJLcNS8Fp3vbXLWW6X9CvI5sUlaT/zWrnppT2BseQLm59v0Ns9NA?=
 =?us-ascii?Q?2EEyA880Cyh6RZyN3rqo+E+M0x0H9aMYzzKdlx/gbGEMYI97uN0EOkEKXuWD?=
 =?us-ascii?Q?2voErdkFqg92foru0EiXSazLtaHdrjvIjowbUxsw9umnW6vYHfZfK7/qfZHb?=
 =?us-ascii?Q?J/g0Mv+tMIrgOfxaNPSfHEiu66G6nmqfmW0wgWkx4pF24vjhwXe3wkscgbX4?=
 =?us-ascii?Q?rIvWocAwh537CedFhV2H54LBf2ulDh13Vc3b111hjyXebIuS0rGEDNiPqQRx?=
 =?us-ascii?Q?HYYXBf+nJSfL+Q5HZQe8fRrX/XbUzXlnjRmYvHSFWMhwKi7bF/A75XbM/mPg?=
 =?us-ascii?Q?gLyPD5f5Y6tygiEIZXdGxJ7nJ8um0a/d9uibsliZtF1NXjv3wO+2nDK0KlwN?=
 =?us-ascii?Q?4VL+IIon7jllz8UlmzzhBRloWZhvU4zeMrdSShw1IUY6sCUBxeWkEzZU02GC?=
 =?us-ascii?Q?R6myHYnqfgckLK3/FXQsEeL+T//q/vR9+sV1KeACejvb5XlJOECi1g+5xtJK?=
 =?us-ascii?Q?qAYv35lJ333zJrJpiZfEXsYW5fQ0nqiZrJhroMNZJ5BwhQQXd5xGsC8yp9ob?=
 =?us-ascii?Q?4RVTnXvghKneb75C7rlSyYG9z1fwm9Ivr912jboKZFw+l9+J0ZqtVk0rwyYx?=
 =?us-ascii?Q?gJkx/9r2o76pR3n7XCWaXAaAaCNilqusHtBfPzMmmztevk4n2R/yfr5RpSiw?=
 =?us-ascii?Q?GE1fGciigTsDIHBLHsHLF06FfjaQoWv84FFyNXCDdamE71gpXX0EejxD49jT?=
 =?us-ascii?Q?u5kQ+B0xWkyfvd+pGBkLzFi0sFXMQU/OXYEdbmqm3sg10BOMCDxkRI+DtscE?=
 =?us-ascii?Q?jN8LeTAmGfMbpuTCLK/dpRyL30/R2BFzIL9QWv/rcBnG2mXCjykac4G+TNgp?=
 =?us-ascii?Q?oAVfRbTtkQWe5GlaMbDAYm56S4eIL9vsDrBlXOiP7oRWB9/pLw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MiyFRjQV3io0qMaeMrGgUOsUOr6mBn4D6h0jE3gW8ib9srFNJ0E1BsnV/m7T?=
 =?us-ascii?Q?godtIRxHwHmGh9a0tk65dRP+prjkOP0VgtldNi+qQqe6eKHoL7agdvnr05+J?=
 =?us-ascii?Q?Gy1GWdgm1/JLT6Fjl5OvJaXLkCx16SJj/zzauZCRGIahMc93XIx43q8SZ8Vs?=
 =?us-ascii?Q?MPPGYDv4xGoKCFlNHcqQjUgDcXZEih4nLLeeLhqzDtmaN7vz/B2ibul9ZXse?=
 =?us-ascii?Q?LOT3ptC/dr0CZ7nT7oeJFZMJ9+32IMqYw2EsqEuo970a8ZeiglT2Gag8LQiF?=
 =?us-ascii?Q?X33TsRvfEPyPXVns4V9WzUHeEgNqvL2HR/RyUZWhcMAQZ0297KEEfmi2sHt3?=
 =?us-ascii?Q?dhZo4jgse5kGe6tJXmIJGsNV3PESByzEDxsMGM8lqmeF5189U50sRz7zA0fb?=
 =?us-ascii?Q?drnSHEcR45xfWF6wZmGrAWkERcjzQt2WODg0cWSCQLmyqMojFbbxRWV0e4ws?=
 =?us-ascii?Q?vz17/+HEGp/Oq2HZ1NIQ9oOExPVXA6bJoDSEKbiS8W0nvGorwa9Nyr7iXqGp?=
 =?us-ascii?Q?SfzbVUL6sdeuczP2IzhsHJ9mQ8AdQ2kpN0q3NUKFewdEWSJ87nyBo4lf27KT?=
 =?us-ascii?Q?LAZhVAek1sgnPkkHw0jB3NSIGEw887MUQwt2WV6ZDDI9gst2boLA22hpDRpo?=
 =?us-ascii?Q?I/WbNJ91aJ1VzUUaPbgkrWWU55i5kB6OCxZesCnA9qJlvxTAOMeNFsZewECm?=
 =?us-ascii?Q?XYXhz19QcQFl+kS/g78L8Pt5hwFgvT3xhTBC4A4Q0DhxvfdUjygO3YZ6aX9u?=
 =?us-ascii?Q?J1PsV456dkRAZIbWHGwe+QF3gE0mWf23c4s/SqVV6/BMt22uTPmuHk6BEc2u?=
 =?us-ascii?Q?2uaRku26gPmL6m9h+8Qm4rCuoEIuFJzMGpyM66rbN9NtuqcojPAUmOakzPEG?=
 =?us-ascii?Q?VRJXhssTswXlaKrYEi2WBeBI1LcKRPgq0LHaEZwbTXhsm5r/lv+bs5ZasfAv?=
 =?us-ascii?Q?pX6M8uzbCXdxXbZyLldim+1seCuPBhlpVwE59JqaESxSPnA7C5pFkfIu2VUu?=
 =?us-ascii?Q?2ekkbj8ohLeyzgQV0vnijybZ6hfJaSezALXBMc9xTrLmNfmVQlQaXgv/7vsR?=
 =?us-ascii?Q?n4JuqBVJXSG/7OnAcCfP+AZp33ocpf3MxnxaCcZNfMgjRg3iu0Bk8zb3UFEd?=
 =?us-ascii?Q?vs7SkMmnm3KQVO04Khi5z2+KV0gxHhWURUrYtWKD6YkaxBNBH4ejJuvqXXRY?=
 =?us-ascii?Q?02/sZMrHxE2+W7Dy3+bk6TaDzE1Uxdk1bmedKNlqAUiRN/dmdGPiuI/av2L1?=
 =?us-ascii?Q?mCgyxJeY84uSmpbBEdNw0OOZO+tYO4L2OQGmFQR7LGoPyBXDsALuvg3TPtyv?=
 =?us-ascii?Q?sUZ//LI9HzVgt0FKy1c01GfW4heNCPabKjT9nL4Rl2iqRVFu3cazR1OODWJQ?=
 =?us-ascii?Q?zRVcC9/b9I3XZJn0HU5/8j1v2iARc1zgDOW2OO4MkKhdSdj+uQRi/TtzIt6m?=
 =?us-ascii?Q?ydLT7BzopiAbmnvMi3JUMCEDC4S7ZsvNl8BSlBWExN6PbQI9lsz2fnHCzsdz?=
 =?us-ascii?Q?5V8TQe0xkg88JJuJsapIU8/uH5i0JSbaKQHcNDC39zVFIiSLkJjiaV+CyZ07?=
 =?us-ascii?Q?8vi8J4NYThxZzw6NdcG8yzLYNsamcdEevfL1T8aD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d958c854-7142-4864-98ef-08dd0eb335a5
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 07:15:02.1579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p9NnKFj0AF5eais8jhk3EMcSWvwdb/wv7r03vnqOjRttDe3K2W/ouxrRkPdD2TwYyG2nj1CxwL9tkJTwzbMAcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8809

From: Haibo Chen <haibo.chen@nxp.com>

Regmap cache mechanism is enabled in default. Thus, IO expander wouldn't
handle GPIO set really before resuming back.

But there are cases need to toggle gpio in NO_IRQ stage.
e.g. To align with PCIe specification, PERST# signal connected on the IO
expander must be toggled during PCIe RC's NO_IRQ_RESUME.

Do not enable the regmap cache when IO expander doesn't have the regulator
during system PM. That means the power of IO expander would be kept on,
and the GPIOs of the IO expander can be toggled really during system PM.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/gpio/gpio-pca953x.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 272febc3230e..6503ef0d7562 100644
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
+	 * Only save context when has regulator, if no
+	 * regulator, power keeps on, can also handle
+	 * gpio related operation.
+	 * e.g. PCIe RC need to toggle the RST pin in
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


