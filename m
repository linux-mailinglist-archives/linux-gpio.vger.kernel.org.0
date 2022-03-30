Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24DF34EC73E
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Mar 2022 16:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347367AbiC3OwO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Mar 2022 10:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347328AbiC3OwG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Mar 2022 10:52:06 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 673314925B;
        Wed, 30 Mar 2022 07:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648651820; x=1680187820;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jQJeoHDjZLYzGmOrK+oBTqEppFS7ObLysie7MCABhco=;
  b=XVqnzcRpRh75CN7NjnGhhxN+9gLyqHafh5yRGLmy14velxDnTGpgPQBk
   rJcFexYLH0/FeHeqlLpFDLL8OEgNkDbeJ8viLHB4DpAxIaOAtOC1QZuwX
   xCVfujsmDLspl9iUGMWzhF3S9GG/jnKlpRqwSOiLTAudQvnHDKcRJfN21
   Nh3DfjypV4KKi+fodgonmznrDF8Z0bfRnQpHBq/ieebeoh1Cr1VGls6Ix
   ycOhDZGPQyzNumxG9z7fIMDgs3jSZFkkjRf3zmhdWqkTHjHTcflYYZz6E
   dhAt2sqD+QLNqcqRMBlmIm9by6vL6kv0fZPy4CzOiYGT2HOWds1meuMal
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="239490487"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="239490487"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 07:50:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="788030765"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 30 Mar 2022 07:50:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4FB5620B; Wed, 30 Mar 2022 17:50:33 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Qianggui Song <qianggui.song@amlogic.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v3 04/13] pinctrl: stm32: Switch to use for_each_gpiochip_node() helper
Date:   Wed, 30 Mar 2022 17:50:21 +0300
Message-Id: <20220330145030.1562-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330145030.1562-1-andriy.shevchenko@linux.intel.com>
References: <20220330145030.1562-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Switch the code to use for_each_gpiochip_node() helper.

While at it, in order to avoid additional churn in the future,
switch to fwnode APIs where it makes sense.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 72 ++++++++++++---------------
 1 file changed, 33 insertions(+), 39 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 91b9a64b649e..09952c463f67 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -24,6 +24,7 @@
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
@@ -1215,13 +1216,12 @@ static const struct pinconf_ops stm32_pconf_ops = {
 	.pin_config_dbg_show	= stm32_pconf_dbg_show,
 };
 
-static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl,
-	struct device_node *np)
+static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode_handle *fwnode)
 {
 	struct stm32_gpio_bank *bank = &pctl->banks[pctl->nbanks];
 	int bank_ioport_nr;
 	struct pinctrl_gpio_range *range = &bank->range;
-	struct of_phandle_args args;
+	struct fwnode_reference_args args;
 	struct device *dev = pctl->dev;
 	struct resource res;
 	int npins = STM32_GPIO_PINS_PER_BANK;
@@ -1230,7 +1230,7 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl,
 	if (!IS_ERR(bank->rstc))
 		reset_control_deassert(bank->rstc);
 
-	if (of_address_to_resource(np, 0, &res))
+	if (of_address_to_resource(to_of_node(fwnode), 0, &res))
 		return -ENODEV;
 
 	bank->base = devm_ioremap_resource(dev, &res);
@@ -1245,15 +1245,15 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl,
 
 	bank->gpio_chip = stm32_gpio_template;
 
-	of_property_read_string(np, "st,bank-name", &bank->gpio_chip.label);
+	fwnode_property_read_string(fwnode, "st,bank-name", &bank->gpio_chip.label);
 
-	if (!of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, i, &args)) {
+	if (!fwnode_property_get_reference_args(fwnode, "gpio-ranges", NULL, 3, i, &args)) {
 		bank_nr = args.args[1] / STM32_GPIO_PINS_PER_BANK;
 		bank->gpio_chip.base = args.args[1];
 
 		/* get the last defined gpio line (offset + nb of pins) */
 		npins = args.args[0] + args.args[2];
-		while (!of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, ++i, &args))
+		while (!fwnode_property_get_reference_args(fwnode, "gpio-ranges", NULL, 3, ++i, &args))
 			npins = max(npins, (int)(args.args[0] + args.args[2]));
 	} else {
 		bank_nr = pctl->nbanks;
@@ -1268,20 +1268,20 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl,
 				       &pctl->banks[bank_nr].range);
 	}
 
-	if (of_property_read_u32(np, "st,bank-ioport", &bank_ioport_nr))
+	if (fwnode_property_read_u32(fwnode, "st,bank-ioport", &bank_ioport_nr))
 		bank_ioport_nr = bank_nr;
 
 	bank->gpio_chip.base = bank_nr * STM32_GPIO_PINS_PER_BANK;
 
 	bank->gpio_chip.ngpio = npins;
-	bank->gpio_chip.of_node = np;
+	bank->gpio_chip.fwnode = fwnode;
 	bank->gpio_chip.parent = dev;
 	bank->bank_nr = bank_nr;
 	bank->bank_ioport_nr = bank_ioport_nr;
 	spin_lock_init(&bank->lock);
 
 	/* create irq hierarchical domain */
-	bank->fwnode = of_node_to_fwnode(np);
+	bank->fwnode = fwnode;
 
 	bank->domain = irq_domain_create_hierarchy(pctl->domain, 0,
 					STM32_GPIO_IRQ_LINE, bank->fwnode,
@@ -1418,7 +1418,7 @@ static int stm32_pctrl_create_pins_tab(struct stm32_pinctrl *pctl,
 int stm32_pctl_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct device_node *child;
+	struct fwnode_handle *child;
 	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
 	struct stm32_pinctrl *pctl;
@@ -1525,40 +1525,34 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	i = 0;
-	for_each_available_child_of_node(np, child) {
+	for_each_gpiochip_node(dev, child) {
 		struct stm32_gpio_bank *bank = &pctl->banks[i];
+		struct device_node *np = to_of_node(child);
 
-		if (of_property_read_bool(child, "gpio-controller")) {
-			bank->rstc = of_reset_control_get_exclusive(child,
-								    NULL);
-			if (PTR_ERR(bank->rstc) == -EPROBE_DEFER) {
-				of_node_put(child);
-				return -EPROBE_DEFER;
-			}
-
-			bank->clk = of_clk_get_by_name(child, NULL);
-			if (IS_ERR(bank->clk)) {
-				if (PTR_ERR(bank->clk) != -EPROBE_DEFER)
-					dev_err(dev,
-						"failed to get clk (%ld)\n",
-						PTR_ERR(bank->clk));
-				of_node_put(child);
-				return PTR_ERR(bank->clk);
-			}
-			i++;
+		bank->rstc = of_reset_control_get_exclusive(np, NULL);
+		if (PTR_ERR(bank->rstc) == -EPROBE_DEFER) {
+			fwnode_handle_put(child);
+			return -EPROBE_DEFER;
 		}
-	}
 
-	for_each_available_child_of_node(np, child) {
-		if (of_property_read_bool(child, "gpio-controller")) {
-			ret = stm32_gpiolib_register_bank(pctl, child);
-			if (ret) {
-				of_node_put(child);
-				return ret;
-			}
+		bank->clk = of_clk_get_by_name(np, NULL);
+		if (IS_ERR(bank->clk)) {
+			if (PTR_ERR(bank->clk) != -EPROBE_DEFER)
+				dev_err(dev, "failed to get clk (%ld)\n", PTR_ERR(bank->clk));
+			fwnode_handle_put(child);
+			return PTR_ERR(bank->clk);
+		}
+		i++;
+	}
 
-			pctl->nbanks++;
+	for_each_gpiochip_node(dev, child) {
+		ret = stm32_gpiolib_register_bank(pctl, child);
+		if (ret) {
+			fwnode_handle_put(child);
+			return ret;
 		}
+
+		pctl->nbanks++;
 	}
 
 	dev_info(dev, "Pinctrl STM32 initialized\n");
-- 
2.35.1

