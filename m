Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEE32131C53
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 00:27:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727268AbgAFX1a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jan 2020 18:27:30 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:39926 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbgAFX1a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jan 2020 18:27:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1578353244; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Dblyd2R4M1j4v9Hrq5bTGO1LiVKJsS/fKFGejpG27g8=;
        b=gyDjwXJNk5NH6JvQGwe7WpuVPaF4DKhlYDRG2fu+rh/Pzy+1rSMaRInnheCnC4YnmT/hqr
        7xPBW2H4AmvvySC/cUY/4EIusHBLbEV7rsS6IayYF9cCBU3GfRLTJmvwO+/k+5gub38n+o
        wOPvJtMRz4sciROUm1mB5XEoPI+J9VA=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        od@zcrc.me, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/5] pinctrl: ingenic: Remove platform ID table
Date:   Tue,  7 Jan 2020 00:27:07 +0100
Message-Id: <20200106232711.559727-2-paul@crapouillou.net>
In-Reply-To: <20200106232711.559727-1-paul@crapouillou.net>
References: <20200106232711.559727-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We enforce devicetree support in the Kconfig and all Ingenic boards
without exception probe their drivers from devicetree. The code path to
probe the driver from arch code can then be considered as dead code and
removed.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/pinctrl/pinctrl-ingenic.c | 26 ++------------------------
 1 file changed, 2 insertions(+), 24 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 4b847906b711..10a94f2f8658 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -2369,9 +2369,6 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 	struct ingenic_pinctrl *jzpc;
 	struct pinctrl_desc *pctl_desc;
 	void __iomem *base;
-	const struct platform_device_id *id = platform_get_device_id(pdev);
-	const struct of_device_id *of_id = of_match_device(
-			ingenic_pinctrl_of_match, dev);
 	const struct ingenic_chip_info *chip_info;
 	struct device_node *node;
 	unsigned int i;
@@ -2394,11 +2391,7 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	jzpc->dev = dev;
-
-	if (of_id)
-		jzpc->version = (enum jz_version)of_id->data;
-	else
-		jzpc->version = (enum jz_version)id->driver_data;
+	jzpc->version = (enum jz_version)of_device_get_match_data(dev);
 
 	if (jzpc->version >= ID_X1830)
 		chip_info = &x1830_chip_info;
@@ -2489,26 +2482,11 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct platform_device_id ingenic_pinctrl_ids[] = {
-	{ "jz4740-pinctrl", ID_JZ4740 },
-	{ "jz4725b-pinctrl", ID_JZ4725B },
-	{ "jz4760-pinctrl", ID_JZ4760 },
-	{ "jz4760b-pinctrl", ID_JZ4760B },
-	{ "jz4770-pinctrl", ID_JZ4770 },
-	{ "jz4780-pinctrl", ID_JZ4780 },
-	{ "x1000-pinctrl", ID_X1000 },
-	{ "x1000e-pinctrl", ID_X1000E },
-	{ "x1500-pinctrl", ID_X1500 },
-	{ "x1830-pinctrl", ID_X1830 },
-	{},
-};
-
 static struct platform_driver ingenic_pinctrl_driver = {
 	.driver = {
 		.name = "pinctrl-ingenic",
-		.of_match_table = of_match_ptr(ingenic_pinctrl_of_match),
+		.of_match_table = ingenic_pinctrl_of_match,
 	},
-	.id_table = ingenic_pinctrl_ids,
 };
 
 static int __init ingenic_pinctrl_drv_register(void)
-- 
2.24.1

