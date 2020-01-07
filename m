Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A826132718
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 14:09:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728066AbgAGNJJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 08:09:09 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39406 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728063AbgAGNJJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 08:09:09 -0500
Received: by mail-wr1-f66.google.com with SMTP id y11so53845595wrt.6
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 05:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dOra14YEaV44ubgsAivBtLe/fYp3aKaI+qe+0zSOjBs=;
        b=MnThldae9U3xf3TZ17WyVKTsfvHvUD1X9MrU103N5h4ZCwjOWPYkLbRJn+0EDnP+ms
         VYnycdcR6xYUl0mC7OlGIfKsKjy4xStQFWXPB7werEMXXYmnfG4mcXy1yKlyVpIsWf5k
         /W5HZUf5kG7ntSFG0Ll/fzfR0xuaO0XeH2Z65lU2aFrsGKE/+wLvKeopcUHe6P31k5c/
         f+8JkfVO7ZMBgcusD9LsWR9v1nf+G/C26anTmwiA0c5rb90lLCFxddSuXfabTGQZFvM4
         zUzN6ecDC3Sb+HfUShZ7BtViSZYyZlinUcd1bOZ5AWJ078CJMR4QzM5UUMFDtVbWK2zc
         R0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dOra14YEaV44ubgsAivBtLe/fYp3aKaI+qe+0zSOjBs=;
        b=sunLjXT4K+tpgdn0Za+jKklKmrjLuKLQ3UXVAF/l3tePr3cXvg4RSvZ8wLO/1D2wI/
         Zz3QA62dEdBj+Sm3KYdtQcBogFrBM6RVsTzVyxOn+7cx1hPUitd4sESpvKCKv4oEMyHE
         oXpTROxcLiUxALOp5vuSyxdyMNHFp8HbNlT5M7CU739HTF8hH109kdzEUasnsFFiod5T
         jXlW+xsdJ8rqb+n84NtSWhzbGjGwTwAI1DkLG37jxSTQWUevHRR+cVnGX0EZ+hzwEMoW
         oFBPlQB/c3i6kHF72/gn7NPrmHFOCGKv3eYNCJwkZGPDEDd1bbbjbLrlbIbUugbLlJxh
         m6ag==
X-Gm-Message-State: APjAAAXzWbPQfBf17vsMajuJ1Pgoyf4fxFoN+TmbVoEHiZkTlaTtOa6p
        8S749ySGLbZ1btb0C/G3haGCKg==
X-Google-Smtp-Source: APXvYqye/FAl2SX+wrbdjY7rkyMFaw93aVHnPxSc0cXTSBLx0RdB6XX5780feE18eQs88L9p63bj/w==
X-Received: by 2002:a5d:620b:: with SMTP id y11mr106337473wru.230.1578402546985;
        Tue, 07 Jan 2020 05:09:06 -0800 (PST)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id b18sm7287035wru.50.2020.01.07.05.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 05:09:06 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc:     robh@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, spapothi@codeaurora.org,
        bgoswami@codeaurora.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v7 2/2] gpio: wcd934x: Add support to wcd934x gpio controller
Date:   Tue,  7 Jan 2020 13:08:44 +0000
Message-Id: <20200107130844.20763-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200107130844.20763-1-srinivas.kandagatla@linaro.org>
References: <20200107130844.20763-1-srinivas.kandagatla@linaro.org>
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
 drivers/gpio/Kconfig        |   7 +++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-wcd934x.c | 121 ++++++++++++++++++++++++++++++++++++
 3 files changed, 129 insertions(+)
 create mode 100644 drivers/gpio/gpio-wcd934x.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8adffd42f8cb..693027191c19 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -613,6 +613,13 @@ config GPIO_VX855
 	  additional drivers must be enabled in order to use the
 	  functionality of the device.
 
+config GPIO_WCD934X
+	tristate "Qualcomm Technologies Inc WCD9340/WCD9341 gpio controller driver"
+	depends on MFD_WCD934X && OF_GPIO
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
index 000000000000..74913f2e5697
--- /dev/null
+++ b/drivers/gpio/gpio-wcd934x.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2019, Linaro Limited
+
+#include <linux/module.h>
+#include <linux/gpio/driver.h>
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
+static int wcd_gpio_get_direction(struct gpio_chip *chip, unsigned int pin)
+{
+	struct wcd_gpio_data *data = gpiochip_get_data(chip);
+	unsigned int value;
+	int ret;
+
+	ret = regmap_read(data->map, WCD_REG_DIR_CTL_OFFSET, &value);
+	if (ret < 0)
+		return ret;
+
+	if (value & WCD_PIN_MASK(pin))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
+}
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
+	chip->get_direction = wcd_gpio_get_direction;
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

