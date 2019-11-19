Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6120E1028AA
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 16:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727591AbfKSPwU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 10:52:20 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:53068 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727509AbfKSPwU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2019 10:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1574178738; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=4yyjAgapYN0BJjJ6GjuEAWNlDoHraNOFl96+eGkH6pU=;
        b=Ie2YY2ngQEP2M/tN4vHf6WPjSeB04qQn4FAz/FK6pzMH/8nYU/eJpRLN4peLibcg4gjqaF
        8Zs+06pLojKMRGQe+hqIHJhLGIOxv0SZc8SQ+RxTtwuLvZA1Tdgh8JY576hQWGXu0QLHcF
        z0xiYG4ZHwFgr+kcm+Rar3eNIYxj7iA=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     od@zcrc.me, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/2] pinctrl: ingenic: Handle PIN_CONFIG_OUTPUT config
Date:   Tue, 19 Nov 2019 16:52:10 +0100
Message-Id: <20191119155211.102527-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This makes the driver support the 'output-low' and 'output-high'
devicetree properties in gpio-hog sub-nodes.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/pinctrl/pinctrl-ingenic.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 6e2683016c1f..dbd907ef7cf0 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -1801,19 +1801,30 @@ static void ingenic_set_bias(struct ingenic_pinctrl *jzpc,
 		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_PULL_DIS, !enabled);
 }
 
+static void ingenic_set_output_level(struct ingenic_pinctrl *jzpc,
+				     unsigned int pin, bool high)
+{
+	if (jzpc->version >= ID_JZ4770)
+		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_PAT0, high);
+	else
+		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_DATA, high);
+}
+
 static int ingenic_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		unsigned long *configs, unsigned int num_configs)
 {
 	struct ingenic_pinctrl *jzpc = pinctrl_dev_get_drvdata(pctldev);
 	unsigned int idx = pin % PINS_PER_GPIO_CHIP;
 	unsigned int offt = pin / PINS_PER_GPIO_CHIP;
-	unsigned int cfg;
+	unsigned int cfg, arg;
+	int ret;
 
 	for (cfg = 0; cfg < num_configs; cfg++) {
 		switch (pinconf_to_config_param(configs[cfg])) {
 		case PIN_CONFIG_BIAS_DISABLE:
 		case PIN_CONFIG_BIAS_PULL_UP:
 		case PIN_CONFIG_BIAS_PULL_DOWN:
+		case PIN_CONFIG_OUTPUT:
 			continue;
 		default:
 			return -ENOTSUPP;
@@ -1821,6 +1832,8 @@ static int ingenic_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	}
 
 	for (cfg = 0; cfg < num_configs; cfg++) {
+		arg = pinconf_to_config_argument(configs[cfg]);
+
 		switch (pinconf_to_config_param(configs[cfg])) {
 		case PIN_CONFIG_BIAS_DISABLE:
 			dev_dbg(jzpc->dev, "disable pull-over for pin P%c%u\n",
@@ -1844,6 +1857,14 @@ static int ingenic_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			ingenic_set_bias(jzpc, pin, true);
 			break;
 
+		case PIN_CONFIG_OUTPUT:
+			ret = pinctrl_gpio_direction_output(pin);
+			if (ret)
+				return ret;
+
+			ingenic_set_output_level(jzpc, pin, arg);
+			break;
+
 		default:
 			unreachable();
 		}
-- 
2.24.0

