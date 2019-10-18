Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63E78DBAA7
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2019 02:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503961AbfJRAU2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 20:20:28 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42901 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503892AbfJRAUN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 20:20:13 -0400
Received: by mail-wr1-f67.google.com with SMTP id n14so4254023wrw.9
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2019 17:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NFhJ0Ish0UcipllWIdsD8WX5howJ70tuJMN0799CtbQ=;
        b=mXrPH9WdiLYexh2aFZIBmMo+VBUpmnvFu67nbIYZkiXxpkKXrfP9CDVmUsFWkPlD90
         ENTkcNStSwhqA/cr8cSRgJUt3B2S/xAi/KeOcyLLf3eCJTTnn4u2DrCN8u6f/9dd40oW
         98e8YBYB6jSglGiZliD6t+pY49NMvErUXfDd6+opJiGw7Lu86qNAA38cveFMGjgoJwnX
         iTjtIGclsPdRnVK2wyY8w9gTDoRiBWo1owNTCw+0Td4Fk5L3BAw/KZvXNPGPla/qECtg
         mxsF1vzNyxcL7wSMfHc1L82DnGcV1yrLeltQtKoRTwtcwcPniXF27vrMQMA/+wJMZLL/
         Fcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NFhJ0Ish0UcipllWIdsD8WX5howJ70tuJMN0799CtbQ=;
        b=CUGqqJtF6e3c6Am20+eRb3RXJozUBMXJSU48n0BEajRecKN99VP72tyc6kkU7GLg/g
         VHu5msI6PR3tkdplvYNSVJzArQCHRqh8Gi1aku/iSj7Da5LiuWwRb1t1LqJn54YQqr71
         RqQJpa0gBkGwo2+DFOJtTEhgKg70G9yXFNiMEIz7ZAY6I4/F7CtorM2VxOlgPhc0uZkQ
         ZhR8WJNHLXgNifZPatg4WfYWpjCg9er+nSCpbiZuiUVK73Lkm6fFNDn0MUMo6t0jVRtu
         IG2Ps3hNq+9XoIBYvdnw70xPggKCNBnwdWoUlk4LjIwya7zZA3f2tIhRIkyH+HKmhe8p
         DNNQ==
X-Gm-Message-State: APjAAAXgm6Z16RkL90uOzm1sA5/09yREq6+3MAh+ZmmIMqhjClnnqMzl
        XkV7m4BgmyvB5V8U/F311ysesg==
X-Google-Smtp-Source: APXvYqwij7hrP3gERpA/4mEFvTiOe8rsmfjT4dHYBYN+EGZcfJ8LmqMDRu/QG0y/jD8r0ETvVYUobQ==
X-Received: by 2002:adf:f343:: with SMTP id e3mr5153138wrp.315.1571358008368;
        Thu, 17 Oct 2019 17:20:08 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id z189sm4851248wmc.25.2019.10.17.17.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 17:20:07 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robh@kernel.org, broonie@kernel.org, linus.walleij@linaro.org,
        lee.jones@linaro.org
Cc:     vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org,
        Yeleswarapu Nagaradhesh <nagaradh@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 09/11] pinctrl: qcom-wcd934x: Add support to wcd934x pinctrl driver.
Date:   Fri, 18 Oct 2019 01:18:47 +0100
Message-Id: <20191018001849.27205-10-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Yeleswarapu Nagaradhesh <nagaradh@codeaurora.org>

This patch adds support to wcd934x pinctrl block found in
WCD9340/WC9341 Audio codecs.

[Srini: multiple cleanups to the code]
Signed-off-by: Yeleswarapu Nagaradhesh <nagaradh@codeaurora.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/pinctrl/qcom/Kconfig                |   7 +
 drivers/pinctrl/qcom/Makefile               |   1 +
 drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c | 365 ++++++++++++++++++++
 3 files changed, 373 insertions(+)
 create mode 100644 drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 32fc2458b8eb..7406df5fb89a 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -195,4 +195,11 @@ config PINCTRL_SM8150
          Qualcomm Technologies Inc TLMM block found on the Qualcomm
          Technologies Inc SM8150 platform.
 
+config PINCTRL_WCD934X
+	tristate "Qualcomm Technologies Inc WCD9340/WCD9341 pin controller driver"
+	depends on GPIOLIB && OF
+	help
+         This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+         Qualcomm Technologies Inc Pinctrl block found on the Qualcomm
+         Technologies Inc WCD9340/WCD9341 Audio Codec.
 endif
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index f8bb0c265381..8c42ba1bdd69 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -24,3 +24,4 @@ obj-$(CONFIG_PINCTRL_SC7180)	+= pinctrl-sc7180.o
 obj-$(CONFIG_PINCTRL_SDM660)   += pinctrl-sdm660.o
 obj-$(CONFIG_PINCTRL_SDM845) += pinctrl-sdm845.o
 obj-$(CONFIG_PINCTRL_SM8150) += pinctrl-sm8150.o
+obj-$(CONFIG_PINCTRL_WCD934X) += pinctrl-wcd934x-gpio.o
diff --git a/drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c b/drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c
new file mode 100644
index 000000000000..1aff88d0bcb3
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c
@@ -0,0 +1,365 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2016-2017, The Linux Foundation. All rights reserved.
+// Copyright (c) 2019, Linaro Limited
+
+#include <linux/module.h>
+#include <linux/gpio.h>
+#include <linux/interrupt.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_gpio.h>
+
+#include "../core.h"
+#include "../pinctrl-utils.h"
+
+#define WCD_REG_DIR_CTL_OFFSET 0x42
+#define WCD_REG_VAL_CTL_OFFSET 0x43
+#define WCD_GPIO_PULL_UP       1
+#define WCD_GPIO_PULL_DOWN     2
+#define WCD_GPIO_BIAS_DISABLE  3
+#define WCD_GPIO_STRING_LEN    20
+#define WCD934X_NPINS		5
+
+/**
+ * struct wcd_gpio_pad - keep current GPIO settings
+ * @offset: offset of gpio.
+ * @is_valid: Set to false, when GPIO in high Z state.
+ * @value: value of a pin
+ * @output_enabled: Set to true if GPIO is output and false if it is input
+ * @pullup: Constant current which flow through GPIO output buffer.
+ * @strength: Drive strength of a pin
+ */
+struct wcd_gpio_pad {
+	u16  offset;
+	bool is_valid;
+	bool value;
+	bool output_enabled;
+	unsigned int pullup;
+	unsigned int strength;
+};
+
+struct wcd_gpio_priv {
+	struct device *dev;
+	struct regmap *map;
+	struct pinctrl_dev *ctrl;
+	struct gpio_chip chip;
+};
+
+static int wcd_gpio_read(struct wcd_gpio_priv *priv_data,
+			 struct wcd_gpio_pad *pad, unsigned int addr)
+{
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(priv_data->map, addr, &val);
+	if (ret < 0)
+		dev_err(priv_data->dev, "%s: read 0x%x failed\n",
+			__func__, addr);
+	else
+		ret = (val >> pad->offset);
+
+	return ret;
+}
+
+static int wcd_gpio_write(struct wcd_gpio_priv *priv_data,
+			  struct wcd_gpio_pad *pad, unsigned int addr,
+			  unsigned int val)
+{
+	int ret;
+
+	ret = regmap_update_bits(priv_data->map, addr, (1 << pad->offset),
+				 val << pad->offset);
+	if (ret < 0)
+		dev_err(priv_data->dev, "write 0x%x failed\n", addr);
+
+	return ret;
+}
+
+static int wcd_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	return pctldev->desc->npins;
+}
+
+static const char *wcd_get_group_name(struct pinctrl_dev *pctldev,
+				      unsigned int pin)
+{
+	return pctldev->desc->pins[pin].name;
+}
+
+static int wcd_get_group_pins(struct pinctrl_dev *pctldev, unsigned int pin,
+			      const unsigned int **pins, unsigned int *num_pins)
+{
+	*pins = &pctldev->desc->pins[pin].number;
+	*num_pins = 1;
+
+	return 0;
+}
+
+static const struct pinctrl_ops wcd_pinctrl_ops = {
+	.get_groups_count       = wcd_get_groups_count,
+	.get_group_name         = wcd_get_group_name,
+	.get_group_pins         = wcd_get_group_pins,
+	.dt_node_to_map         = pinconf_generic_dt_node_to_map_group,
+	.dt_free_map            = pinctrl_utils_free_map,
+};
+
+static int wcd_config_get(struct pinctrl_dev *pctldev,
+			  unsigned int pin, unsigned long *config)
+{
+	unsigned int param = pinconf_to_config_param(*config);
+	struct wcd_gpio_pad *pad;
+	unsigned int arg;
+
+	pad = pctldev->desc->pins[pin].drv_data;
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		arg = pad->pullup == WCD_GPIO_PULL_DOWN;
+		break;
+	case PIN_CONFIG_BIAS_DISABLE:
+		arg = pad->pullup = WCD_GPIO_BIAS_DISABLE;
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		arg = pad->pullup == WCD_GPIO_PULL_UP;
+		break;
+	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+		arg = !pad->is_valid;
+		break;
+	case PIN_CONFIG_INPUT_ENABLE:
+		arg = pad->output_enabled;
+		break;
+	case PIN_CONFIG_OUTPUT:
+		arg = pad->value;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	*config = pinconf_to_config_packed(param, arg);
+	return 0;
+}
+
+static int wcd_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
+			  unsigned long *configs, unsigned int nconfs)
+{
+	struct wcd_gpio_priv *priv_data = pinctrl_dev_get_drvdata(pctldev);
+	struct wcd_gpio_pad *pad;
+	unsigned int param, arg;
+	int i, ret;
+
+	pad = pctldev->desc->pins[pin].drv_data;
+
+	for (i = 0; i < nconfs; i++) {
+		param = pinconf_to_config_param(configs[i]);
+		arg = pinconf_to_config_argument(configs[i]);
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_DISABLE:
+			pad->pullup = WCD_GPIO_BIAS_DISABLE;
+			break;
+		case PIN_CONFIG_BIAS_PULL_UP:
+			pad->pullup = WCD_GPIO_PULL_UP;
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			pad->pullup = WCD_GPIO_PULL_DOWN;
+			break;
+		case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+			pad->is_valid = false;
+			break;
+		case PIN_CONFIG_INPUT_ENABLE:
+			pad->output_enabled = false;
+			break;
+		case PIN_CONFIG_OUTPUT:
+			pad->output_enabled = true;
+			pad->value = arg;
+			break;
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			pad->strength = arg;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	ret = wcd_gpio_write(priv_data, pad, WCD_REG_DIR_CTL_OFFSET,
+			     pad->output_enabled);
+	if (ret < 0)
+		return ret;
+
+	if (pad->output_enabled)
+		ret = wcd_gpio_write(priv_data, pad, WCD_REG_VAL_CTL_OFFSET,
+				     pad->value);
+
+	return ret;
+}
+
+static const struct pinconf_ops wcd_pinconf_ops = {
+	.is_generic  = true,
+	.pin_config_group_get = wcd_config_get,
+	.pin_config_group_set = wcd_config_set,
+};
+
+static int wcd_gpio_direction_input(struct gpio_chip *chip, unsigned int pin)
+{
+	struct wcd_gpio_priv *priv_data = gpiochip_get_data(chip);
+	unsigned long config;
+
+	config = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 1);
+
+	return wcd_config_set(priv_data->ctrl, pin, &config, 1);
+}
+
+static int wcd_gpio_direction_output(struct gpio_chip *chip,
+				      unsigned int pin, int val)
+{
+	struct wcd_gpio_priv *priv_data = gpiochip_get_data(chip);
+	unsigned long config;
+
+	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT, val);
+
+	return wcd_config_set(priv_data->ctrl, pin, &config, 1);
+}
+
+static int wcd_gpio_get(struct gpio_chip *chip, unsigned int pin)
+{
+	struct wcd_gpio_priv *priv_data = gpiochip_get_data(chip);
+	struct wcd_gpio_pad *pad;
+	int value;
+
+	pad = priv_data->ctrl->desc->pins[pin].drv_data;
+
+	if (!pad->is_valid)
+		return -EINVAL;
+
+	value = wcd_gpio_read(priv_data, pad, WCD_REG_VAL_CTL_OFFSET);
+
+	return value;
+}
+
+static void wcd_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
+{
+	struct wcd_gpio_priv *priv_data = gpiochip_get_data(chip);
+	unsigned long config;
+
+	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT, value);
+
+	wcd_config_set(priv_data->ctrl, pin, &config, 1);
+}
+
+static const struct gpio_chip wcd_gpio_chip = {
+	.direction_input  = wcd_gpio_direction_input,
+	.direction_output = wcd_gpio_direction_output,
+	.get = wcd_gpio_get,
+	.set = wcd_gpio_set,
+};
+
+static int wcd_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct pinctrl_pin_desc *pindesc;
+	struct pinctrl_desc *pctrldesc;
+	struct wcd_gpio_pad *pad, *pads;
+	struct wcd_gpio_priv *priv_data;
+	u32 npins = WCD934X_NPINS;
+	char **name;
+	int i;
+
+	priv_data = devm_kzalloc(dev, sizeof(*priv_data), GFP_KERNEL);
+	if (!priv_data)
+		return -ENOMEM;
+
+	priv_data->dev = dev;
+	priv_data->map = dev_get_regmap(dev->parent, NULL);
+	if (!priv_data->map) {
+		dev_err(dev, "%s: failed to get regmap\n", __func__);
+		return  -EINVAL;
+	}
+
+	pindesc = devm_kcalloc(dev, npins, sizeof(*pindesc), GFP_KERNEL);
+	if (!pindesc)
+		return -ENOMEM;
+
+	pads = devm_kcalloc(dev, npins, sizeof(*pads), GFP_KERNEL);
+	if (!pads)
+		return -ENOMEM;
+
+	pctrldesc = devm_kzalloc(dev, sizeof(*pctrldesc), GFP_KERNEL);
+	if (!pctrldesc)
+		return -ENOMEM;
+
+	pctrldesc->pctlops = &wcd_pinctrl_ops;
+	pctrldesc->confops = &wcd_pinconf_ops;
+	pctrldesc->owner = THIS_MODULE;
+	pctrldesc->name = dev_name(dev);
+	pctrldesc->pins = pindesc;
+	pctrldesc->npins = npins;
+
+	name = devm_kcalloc(dev, npins, sizeof(char *), GFP_KERNEL);
+	if (!name)
+		return -ENOMEM;
+
+	for (i = 0; i < npins; i++, pindesc++) {
+		name[i] = devm_kzalloc(dev, sizeof(char) * WCD_GPIO_STRING_LEN,
+				       GFP_KERNEL);
+		if (!name[i])
+			return -ENOMEM;
+
+		pad = &pads[i];
+		pindesc->drv_data = pad;
+		pindesc->number = i;
+		snprintf(name[i], (WCD_GPIO_STRING_LEN - 1), "gpio%d", (i+1));
+		pindesc->name = name[i];
+		pad->offset = i;
+		pad->is_valid  = true;
+	}
+
+	priv_data->chip = wcd_gpio_chip;
+	priv_data->chip.parent = dev;
+	priv_data->chip.base = -1;
+	priv_data->chip.ngpio = npins;
+	priv_data->chip.label = dev_name(dev);
+	priv_data->chip.of_gpio_n_cells = 2;
+	priv_data->chip.can_sleep = false;
+	platform_set_drvdata(pdev, priv_data);
+
+	priv_data->ctrl = devm_pinctrl_register(dev, pctrldesc, priv_data);
+	if (IS_ERR(priv_data->ctrl)) {
+		dev_err(dev, "%s: failed to register to pinctrl\n", __func__);
+		return PTR_ERR(priv_data->ctrl);
+	}
+
+	return gpiochip_add_data(&priv_data->chip, priv_data);
+}
+
+static int wcd_pinctrl_remove(struct platform_device *pdev)
+{
+	struct wcd_gpio_priv *priv_data = platform_get_drvdata(pdev);
+
+	gpiochip_remove(&priv_data->chip);
+
+	return 0;
+}
+
+static const struct of_device_id wcd_pinctrl_of_match[] = {
+	{ .compatible = "qcom,wcd9340-pinctrl" },
+	{ .compatible = "qcom,wcd9341-pinctrl" },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, wcd_pinctrl_of_match);
+
+static struct platform_driver wcd_pinctrl_driver = {
+	.driver = {
+		   .name = "wcd934x-pinctrl",
+		   .of_match_table = wcd_pinctrl_of_match,
+	},
+	.probe = wcd_pinctrl_probe,
+	.remove = wcd_pinctrl_remove,
+};
+
+module_platform_driver(wcd_pinctrl_driver);
+
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc WCD GPIO pin control driver");
+MODULE_LICENSE("GPL v2");
-- 
2.21.0

