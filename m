Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB52A267C7
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2019 18:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729803AbfEVQMa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 May 2019 12:12:30 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:49332 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729740AbfEVQMa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 May 2019 12:12:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1558541548; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=ommTaJiiF1wEQejjgl2jDFfJkhMbVYAtU2wzIc7UzPA=;
        b=OXsob//8E2wfBWl4R46XcNFX0M97JmIeGlwO8MdA9bqrgw/9dNhpxJ6DDdSTiXhaD1K53t
        pLye01sif6jXdr29xdH+hzlqvWhTkmvNuffecCoNq6gc4X9V9DQa2S56O6/cIPxzOowbmJ
        wTa0I6drPzcC0YOOY3ruZReOEBaI1U8=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     od@zcrc.me, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] pinctrl: ingenic: Handle PIN_CONFIG_OUTPUT config
Date:   Wed, 22 May 2019 18:12:24 +0200
Message-Id: <20190522161224.6169-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This enables devicetree bindings to specify that a given GPIO should be
driven low or high.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/pinctrl/pinctrl-ingenic.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index a83ddd52efdd..07342bc769d1 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -1154,19 +1154,30 @@ static void ingenic_set_bias(struct ingenic_pinctrl *jzpc,
 		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_PULL_DIS, !enabled);
 }
 
+static void ingenic_set_output_level(struct ingenic_pinctrl *jzpc,
+				     unsigned int pin, bool high)
+{
+	if (jzpc->version >= ID_JZ4770)
+		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_PAT0, high);
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
@@ -1174,6 +1185,8 @@ static int ingenic_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	}
 
 	for (cfg = 0; cfg < num_configs; cfg++) {
+		arg = pinconf_to_config_argument(configs[cfg]);
+
 		switch (pinconf_to_config_param(configs[cfg])) {
 		case PIN_CONFIG_BIAS_DISABLE:
 			dev_dbg(jzpc->dev, "disable pull-over for pin P%c%u\n",
@@ -1197,6 +1210,14 @@ static int ingenic_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
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
2.21.0.593.g511ec345e18

