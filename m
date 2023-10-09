Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8CE77BE834
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Oct 2023 19:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378052AbjJIRdE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Oct 2023 13:33:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378008AbjJIRc6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2023 13:32:58 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA58122;
        Mon,  9 Oct 2023 10:32:49 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18514C433CA;
        Mon,  9 Oct 2023 17:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696872769;
        bh=0HIhzaaSUTTnt0JseuEuP/dgBKYxy2t5eKbIHll9FzI=;
        h=From:To:Cc:Subject:Date:From;
        b=QNOy0dgD+GvhGtctpuzgOV+UGFKrzo3aaTtRWaiIT0F3i3K3Z7IdWKke3JSUrzLxS
         a3ZBxHvLv4Q/n6Sy9SKTwIzGYN306hskrSwxTMat7nEdMi+yyVhxAEzYssNpFyp43P
         LRdQgmYetevcW7KyRsDjUZUt1e9R4oR9DPzi/p7TJ1ZJ2c7BYcvSN1PqaNzx0MYALF
         XHLf+QvhiaD/df6xCMWAj8nk+V0Re7oxaAOgxYNAww0k3VcenRQuSzkbA/hg6MbxLY
         ADxO4lFjPgJUssOu9iMM8VnancISqkiz6zWvkw4aoNC6X9Uc47eTto/a8aF6E+a75C
         Xt7viCt5S0Xtg==
Received: (nullmailer pid 2532000 invoked by uid 1000);
        Mon, 09 Oct 2023 17:32:47 -0000
From:   Rob Herring <robh@kernel.org>
To:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: Use device_get_match_data()
Date:   Mon,  9 Oct 2023 12:29:13 -0500
Message-ID: <20231009172923.2457844-18-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use preferred device_get_match_data() instead of of_match_device() to
get the driver match data. With this, adjust the includes to explicitly
include the correct headers.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pinctrl/bcm/pinctrl-ns.c             |  8 ++------
 drivers/pinctrl/berlin/berlin-bg2.c          |  8 +++-----
 drivers/pinctrl/berlin/berlin-bg2cd.c        |  8 +++-----
 drivers/pinctrl/berlin/berlin-bg2q.c         |  8 +++-----
 drivers/pinctrl/berlin/berlin-bg4ct.c        |  9 +++++----
 drivers/pinctrl/berlin/pinctrl-as370.c       |  9 +++++----
 drivers/pinctrl/mvebu/pinctrl-armada-38x.c   |  9 ++-------
 drivers/pinctrl/mvebu/pinctrl-armada-39x.c   |  9 ++-------
 drivers/pinctrl/mvebu/pinctrl-armada-ap806.c |  5 +----
 drivers/pinctrl/mvebu/pinctrl-armada-cp110.c |  6 ++----
 drivers/pinctrl/mvebu/pinctrl-armada-xp.c    |  9 ++-------
 drivers/pinctrl/mvebu/pinctrl-dove.c         |  6 ++----
 drivers/pinctrl/mvebu/pinctrl-kirkwood.c     |  7 ++-----
 drivers/pinctrl/mvebu/pinctrl-orion.c        |  7 ++-----
 drivers/pinctrl/nomadik/pinctrl-abx500.c     |  9 ++-------
 drivers/pinctrl/nomadik/pinctrl-nomadik.c    | 10 ++++------
 drivers/pinctrl/pinctrl-at91.c               | 11 +++++------
 drivers/pinctrl/pinctrl-xway.c               | 11 ++++-------
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c      | 18 ++++++++----------
 19 files changed, 59 insertions(+), 108 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-ns.c b/drivers/pinctrl/bcm/pinctrl-ns.c
index f80630a74d34..d099a7f25f64 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns.c
@@ -7,11 +7,11 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 
 #include "../core.h"
@@ -208,7 +208,6 @@ static const struct of_device_id ns_pinctrl_of_match_table[] = {
 static int ns_pinctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	const struct of_device_id *of_id;
 	struct ns_pinctrl *ns_pinctrl;
 	struct pinctrl_desc *pctldesc;
 	struct pinctrl_pin_desc *pin;
@@ -225,10 +224,7 @@ static int ns_pinctrl_probe(struct platform_device *pdev)
 
 	ns_pinctrl->dev = dev;
 
-	of_id = of_match_device(ns_pinctrl_of_match_table, dev);
-	if (!of_id)
-		return -EINVAL;
-	ns_pinctrl->chipset_flag = (uintptr_t)of_id->data;
+	ns_pinctrl->chipset_flag = (uintptr_t)device_get_match_data(dev);
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 					   "cru_gpio_control");
diff --git a/drivers/pinctrl/berlin/berlin-bg2.c b/drivers/pinctrl/berlin/berlin-bg2.c
index acbd413340e8..15aed4467627 100644
--- a/drivers/pinctrl/berlin/berlin-bg2.c
+++ b/drivers/pinctrl/berlin/berlin-bg2.c
@@ -8,8 +8,9 @@
  */
 
 #include <linux/init.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #include "berlin.h"
@@ -227,10 +228,7 @@ static const struct of_device_id berlin2_pinctrl_match[] = {
 
 static int berlin2_pinctrl_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match =
-		of_match_device(berlin2_pinctrl_match, &pdev->dev);
-
-	return berlin_pinctrl_probe(pdev, match->data);
+	return berlin_pinctrl_probe(pdev, device_get_match_data(&pdev->dev));
 }
 
 static struct platform_driver berlin2_pinctrl_driver = {
diff --git a/drivers/pinctrl/berlin/berlin-bg2cd.c b/drivers/pinctrl/berlin/berlin-bg2cd.c
index c0f5d86d5d01..73a1d8c23088 100644
--- a/drivers/pinctrl/berlin/berlin-bg2cd.c
+++ b/drivers/pinctrl/berlin/berlin-bg2cd.c
@@ -8,8 +8,9 @@
  */
 
 #include <linux/init.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #include "berlin.h"
@@ -172,10 +173,7 @@ static const struct of_device_id berlin2cd_pinctrl_match[] = {
 
 static int berlin2cd_pinctrl_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match =
-		of_match_device(berlin2cd_pinctrl_match, &pdev->dev);
-
-	return berlin_pinctrl_probe(pdev, match->data);
+	return berlin_pinctrl_probe(pdev, device_get_match_data(&pdev->dev));
 }
 
 static struct platform_driver berlin2cd_pinctrl_driver = {
diff --git a/drivers/pinctrl/berlin/berlin-bg2q.c b/drivers/pinctrl/berlin/berlin-bg2q.c
index 20a3216ede07..a5dbc8f279e7 100644
--- a/drivers/pinctrl/berlin/berlin-bg2q.c
+++ b/drivers/pinctrl/berlin/berlin-bg2q.c
@@ -8,8 +8,9 @@
  */
 
 #include <linux/init.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #include "berlin.h"
@@ -389,10 +390,7 @@ static const struct of_device_id berlin2q_pinctrl_match[] = {
 
 static int berlin2q_pinctrl_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match =
-		of_match_device(berlin2q_pinctrl_match, &pdev->dev);
-
-	return berlin_pinctrl_probe(pdev, match->data);
+	return berlin_pinctrl_probe(pdev, device_get_match_data(&pdev->dev));
 }
 
 static struct platform_driver berlin2q_pinctrl_driver = {
diff --git a/drivers/pinctrl/berlin/berlin-bg4ct.c b/drivers/pinctrl/berlin/berlin-bg4ct.c
index 3026a3b3da2d..9bf0a54f2798 100644
--- a/drivers/pinctrl/berlin/berlin-bg4ct.c
+++ b/drivers/pinctrl/berlin/berlin-bg4ct.c
@@ -8,8 +8,9 @@
  */
 
 #include <linux/init.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #include "berlin.h"
@@ -449,8 +450,8 @@ static const struct of_device_id berlin4ct_pinctrl_match[] = {
 
 static int berlin4ct_pinctrl_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match =
-		of_match_device(berlin4ct_pinctrl_match, &pdev->dev);
+	const struct berlin_pinctrl_desc *desc =
+		device_get_match_data(&pdev->dev);
 	struct regmap_config *rmconfig;
 	struct regmap *regmap;
 	struct resource *res;
@@ -473,7 +474,7 @@ static int berlin4ct_pinctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	return berlin_pinctrl_probe_regmap(pdev, match->data, regmap);
+	return berlin_pinctrl_probe_regmap(pdev, desc, regmap);
 }
 
 static struct platform_driver berlin4ct_pinctrl_driver = {
diff --git a/drivers/pinctrl/berlin/pinctrl-as370.c b/drivers/pinctrl/berlin/pinctrl-as370.c
index b631c14813a7..fc0daec94e10 100644
--- a/drivers/pinctrl/berlin/pinctrl-as370.c
+++ b/drivers/pinctrl/berlin/pinctrl-as370.c
@@ -8,8 +8,9 @@
  */
 
 #include <linux/init.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #include "berlin.h"
@@ -330,8 +331,8 @@ static const struct of_device_id as370_pinctrl_match[] = {
 
 static int as370_pinctrl_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match =
-		of_match_device(as370_pinctrl_match, &pdev->dev);
+	const struct berlin_pinctrl_desc *desc =
+		device_get_match_data(&pdev->dev);
 	struct regmap_config *rmconfig;
 	struct regmap *regmap;
 	struct resource *res;
@@ -354,7 +355,7 @@ static int as370_pinctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	return berlin_pinctrl_probe_regmap(pdev, match->data, regmap);
+	return berlin_pinctrl_probe_regmap(pdev, desc, regmap);
 }
 
 static struct platform_driver as370_pinctrl_driver = {
diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-38x.c b/drivers/pinctrl/mvebu/pinctrl-armada-38x.c
index 040e418dbfc1..162dfc213669 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-38x.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-38x.c
@@ -12,8 +12,8 @@
 #include <linux/io.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/pinctrl/pinctrl.h>
+#include <linux/property.h>
 
 #include "pinctrl-mvebu.h"
 
@@ -404,13 +404,8 @@ static struct pinctrl_gpio_range armada_38x_mpp_gpio_ranges[] = {
 static int armada_38x_pinctrl_probe(struct platform_device *pdev)
 {
 	struct mvebu_pinctrl_soc_info *soc = &armada_38x_pinctrl_info;
-	const struct of_device_id *match =
-		of_match_device(armada_38x_pinctrl_of_match, &pdev->dev);
 
-	if (!match)
-		return -ENODEV;
-
-	soc->variant = (unsigned) match->data & 0xff;
+	soc->variant = (unsigned)device_get_match_data(&pdev->dev) & 0xff;
 	soc->controls = armada_38x_mpp_controls;
 	soc->ncontrols = ARRAY_SIZE(armada_38x_mpp_controls);
 	soc->gpioranges = armada_38x_mpp_gpio_ranges;
diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-39x.c b/drivers/pinctrl/mvebu/pinctrl-armada-39x.c
index c33f1cbaf661..d9c98faa7b0e 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-39x.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-39x.c
@@ -12,8 +12,8 @@
 #include <linux/io.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/pinctrl/pinctrl.h>
+#include <linux/property.h>
 
 #include "pinctrl-mvebu.h"
 
@@ -386,13 +386,8 @@ static struct pinctrl_gpio_range armada_39x_mpp_gpio_ranges[] = {
 static int armada_39x_pinctrl_probe(struct platform_device *pdev)
 {
 	struct mvebu_pinctrl_soc_info *soc = &armada_39x_pinctrl_info;
-	const struct of_device_id *match =
-		of_match_device(armada_39x_pinctrl_of_match, &pdev->dev);
 
-	if (!match)
-		return -ENODEV;
-
-	soc->variant = (unsigned) match->data & 0xff;
+	soc->variant = (unsigned)device_get_match_data(&pdev->dev) & 0xff;
 	soc->controls = armada_39x_mpp_controls;
 	soc->ncontrols = ARRAY_SIZE(armada_39x_mpp_controls);
 	soc->gpioranges = armada_39x_mpp_gpio_ranges;
diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-ap806.c b/drivers/pinctrl/mvebu/pinctrl-armada-ap806.c
index 89bab536717d..7becf2781a0b 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-ap806.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-ap806.c
@@ -13,7 +13,6 @@
 #include <linux/io.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/pinctrl/pinctrl.h>
 
 #include "pinctrl-mvebu.h"
@@ -106,10 +105,8 @@ static struct pinctrl_gpio_range armada_ap806_mpp_gpio_ranges[] = {
 static int armada_ap806_pinctrl_probe(struct platform_device *pdev)
 {
 	struct mvebu_pinctrl_soc_info *soc = &armada_ap806_pinctrl_info;
-	const struct of_device_id *match =
-		of_match_device(armada_ap806_pinctrl_of_match, &pdev->dev);
 
-	if (!match || !pdev->dev.parent)
+	if (!pdev->dev.parent)
 		return -ENODEV;
 
 	soc->variant = 0; /* no variants for Armada AP806 */
diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-cp110.c b/drivers/pinctrl/mvebu/pinctrl-armada-cp110.c
index 8ba8f3e9121f..9a250c491f33 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-cp110.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-cp110.c
@@ -12,9 +12,9 @@
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 #include "pinctrl-mvebu.h"
 
@@ -638,8 +638,6 @@ static void mvebu_pinctrl_assign_variant(struct mvebu_mpp_mode *m,
 static int armada_cp110_pinctrl_probe(struct platform_device *pdev)
 {
 	struct mvebu_pinctrl_soc_info *soc;
-	const struct of_device_id *match =
-		of_match_device(armada_cp110_pinctrl_of_match, &pdev->dev);
 	int i;
 
 	if (!pdev->dev.parent)
@@ -650,7 +648,7 @@ static int armada_cp110_pinctrl_probe(struct platform_device *pdev)
 	if (!soc)
 		return -ENOMEM;
 
-	soc->variant = (unsigned long) match->data & 0xff;
+	soc->variant = (unsigned long)device_get_match_data(&pdev->dev) & 0xff;
 	soc->controls = armada_cp110_mpp_controls;
 	soc->ncontrols = ARRAY_SIZE(armada_cp110_mpp_controls);
 	soc->modes = armada_cp110_mpp_modes;
diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-xp.c b/drivers/pinctrl/mvebu/pinctrl-armada-xp.c
index 48e2a6c56a83..487825bfd125 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-xp.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-xp.c
@@ -19,8 +19,8 @@
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/pinctrl/pinctrl.h>
+#include <linux/property.h>
 #include <linux/bitops.h>
 
 #include "pinctrl-mvebu.h"
@@ -568,14 +568,9 @@ static int armada_xp_pinctrl_resume(struct platform_device *pdev)
 static int armada_xp_pinctrl_probe(struct platform_device *pdev)
 {
 	struct mvebu_pinctrl_soc_info *soc = &armada_xp_pinctrl_info;
-	const struct of_device_id *match =
-		of_match_device(armada_xp_pinctrl_of_match, &pdev->dev);
 	int nregs;
 
-	if (!match)
-		return -ENODEV;
-
-	soc->variant = (unsigned) match->data & 0xff;
+	soc->variant = (unsigned)device_get_match_data(&pdev->dev) & 0xff;
 
 	switch (soc->variant) {
 	case V_MV78230:
diff --git a/drivers/pinctrl/mvebu/pinctrl-dove.c b/drivers/pinctrl/mvebu/pinctrl-dove.c
index bd74daa9ed66..1947da73e512 100644
--- a/drivers/pinctrl/mvebu/pinctrl-dove.c
+++ b/drivers/pinctrl/mvebu/pinctrl-dove.c
@@ -12,9 +12,9 @@
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/mfd/syscon.h>
 #include <linux/pinctrl/pinctrl.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #include "pinctrl-mvebu.h"
@@ -765,13 +765,11 @@ static int dove_pinctrl_probe(struct platform_device *pdev)
 {
 	struct resource *res, *mpp_res;
 	struct resource fb_res;
-	const struct of_device_id *match =
-		of_match_device(dove_pinctrl_of_match, &pdev->dev);
 	struct mvebu_mpp_ctrl_data *mpp_data;
 	void __iomem *base;
 	int i;
 
-	pdev->dev.platform_data = (void *)match->data;
+	pdev->dev.platform_data = (void *)device_get_match_data(&pdev->dev);
 
 	/*
 	 * General MPP Configuration Register is part of pdma registers.
diff --git a/drivers/pinctrl/mvebu/pinctrl-kirkwood.c b/drivers/pinctrl/mvebu/pinctrl-kirkwood.c
index d45c31f281c8..4789d7442f78 100644
--- a/drivers/pinctrl/mvebu/pinctrl-kirkwood.c
+++ b/drivers/pinctrl/mvebu/pinctrl-kirkwood.c
@@ -11,8 +11,8 @@
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/pinctrl/pinctrl.h>
+#include <linux/property.h>
 
 #include "pinctrl-mvebu.h"
 
@@ -470,10 +470,7 @@ static const struct of_device_id kirkwood_pinctrl_of_match[] = {
 
 static int kirkwood_pinctrl_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match =
-		of_match_device(kirkwood_pinctrl_of_match, &pdev->dev);
-
-	pdev->dev.platform_data = (void *)match->data;
+	pdev->dev.platform_data = (void *)device_get_match_data(&pdev->dev);
 
 	return mvebu_pinctrl_simple_mmio_probe(pdev);
 }
diff --git a/drivers/pinctrl/mvebu/pinctrl-orion.c b/drivers/pinctrl/mvebu/pinctrl-orion.c
index cc97d270be61..2b6ab7f2afc7 100644
--- a/drivers/pinctrl/mvebu/pinctrl-orion.c
+++ b/drivers/pinctrl/mvebu/pinctrl-orion.c
@@ -19,8 +19,8 @@
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/pinctrl/pinctrl.h>
+#include <linux/property.h>
 
 #include "pinctrl-mvebu.h"
 
@@ -218,10 +218,7 @@ static const struct of_device_id orion_pinctrl_of_match[] = {
 
 static int orion_pinctrl_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match =
-		of_match_device(orion_pinctrl_of_match, &pdev->dev);
-
-	pdev->dev.platform_data = (void*)match->data;
+	pdev->dev.platform_data = (void*)device_get_match_data(&pdev->dev);
 
 	mpp_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mpp_base))
diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
index 6b90051af206..0cfa74365733 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -17,6 +17,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -985,7 +986,6 @@ static const struct of_device_id abx500_gpio_match[] = {
 static int abx500_gpio_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	const struct of_device_id *match;
 	struct abx500_pinctrl *pct;
 	unsigned int id = -1;
 	int ret;
@@ -1006,12 +1006,7 @@ static int abx500_gpio_probe(struct platform_device *pdev)
 	pct->chip.parent = &pdev->dev;
 	pct->chip.base = -1; /* Dynamic allocation */
 
-	match = of_match_device(abx500_gpio_match, &pdev->dev);
-	if (!match) {
-		dev_err(&pdev->dev, "gpio dt not matching\n");
-		return -ENODEV;
-	}
-	id = (unsigned long)match->data;
+	id = (unsigned long)device_get_match_data(&pdev->dev);
 
 	/* Poke in other ASIC variants here */
 	switch (id) {
diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index 86a638077a69..863732287b1e 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -16,9 +16,11 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
@@ -1838,7 +1840,6 @@ static int nmk_pinctrl_resume(struct device *dev)
 
 static int nmk_pinctrl_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match;
 	struct device_node *np = pdev->dev.of_node;
 	struct device_node *prcm_np;
 	struct nmk_pinctrl *npct;
@@ -1849,10 +1850,7 @@ static int nmk_pinctrl_probe(struct platform_device *pdev)
 	if (!npct)
 		return -ENOMEM;
 
-	match = of_match_device(nmk_pinctrl_match, &pdev->dev);
-	if (!match)
-		return -ENODEV;
-	version = (unsigned int) match->data;
+	version = (unsigned int)device_get_match_data(&pdev->dev);
 
 	/* Poke in other ASIC variants here */
 	if (version == PINCTRL_NMK_STN8815)
diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 608f55c5ba5f..5aa9d5c533c6 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -12,10 +12,9 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of_irq.h>
+#include <linux/platform_device.h>
 #include <linux/pm.h>
+#include <linux/property.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/string_helpers.h>
@@ -1302,8 +1301,8 @@ static int at91_pinctrl_probe_dt(struct platform_device *pdev,
 	if (!np)
 		return -ENODEV;
 
-	info->dev = dev;
-	info->ops = of_device_get_match_data(dev);
+	info->dev = &pdev->dev;
+	info->ops = device_get_match_data(&pdev->dev);
 	at91_pinctrl_child_count(info, np);
 
 	/*
@@ -1845,7 +1844,7 @@ static int at91_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(at91_chip->regbase))
 		return PTR_ERR(at91_chip->regbase);
 
-	at91_chip->ops = of_device_get_match_data(dev);
+	at91_chip->ops = device_get_match_data(dev);
 	at91_chip->pioc_virq = irq;
 
 	at91_chip->clock = devm_clk_get_enabled(dev, NULL);
diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index cf0383f575d9..f4256a918165 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -11,12 +11,12 @@
 #include <linux/gpio/driver.h>
 #include <linux/slab.h>
 #include <linux/module.h>
-#include <linux/of_platform.h>
-#include <linux/of_address.h>
+#include <linux/of.h>
 #include <linux/ioport.h>
 #include <linux/io.h>
 #include <linux/device.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 #include "pinctrl-lantiq.h"
 
@@ -1451,7 +1451,6 @@ MODULE_DEVICE_TABLE(of, xway_match);
 
 static int pinmux_xway_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match;
 	const struct pinctrl_xway_soc *xway_soc;
 	int ret, i;
 
@@ -1460,10 +1459,8 @@ static int pinmux_xway_probe(struct platform_device *pdev)
 	if (IS_ERR(xway_info.membase[0]))
 		return PTR_ERR(xway_info.membase[0]);
 
-	match = of_match_device(xway_match, &pdev->dev);
-	if (match)
-		xway_soc = (const struct pinctrl_xway_soc *) match->data;
-	else
+	xway_soc = device_get_match_data(&pdev->dev);
+	if (!xway_soc)
 		xway_soc = &danube_pinctrl;
 
 	/* find out how many pads we have */
diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
index c1477f657839..379686efb030 100644
--- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
+++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
@@ -14,7 +14,8 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
@@ -822,7 +823,6 @@ static int ti_iodelay_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = of_node_get(dev->of_node);
-	const struct of_device_id *match;
 	struct resource *res;
 	struct ti_iodelay_device *iod;
 	int ret = 0;
@@ -833,20 +833,18 @@ static int ti_iodelay_probe(struct platform_device *pdev)
 		goto exit_out;
 	}
 
-	match = of_match_device(ti_iodelay_of_match, dev);
-	if (!match) {
-		ret = -EINVAL;
-		dev_err(dev, "No DATA match\n");
-		goto exit_out;
-	}
-
 	iod = devm_kzalloc(dev, sizeof(*iod), GFP_KERNEL);
 	if (!iod) {
 		ret = -ENOMEM;
 		goto exit_out;
 	}
 	iod->dev = dev;
-	iod->reg_data = match->data;
+	iod->reg_data = device_get_match_data(dev);
+	if (!iod->reg_data) {
+		ret = -EINVAL;
+		dev_err(dev, "No DATA match\n");
+		goto exit_out;
+	}
 
 	/* So far We can assume there is only 1 bank of registers */
 	iod->reg_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
-- 
2.42.0

