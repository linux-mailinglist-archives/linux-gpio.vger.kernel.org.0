Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 638574546F0
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Nov 2021 14:09:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237055AbhKQNLy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Nov 2021 08:11:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232830AbhKQNLx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Nov 2021 08:11:53 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F2E9C061570
        for <linux-gpio@vger.kernel.org>; Wed, 17 Nov 2021 05:08:55 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id f18so8190800lfv.6
        for <linux-gpio@vger.kernel.org>; Wed, 17 Nov 2021 05:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0KRWvubjIy8RO1CHSsT+VLxUKIhKyGrUk0tGFfKcoeA=;
        b=bHXKAibhTpfjXgfgxnDkh9SGQWVE80tS+ZiX07yIGs4ug8d8aaEk3SP/PP1zGQ6iAK
         Q+j4T8/CdEr330Nll6k/gVytldFuDPUMdDm8Dul328f2wMlnJQEZ4OYYIpMrGb7AbZFb
         ZEHUZMWLLVz1ZcLTISekbxoXdn5jhCfTicmGItWn9VAfrUFJ+trnmQ5+2Hzufy/wxyOY
         QLzOxZAHaSQvLeU1t5XQK+VLc2K7ogdJ7fNLA/81hUiRoYjccyojhx4HH9uyqMWNm/SA
         3tX6BrIcba/V0exwTaPbMZEzEYcTpyiErCVHOCirauI8A5IfkFtpER+fL8GW8zGJvieo
         TJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0KRWvubjIy8RO1CHSsT+VLxUKIhKyGrUk0tGFfKcoeA=;
        b=Qsw8Udsc/PFWQua5uB4uGktWk1XdRct7R+kn8QnQaeVyV6Nyg/FfKl1alSW41K3gDl
         AvTl1c8f4Ie7XMBMiEQOX1O6FH9y6gDUDAdTpY95rLnWIggrJgaVu/vI1kT96MPy+Jr4
         A4FzGobvEohB2QIVYXe4a9/A0N0M7Y6a5HbnTOXqgvsMWldYDSMhmmUoDT6aOyghsbMr
         WIVTeKVXWEeLT4dWA81D6cYbgzlAotsLgOEV2a7PZoskPqk5AKp0hCcc1MM/Edq623oP
         eW+C8b4p7Nlsl1tyAIXdP24IQOCEBKzx0sfQlS2Xk5YsaKNUoXVNAy/C6ywLDJiWVsGa
         Wfww==
X-Gm-Message-State: AOAM533+IwZi8VvIS014kUt8VeSPppMuuZ+VN6gkkdBEbPSb54ztSorr
        Muzf64tZb43qNfzNT4Zv8IU=
X-Google-Smtp-Source: ABdhPJyyak53QuChYtu+8n+aKNYIqivJtIFgQnoMUGGSRcwz6k6BiQwmXKpoIp8Xd40ZHH4h5xgIMg==
X-Received: by 2002:a2e:aa14:: with SMTP id bf20mr7514122ljb.376.1637154533366;
        Wed, 17 Nov 2021 05:08:53 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id v10sm810377ljp.125.2021.11.17.05.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 05:08:52 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2] pinctrl: bcm: ns: use generic groups & functions helpers
Date:   Wed, 17 Nov 2021 14:08:40 +0100
Message-Id: <20211117130840.975-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211116224239.9387-1-zajec5@gmail.com>
References: <20211116224239.9387-1-zajec5@gmail.com>
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
V2: Use pinctrl_generic_get_group() in .set_mux() cb
---
 drivers/pinctrl/bcm/Kconfig      |   2 +
 drivers/pinctrl/bcm/pinctrl-ns.c | 180 ++++++++++---------------------
 2 files changed, 59 insertions(+), 123 deletions(-)

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
index d7f8175d2c1c..0897041b5ef1 100644
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
@@ -186,47 +157,22 @@ static const struct pinctrl_ops ns_pinctrl_ops = {
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
-			      unsigned int grp_select)
+			      unsigned int group_selector)
 {
 	struct ns_pinctrl *ns_pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
+	struct group_desc *group;
 	u32 unset = 0;
 	u32 tmp;
 	int i;
 
-	for (i = 0; i < ns_pinctrl->groups[grp_select].num_pins; i++) {
-		int pin_number = ns_pinctrl->groups[grp_select].pins[i];
+	group = pinctrl_generic_get_group(pctrl_dev, group_selector);
+	if (!group)
+		return -EINVAL;
 
-		unset |= BIT(pin_number);
+	for (i = 0; i < group->num_pins; i++) {
+		unset |= BIT(group->pins[i]);
 	}
 
 	tmp = readl(ns_pinctrl->base);
@@ -237,9 +183,9 @@ static int ns_pinctrl_set_mux(struct pinctrl_dev *pctrl_dev,
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
 
@@ -267,8 +213,6 @@ static int ns_pinctrl_probe(struct platform_device *pdev)
 	struct ns_pinctrl *ns_pinctrl;
 	struct pinctrl_desc *pctldesc;
 	struct pinctrl_pin_desc *pin;
-	struct ns_pinctrl_group *group;
-	struct ns_pinctrl_function *function;
 	struct resource *res;
 	int i;
 
@@ -315,43 +259,33 @@ static int ns_pinctrl_probe(struct platform_device *pdev)
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

