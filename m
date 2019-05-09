Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEF5F18E24
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2019 18:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727215AbfEIQ3r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 May 2019 12:29:47 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40420 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727429AbfEIQ32 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 May 2019 12:29:28 -0400
Received: by mail-wr1-f67.google.com with SMTP id h4so3918241wre.7
        for <linux-gpio@vger.kernel.org>; Thu, 09 May 2019 09:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vmeMuMSDMRsdloGxuoikGok3kV3ygZ9BvAD0hdZ7+1Q=;
        b=M7g8EkqmvRrEK7koH/I8Kj1kubFPWigS6HT0fcBopuqWq6SnSLdzjd+eubupKFJI4i
         YGDwcdR/5lRYsBsRlACF3H4pHAfoY7mphC1mMDkk881qa6DNjfbOy7jeIjvkLnZcWgxu
         K4L3MBFd4sXJTvkKtg3ODCpogtLmWYr7agApw9asekiBLNjRelZwGw6T6qxEvPnISFJ3
         OO/S+2US00AnP1F7w+N9wTTmLXYfza8zcGcHC0VJt3ikurVHGHm/EnRxNrXO7ELpoRvT
         WeV/R0GQ4ndrXz08DqgjUFzn6R/z1R9K7D0VdX8H23y+bhodq8+c6viI/xYUUktpfBf/
         1p5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vmeMuMSDMRsdloGxuoikGok3kV3ygZ9BvAD0hdZ7+1Q=;
        b=eFk4fz/4rrr2u3tfYRUod6e4/1dDDzyZyNThV6Nr71lajblw3b0ARcP/2OZydyeHtr
         3p7Tg7E5QBZ5RMIO2A8gIn4m0qr0THwuC5yQ1XaVfGL+qFO8ZW55J0S/FhdtkTd367kr
         dB1FAWFa1R3PCvopsqGr/EgW5Urrmckmy9FmJDj9OWTo09S3qIrH4R0nno2agwSWPOtc
         lOacwibzVEK0uKnvphU2Rq3h2OwlO/W4DWbCdzEFT2Ni9KhLGhMXpns9YBBBsgc2P/6w
         HuDPQWmNS4i+ibaFWDIVOZth2/N9cf+2UtY9ZcFzYmbxsz32eBSK+aY8E1Z4kDCf8t97
         6aMQ==
X-Gm-Message-State: APjAAAXU6Ntd4yiXKE4yGqMUMt3Gcw8YySfAM1xdhx98n3rBndp6r7Ip
        9txhNMTGdVudIDQIMIW5IGr+WysVW54MOw==
X-Google-Smtp-Source: APXvYqxCuk1s27H8O/HjRxYrETBY3Dle2aP7hp3wHINxTaUhtWUEE3HBtL+EIIDnypQegrvcf8zy+g==
X-Received: by 2002:adf:da4a:: with SMTP id r10mr3858823wrl.216.1557419366867;
        Thu, 09 May 2019 09:29:26 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.home ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
        by smtp.gmail.com with ESMTPSA id k2sm4116297wrg.22.2019.05.09.09.29.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 09:29:26 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     linus.walleij@linaro.org, khilman@baylibre.com
Cc:     jbrunet@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/6] pinctrl: meson: Rework enable/disable bias part
Date:   Thu,  9 May 2019 18:29:18 +0200
Message-Id: <20190509162920.7054-5-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190509162920.7054-1-glaroque@baylibre.com>
References: <20190509162920.7054-1-glaroque@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

rework bias enable/disable part to prepare drive-strength integration
no functional changes

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 85 +++++++++++++++------------
 1 file changed, 49 insertions(+), 36 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 96a4a72708e4..8ea5c1527064 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -174,62 +174,75 @@ int meson_pmx_get_groups(struct pinctrl_dev *pcdev, unsigned selector,
 	return 0;
 }
 
-static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
-			     unsigned long *configs, unsigned num_configs)
+static int meson_pinconf_disable_bias(struct meson_pinctrl *pc,
+				      unsigned int pin)
 {
-	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
 	struct meson_bank *bank;
-	enum pin_config_param param;
-	unsigned int reg, bit;
-	int i, ret;
+	unsigned int reg, bit = 0;
+	int ret;
 
 	ret = meson_get_bank(pc, pin, &bank);
 	if (ret)
 		return ret;
 
+	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
+	ret = regmap_update_bits(pc->reg_pullen, reg, BIT(bit), 0);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int pin,
+				     bool pull_up)
+{
+	struct meson_bank *bank;
+	unsigned int reg, bit, val = 0;
+	int ret;
+
+	ret = meson_get_bank(pc, pin, &bank);
+	if (ret)
+		return ret;
+
+	meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
+	if (pull_up)
+		val = BIT(bit);
+
+	ret = regmap_update_bits(pc->reg_pull, reg, BIT(bit), val);
+	if (ret)
+		return ret;
+
+	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
+	ret = regmap_update_bits(pc->reg_pullen, reg, BIT(bit),	BIT(bit));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
+			     unsigned long *configs, unsigned num_configs)
+{
+	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
+	enum pin_config_param param;
+	int i, ret;
+
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
 
 		switch (param) {
 		case PIN_CONFIG_BIAS_DISABLE:
-			dev_dbg(pc->dev, "pin %u: disable bias\n", pin);
-
-			meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg,
-					       &bit);
-			ret = regmap_update_bits(pc->reg_pullen, reg,
-						 BIT(bit), 0);
+			ret = meson_pinconf_disable_bias(pc, pin);
 			if (ret)
 				return ret;
 			break;
 		case PIN_CONFIG_BIAS_PULL_UP:
-			dev_dbg(pc->dev, "pin %u: enable pull-up\n", pin);
-
-			meson_calc_reg_and_bit(bank, pin, REG_PULLEN,
-					       &reg, &bit);
-			ret = regmap_update_bits(pc->reg_pullen, reg,
-						 BIT(bit), BIT(bit));
-			if (ret)
-				return ret;
-
-			meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
-			ret = regmap_update_bits(pc->reg_pull, reg,
-						 BIT(bit), BIT(bit));
+			ret = meson_pinconf_enable_bias(pc, pin, true);
 			if (ret)
 				return ret;
 			break;
 		case PIN_CONFIG_BIAS_PULL_DOWN:
-			dev_dbg(pc->dev, "pin %u: enable pull-down\n", pin);
-
-			meson_calc_reg_and_bit(bank, pin, REG_PULLEN,
-					       &reg, &bit);
-			ret = regmap_update_bits(pc->reg_pullen, reg,
-						 BIT(bit), BIT(bit));
-			if (ret)
-				return ret;
-
-			meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
-			ret = regmap_update_bits(pc->reg_pull, reg,
-						 BIT(bit), 0);
+			ret = meson_pinconf_enable_bias(pc, pin, false);
 			if (ret)
 				return ret;
 			break;
-- 
2.17.1

