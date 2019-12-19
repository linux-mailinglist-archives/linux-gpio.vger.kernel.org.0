Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA069125F0B
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 11:33:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbfLSKdf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 05:33:35 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38313 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726884AbfLSKdQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 05:33:16 -0500
Received: by mail-wr1-f68.google.com with SMTP id y17so5450486wrh.5
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 02:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DVqcfTgjqDIP2wy7JDCyl9+vrKLd49ALRMx75DX6+Wc=;
        b=ktZZjyoTyUtEdNALf1SUzrS1RPulAqz9Se89Q4db1cThkkBsCMs7gsG3rDtjq0yNsi
         1sjtnRgiV78PeN17xTD2FWam85YUufWlTpQnBXMbIi06RLpnGboxtv+lh2I7L6ZZ6H1O
         3tfMyfeWxJUph3D1z8GuVXxKMcMCGa80N4qGnVTJc+0jwa5vjgerOi5ecxVgWHzOpM34
         snKbXZbSzJyTQh3V20VFLiT7UOnM4/BX84Iflpnejm/qpOw8ITHqpwm/y8Bg0ZPVgyV1
         7unaqHWFOSXFtKm9uVU4Ca4EHzCkmntnjAK9Nd8DGIAR2LrbCdoidB5OEZ8WN0+E3dMr
         WZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DVqcfTgjqDIP2wy7JDCyl9+vrKLd49ALRMx75DX6+Wc=;
        b=hvlmCBjxEhXDeHz8Zojbm4McWhPnCsFcs5ojnjgf9/S2oq0xbJULlzC3m5fU1h0WrM
         46vhM21pneZlM3aENCYExpuHz4ZawBkwSIo39jSCgPeQlgClAI/kOUpFtXpzYqaI8OrU
         Jv1R7XNM6iUY9y4sVD9jb0OaFG7m5RF89cKhj396zdFchQ+5/gfEPbuJIFgc3uiU9spO
         Ynva9wIxzZJQV74a1WDTxzoTIlf9Ky6pnfa/RHiA2y66r07mUk0KMDuSWCqR5HUiKNta
         oJOQF6I9ZX0IxqyvGaonIh8xHy9e/kscg+E1qA/aiTdmyjkP73YxxppI68grXdSItbs5
         Lr5g==
X-Gm-Message-State: APjAAAVfsWWTMali6gWAD1pX0OiiJqsOAaRSQOlm69Jy+14OWzWx5ZGX
        2i7WV2GbhGqbQ/YHo7X+OC+19A==
X-Google-Smtp-Source: APXvYqywH6nF4apRKFQBfuslkaG/uLnfHUFGV9WQbZz83s/5IJ6BvRgIs+spPH6XgHIa6218fyOCfA==
X-Received: by 2002:adf:de84:: with SMTP id w4mr8217555wrl.97.1576751593796;
        Thu, 19 Dec 2019 02:33:13 -0800 (PST)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id i11sm5962942wrs.10.2019.12.19.02.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 02:33:13 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     broonie@kernel.org, lee.jones@linaro.org, linus.walleij@linaro.org
Cc:     robh@kernel.org, vinod.koul@linaro.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, spapothi@codeaurora.org,
        bgoswami@codeaurora.org, linux-gpio@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v6 09/11] gpio: wcd934x: Add support to wcd934x gpio controller
Date:   Thu, 19 Dec 2019 10:31:51 +0000
Message-Id: <20191219103153.14875-10-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
References: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds support to wcd934x gpio block found in
WCD9340/WC9341 Audio codecs.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/gpio/Kconfig        |   8 +++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-wcd934x.c | 104 ++++++++++++++++++++++++++++++++++++
 3 files changed, 113 insertions(+)
 create mode 100644 drivers/gpio/gpio-wcd934x.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8adffd42f8cb..3da3e228c221 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -613,6 +613,14 @@ config GPIO_VX855
 	  additional drivers must be enabled in order to use the
 	  functionality of the device.
 
+config GPIO_WCD934X
+	tristate "Qualcomm Technologies Inc WCD9340/WCD9341 gpio controller driver"
+	depends on MFD_WCD934X && OF_GPIO
+	select GPIO_GENERIC
+	help
+         This driver is to supprot GPIO block found on the Qualcomm Technologies
+	 Inc WCD9340/WCD9341 Audio Codec.
+
 config GPIO_XGENE
 	bool "APM X-Gene GPIO controller support"
 	depends on ARM64 && OF_GPIO
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 34eb8b2b12dd..116133f905e7 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -157,6 +157,7 @@ obj-$(CONFIG_GPIO_VF610)		+= gpio-vf610.o
 obj-$(CONFIG_GPIO_VIPERBOARD)		+= gpio-viperboard.o
 obj-$(CONFIG_GPIO_VR41XX)		+= gpio-vr41xx.o
 obj-$(CONFIG_GPIO_VX855)		+= gpio-vx855.o
+obj-$(CONFIG_GPIO_WCD934X)		+= gpio-wcd934x.o
 obj-$(CONFIG_GPIO_WHISKEY_COVE)		+= gpio-wcove.o
 obj-$(CONFIG_GPIO_WINBOND)		+= gpio-winbond.o
 obj-$(CONFIG_GPIO_WM831X)		+= gpio-wm831x.o
diff --git a/drivers/gpio/gpio-wcd934x.c b/drivers/gpio/gpio-wcd934x.c
new file mode 100644
index 000000000000..0aac33235c5f
--- /dev/null
+++ b/drivers/gpio/gpio-wcd934x.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2019, Linaro Limited
+
+#include <linux/module.h>
+#include <linux/gpio.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/of_device.h>
+
+#define WCD_PIN_MASK(p) BIT(p - 1)
+#define WCD_REG_DIR_CTL_OFFSET 0x42
+#define WCD_REG_VAL_CTL_OFFSET 0x43
+#define WCD934X_NPINS		5
+
+struct wcd_gpio_data {
+	struct regmap *map;
+	struct gpio_chip chip;
+};
+
+static int wcd_gpio_direction_input(struct gpio_chip *chip, unsigned int pin)
+{
+	struct wcd_gpio_data *data = gpiochip_get_data(chip);
+
+	return regmap_update_bits(data->map, WCD_REG_DIR_CTL_OFFSET,
+				  WCD_PIN_MASK(pin), 0);
+}
+
+static int wcd_gpio_direction_output(struct gpio_chip *chip, unsigned int pin,
+				     int val)
+{
+	struct wcd_gpio_data *data = gpiochip_get_data(chip);
+
+	regmap_update_bits(data->map, WCD_REG_DIR_CTL_OFFSET,
+			   WCD_PIN_MASK(pin), WCD_PIN_MASK(pin));
+
+	return regmap_update_bits(data->map, WCD_REG_VAL_CTL_OFFSET,
+				  WCD_PIN_MASK(pin),
+				  val ? WCD_PIN_MASK(pin) : 0);
+}
+
+static int wcd_gpio_get(struct gpio_chip *chip, unsigned int pin)
+{
+	struct wcd_gpio_data *data = gpiochip_get_data(chip);
+	int value;
+
+	regmap_read(data->map, WCD_REG_VAL_CTL_OFFSET, &value);
+
+	return !!(value && WCD_PIN_MASK(pin));
+}
+
+static void wcd_gpio_set(struct gpio_chip *chip, unsigned int pin, int val)
+{
+	wcd_gpio_direction_output(chip, pin, val);
+}
+
+static int wcd_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct wcd_gpio_data *data;
+	struct gpio_chip *chip;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->map = dev_get_regmap(dev->parent, NULL);
+	if (!data->map) {
+		dev_err(dev, "%s: failed to get regmap\n", __func__);
+		return  -EINVAL;
+	}
+
+	chip = &data->chip;
+	chip->direction_input  = wcd_gpio_direction_input;
+	chip->direction_output = wcd_gpio_direction_output;
+	chip->get = wcd_gpio_get;
+	chip->set = wcd_gpio_set;
+	chip->parent = dev;
+	chip->base = -1;
+	chip->ngpio = WCD934X_NPINS;
+	chip->label = dev_name(dev);
+	chip->of_gpio_n_cells = 2;
+	chip->can_sleep = false;
+
+	return devm_gpiochip_add_data(dev, chip, data);
+}
+
+static const struct of_device_id wcd_gpio_of_match[] = {
+	{ .compatible = "qcom,wcd9340-gpio" },
+	{ .compatible = "qcom,wcd9341-gpio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, wcd_gpio_of_match);
+
+static struct platform_driver wcd_gpio_driver = {
+	.driver = {
+		   .name = "wcd934x-gpio",
+		   .of_match_table = wcd_gpio_of_match,
+	},
+	.probe = wcd_gpio_probe,
+};
+
+module_platform_driver(wcd_gpio_driver);
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc WCD GPIO control driver");
+MODULE_LICENSE("GPL v2");
-- 
2.21.0

