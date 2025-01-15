Return-Path: <linux-gpio+bounces-14810-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A60F0A119DC
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 07:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2DA31640B9
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 06:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1FF22FAFF;
	Wed, 15 Jan 2025 06:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NMHuIPPz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBE422F820;
	Wed, 15 Jan 2025 06:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736923323; cv=none; b=ACe0SQSH/E2XTRvNruT51ImIhVXimNxkRaxCqVG7+ulC6X5R52A2xDEDBw5EoFJZqP3NPjnM0QUPgjGAWyqpqCgL6iLDgWOuuBsSJmZ1AHZNb5j0K2XOw1Yu+bZnYRGDX6bNySoBerO+pASMrW5UfHykM3e0xJYlt/g2X9GklLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736923323; c=relaxed/simple;
	bh=aZjZzHMkosGxEQcOgbVAJ2C+NA1D6LE2cArAw+uM44c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nFLXcppN439iiulXKV3dGnbKHLk3T4eEGlS/Ox27X+JOHpwjI0bYCzNneidK2YM9ebrBG0jnSes+dIeeHY6rt1m8ONCnkEqr9A7gvBYbfiL58fmHx3OTcFmqGtdRIuc1oygrMjGXMGehQbNUZfdZP+U87UEkiS+azKTPIUXfH7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NMHuIPPz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7FBBEC4CEE9;
	Wed, 15 Jan 2025 06:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736923322;
	bh=aZjZzHMkosGxEQcOgbVAJ2C+NA1D6LE2cArAw+uM44c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NMHuIPPzrYaUtRYoOyLLUygP9SAZCxH4jZh2fnxy5Yk7GIU1cIO6bTqACNG05TCWX
	 DCYwTyQFPUVzn7CBX9xEsd9+hGmn4oBk1ViuvxwFXLsk5pu0llVbez77QibdyOsb2D
	 WtCCLGypmE0jcJFKTnbLZ7PgW7N4j1Wdwrk2UoEgzQs2cotVujSRMg6u/2Q926lgVz
	 etKuU2kYwqX98WY+bSsm6NC1Y0L64C7D5Bhftgvq+igs6QK8oPCoSXTe4L8ltwQxNR
	 HHkV/lkjZtznJ1B/DCu1yIW2LtgceavGNRHbuG9R403NkUKictNq/Kre8Y4yUrKJyW
	 50EFLjdZzZwtg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74420C02180;
	Wed, 15 Jan 2025 06:42:02 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 15 Jan 2025 14:42:01 +0800
Subject: [PATCH v3 3/5] pinctrl: Add driver support for Amlogic SoCs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-amlogic-pinctrl-v3-3-2b8536457aba@amlogic.com>
References: <20250115-amlogic-pinctrl-v3-0-2b8536457aba@amlogic.com>
In-Reply-To: <20250115-amlogic-pinctrl-v3-0-2b8536457aba@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736923319; l=30620;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=Dnan2/vnCvOsr7pBHgYQqNsk2z/vKC6yzIe8/Ru5pJU=;
 b=AxlZCEWgxVb3cNfAm5HPD+OzBxPxBBALabPYxQtRyssTuc3aVH2hKFzs7Hi2rDmH8VufiIpIl
 JPguTtPQu7sB4UVwzBfIQBReIWM1tOkl1/tuVLouHw7ITTUDLMpanaY
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add a new pinctrl driver for Amlogic SoCs. All future Amlogic
SoCs pinctrl drives use this, such A4, A5, S6, S7 etc. To support
new Amlogic SoCs, only need to add the corresponding dts file.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/pinctrl/Kconfig           |   18 +
 drivers/pinctrl/Makefile          |    1 +
 drivers/pinctrl/pinctrl-amlogic.c | 1040 +++++++++++++++++++++++++++++++++++++
 3 files changed, 1059 insertions(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 95a8e2b9a614..3d44f8761056 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -49,6 +49,24 @@ config PINCTRL_AMD
 	  Requires ACPI/FDT device enumeration code to set up a platform
 	  device.
 
+config PINCTRL_AMLOGIC
+	bool "AMLOGIC pincontrol"
+	depends on ARCH_MESON || COMPILE_TEST
+	depends on OF
+	default y
+	select PINMUX
+	select PINCONF
+	select GENERIC_PINCONF
+	select GPIOLIB
+	select OF_GPIO
+	select REGMAP_MMIO
+	help
+	  This is the driver for the pin controller found on Amlogic SoCs.
+
+	  This driver is simplify subsequent support for new amlogic SoCs,
+	  to support new Amlogic SoCs, only need to add the corresponding dts file,
+	  no additional binding header files or C file are added.
+
 config PINCTRL_APPLE_GPIO
 	tristate "Apple SoC GPIO pin controller driver"
 	depends on ARCH_APPLE
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index fba1c56624c0..638ffec63ff1 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_GENERIC_PINCONF)	+= pinconf-generic.o
 obj-$(CONFIG_OF)		+= devicetree.o
 
 obj-$(CONFIG_PINCTRL_AMD)	+= pinctrl-amd.o
+obj-$(CONFIG_PINCTRL_AMLOGIC) 	+= pinctrl-amlogic.o
 obj-$(CONFIG_PINCTRL_APPLE_GPIO) += pinctrl-apple-gpio.o
 obj-$(CONFIG_PINCTRL_ARTPEC6)	+= pinctrl-artpec6.o
 obj-$(CONFIG_PINCTRL_AS3722)	+= pinctrl-as3722.o
diff --git a/drivers/pinctrl/pinctrl-amlogic.c b/drivers/pinctrl/pinctrl-amlogic.c
new file mode 100644
index 000000000000..e81684f5ee20
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-amlogic.c
@@ -0,0 +1,1040 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
+ * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
+ */
+
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+#include <linux/string_helpers.h>
+
+#include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
+
+#include "core.h"
+#include "pinconf.h"
+
+#define gpio_chip_to_bank(chip) \
+		container_of(chip, struct aml_gpio_bank, gpio_chip)
+
+#define AML_REG_PULLEN		0
+#define AML_REG_PULL		1
+#define AML_REG_DIR		2
+#define AML_REG_OUT		3
+#define AML_REG_IN		4
+#define AML_REG_DS		5
+#define AML_NUM_REG		6
+
+enum aml_pinconf_drv {
+	PINCONF_DRV_500UA,
+	PINCONF_DRV_2500UA,
+	PINCONF_DRV_3000UA,
+	PINCONF_DRV_4000UA,
+};
+
+struct aml_pio_control {
+	u32 gpio_offset;
+	u32 reg_offset[AML_NUM_REG];
+	u32 bit_offset[AML_NUM_REG];
+};
+
+struct aml_reg_bit {
+	u32 bank_id;
+	u32 reg_offs[AML_NUM_REG];
+	u32 bit_offs[AML_NUM_REG];
+};
+
+struct aml_pctl_data {
+	unsigned int number;
+	struct aml_reg_bit rb_offs[];
+};
+
+struct aml_pmx_func {
+	const char	*name;
+	const char	**groups;
+	unsigned int	ngroups;
+};
+
+struct aml_pctl_group {
+	const char		*name;
+	unsigned int		npins;
+	unsigned int		*pins;
+	unsigned int		*func;
+};
+
+struct aml_gpio_bank {
+	struct gpio_chip		gpio_chip;
+	struct aml_pio_control		pc;
+	u32				bank_id;
+	unsigned int			pin_base;
+	struct regmap			*reg_mux;
+	struct regmap			*reg_gpio;
+	struct regmap			*reg_ds;
+};
+
+struct aml_pinctrl {
+	struct device			*dev;
+	struct pinctrl_dev		*pctl;
+	struct aml_gpio_bank		*banks;
+	int				nbanks;
+	struct aml_pmx_func		*functions;
+	int				nfunctions;
+	struct aml_pctl_group		*groups;
+	int				ngroups;
+
+	const struct aml_pctl_data	*data;
+};
+
+static const unsigned int aml_bit_strides[AML_NUM_REG] = {
+	1, 1, 1, 1, 1, 2
+};
+
+static const unsigned int aml_def_regoffs[AML_NUM_REG] = {
+	3, 4, 2, 1, 0, 7
+};
+
+static const char *aml_bank_name[31] = {
+"GPIOA", "GPIOB", "GPIOC", "GPIOD", "GPIOE", "GPIOF", "GPIOG",
+"GPIOH", "GPIOI", "GPIOJ", "GPIOK", "GPIOL", "GPIOM", "GPION",
+"GPIOO", "GPIOP", "GPIOQ", "GPIOR", "GPIOS", "GPIOT", "GPIOU",
+"GPIOV", "GPIOW", "GPIOX", "GPIOY", "GPIOZ", "GPIODV", "GPIOAO",
+"GPIOCC", "TEST_N", "ANALOG"
+};
+
+static int aml_pmx_calc_reg_and_offset(struct pinctrl_gpio_range *range,
+				       unsigned int pin, unsigned int *reg,
+				       unsigned int *offset)
+{
+	unsigned int shift;
+
+	shift = (pin - range->pin_base) << 2;
+	*reg = (shift / 32) * 4;
+	*offset = shift % 32;
+
+	return 0;
+}
+
+static int aml_pctl_set_function(struct aml_pinctrl *info,
+				 struct pinctrl_gpio_range *range,
+				 int pin_id, int func)
+{
+	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
+	int reg;
+	int offset;
+
+	if (!bank->reg_mux)
+		return 0;
+
+	aml_pmx_calc_reg_and_offset(range, pin_id, &reg, &offset);
+	return regmap_update_bits(bank->reg_mux, reg,
+			0xf << offset, (func & 0xf) << offset);
+}
+
+static int aml_pmx_get_funcs_count(struct pinctrl_dev *pctldev)
+{
+	struct aml_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
+
+	return info->nfunctions;
+}
+
+static const char *aml_pmx_get_fname(struct pinctrl_dev *pctldev,
+				     unsigned int selector)
+{
+	struct aml_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
+
+	return info->functions[selector].name;
+}
+
+static int aml_pmx_get_groups(struct pinctrl_dev *pctldev,
+			      unsigned int selector,
+			      const char * const **grps,
+			      unsigned * const ngrps)
+{
+	struct aml_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
+
+	*grps = info->functions[selector].groups;
+	*ngrps = info->functions[selector].ngroups;
+
+	return 0;
+}
+
+static int aml_pmx_set_mux(struct pinctrl_dev *pctldev, unsigned int fselector,
+			   unsigned int group_id)
+{
+	struct aml_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
+	struct aml_pctl_group *group = &info->groups[group_id];
+	struct pinctrl_gpio_range *range;
+	int i;
+
+	for (i = 0; i < group->npins; i++) {
+		range =  pinctrl_find_gpio_range_from_pin(pctldev, group->pins[i]);
+		aml_pctl_set_function(info, range, group->pins[i], group->func[i]);
+	}
+
+	return 0;
+}
+
+static int aml_pmx_request_gpio(struct pinctrl_dev *pctldev,
+				struct pinctrl_gpio_range *range,
+				unsigned int pin)
+{
+	struct aml_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
+
+	return aml_pctl_set_function(info, range, pin, 0);
+}
+
+static const struct pinmux_ops aml_pmx_ops = {
+	.set_mux		= aml_pmx_set_mux,
+	.get_functions_count	= aml_pmx_get_funcs_count,
+	.get_function_name	= aml_pmx_get_fname,
+	.get_function_groups	= aml_pmx_get_groups,
+	.gpio_request_enable	= aml_pmx_request_gpio,
+};
+
+static int aml_calc_reg_and_bit(struct pinctrl_gpio_range *range,
+				unsigned int pin,
+				unsigned int reg_type,
+				unsigned int *reg, unsigned int *bit)
+{
+	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
+
+	*bit = (pin - range->pin_base) * aml_bit_strides[reg_type]
+		+ bank->pc.bit_offset[reg_type];
+	*reg = (bank->pc.reg_offset[reg_type] + (*bit / 32)) * 4;
+	*bit &= 0x1f;
+
+	return 0;
+}
+
+static int aml_pinconf_get_pull(struct aml_pinctrl *info, unsigned int pin)
+{
+	struct pinctrl_gpio_range *range =
+			 pinctrl_find_gpio_range_from_pin(info->pctl, pin);
+	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
+	unsigned int reg, bit, val;
+	int ret, conf;
+
+	aml_calc_reg_and_bit(range, pin, AML_REG_PULLEN, &reg, &bit);
+
+	ret = regmap_read(bank->reg_gpio, reg, &val);
+	if (ret)
+		return ret;
+
+	if (!(val & BIT(bit))) {
+		conf = PIN_CONFIG_BIAS_DISABLE;
+	} else {
+		aml_calc_reg_and_bit(range, pin, AML_REG_PULL, &reg, &bit);
+
+		ret = regmap_read(bank->reg_gpio, reg, &val);
+		if (ret)
+			return ret;
+
+		if (val & BIT(bit))
+			conf = PIN_CONFIG_BIAS_PULL_UP;
+		else
+			conf = PIN_CONFIG_BIAS_PULL_DOWN;
+	}
+
+	return conf;
+}
+
+static int aml_pinconf_get_drive_strength(struct aml_pinctrl *info,
+					  unsigned int pin,
+					  u16 *drive_strength_ua)
+{
+	struct pinctrl_gpio_range *range =
+			 pinctrl_find_gpio_range_from_pin(info->pctl, pin);
+	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
+	unsigned int reg, bit;
+	unsigned int val;
+	int ret;
+
+	if (!bank->reg_ds)
+		return -EOPNOTSUPP;
+
+	aml_calc_reg_and_bit(range, pin, AML_REG_DS, &reg, &bit);
+	ret = regmap_read(bank->reg_ds, reg, &val);
+	if (ret)
+		return ret;
+
+	switch ((val >> bit) & 0x3) {
+	case PINCONF_DRV_500UA:
+		*drive_strength_ua = 500;
+		break;
+	case PINCONF_DRV_2500UA:
+		*drive_strength_ua = 2500;
+		break;
+	case PINCONF_DRV_3000UA:
+		*drive_strength_ua = 3000;
+		break;
+	case PINCONF_DRV_4000UA:
+		*drive_strength_ua = 4000;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int aml_pinconf_get_gpio_bit(struct aml_pinctrl *info,
+				    unsigned int pin,
+				    unsigned int reg_type)
+{
+	struct pinctrl_gpio_range *range =
+			 pinctrl_find_gpio_range_from_pin(info->pctl, pin);
+	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
+	unsigned int reg, bit, val;
+	int ret;
+
+	aml_calc_reg_and_bit(range, pin, reg_type, &reg, &bit);
+	ret = regmap_read(bank->reg_gpio, reg, &val);
+	if (ret)
+		return ret;
+
+	return BIT(bit) & val ? 1 : 0;
+}
+
+static int aml_pinconf_get_output(struct aml_pinctrl *info,
+				  unsigned int pin)
+{
+	int ret = aml_pinconf_get_gpio_bit(info, pin, AML_REG_DIR);
+
+	if (ret < 0)
+		return ret;
+
+	return !ret;
+}
+
+static int aml_pinconf_get_drive(struct aml_pinctrl *info,
+				 unsigned int pin)
+{
+	return aml_pinconf_get_gpio_bit(info, pin, AML_REG_OUT);
+}
+
+static int aml_pinconf_get(struct pinctrl_dev *pcdev, unsigned int pin,
+			   unsigned long *config)
+{
+	struct aml_pinctrl *info = pinctrl_dev_get_drvdata(pcdev);
+	enum pin_config_param param = pinconf_to_config_param(*config);
+	u16 arg;
+	int ret;
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+	case PIN_CONFIG_BIAS_PULL_UP:
+		if (aml_pinconf_get_pull(info, pin) == param)
+			arg = 1;
+		else
+			return -EINVAL;
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH_UA:
+		ret = aml_pinconf_get_drive_strength(info, pin, &arg);
+		if (ret)
+			return ret;
+		break;
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		ret = aml_pinconf_get_output(info, pin);
+		if (ret <= 0)
+			return -EINVAL;
+		arg = 1;
+		break;
+	case PIN_CONFIG_OUTPUT:
+		ret = aml_pinconf_get_output(info, pin);
+		if (ret <= 0)
+			return -EINVAL;
+
+		ret = aml_pinconf_get_drive(info, pin);
+		if (ret < 0)
+			return -EINVAL;
+
+		arg = ret;
+		break;
+
+	default:
+		return -ENOTSUPP;
+	}
+
+	*config = pinconf_to_config_packed(param, arg);
+	dev_dbg(info->dev, "pinconf for pin %u is %lu\n", pin, *config);
+
+	return 0;
+}
+
+static int aml_pinconf_disable_bias(struct aml_pinctrl *info,
+				    unsigned int pin)
+{
+	struct pinctrl_gpio_range *range =
+			 pinctrl_find_gpio_range_from_pin(info->pctl, pin);
+	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
+	unsigned int reg, bit = 0;
+
+	aml_calc_reg_and_bit(range, pin, AML_REG_PULLEN, &reg, &bit);
+
+	return regmap_update_bits(bank->reg_gpio, reg, BIT(bit), 0);
+}
+
+static int aml_pinconf_enable_bias(struct aml_pinctrl *info, unsigned int pin,
+				   bool pull_up)
+{
+	struct pinctrl_gpio_range *range =
+			 pinctrl_find_gpio_range_from_pin(info->pctl, pin);
+	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
+	unsigned int reg, bit, val = 0;
+	int ret;
+
+	aml_calc_reg_and_bit(range, pin, AML_REG_PULL, &reg, &bit);
+	if (pull_up)
+		val = BIT(bit);
+
+	ret = regmap_update_bits(bank->reg_gpio, reg, BIT(bit), val);
+	if (ret)
+		return ret;
+
+	aml_calc_reg_and_bit(range, pin, AML_REG_PULLEN, &reg, &bit);
+	return regmap_update_bits(bank->reg_gpio, reg, BIT(bit), BIT(bit));
+}
+
+static int aml_pinconf_set_drive_strength(struct aml_pinctrl *info,
+					  unsigned int pin,
+					  u16 drive_strength_ua)
+{
+	struct pinctrl_gpio_range *range =
+			 pinctrl_find_gpio_range_from_pin(info->pctl, pin);
+	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
+	unsigned int reg, bit, ds_val;
+
+	if (!bank->reg_ds) {
+		dev_err(info->dev, "drive-strength not supported\n");
+		return -EOPNOTSUPP;
+	}
+
+	aml_calc_reg_and_bit(range, pin, AML_REG_DS, &reg, &bit);
+
+	if (drive_strength_ua <= 500) {
+		ds_val = PINCONF_DRV_500UA;
+	} else if (drive_strength_ua <= 2500) {
+		ds_val = PINCONF_DRV_2500UA;
+	} else if (drive_strength_ua <= 3000) {
+		ds_val = PINCONF_DRV_3000UA;
+	} else if (drive_strength_ua <= 4000) {
+		ds_val = PINCONF_DRV_4000UA;
+	} else {
+		dev_warn_once(info->dev,
+			      "pin %u: invalid drive-strength : %d , default to 4mA\n",
+			      pin, drive_strength_ua);
+		ds_val = PINCONF_DRV_4000UA;
+	}
+
+	return regmap_update_bits(bank->reg_ds, reg, 0x3 << bit, ds_val << bit);
+}
+
+static int aml_pinconf_set_gpio_bit(struct aml_pinctrl *info,
+				    unsigned int pin,
+				    unsigned int reg_type,
+				    bool arg)
+{
+	struct pinctrl_gpio_range *range =
+			 pinctrl_find_gpio_range_from_pin(info->pctl, pin);
+	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
+	unsigned int reg, bit;
+
+	aml_calc_reg_and_bit(range, pin, reg_type, &reg, &bit);
+	return regmap_update_bits(bank->reg_gpio, reg, BIT(bit),
+				  arg ? BIT(bit) : 0);
+}
+
+static int aml_pinconf_set_output(struct aml_pinctrl *info,
+				  unsigned int pin,
+				  bool out)
+{
+	return aml_pinconf_set_gpio_bit(info, pin, AML_REG_DIR, !out);
+}
+
+static int aml_pinconf_set_drive(struct aml_pinctrl *info,
+				 unsigned int pin,
+				 bool high)
+{
+	return aml_pinconf_set_gpio_bit(info, pin, AML_REG_OUT, high);
+}
+
+static int aml_pinconf_set_output_drive(struct aml_pinctrl *info,
+					unsigned int pin,
+					bool high)
+{
+	int ret;
+
+	ret = aml_pinconf_set_output(info, pin, true);
+	if (ret)
+		return ret;
+
+	return aml_pinconf_set_drive(info, pin, high);
+}
+
+static int aml_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
+			   unsigned long *configs, unsigned int num_configs)
+{
+	struct aml_pinctrl *info = pinctrl_dev_get_drvdata(pcdev);
+	enum pin_config_param param;
+	unsigned int arg = 0;
+	int i, ret;
+
+	for (i = 0; i < num_configs; i++) {
+		param = pinconf_to_config_param(configs[i]);
+
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
+		switch (param) {
+		case PIN_CONFIG_BIAS_DISABLE:
+			ret = aml_pinconf_disable_bias(info, pin);
+			break;
+		case PIN_CONFIG_BIAS_PULL_UP:
+			ret = aml_pinconf_enable_bias(info, pin, true);
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			ret = aml_pinconf_enable_bias(info, pin, false);
+			break;
+		case PIN_CONFIG_DRIVE_STRENGTH_UA:
+			ret = aml_pinconf_set_drive_strength(info, pin, arg);
+			break;
+		case PIN_CONFIG_OUTPUT_ENABLE:
+			ret = aml_pinconf_set_output(info, pin, arg);
+			break;
+		case PIN_CONFIG_OUTPUT:
+			ret = aml_pinconf_set_output_drive(info, pin, arg);
+			break;
+		default:
+			ret = -ENOTSUPP;
+		}
+
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int aml_pinconf_group_set(struct pinctrl_dev *pcdev,
+				 unsigned int num_group,
+				 unsigned long *configs,
+				 unsigned int num_configs)
+{
+	struct aml_pinctrl *info = pinctrl_dev_get_drvdata(pcdev);
+	int i;
+
+	for (i = 0; i < info->groups[num_group].npins; i++) {
+		aml_pinconf_set(pcdev, info->groups[num_group].pins[i], configs,
+				num_configs);
+	}
+
+	return 0;
+}
+
+static int aml_pinconf_group_get(struct pinctrl_dev *pcdev,
+				 unsigned int group, unsigned long *config)
+{
+	return -EOPNOTSUPP;
+}
+
+static const struct pinconf_ops aml_pinconf_ops = {
+	.pin_config_get		= aml_pinconf_get,
+	.pin_config_set		= aml_pinconf_set,
+	.pin_config_group_get	= aml_pinconf_group_get,
+	.pin_config_group_set	= aml_pinconf_group_set,
+	.is_generic		= true,
+};
+
+static int aml_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct aml_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
+
+	return info->ngroups;
+}
+
+static const char *aml_get_group_name(struct pinctrl_dev *pctldev,
+				      unsigned int selector)
+{
+	struct aml_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
+
+	return info->groups[selector].name;
+}
+
+static int aml_get_group_pins(struct pinctrl_dev *pctldev,
+			      unsigned int selector, const unsigned int **pins,
+			      unsigned int *npins)
+{
+	struct aml_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
+
+	if (selector >= info->ngroups)
+		return -EINVAL;
+
+	*pins = info->groups[selector].pins;
+	*npins = info->groups[selector].npins;
+
+	return 0;
+}
+
+static inline const struct aml_pctl_group *
+	aml_pctl_find_group_by_name(const struct aml_pinctrl *info,
+				    const char *name)
+{
+	int i;
+
+	for (i = 0; i < info->ngroups; i++) {
+		if (!strcmp(info->groups[i].name, name))
+			return &info->groups[i];
+	}
+
+	return NULL;
+}
+
+static void aml_pin_dbg_show(struct pinctrl_dev *pcdev, struct seq_file *s,
+			     unsigned int offset)
+{
+	seq_printf(s, " %s", dev_name(pcdev->dev));
+}
+
+static const struct pinctrl_ops aml_pctrl_ops = {
+	.get_groups_count	= aml_get_groups_count,
+	.get_group_name		= aml_get_group_name,
+	.get_group_pins		= aml_get_group_pins,
+	.dt_node_to_map		= pinconf_generic_dt_node_to_map_pinmux,
+	.dt_free_map		= pinconf_generic_dt_free_map,
+	.pin_dbg_show		= aml_pin_dbg_show,
+};
+
+static int aml_pctl_parse_functions(struct device_node *np,
+				    struct aml_pinctrl *info, u32 index,
+				    int *grp_index)
+{
+	struct device *dev = info->dev;
+	struct aml_pmx_func *func;
+	struct aml_pctl_group *grp;
+	int ret, i;
+
+	func = &info->functions[index];
+	func->name = np->name;
+	func->ngroups = of_get_child_count(np);
+	if (func->ngroups == 0)
+		return dev_err_probe(dev, -EINVAL, "No groups defined\n");
+
+	func->groups = devm_kcalloc(dev, func->ngroups, sizeof(*func->groups), GFP_KERNEL);
+	if (!func->groups)
+		return -ENOMEM;
+
+	i = 0;
+	for_each_child_of_node_scoped(np, child) {
+		func->groups[i++] = child->name;
+		grp = &info->groups[*grp_index];
+		grp->name = child->name;
+		*grp_index += 1;
+		ret = pinconf_generic_parse_dt_pinmux(child, dev, &grp->pins,
+						      &grp->func, &grp->npins);
+		if (ret) {
+			dev_err(dev, "function :%s, groups:%s fail\n", func->name, child->name);
+			return ret;
+		}
+	}
+	dev_dbg(dev, "Function[%d\t name:%s,\tgroups:%d]\n", index, func->name, func->ngroups);
+
+	return 0;
+}
+
+static u32 aml_bank_pins(struct device_node *np)
+{
+	struct of_phandle_args of_args;
+
+	if (of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
+					     0, &of_args))
+		return 0;
+	else
+		return of_args.args[2];
+}
+
+static unsigned int aml_count_pins(struct device_node *np)
+{
+	struct device_node *child;
+	unsigned int pins = 0;
+
+	for_each_child_of_node(np, child) {
+		if (of_property_read_bool(child, "gpio-controller"))
+			pins += aml_bank_pins(child);
+	}
+
+	return pins;
+}
+
+/*
+ * A pinctrl device contains two types of nodes. The one named GPIO
+ * bank which includes gpio-controller property. The other one named
+ * function which includes one or more pin groups. The pin group
+ * include pinmux property(global index in pinctrl dev, and mux vlaue
+ * in mux reg) and pin configuration properties.
+ */
+static void aml_pctl_dt_child_count(struct aml_pinctrl *info,
+				    struct device_node *np)
+{
+	struct device_node *child;
+
+	for_each_child_of_node(np, child) {
+		if (of_property_read_bool(child, "gpio-controller")) {
+			info->nbanks++;
+		} else {
+			info->nfunctions++;
+			info->ngroups += of_get_child_count(child);
+		}
+	}
+}
+
+static struct regmap *aml_map_resource(struct device *dev, unsigned int id,
+				       struct device_node *node, char *name)
+{
+	struct resource res;
+	void __iomem *base;
+	int i;
+
+	struct regmap_config aml_regmap_config = {
+		.reg_bits = 32,
+		.val_bits = 32,
+		.reg_stride = 4,
+	};
+
+	i = of_property_match_string(node, "reg-names", name);
+	if (i < 0)
+		return NULL;
+	if (of_address_to_resource(node, i, &res))
+		return NULL;
+
+	base = devm_ioremap_resource(dev, &res);
+	if (IS_ERR(base))
+		return ERR_CAST(base);
+
+	aml_regmap_config.max_register = resource_size(&res) - 4;
+	aml_regmap_config.name = devm_kasprintf(dev, GFP_KERNEL,
+						"%s-%s", aml_bank_name[id], name);
+	if (!aml_regmap_config.name)
+		return ERR_PTR(-ENOMEM);
+
+	return devm_regmap_init_mmio(dev, base, &aml_regmap_config);
+}
+
+static inline int aml_gpio_calc_reg_and_bit(struct aml_gpio_bank *bank,
+					    unsigned int reg_type,
+					    unsigned int gpio,
+					    unsigned int *reg,
+					    unsigned int *bit)
+{
+	*bit = gpio * aml_bit_strides[reg_type] + bank->pc.bit_offset[reg_type];
+	*reg = (bank->pc.reg_offset[reg_type] + (*bit / 32)) * 4;
+	*bit &= 0x1f;
+
+	return 0;
+}
+
+static int aml_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct aml_gpio_bank *bank = gpiochip_get_data(chip);
+	unsigned int bit, reg, val;
+	int ret;
+
+	aml_gpio_calc_reg_and_bit(bank, AML_REG_DIR, gpio, &reg, &bit);
+
+	ret = regmap_read(bank->reg_gpio, reg, &val);
+	if (ret)
+		return ret;
+
+	return BIT(bit) & val ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
+static int aml_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct aml_gpio_bank *bank = gpiochip_get_data(chip);
+	unsigned int bit, reg;
+
+	aml_gpio_calc_reg_and_bit(bank, AML_REG_DIR, gpio, &reg, &bit);
+
+	return regmap_update_bits(bank->reg_gpio, reg, BIT(bit), 0);
+}
+
+static int aml_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
+				     int value)
+{
+	struct aml_gpio_bank *bank = gpiochip_get_data(chip);
+	unsigned int bit, reg;
+	int ret;
+
+	aml_gpio_calc_reg_and_bit(bank, AML_REG_DIR, gpio, &reg, &bit);
+	ret = regmap_update_bits(bank->reg_gpio, reg, BIT(bit), BIT(bit));
+	if (ret < 0)
+		return ret;
+
+	aml_gpio_calc_reg_and_bit(bank, AML_REG_OUT, gpio, &reg, &bit);
+
+	return regmap_update_bits(bank->reg_gpio, reg, BIT(bit),
+				  value ? BIT(bit) : 0);
+}
+
+static void aml_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
+{
+	struct aml_gpio_bank *bank = gpiochip_get_data(chip);
+	unsigned int bit, reg;
+
+	aml_gpio_calc_reg_and_bit(bank, AML_REG_OUT, gpio, &reg, &bit);
+
+	regmap_update_bits(bank->reg_gpio, reg, BIT(bit),
+			   value ? BIT(bit) : 0);
+}
+
+static int aml_gpio_get(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct aml_gpio_bank *bank = gpiochip_get_data(chip);
+	unsigned int reg, bit, val;
+
+	aml_gpio_calc_reg_and_bit(bank, AML_REG_IN, gpio, &reg, &bit);
+	regmap_read(bank->reg_gpio, reg, &val);
+
+	return !!(val & BIT(bit));
+}
+
+static const struct gpio_chip aml_gpio_template = {
+	.request		= gpiochip_generic_request,
+	.free			= gpiochip_generic_free,
+	.set_config		= gpiochip_generic_config,
+	.set			= aml_gpio_set,
+	.get			= aml_gpio_get,
+	.direction_input	= aml_gpio_direction_input,
+	.direction_output	= aml_gpio_direction_output,
+	.get_direction		= aml_gpio_get_direction,
+	.can_sleep		= false,
+};
+
+static void init_bank_register_bit(struct aml_pinctrl *info,
+				   struct aml_gpio_bank *bank)
+{
+	const struct aml_pctl_data *data = info->data;
+	const struct aml_reg_bit *aml_rb;
+	bool def_offs = true;
+	int i;
+
+	if (data) {
+		for (i = 0; i < data->number; i++) {
+			aml_rb = &data->rb_offs[i];
+			if (bank->bank_id == aml_rb->bank_id) {
+				def_offs = false;
+				break;
+			}
+		}
+	};
+
+	if (def_offs) {
+		for (i = 0; i < AML_NUM_REG; i++) {
+			bank->pc.reg_offset[i] = aml_def_regoffs[i];
+			bank->pc.bit_offset[i] = 0;
+		}
+	} else {
+		for (i = 0; i < AML_NUM_REG; i++) {
+			bank->pc.reg_offset[i] = aml_rb->reg_offs[i];
+			bank->pc.bit_offset[i] = aml_rb->bit_offs[i];
+		}
+	}
+}
+
+static int aml_gpiolib_register_bank(struct aml_pinctrl *info,
+				     int bank_nr, struct device_node *np)
+{
+	struct aml_gpio_bank *bank = &info->banks[bank_nr];
+	struct device *dev = info->dev;
+
+	if (of_property_read_u32(np, "bank-number", &bank->bank_id)) {
+		dev_err(dev, "get num=%d bank identity fail\n", bank_nr);
+		return -EINVAL;
+	}
+
+	bank->reg_mux = aml_map_resource(dev, bank->bank_id, np, "mux");
+	if (IS_ERR_OR_NULL(bank->reg_mux)) {
+		if (bank->bank_id == AMLOGIC_GPIO_TEST_N ||
+		    bank->bank_id == AMLOGIC_GPIO_ANALOG)
+			bank->reg_mux = NULL;
+		else
+			return dev_err_probe(dev, bank->reg_mux ? PTR_ERR(bank->reg_mux) : -ENOENT,
+					     "mux registers not found\n");
+	}
+
+	bank->reg_gpio = aml_map_resource(dev, bank->bank_id, np, "gpio");
+	if (IS_ERR_OR_NULL(bank->reg_gpio))
+		return dev_err_probe(dev, bank->reg_gpio ? PTR_ERR(bank->reg_gpio) : -ENOENT,
+				     "gpio registers not found\n");
+
+	bank->reg_ds = aml_map_resource(dev, bank->bank_id, np, "ds");
+	if (IS_ERR_OR_NULL(bank->reg_ds)) {
+		dev_dbg(info->dev, "ds registers not found - skipping\n");
+		bank->reg_ds = bank->reg_gpio;
+	}
+
+	bank->gpio_chip = aml_gpio_template;
+	bank->gpio_chip.base = -1;
+	bank->gpio_chip.ngpio = aml_bank_pins(np);
+	bank->gpio_chip.fwnode = of_fwnode_handle(np);
+	bank->gpio_chip.parent = dev;
+
+	init_bank_register_bit(info, bank);
+	bank->gpio_chip.label = aml_bank_name[bank->bank_id];
+
+	bank->pin_base = bank->bank_id << 8;
+
+	return 0;
+}
+
+static int aml_pctl_probe_dt(struct platform_device *pdev,
+			     struct pinctrl_desc *pctl_desc,
+			     struct aml_pinctrl *info)
+{
+	struct device *dev = &pdev->dev;
+	struct pinctrl_pin_desc *pdesc;
+	struct device_node *np = dev->of_node;
+	int grp_index = 0;
+	int i = 0, j = 0, k = 0, bank;
+	int ret = 0;
+
+	aml_pctl_dt_child_count(info, np);
+	if (!info->nbanks)
+		return dev_err_probe(dev, -EINVAL, "you need at least one gpio bank\n");
+
+	dev_dbg(dev, "nbanks = %d\n", info->nbanks);
+	dev_dbg(dev, "nfunctions = %d\n", info->nfunctions);
+	dev_dbg(dev, "ngroups = %d\n", info->ngroups);
+
+	info->functions = devm_kcalloc(dev, info->nfunctions, sizeof(*info->functions), GFP_KERNEL);
+
+	info->groups = devm_kcalloc(dev, info->ngroups, sizeof(*info->groups), GFP_KERNEL);
+
+	info->banks = devm_kcalloc(dev, info->nbanks, sizeof(*info->banks), GFP_KERNEL);
+
+	if (!info->functions || !info->groups || !info->banks)
+		return -ENOMEM;
+
+	info->data = (struct aml_pctl_data *)of_device_get_match_data(dev);
+
+	pctl_desc->npins = aml_count_pins(np);
+
+	pdesc =	devm_kcalloc(dev, pctl_desc->npins, sizeof(*pdesc), GFP_KERNEL);
+	if (!pdesc)
+		return -ENOMEM;
+
+	pctl_desc->pins = pdesc;
+
+	bank = 0;
+	for_each_child_of_node_scoped(np, child) {
+		if (of_property_read_bool(child, "gpio-controller")) {
+			const char *bank_name = NULL;
+			char **pin_names;
+
+			ret = aml_gpiolib_register_bank(info, bank, child);
+			if (ret)
+				return ret;
+
+			k = info->banks[bank].pin_base;
+			bank_name = info->banks[bank].gpio_chip.label;
+
+			pin_names = devm_kasprintf_strarray(dev, bank_name,
+							    info->banks[bank].gpio_chip.ngpio);
+			if (IS_ERR(pin_names))
+				return PTR_ERR(pin_names);
+
+			for (j = 0; j < info->banks[bank].gpio_chip.ngpio; j++, k++) {
+				pdesc->number = k;
+				pdesc->name = pin_names[j];
+				pdesc++;
+			}
+			bank++;
+		} else {
+			ret = aml_pctl_parse_functions(child, info,
+						       i++, &grp_index);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int aml_pctl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct aml_pinctrl *info;
+	struct pinctrl_desc *pctl_desc;
+	int ret, i;
+
+	pctl_desc = devm_kzalloc(dev, sizeof(*pctl_desc), GFP_KERNEL);
+	if (!pctl_desc)
+		return -ENOMEM;
+
+	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	info->dev = dev;
+	platform_set_drvdata(pdev, info);
+	ret = aml_pctl_probe_dt(pdev, pctl_desc, info);
+	if (ret)
+		return ret;
+
+	pctl_desc->owner	= THIS_MODULE;
+	pctl_desc->pctlops	= &aml_pctrl_ops;
+	pctl_desc->pmxops	= &aml_pmx_ops;
+	pctl_desc->confops	= &aml_pinconf_ops;
+	pctl_desc->name		= dev_name(dev);
+
+	info->pctl = devm_pinctrl_register(dev, pctl_desc, info);
+	if (IS_ERR(info->pctl))
+		return dev_err_probe(dev, PTR_ERR(info->pctl), "Failed pinctrl registration\n");
+
+	for (i = 0; i < info->nbanks; i++) {
+		ret  = gpiochip_add_data(&info->banks[i].gpio_chip, &info->banks[i]);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to add gpiochip(%d)!\n", i);
+	}
+
+	return 0;
+}
+
+static const struct of_device_id aml_pctl_of_match[] = {
+	{ .compatible = "amlogic,pinctrl-a4", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, aml_pctl_dt_match);
+
+static struct platform_driver aml_pctl_driver = {
+	.driver = {
+		.name = "amlogic-pinctrl",
+		.of_match_table = aml_pctl_of_match,
+	},
+	.probe = aml_pctl_probe,
+};
+module_platform_driver(aml_pctl_driver);
+
+MODULE_AUTHOR("Xianwei Zhao <xianwei.zhao@amlogic.com>");
+MODULE_DESCRIPTION("Pin controller and GPIO driver for Amlogic SoC");
+MODULE_LICENSE("Dual BSD/GPL");

-- 
2.37.1



