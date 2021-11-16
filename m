Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9E39453C56
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 23:42:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbhKPWpy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 17:45:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbhKPWpx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 17:45:53 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26870C061570
        for <linux-gpio@vger.kernel.org>; Tue, 16 Nov 2021 14:42:56 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id u22so1705632lju.7
        for <linux-gpio@vger.kernel.org>; Tue, 16 Nov 2021 14:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b2fbCGZIo6J1F8bF7D8bLRpHTy3x+dgeTeVSdFGaFGg=;
        b=WxnJGt6v14fbiMfIRNO9SuDtYKF+ic2CZOF+k6Wgv012BHJUYfbGq93sa6Tw9WlUbn
         UAwBwOnk1lWDxv0UI/qDRqN+b7vhLHKXvggEQ22WAu34IuYZMXvgTlgJL7NVkS07dlvD
         ydsooNLqNvCHUMD2sGOfq99tm1f9wKV5eQVKMJG/ij9QLzjGkMRFMNB91DRwOHx+pLRo
         ZQ6umHzooWxRsdIRRFjQz7e4J+rDRDokn3J8u9zFPIG6GWxmm5F9ZeQnxN+1a2GFQtgX
         D07rXZ4/8uJ5GL92ne83rMT1n0Trhc9OKixOo0rG+U0ejm1yVH4TPYbq4RZBhhA2eD/X
         0xPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b2fbCGZIo6J1F8bF7D8bLRpHTy3x+dgeTeVSdFGaFGg=;
        b=fTScAZbQOQC2ewB/4uIvOkgg/XQW7PHJEdw7vx99YS/N0UfArSXa+abIVa5bE7KPJk
         lcyb+2SYzPHS9RuN7WDhLOSnjjcPZGMylE2JoP56qaAx+ZDEVRfp/N/o3BpDiBKxs0CX
         +fMROi48J3SkmET20Alb1pIECQjI1EdtVX2O8oQXm/a43mzDZpdCwVNIStXK5YQAuvVQ
         RpYzM4Ca2zVPnoxPszRHRyFbLotgcf+Gb/pQOrdw+NYXeqFvsQPsZBypo1lEMkRIbkn6
         YMYF86L8Q7CfwmWiMiWPcvpvcL7ZAodtnXORE7e34J5odithbIeEJfWTjHQIUzibl2Ub
         K9dA==
X-Gm-Message-State: AOAM532vTWfuELLAw5n0ynRleEW99NfOCeBWzEFjO7sG5THuH4Lc6s2V
        F+x86AMnw2kGLyTItwD23l4=
X-Google-Smtp-Source: ABdhPJzO7KVpA+MegAnlSL1DJ3hjmXXstnOm8W3sc99k+iFO7CLriSScuV4qF5sjClIt7c1W3p7PeA==
X-Received: by 2002:a2e:8455:: with SMTP id u21mr2871829ljh.388.1637102574457;
        Tue, 16 Nov 2021 14:42:54 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id b14sm1906006lfs.174.2021.11.16.14.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 14:42:54 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] pinctrl: bcm: ns: use generic groups & functions helpers
Date:   Tue, 16 Nov 2021 23:42:39 +0100
Message-Id: <20211116224239.9387-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This simplifies ns driver and gets rid of 70 lines of code.

Some "const"s had to be dropped to avoid:
drivers/pinctrl/bcm/pinctrl-ns.c:274:13: warning: passing argument 3 of 'pinctrl_generic_add_group' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
drivers/pinctrl/bcm/pinctrl-ns.c:284:18: warning: passing argument 3 of 'pinmux_generic_add_function' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/pinctrl/bcm/Kconfig      |   2 +
 drivers/pinctrl/bcm/pinctrl-ns.c | 173 ++++++++++---------------------
 2 files changed, 54 insertions(+), 121 deletions(-)

diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index 8fc1feedd861..5123f4c33854 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -146,6 +146,8 @@ config PINCTRL_NS
 	depends on OF && (ARCH_BCM_5301X || COMPILE_TEST)
 	select PINMUX
 	select GENERIC_PINCONF
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
 	default ARCH_BCM_5301X
 	help
 	  Say yes here to enable the Broadcom NS SoC pins driver.
diff --git a/drivers/pinctrl/bcm/pinctrl-ns.c b/drivers/pinctrl/bcm/pinctrl-ns.c
index d7f8175d2c1c..08f0298882ac 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns.c
@@ -14,6 +14,9 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
+#include "../core.h"
+#include "../pinmux.h"
+
 #define FLAG_BCM4708		BIT(1)
 #define FLAG_BCM4709		BIT(2)
 #define FLAG_BCM53012		BIT(3)
@@ -25,10 +28,6 @@ struct ns_pinctrl {
 	void __iomem *base;
 
 	struct pinctrl_desc pctldesc;
-	struct ns_pinctrl_group *groups;
-	unsigned int num_groups;
-	struct ns_pinctrl_function *functions;
-	unsigned int num_functions;
 };
 
 /*
@@ -65,22 +64,22 @@ static const struct pinctrl_pin_desc ns_pinctrl_pins[] = {
 
 struct ns_pinctrl_group {
 	const char *name;
-	const unsigned int *pins;
+	unsigned int *pins;
 	const unsigned int num_pins;
 	unsigned int chipsets;
 };
 
-static const unsigned int spi_pins[] = { 0, 1, 2, 3 };
-static const unsigned int i2c_pins[] = { 4, 5 };
-static const unsigned int mdio_pins[] = { 6, 7 };
-static const unsigned int pwm0_pins[] = { 8 };
-static const unsigned int pwm1_pins[] = { 9 };
-static const unsigned int pwm2_pins[] = { 10 };
-static const unsigned int pwm3_pins[] = { 11 };
-static const unsigned int uart1_pins[] = { 12, 13, 14, 15 };
-static const unsigned int uart2_pins[] = { 16, 17 };
-static const unsigned int sdio_pwr_pins[] = { 22 };
-static const unsigned int sdio_1p8v_pins[] = { 23 };
+static unsigned int spi_pins[] = { 0, 1, 2, 3 };
+static unsigned int i2c_pins[] = { 4, 5 };
+static unsigned int mdio_pins[] = { 6, 7 };
+static unsigned int pwm0_pins[] = { 8 };
+static unsigned int pwm1_pins[] = { 9 };
+static unsigned int pwm2_pins[] = { 10 };
+static unsigned int pwm3_pins[] = { 11 };
+static unsigned int uart1_pins[] = { 12, 13, 14, 15 };
+static unsigned int uart2_pins[] = { 16, 17 };
+static unsigned int sdio_pwr_pins[] = { 22 };
+static unsigned int sdio_1p8v_pins[] = { 23 };
 
 #define NS_GROUP(_name, _pins, _chipsets)		\
 {							\
@@ -110,19 +109,19 @@ static const struct ns_pinctrl_group ns_pinctrl_groups[] = {
 
 struct ns_pinctrl_function {
 	const char *name;
-	const char * const *groups;
+	const char **groups;
 	const unsigned int num_groups;
 	unsigned int chipsets;
 };
 
-static const char * const spi_groups[] = { "spi_grp" };
-static const char * const i2c_groups[] = { "i2c_grp" };
-static const char * const mdio_groups[] = { "mdio_grp" };
-static const char * const pwm_groups[] = { "pwm0_grp", "pwm1_grp", "pwm2_grp",
-					   "pwm3_grp" };
-static const char * const uart1_groups[] = { "uart1_grp" };
-static const char * const uart2_groups[] = { "uart2_grp" };
-static const char * const sdio_groups[] = { "sdio_pwr_grp", "sdio_1p8v_grp" };
+static const char *spi_groups[] = { "spi_grp" };
+static const char *i2c_groups[] = { "i2c_grp" };
+static const char *mdio_groups[] = { "mdio_grp" };
+static const char *pwm_groups[] = { "pwm0_grp", "pwm1_grp", "pwm2_grp",
+				    "pwm3_grp" };
+static const char *uart1_groups[] = { "uart1_grp" };
+static const char *uart2_groups[] = { "uart2_grp" };
+static const char *sdio_groups[] = { "sdio_pwr_grp", "sdio_1p8v_grp" };
 
 #define NS_FUNCTION(_name, _groups, _chipsets)		\
 {							\
@@ -146,38 +145,10 @@ static const struct ns_pinctrl_function ns_pinctrl_functions[] = {
  * Groups code
  */
 
-static int ns_pinctrl_get_groups_count(struct pinctrl_dev *pctrl_dev)
-{
-	struct ns_pinctrl *ns_pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
-
-	return ns_pinctrl->num_groups;
-}
-
-static const char *ns_pinctrl_get_group_name(struct pinctrl_dev *pctrl_dev,
-					     unsigned int selector)
-{
-	struct ns_pinctrl *ns_pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
-
-	return ns_pinctrl->groups[selector].name;
-}
-
-static int ns_pinctrl_get_group_pins(struct pinctrl_dev *pctrl_dev,
-				     unsigned int selector,
-				     const unsigned int **pins,
-				     unsigned int *num_pins)
-{
-	struct ns_pinctrl *ns_pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
-
-	*pins = ns_pinctrl->groups[selector].pins;
-	*num_pins = ns_pinctrl->groups[selector].num_pins;
-
-	return 0;
-}
-
 static const struct pinctrl_ops ns_pinctrl_ops = {
-	.get_groups_count = ns_pinctrl_get_groups_count,
-	.get_group_name = ns_pinctrl_get_group_name,
-	.get_group_pins = ns_pinctrl_get_group_pins,
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name = pinctrl_generic_get_group_name,
+	.get_group_pins = pinctrl_generic_get_group_pins,
 	.dt_node_to_map = pinconf_generic_dt_node_to_map_group,
 	.dt_free_map = pinconf_generic_dt_free_map,
 };
@@ -186,34 +157,6 @@ static const struct pinctrl_ops ns_pinctrl_ops = {
  * Functions code
  */
 
-static int ns_pinctrl_get_functions_count(struct pinctrl_dev *pctrl_dev)
-{
-	struct ns_pinctrl *ns_pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
-
-	return ns_pinctrl->num_functions;
-}
-
-static const char *ns_pinctrl_get_function_name(struct pinctrl_dev *pctrl_dev,
-						unsigned int selector)
-{
-	struct ns_pinctrl *ns_pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
-
-	return ns_pinctrl->functions[selector].name;
-}
-
-static int ns_pinctrl_get_function_groups(struct pinctrl_dev *pctrl_dev,
-					  unsigned int selector,
-					  const char * const **groups,
-					  unsigned * const num_groups)
-{
-	struct ns_pinctrl *ns_pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
-
-	*groups = ns_pinctrl->functions[selector].groups;
-	*num_groups = ns_pinctrl->functions[selector].num_groups;
-
-	return 0;
-}
-
 static int ns_pinctrl_set_mux(struct pinctrl_dev *pctrl_dev,
 			      unsigned int func_select,
 			      unsigned int grp_select)
@@ -223,8 +166,8 @@ static int ns_pinctrl_set_mux(struct pinctrl_dev *pctrl_dev,
 	u32 tmp;
 	int i;
 
-	for (i = 0; i < ns_pinctrl->groups[grp_select].num_pins; i++) {
-		int pin_number = ns_pinctrl->groups[grp_select].pins[i];
+	for (i = 0; i < ns_pinctrl_groups[grp_select].num_pins; i++) {
+		int pin_number = ns_pinctrl_groups[grp_select].pins[i];
 
 		unset |= BIT(pin_number);
 	}
@@ -237,9 +180,9 @@ static int ns_pinctrl_set_mux(struct pinctrl_dev *pctrl_dev,
 }
 
 static const struct pinmux_ops ns_pinctrl_pmxops = {
-	.get_functions_count = ns_pinctrl_get_functions_count,
-	.get_function_name = ns_pinctrl_get_function_name,
-	.get_function_groups = ns_pinctrl_get_function_groups,
+	.get_functions_count = pinmux_generic_get_function_count,
+	.get_function_name = pinmux_generic_get_function_name,
+	.get_function_groups = pinmux_generic_get_function_groups,
 	.set_mux = ns_pinctrl_set_mux,
 };
 
@@ -267,8 +210,6 @@ static int ns_pinctrl_probe(struct platform_device *pdev)
 	struct ns_pinctrl *ns_pinctrl;
 	struct pinctrl_desc *pctldesc;
 	struct pinctrl_pin_desc *pin;
-	struct ns_pinctrl_group *group;
-	struct ns_pinctrl_function *function;
 	struct resource *res;
 	int i;
 
@@ -315,43 +256,33 @@ static int ns_pinctrl_probe(struct platform_device *pdev)
 		}
 	}
 
-	ns_pinctrl->groups = devm_kcalloc(dev, ARRAY_SIZE(ns_pinctrl_groups),
-					  sizeof(struct ns_pinctrl_group),
-					  GFP_KERNEL);
-	if (!ns_pinctrl->groups)
-		return -ENOMEM;
-	for (i = 0, group = &ns_pinctrl->groups[0];
-	     i < ARRAY_SIZE(ns_pinctrl_groups); i++) {
-		const struct ns_pinctrl_group *src = &ns_pinctrl_groups[i];
+	/* Register */
 
-		if (src->chipsets & ns_pinctrl->chipset_flag) {
-			memcpy(group++, src, sizeof(*src));
-			ns_pinctrl->num_groups++;
-		}
+	ns_pinctrl->pctldev = devm_pinctrl_register(dev, pctldesc, ns_pinctrl);
+	if (IS_ERR(ns_pinctrl->pctldev)) {
+		dev_err(dev, "Failed to register pinctrl\n");
+		return PTR_ERR(ns_pinctrl->pctldev);
 	}
 
-	ns_pinctrl->functions = devm_kcalloc(dev,
-					     ARRAY_SIZE(ns_pinctrl_functions),
-					     sizeof(struct ns_pinctrl_function),
-					     GFP_KERNEL);
-	if (!ns_pinctrl->functions)
-		return -ENOMEM;
-	for (i = 0, function = &ns_pinctrl->functions[0];
-	     i < ARRAY_SIZE(ns_pinctrl_functions); i++) {
-		const struct ns_pinctrl_function *src = &ns_pinctrl_functions[i];
+	for (i = 0; i < ARRAY_SIZE(ns_pinctrl_groups); i++) {
+		const struct ns_pinctrl_group *group = &ns_pinctrl_groups[i];
 
-		if (src->chipsets & ns_pinctrl->chipset_flag) {
-			memcpy(function++, src, sizeof(*src));
-			ns_pinctrl->num_functions++;
-		}
+		if (!(group->chipsets & ns_pinctrl->chipset_flag))
+			continue;
+
+		pinctrl_generic_add_group(ns_pinctrl->pctldev, group->name,
+					  group->pins, group->num_pins, NULL);
 	}
 
-	/* Register */
+	for (i = 0; i < ARRAY_SIZE(ns_pinctrl_functions); i++) {
+		const struct ns_pinctrl_function *function = &ns_pinctrl_functions[i];
 
-	ns_pinctrl->pctldev = devm_pinctrl_register(dev, pctldesc, ns_pinctrl);
-	if (IS_ERR(ns_pinctrl->pctldev)) {
-		dev_err(dev, "Failed to register pinctrl\n");
-		return PTR_ERR(ns_pinctrl->pctldev);
+		if (!(function->chipsets & ns_pinctrl->chipset_flag))
+			continue;
+
+		pinmux_generic_add_function(ns_pinctrl->pctldev, function->name,
+					    function->groups,
+					    function->num_groups, NULL);
 	}
 
 	return 0;
-- 
2.31.1

