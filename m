Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C49B12D913F
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 00:59:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730466AbgLMX46 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 18:56:58 -0500
Received: from aposti.net ([89.234.176.197]:48906 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391090AbgLMX4s (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 13 Dec 2020 18:56:48 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@kernel.org>, od@zcrc.me,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 2/2] pinctrl: ingenic: Only support SoCs enabled in config
Date:   Sun, 13 Dec 2020 23:54:47 +0000
Message-Id: <20201213235447.138271-2-paul@crapouillou.net>
In-Reply-To: <20201213235447.138271-1-paul@crapouillou.net>
References: <20201213235447.138271-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tested on a JZ4740 system (ARCH=mips make qi_lb60_defconfig), this saves
about 14 KiB, by allowing the compiler to garbage-collect all the
functions and tables that correspond to SoCs that were disabled in the
config.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: Drop <linux/if_enabled.h> include

 drivers/pinctrl/pinctrl-ingenic.c | 60 ++++++++++++++++++++++++-------
 1 file changed, 48 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index a14938a7cc30..cb8fa261110a 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -2384,6 +2384,12 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 	unsigned int i;
 	int err;
 
+	chip_info = of_device_get_match_data(dev);
+	if (!chip_info) {
+		dev_err(dev, "Unsupported SoC\n");
+		return -EINVAL;
+	}
+
 	jzpc = devm_kzalloc(dev, sizeof(*jzpc), GFP_KERNEL);
 	if (!jzpc)
 		return -ENOMEM;
@@ -2400,7 +2406,7 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	jzpc->dev = dev;
-	jzpc->info = chip_info = of_device_get_match_data(dev);
+	jzpc->info = chip_info;
 
 	pctl_desc = devm_kzalloc(&pdev->dev, sizeof(*pctl_desc), GFP_KERNEL);
 	if (!pctl_desc)
@@ -2470,17 +2476,47 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id ingenic_pinctrl_of_match[] = {
-	{ .compatible = "ingenic,jz4740-pinctrl", .data = &jz4740_chip_info },
-	{ .compatible = "ingenic,jz4725b-pinctrl", .data = &jz4725b_chip_info },
-	{ .compatible = "ingenic,jz4760-pinctrl", .data = &jz4760_chip_info },
-	{ .compatible = "ingenic,jz4760b-pinctrl", .data = &jz4760_chip_info },
-	{ .compatible = "ingenic,jz4770-pinctrl", .data = &jz4770_chip_info },
-	{ .compatible = "ingenic,jz4780-pinctrl", .data = &jz4780_chip_info },
-	{ .compatible = "ingenic,x1000-pinctrl", .data = &x1000_chip_info },
-	{ .compatible = "ingenic,x1000e-pinctrl", .data = &x1000_chip_info },
-	{ .compatible = "ingenic,x1500-pinctrl", .data = &x1500_chip_info },
-	{ .compatible = "ingenic,x1830-pinctrl", .data = &x1830_chip_info },
-	{},
+	{
+		.compatible = "ingenic,jz4740-pinctrl",
+		.data = IF_ENABLED(CONFIG_MACH_JZ4740, &jz4740_chip_info)
+	},
+	{
+		.compatible = "ingenic,jz4725b-pinctrl",
+		.data = IF_ENABLED(CONFIG_MACH_JZ4725B, &jz4725b_chip_info)
+	},
+	{
+		.compatible = "ingenic,jz4760-pinctrl",
+		.data = IF_ENABLED(CONFIG_MACH_JZ4760, &jz4760_chip_info)
+	},
+	{
+		.compatible = "ingenic,jz4760b-pinctrl",
+		.data = IF_ENABLED(CONFIG_MACH_JZ4760, &jz4760_chip_info)
+	},
+	{
+		.compatible = "ingenic,jz4770-pinctrl",
+		.data = IF_ENABLED(CONFIG_MACH_JZ4770, &jz4770_chip_info)
+	},
+	{
+		.compatible = "ingenic,jz4780-pinctrl",
+		.data = IF_ENABLED(CONFIG_MACH_JZ4780, &jz4780_chip_info)
+	},
+	{
+		.compatible = "ingenic,x1000-pinctrl",
+		.data = IF_ENABLED(CONFIG_MACH_X1000, &x1000_chip_info)
+	},
+	{
+		.compatible = "ingenic,x1000e-pinctrl",
+		.data = IF_ENABLED(CONFIG_MACH_X1000, &x1000_chip_info)
+	},
+	{
+		.compatible = "ingenic,x1500-pinctrl",
+		.data = IF_ENABLED(CONFIG_MACH_X1500, &x1500_chip_info)
+	},
+	{
+		.compatible = "ingenic,x1830-pinctrl",
+		.data = IF_ENABLED(CONFIG_MACH_X1830, &x1830_chip_info)
+	},
+	{ /* sentinel */ },
 };
 
 static struct platform_driver ingenic_pinctrl_driver = {
-- 
2.29.2

