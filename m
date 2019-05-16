Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4851A20AE5
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2019 17:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbfEPPN6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 May 2019 11:13:58 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38620 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727375AbfEPPNv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 May 2019 11:13:51 -0400
Received: by mail-wm1-f68.google.com with SMTP id t5so2518317wmh.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 May 2019 08:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xwTuo9cmOBgLtYKY6tIim7Qw2ueucrmJKldtrpo1E+Y=;
        b=UEIXbPkC0myO/R8zz+1+yUD/Q5UNbeXQFQrtPdEteSSLrLwX/C9QqW0eoPGbHdLw1u
         yL1vNOm1OfYJJUk7Qnvw/ZnCISmv7Agd2/HeO27ECus6Xx1frxbByuv9fnY2YNzkgziz
         uukXc5YH3b4iGErd0z3e9bqjCn7bQxeTek3vcUxJc//EdAtSI/EoJcg77vTD43pX/+JF
         pC5oO3hKti5JOrvJe2wzmSWhFckYB2PDxDIm7dr21YXZjc7JC5B/xRrnHSrI3tKH2vvG
         u8KDzLYHQ5hqU9gqm+fAvS8d5v2LLgQ65I3k5X7WU3M+de19aZOXjJy7FqUjLGfVtlNW
         D/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xwTuo9cmOBgLtYKY6tIim7Qw2ueucrmJKldtrpo1E+Y=;
        b=DtZaC0Ej0s6uPqMhUGNcpIsBsgy+L7c7FF6ZcL5bvcn8TZ6AcUu4Q/TVTHGQFIHi/g
         0v6rBarqYAdtINpsf459bDvruuT0XjP+qa1lnJtFHG3PtL5JNE4UlNYq7UVZ4O33L7GX
         mnRfeewGU9tAQw6IwM5OBAGn0fDsmIUbSUXOP52+t+2bn0J+efhyuLsIaUR7uARMXEpu
         4mucKRcuCh/tq+xZudfU5dWfFsI+SUFI3U26c6MfgFdqn81jMDhIaqKxr+o5vRTEdH4U
         TmL5pli2MxLXMNpHlMkbQ/39FEnVM+pNBbgNSb5hVrQk0RJO/yheidMGp5asd686xlDS
         0AfA==
X-Gm-Message-State: APjAAAWCaxzeec6DlU0w8JD8RaBHAIeN++eFN/jEKacWcEnifz35BiGW
        nbPcmBOhoBHJBQLgryrNZsxYfA==
X-Google-Smtp-Source: APXvYqxtX0A2PAeunKpL7XXFo1SfjQP7HuVm6uvMgg+h/dgz2iYpPyM3craEvwnREeu3sykqjWru0g==
X-Received: by 2002:a1c:d182:: with SMTP id i124mr7089369wmg.102.1558019628440;
        Thu, 16 May 2019 08:13:48 -0700 (PDT)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id 17sm6968126wrk.91.2019.05.16.08.13.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 May 2019 08:13:47 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: meson: add output support in pinconf
Date:   Thu, 16 May 2019 17:13:39 +0200
Message-Id: <20190516151339.25846-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190516151339.25846-1-jbrunet@baylibre.com>
References: <20190516151339.25846-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pinconf support for PIN_CONFIG_OUTPUT_ENABLE and PIN_CONFIG_OUTPUT
in the meson pinctrl driver.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 182 ++++++++++++++++++--------
 1 file changed, 127 insertions(+), 55 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 33b4b141baac..410eb7559016 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -174,6 +174,88 @@ int meson_pmx_get_groups(struct pinctrl_dev *pcdev, unsigned selector,
 	return 0;
 }
 
+static int meson_pinconf_set_gpio_bit(struct meson_pinctrl *pc,
+				      unsigned int pin,
+				      unsigned int reg_type,
+				      bool arg)
+{
+	struct meson_bank *bank;
+	unsigned int reg, bit;
+	int ret;
+
+	ret = meson_get_bank(pc, pin, &bank);
+	if (ret)
+		return ret;
+
+	meson_calc_reg_and_bit(bank, pin, reg_type, &reg, &bit);
+	return regmap_update_bits(pc->reg_gpio, reg, BIT(bit),
+				  arg ? BIT(bit) : 0);
+}
+
+static int meson_pinconf_get_gpio_bit(struct meson_pinctrl *pc,
+				      unsigned int pin,
+				      unsigned int reg_type)
+{
+	struct meson_bank *bank;
+	unsigned int reg, bit, val;
+	int ret;
+
+	ret = meson_get_bank(pc, pin, &bank);
+	if (ret)
+		return ret;
+
+	meson_calc_reg_and_bit(bank, pin, reg_type, &reg, &bit);
+	ret = regmap_read(pc->reg_gpio, reg, &val);
+	if (ret)
+		return ret;
+
+	return BIT(bit) & val ? 1 : 0;
+}
+
+static int meson_pinconf_set_output(struct meson_pinctrl *pc,
+				    unsigned int pin,
+				    bool out)
+{
+	return meson_pinconf_set_gpio_bit(pc, pin, REG_DIR, !out);
+}
+
+static int meson_pinconf_get_output(struct meson_pinctrl *pc,
+				    unsigned int pin)
+{
+	int ret = meson_pinconf_get_gpio_bit(pc, pin, REG_DIR);
+
+	if (ret < 0)
+		return ret;
+
+	return !ret;
+}
+
+static int meson_pinconf_set_drive(struct meson_pinctrl *pc,
+				   unsigned int pin,
+				   bool high)
+{
+	return meson_pinconf_set_gpio_bit(pc, pin, REG_OUT, high);
+}
+
+static int meson_pinconf_get_drive(struct meson_pinctrl *pc,
+				   unsigned int pin)
+{
+	return meson_pinconf_get_gpio_bit(pc, pin, REG_OUT);
+}
+
+static int meson_pinconf_set_output_drive(struct meson_pinctrl *pc,
+					  unsigned int pin,
+					  bool high)
+{
+	int ret;
+
+	ret = meson_pinconf_set_output(pc, pin, true);
+	if (ret)
+		return ret;
+
+	return meson_pinconf_set_drive(pc, pin, high);
+}
+
 static int meson_pinconf_disable_bias(struct meson_pinctrl *pc,
 				      unsigned int pin)
 {
@@ -267,39 +349,48 @@ static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
 {
 	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
 	enum pin_config_param param;
-	unsigned int drive_strength_ua;
+	unsigned int arg = 0;
 	int i, ret;
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
 
+		switch (param) {
+		case PIN_CONFIG_DRIVE_STRENGTH_UA:
+		case PIN_CONFIG_OUTPUT_ENABLE:
+		case PIN_CONFIG_OUTPUT:
+			arg = pinconf_to_config_argument(configs[i]);
+			break;
+
+		default:
+			break;
+		}
+
 		switch (param) {
 		case PIN_CONFIG_BIAS_DISABLE:
 			ret = meson_pinconf_disable_bias(pc, pin);
-			if (ret)
-				return ret;
 			break;
 		case PIN_CONFIG_BIAS_PULL_UP:
 			ret = meson_pinconf_enable_bias(pc, pin, true);
-			if (ret)
-				return ret;
 			break;
 		case PIN_CONFIG_BIAS_PULL_DOWN:
 			ret = meson_pinconf_enable_bias(pc, pin, false);
-			if (ret)
-				return ret;
 			break;
 		case PIN_CONFIG_DRIVE_STRENGTH_UA:
-			drive_strength_ua =
-				pinconf_to_config_argument(configs[i]);
-			ret = meson_pinconf_set_drive_strength
-				(pc, pin, drive_strength_ua);
-			if (ret)
-				return ret;
+			ret = meson_pinconf_set_drive_strength(pc, pin, arg);
+			break;
+		case PIN_CONFIG_OUTPUT_ENABLE:
+			ret = meson_pinconf_set_output(pc, pin, arg);
+			break;
+		case PIN_CONFIG_OUTPUT:
+			ret = meson_pinconf_set_output_drive(pc, pin, arg);
 			break;
 		default:
-			return -ENOTSUPP;
+			ret = -ENOTSUPP;
 		}
+
+		if (ret)
+			return ret;
 	}
 
 	return 0;
@@ -403,6 +494,24 @@ static int meson_pinconf_get(struct pinctrl_dev *pcdev, unsigned int pin,
 		if (ret)
 			return ret;
 		break;
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		ret = meson_pinconf_get_output(pc, pin);
+		if (ret <= 0)
+			return -EINVAL;
+		arg = 1;
+		break;
+	case PIN_CONFIG_OUTPUT:
+		ret = meson_pinconf_get_output(pc, pin);
+		if (ret <= 0)
+			return -EINVAL;
+
+		ret = meson_pinconf_get_drive(pc, pin);
+		if (ret < 0)
+			return -EINVAL;
+
+		arg = ret;
+		break;
+
 	default:
 		return -ENOTSUPP;
 	}
@@ -447,56 +556,19 @@ static const struct pinconf_ops meson_pinconf_ops = {
 
 static int meson_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 {
-	struct meson_pinctrl *pc = gpiochip_get_data(chip);
-	unsigned int reg, bit;
-	struct meson_bank *bank;
-	int ret;
-
-	ret = meson_get_bank(pc, gpio, &bank);
-	if (ret)
-		return ret;
-
-	meson_calc_reg_and_bit(bank, gpio, REG_DIR, &reg, &bit);
-
-	return regmap_update_bits(pc->reg_gpio, reg, BIT(bit), BIT(bit));
+	return meson_pinconf_set_output(gpiochip_get_data(chip), gpio, false);
 }
 
 static int meson_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
 				       int value)
 {
-	struct meson_pinctrl *pc = gpiochip_get_data(chip);
-	unsigned int reg, bit;
-	struct meson_bank *bank;
-	int ret;
-
-	ret = meson_get_bank(pc, gpio, &bank);
-	if (ret)
-		return ret;
-
-	meson_calc_reg_and_bit(bank, gpio, REG_DIR, &reg, &bit);
-	ret = regmap_update_bits(pc->reg_gpio, reg, BIT(bit), 0);
-	if (ret)
-		return ret;
-
-	meson_calc_reg_and_bit(bank, gpio, REG_OUT, &reg, &bit);
-	return regmap_update_bits(pc->reg_gpio, reg, BIT(bit),
-				  value ? BIT(bit) : 0);
+	return meson_pinconf_set_output_drive(gpiochip_get_data(chip),
+					      gpio, value);
 }
 
 static void meson_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
 {
-	struct meson_pinctrl *pc = gpiochip_get_data(chip);
-	unsigned int reg, bit;
-	struct meson_bank *bank;
-	int ret;
-
-	ret = meson_get_bank(pc, gpio, &bank);
-	if (ret)
-		return;
-
-	meson_calc_reg_and_bit(bank, gpio, REG_OUT, &reg, &bit);
-	regmap_update_bits(pc->reg_gpio, reg, BIT(bit),
-			   value ? BIT(bit) : 0);
+	meson_pinconf_set_drive(gpiochip_get_data(chip), gpio, value);
 }
 
 static int meson_gpio_get(struct gpio_chip *chip, unsigned gpio)
-- 
2.20.1

