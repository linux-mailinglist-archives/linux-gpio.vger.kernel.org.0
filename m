Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB8EC24354A
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Aug 2020 09:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgHMHtn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 03:49:43 -0400
Received: from rtits2.realtek.com ([211.75.126.72]:39182 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbgHMHtb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 03:49:31 -0400
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 07D7nAfM5028965, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
        by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 07D7nAfM5028965
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 13 Aug 2020 15:49:10 +0800
Received: from RTEXMB05.realtek.com.tw (172.21.6.98) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 13 Aug 2020 15:49:10 +0800
Received: from RTEXMB05.realtek.com.tw (172.21.6.98) by
 RTEXMB05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 13 Aug 2020 15:49:09 +0800
Received: from localhost.localdomain (172.21.252.101) by
 RTEXMB01.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server id
 15.1.1779.2 via Frontend Transport; Thu, 13 Aug 2020 15:49:09 +0800
From:   TY Chang <tychang@realtek.com>
To:     <linux-realtek-soc@lists.infradead.org>, <afaerber@suse.de>
CC:     <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 8/9] pinctrl: realtek: DHC: Move pinctrl drivers to realtek directory and rename.
Date:   Thu, 13 Aug 2020 15:49:07 +0800
Message-ID: <20200813074908.889-9-tychang@realtek.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813074908.889-1-tychang@realtek.com>
References: <20200813074908.889-1-tychang@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Move Realtek DHC SoC pinctrl drivers to realtek directory and
rename pinctrl-rtd119x.c to pinctrl-rtd.c.

Signed-off-by: TY Chang <tychang@realtek.com>
---
 drivers/pinctrl/Kconfig                       |  10 +-
 drivers/pinctrl/Makefile                      |   2 +-
 drivers/pinctrl/realtek/Kconfig               |  14 ++
 drivers/pinctrl/realtek/Makefile              |   3 +
 .../pinctrl-rtd.c}                            | 192 +++++++++---------
 .../pinctrl/{ => realtek}/pinctrl-rtd1195.h   |  20 +-
 .../pinctrl/{ => realtek}/pinctrl-rtd1295.h   |  42 ++--
 7 files changed, 146 insertions(+), 137 deletions(-)
 create mode 100644 drivers/pinctrl/realtek/Kconfig
 create mode 100644 drivers/pinctrl/realtek/Makefile
 rename drivers/pinctrl/{pinctrl-rtd119x.c => realtek/pinctrl-rtd.c} (69%)
 rename drivers/pinctrl/{ => realtek}/pinctrl-rtd1195.h (98%)
 rename drivers/pinctrl/{ => realtek}/pinctrl-rtd1295.h (98%)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 31ae1f13a59c..7d912212c999 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -206,15 +206,6 @@ config PINCTRL_OXNAS
 	select GPIOLIB_IRQCHIP
 	select MFD_SYSCON
 
-config PINCTRL_REALTEK
-	bool "Realtek RTD129x pinctrl driver"
-	depends on OF
-	depends on ARCH_REALTEK || COMPILE_TEST
-	select GENERIC_PINCONF
-	select PINMUX
-	help
-	  This selects pinctrl driver for Realtek RTD1295 platforms.
-
 config PINCTRL_ROCKCHIP
 	bool
 	select PINMUX
@@ -438,6 +429,7 @@ source "drivers/pinctrl/mediatek/Kconfig"
 source "drivers/pinctrl/zte/Kconfig"
 source "drivers/pinctrl/meson/Kconfig"
 source "drivers/pinctrl/cirrus/Kconfig"
+source "drivers/pinctrl/realtek/Kconfig"
 
 config PINCTRL_XWAY
 	bool
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index b1d5c194ffcd..ff6319d9630c 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -29,7 +29,6 @@ obj-$(CONFIG_PINCTRL_OXNAS)	+= pinctrl-oxnas.o
 obj-$(CONFIG_PINCTRL_PALMAS)	+= pinctrl-palmas.o
 obj-$(CONFIG_PINCTRL_PIC32)	+= pinctrl-pic32.o
 obj-$(CONFIG_PINCTRL_PISTACHIO)	+= pinctrl-pistachio.o
-obj-$(CONFIG_PINCTRL_REALTEK)	+= pinctrl-rtd119x.o
 obj-$(CONFIG_PINCTRL_ROCKCHIP)	+= pinctrl-rockchip.o
 obj-$(CONFIG_PINCTRL_RZA1)	+= pinctrl-rza1.o
 obj-$(CONFIG_PINCTRL_RZA2)	+= pinctrl-rza2.o
@@ -75,3 +74,4 @@ obj-$(CONFIG_ARCH_VT8500)	+= vt8500/
 obj-y				+= mediatek/
 obj-$(CONFIG_PINCTRL_ZX)	+= zte/
 obj-y				+= cirrus/
+obj-y				+= realtek/
\ No newline at end of file
diff --git a/drivers/pinctrl/realtek/Kconfig b/drivers/pinctrl/realtek/Kconfig
new file mode 100644
index 000000000000..12c05799d223
--- /dev/null
+++ b/drivers/pinctrl/realtek/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config PINCTRL_REALTEK_DHC
+	bool "Realtek DHC pinctrl driver"
+	depends on OF
+	depends on ARCH_REALTEK || COMPILE_TEST
+	select GENERIC_PINCONF
+	select PINMUX
+	help
+	  This is the pinctrl, pinmux, pinconf driver for
+	  Realtek DHC SoC platforms.
+
+
+
diff --git a/drivers/pinctrl/realtek/Makefile b/drivers/pinctrl/realtek/Makefile
new file mode 100644
index 000000000000..0d18245ead77
--- /dev/null
+++ b/drivers/pinctrl/realtek/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+# Realtek pin control drivers
+obj-$(CONFIG_PINCTRL_REALTEK_DHC)	+= pinctrl-rtd.o
diff --git a/drivers/pinctrl/pinctrl-rtd119x.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
similarity index 69%
rename from drivers/pinctrl/pinctrl-rtd119x.c
rename to drivers/pinctrl/realtek/pinctrl-rtd.c
index 26e88050e9ed..5dc4fac9c8bb 100644
--- a/drivers/pinctrl/pinctrl-rtd119x.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -19,27 +19,27 @@
 #include <linux/pinctrl/pinmux.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include "core.h"
-#include "pinctrl-utils.h"
+#include "../core.h"
+#include "../pinctrl-utils.h"
 
-struct rtd119x_pin_group_desc {
+struct rtd_pin_group_desc {
 	const char *name;
 	const unsigned int *pins;
 	unsigned int num_pins;
 };
 
-struct rtd119x_pin_func_desc {
+struct rtd_pin_func_desc {
 	const char *name;
 	const char * const *groups;
 	unsigned int num_groups;
 };
 
-struct rtd119x_pin_mux_desc {
+struct rtd_pin_mux_desc {
 	const char *name;
 	u32 mux_value;
 };
 
-struct rtd119x_pin_sconfig_desc {
+struct rtd_pin_sconfig_desc {
 	const char *name;
 	unsigned int reg_offset;
 	unsigned int ndrive_offset;
@@ -48,7 +48,7 @@ struct rtd119x_pin_sconfig_desc {
 	unsigned int pdrive_maskbits;
 };
 
-struct rtd119x_pin_config_desc {
+struct rtd_pin_config_desc {
 	const char *name;
 	unsigned int reg_offset;
 	unsigned int base_bit;
@@ -59,11 +59,11 @@ struct rtd119x_pin_config_desc {
 	unsigned int curr_type;
 };
 
-struct rtd119x_pin_desc {
+struct rtd_pin_desc {
 	const char *name;
 	unsigned int mux_offset;
 	u32 mux_mask;
-	const struct rtd119x_pin_mux_desc *functions;
+	const struct rtd_pin_mux_desc *functions;
 };
 
 #define RTK_PIN_SCONFIG(_name, _reg_off, _n_offset, _n_mask, _p_offset, _p_mask) \
@@ -96,7 +96,7 @@ struct rtd119x_pin_desc {
 		.name = # _name, \
 		.mux_offset = _mux_off, \
 		.mux_mask = _mux_mask, \
-		.functions = (const struct rtd119x_pin_mux_desc []) { \
+		.functions = (const struct rtd_pin_mux_desc []) { \
 			__VA_ARGS__, { } \
 		}, \
 	}
@@ -107,18 +107,18 @@ struct rtd119x_pin_desc {
 		.mux_value = _mux_val, \
 	}
 
-struct rtd119x_pinctrl_desc {
+struct rtd_pinctrl_desc {
 	const struct pinctrl_pin_desc *pins;
 	unsigned int num_pins;
-	const struct rtd119x_pin_group_desc *groups;
+	const struct rtd_pin_group_desc *groups;
 	unsigned int num_groups;
-	const struct rtd119x_pin_func_desc *functions;
+	const struct rtd_pin_func_desc *functions;
 	unsigned int num_functions;
-	const struct rtd119x_pin_desc *muxes;
+	const struct rtd_pin_desc *muxes;
 	unsigned int num_muxes;
-	const struct rtd119x_pin_config_desc *configs;
+	const struct rtd_pin_config_desc *configs;
 	unsigned int num_configs;
-	const struct rtd119x_pin_sconfig_desc *sconfigs;
+	const struct rtd_pin_sconfig_desc *sconfigs;
 	unsigned int num_sconfigs;
 };
 
@@ -130,42 +130,42 @@ struct rtd119x_pinctrl_desc {
 #include "pinctrl-rtd1195.h"
 #include "pinctrl-rtd1295.h"
 
-struct rtd119x_pinctrl {
+struct rtd_pinctrl {
 	struct pinctrl_dev *pcdev;
 	void __iomem *base;
 	struct pinctrl_desc desc;
-	const struct rtd119x_pinctrl_desc *info;
+	const struct rtd_pinctrl_desc *info;
 };
 
 /* custom pinconf parameters */
 #define RTK_P_DRIVE	(PIN_CONFIG_END + 1)
 #define RTK_N_DRIVE	(PIN_CONFIG_END + 2)
 
-static const struct pinconf_generic_params rtd119x_custom_bindings[] = {
+static const struct pinconf_generic_params rtd_custom_bindings[] = {
 	{"rtk,pdrive",  RTK_P_DRIVE,	0},
 	{"rtk,ndrive",	RTK_N_DRIVE,	0},
 };
 
-static int rtd119x_pinctrl_get_groups_count(struct pinctrl_dev *pcdev)
+static int rtd_pinctrl_get_groups_count(struct pinctrl_dev *pcdev)
 {
-	struct rtd119x_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
+	struct rtd_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
 
 	return data->info->num_groups;
 }
 
-static const char *rtd119x_pinctrl_get_group_name(struct pinctrl_dev *pcdev,
+static const char *rtd_pinctrl_get_group_name(struct pinctrl_dev *pcdev,
 		unsigned int selector)
 {
-	struct rtd119x_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
+	struct rtd_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
 
 	return data->info->groups[selector].name;
 }
 
-static int rtd119x_pinctrl_get_group_pins(struct pinctrl_dev *pcdev,
+static int rtd_pinctrl_get_group_pins(struct pinctrl_dev *pcdev,
 		unsigned int selector, const unsigned int **pins,
 		unsigned int *num_pins)
 {
-	struct rtd119x_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
+	struct rtd_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
 
 	*pins		= data->info->groups[selector].pins;
 	*num_pins	= data->info->groups[selector].num_pins;
@@ -173,34 +173,34 @@ static int rtd119x_pinctrl_get_group_pins(struct pinctrl_dev *pcdev,
 	return 0;
 }
 
-static const struct pinctrl_ops rtd119x_pinctrl_ops = {
+static const struct pinctrl_ops rtd_pinctrl_ops = {
 	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
 	.dt_free_map = pinctrl_utils_free_map,
-	.get_groups_count = rtd119x_pinctrl_get_groups_count,
-	.get_group_name = rtd119x_pinctrl_get_group_name,
-	.get_group_pins = rtd119x_pinctrl_get_group_pins,
+	.get_groups_count = rtd_pinctrl_get_groups_count,
+	.get_group_name = rtd_pinctrl_get_group_name,
+	.get_group_pins = rtd_pinctrl_get_group_pins,
 };
 
-static int rtd119x_pinctrl_get_functions_count(struct pinctrl_dev *pcdev)
+static int rtd_pinctrl_get_functions_count(struct pinctrl_dev *pcdev)
 {
-	struct rtd119x_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
+	struct rtd_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
 
 	return data->info->num_functions;
 }
 
-static const char *rtd119x_pinctrl_get_function_name(struct pinctrl_dev *pcdev,
+static const char *rtd_pinctrl_get_function_name(struct pinctrl_dev *pcdev,
 		unsigned int selector)
 {
-	struct rtd119x_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
+	struct rtd_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
 
 	return data->info->functions[selector].name;
 }
 
-static int rtd119x_pinctrl_get_function_groups(struct pinctrl_dev *pcdev,
+static int rtd_pinctrl_get_function_groups(struct pinctrl_dev *pcdev,
 		unsigned int selector, const char * const **groups,
 		unsigned int * const num_groups)
 {
-	struct rtd119x_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
+	struct rtd_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
 
 	*groups		= data->info->functions[selector].groups;
 	*num_groups	= data->info->functions[selector].num_groups;
@@ -208,8 +208,8 @@ static int rtd119x_pinctrl_get_function_groups(struct pinctrl_dev *pcdev,
 	return 0;
 }
 
-static const struct pinctrl_pin_desc *rtd119x_pinctrl_get_pin_by_number(
-		struct rtd119x_pinctrl *data, int number)
+static const struct pinctrl_pin_desc *rtd_pinctrl_get_pin_by_number(
+		struct rtd_pinctrl *data, int number)
 {
 	int i;
 
@@ -221,8 +221,8 @@ static const struct pinctrl_pin_desc *rtd119x_pinctrl_get_pin_by_number(
 	return NULL;
 }
 
-static const struct rtd119x_pin_desc *rtd119x_pinctrl_find_mux(
-		struct rtd119x_pinctrl *data, const char *name)
+static const struct rtd_pin_desc *rtd_pinctrl_find_mux(
+		struct rtd_pinctrl *data, const char *name)
 {
 	int i;
 
@@ -234,8 +234,8 @@ static const struct rtd119x_pin_desc *rtd119x_pinctrl_find_mux(
 	return NULL;
 }
 
-static const struct rtd119x_pin_config_desc *rtd119x_pinctrl_find_config(
-		struct rtd119x_pinctrl *data, const char *name)
+static const struct rtd_pin_config_desc *rtd_pinctrl_find_config(
+		struct rtd_pinctrl *data, const char *name)
 {
 	int i;
 
@@ -247,7 +247,7 @@ static const struct rtd119x_pin_config_desc *rtd119x_pinctrl_find_config(
 	return NULL;
 }
 
-static const struct rtd119x_pin_sconfig_desc *rtd119x_pinctrl_find_sconfig(struct rtd119x_pinctrl *data, const char *name)
+static const struct rtd_pin_sconfig_desc *rtd_pinctrl_find_sconfig(struct rtd_pinctrl *data, const char *name)
 {
 	int i;
 
@@ -261,23 +261,23 @@ static const struct rtd119x_pin_sconfig_desc *rtd119x_pinctrl_find_sconfig(struc
 
 
 
-static int rtd119x_pinctrl_set_one_mux(struct pinctrl_dev *pcdev,
+static int rtd_pinctrl_set_one_mux(struct pinctrl_dev *pcdev,
 	unsigned int pin, const char *func_name)
 {
-	struct rtd119x_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
+	struct rtd_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
 	const struct pinctrl_pin_desc *pin_desc;
-	const struct rtd119x_pin_desc *mux;
+	const struct rtd_pin_desc *mux;
 	const char *pin_name;
 	u32 val;
 	int i;
 
-	pin_desc = rtd119x_pinctrl_get_pin_by_number(data, pin);
+	pin_desc = rtd_pinctrl_get_pin_by_number(data, pin);
 	if (!pin_desc)
 		return -ENOTSUPP;
 
 	pin_name = pin_desc->name;
 
-	mux = rtd119x_pinctrl_find_mux(data, pin_name);
+	mux = rtd_pinctrl_find_mux(data, pin_name);
 	if (!mux)
 		return -ENOTSUPP;
 
@@ -303,10 +303,10 @@ static int rtd119x_pinctrl_set_one_mux(struct pinctrl_dev *pcdev,
 	return -EINVAL;
 }
 
-static int rtd119x_pinctrl_set_mux(struct pinctrl_dev *pcdev,
+static int rtd_pinctrl_set_mux(struct pinctrl_dev *pcdev,
 		unsigned int function, unsigned int group)
 {
-	struct rtd119x_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
+	struct rtd_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
 	const unsigned int *pins;
 	unsigned int num_pins;
 	const char *func_name;
@@ -316,7 +316,7 @@ static int rtd119x_pinctrl_set_mux(struct pinctrl_dev *pcdev,
 	func_name = data->info->functions[function].name;
 	group_name = data->info->groups[group].name;
 
-	ret = rtd119x_pinctrl_get_group_pins(pcdev, group, &pins, &num_pins);
+	ret = rtd_pinctrl_get_group_pins(pcdev, group, &pins, &num_pins);
 	if (ret) {
 		dev_err(pcdev->dev, "Getting pins for group %s failed\n",
 			group_name);
@@ -324,7 +324,7 @@ static int rtd119x_pinctrl_set_mux(struct pinctrl_dev *pcdev,
 	}
 
 	for (i = 0; i < num_pins; i++) {
-		ret = rtd119x_pinctrl_set_one_mux(pcdev, pins[i], func_name);
+		ret = rtd_pinctrl_set_one_mux(pcdev, pins[i], func_name);
 		if (ret)
 			return ret;
 	}
@@ -332,22 +332,22 @@ static int rtd119x_pinctrl_set_mux(struct pinctrl_dev *pcdev,
 	return 0;
 }
 
-static int rtd119x_pinctrl_gpio_request_enable(struct pinctrl_dev *pcdev,
+static int rtd_pinctrl_gpio_request_enable(struct pinctrl_dev *pcdev,
 	struct pinctrl_gpio_range *range, unsigned int offset)
 {
-	return rtd119x_pinctrl_set_one_mux(pcdev, offset, "gpio");
+	return rtd_pinctrl_set_one_mux(pcdev, offset, "gpio");
 }
 
-static const struct pinmux_ops rtd119x_pinmux_ops = {
-	.get_functions_count = rtd119x_pinctrl_get_functions_count,
-	.get_function_name = rtd119x_pinctrl_get_function_name,
-	.get_function_groups = rtd119x_pinctrl_get_function_groups,
-	.set_mux = rtd119x_pinctrl_set_mux,
-	.gpio_request_enable = rtd119x_pinctrl_gpio_request_enable,
+static const struct pinmux_ops rtd_pinmux_ops = {
+	.get_functions_count = rtd_pinctrl_get_functions_count,
+	.get_function_name = rtd_pinctrl_get_function_name,
+	.get_function_groups = rtd_pinctrl_get_function_groups,
+	.set_mux = rtd_pinctrl_set_mux,
+	.gpio_request_enable = rtd_pinctrl_gpio_request_enable,
 };
 
 
-static int rtd119x_pconf_parse_conf(struct rtd119x_pinctrl *data,
+static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 	const char *pin_name, enum pin_config_param param,
 	enum pin_config_param arg)
 {
@@ -355,10 +355,10 @@ static int rtd119x_pconf_parse_conf(struct rtd119x_pinctrl *data,
 	u16 strength;
 	u32 val, mask;
 	int pulsel_off, pulen_off, smt_off, curr_off;
-	const struct rtd119x_pin_config_desc *config_desc;
-	const struct rtd119x_pin_sconfig_desc *sconfig_desc;
+	const struct rtd_pin_config_desc *config_desc;
+	const struct rtd_pin_sconfig_desc *sconfig_desc;
 
-	config_desc = rtd119x_pinctrl_find_config(data, pin_name);
+	config_desc = rtd_pinctrl_find_config(data, pin_name);
 	if (!config_desc)
 		return -ENOTSUPP;
 
@@ -432,7 +432,7 @@ static int rtd119x_pconf_parse_conf(struct rtd119x_pinctrl *data,
 		writel(val, data->base + config_desc->reg_offset);
 		break;
 	case RTK_P_DRIVE:
-		sconfig_desc = rtd119x_pinctrl_find_sconfig(data, pin_name);
+		sconfig_desc = rtd_pinctrl_find_sconfig(data, pin_name);
 		if (!sconfig_desc)
 			return -ENOTSUPP;
 		set_val = arg;
@@ -443,7 +443,7 @@ static int rtd119x_pconf_parse_conf(struct rtd119x_pinctrl *data,
 		writel(val, data->base + sconfig_desc->reg_offset);
 		break;
 	case RTK_N_DRIVE:
-		sconfig_desc = rtd119x_pinctrl_find_sconfig(data, pin_name);
+		sconfig_desc = rtd_pinctrl_find_sconfig(data, pin_name);
 		if (!sconfig_desc)
 			return -ENOTSUPP;
 		set_val = arg;
@@ -460,7 +460,7 @@ static int rtd119x_pconf_parse_conf(struct rtd119x_pinctrl *data,
 	return 0;
 }
 
-static int rtd119x_pin_config_get(struct pinctrl_dev *pcdev, unsigned int pinnr,
+static int rtd_pin_config_get(struct pinctrl_dev *pcdev, unsigned int pinnr,
 		unsigned long *config)
 {
 	unsigned int param = pinconf_to_config_param(*config);
@@ -475,23 +475,23 @@ static int rtd119x_pin_config_get(struct pinctrl_dev *pcdev, unsigned int pinnr,
 	return 0;
 }
 
-static int rtd119x_pin_config_set(struct pinctrl_dev *pcdev, unsigned int pinnr,
+static int rtd_pin_config_set(struct pinctrl_dev *pcdev, unsigned int pinnr,
 		unsigned long *configs, unsigned int num_configs)
 {
-	struct rtd119x_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
+	struct rtd_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
 	const struct pinctrl_pin_desc *pin_desc;
 	const char *pin_name;
 	int i;
 	int ret = 0;
 
-	pin_desc = rtd119x_pinctrl_get_pin_by_number(data, pinnr);
+	pin_desc = rtd_pinctrl_get_pin_by_number(data, pinnr);
 	if (!pin_desc)
 		return -ENOTSUPP;
 
 	pin_name = pin_desc->name;
 
 	for (i = 0; i < num_configs; i++) {
-		ret = rtd119x_pconf_parse_conf(data, pin_name,
+		ret = rtd_pconf_parse_conf(data, pin_name,
 			pinconf_to_config_param(configs[i]),
 			pinconf_to_config_argument(configs[i]));
 		if (ret < 0)
@@ -502,10 +502,10 @@ static int rtd119x_pin_config_set(struct pinctrl_dev *pcdev, unsigned int pinnr,
 }
 
 
-static int rtd119x_pin_config_group_set(struct pinctrl_dev *pcdev,
+static int rtd_pin_config_group_set(struct pinctrl_dev *pcdev,
 					unsigned int group, unsigned long *configs, unsigned int num_configs)
 {
-	struct rtd119x_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
+	struct rtd_pinctrl *data = pinctrl_dev_get_drvdata(pcdev);
 	const unsigned int *pins;
 	unsigned int num_pins;
 	const char *group_name;
@@ -513,14 +513,14 @@ static int rtd119x_pin_config_group_set(struct pinctrl_dev *pcdev,
 
 		group_name = data->info->groups[group].name;
 
-	ret = rtd119x_pinctrl_get_group_pins(pcdev, group, &pins, &num_pins);
+	ret = rtd_pinctrl_get_group_pins(pcdev, group, &pins, &num_pins);
 	if (ret) {
 		dev_err(pcdev->dev, "Getting pins for group %s failed\n", group_name);
 		return ret;
 	}
 
 	for (i = 0; i < num_pins; i++) {
-		ret = rtd119x_pin_config_set(pcdev, pins[i], configs, num_configs);
+		ret = rtd_pin_config_set(pcdev, pins[i], configs, num_configs);
 		if (ret)
 			return ret;
 	}
@@ -529,17 +529,17 @@ static int rtd119x_pin_config_group_set(struct pinctrl_dev *pcdev,
 }
 
 
-static const struct pinconf_ops rtd119x_pinconf_ops = {
+static const struct pinconf_ops rtd_pinconf_ops = {
 	.is_generic = true,
-	.pin_config_get = rtd119x_pin_config_get,
-	.pin_config_set = rtd119x_pin_config_set,
-	.pin_config_group_set = rtd119x_pin_config_group_set,
+	.pin_config_get = rtd_pin_config_get,
+	.pin_config_set = rtd_pin_config_set,
+	.pin_config_group_set = rtd_pin_config_group_set,
 };
 
-static void rtd119x_pinctrl_selftest(struct rtd119x_pinctrl *data)
+static void rtd_pinctrl_selftest(struct rtd_pinctrl *data)
 {
 	int i, j, k;
-	const struct rtd119x_pinctrl_desc *info = data->info;
+	const struct rtd_pinctrl_desc *info = data->info;
 
 	for (i = 0; i < info->num_muxes; i++) {
 		/* Check for pin */
@@ -586,7 +586,7 @@ static void rtd119x_pinctrl_selftest(struct rtd119x_pinctrl *data)
 	}
 }
 
-static const struct of_device_id rtd119x_pinctrl_dt_ids[] = {
+static const struct of_device_id rtd_pinctrl_dt_ids[] = {
 	 { .compatible = "realtek,rtd1195-iso-pinctrl",
 		.data = &rtd1195_iso_pinctrl_desc },
 	 { .compatible = "realtek,rtd1195-crt-pinctrl",
@@ -602,12 +602,12 @@ static const struct of_device_id rtd119x_pinctrl_dt_ids[] = {
 	 { }
 };
 
-static int rtd119x_pinctrl_probe(struct platform_device *pdev)
+static int rtd_pinctrl_probe(struct platform_device *pdev)
 {
-	struct rtd119x_pinctrl *data;
+	struct rtd_pinctrl *data;
 	const struct of_device_id *match;
 
-	match = of_match_node(rtd119x_pinctrl_dt_ids, pdev->dev.of_node);
+	match = of_match_node(rtd_pinctrl_dt_ids, pdev->dev.of_node);
 	if (!match)
 		return -EINVAL;
 
@@ -623,11 +623,11 @@ static int rtd119x_pinctrl_probe(struct platform_device *pdev)
 	data->desc.name = "foo";
 	data->desc.pins = data->info->pins;
 	data->desc.npins = data->info->num_pins;
-	data->desc.pctlops = &rtd119x_pinctrl_ops;
-	data->desc.pmxops = &rtd119x_pinmux_ops;
-	data->desc.confops = &rtd119x_pinconf_ops;
-	data->desc.custom_params = rtd119x_custom_bindings;
-	data->desc.num_custom_params = ARRAY_SIZE(rtd119x_custom_bindings);
+	data->desc.pctlops = &rtd_pinctrl_ops;
+	data->desc.pmxops = &rtd_pinmux_ops;
+	data->desc.confops = &rtd_pinconf_ops;
+	data->desc.custom_params = rtd_custom_bindings;
+	data->desc.num_custom_params = ARRAY_SIZE(rtd_custom_bindings);
 	data->desc.owner = THIS_MODULE;
 
 	data->pcdev = pinctrl_register(&data->desc, &pdev->dev, data);
@@ -636,20 +636,20 @@ static int rtd119x_pinctrl_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, data);
 
-	rtd119x_pinctrl_selftest(data);
+	rtd_pinctrl_selftest(data);
 
 	dev_info(&pdev->dev, "probed\n");
 
 	return 0;
 }
 
-static struct platform_driver rtd119x_pinctrl_driver = {
-	.probe = rtd119x_pinctrl_probe,
+static struct platform_driver rtd_pinctrl_driver = {
+	.probe = rtd_pinctrl_probe,
 	.driver = {
-		.name = "rtd1295-pinctrl",
-		.of_match_table	= rtd119x_pinctrl_dt_ids,
+		.name = "rtd-pinctrl",
+		.of_match_table	= rtd_pinctrl_dt_ids,
 	},
 };
-builtin_platform_driver(rtd119x_pinctrl_driver);
-MODULE_DESCRIPTION("rtk pinctrl driver");
+builtin_platform_driver(rtd_pinctrl_driver);
+MODULE_DESCRIPTION("rtd pinctrl driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/pinctrl-rtd1195.h b/drivers/pinctrl/realtek/pinctrl-rtd1195.h
similarity index 98%
rename from drivers/pinctrl/pinctrl-rtd1195.h
rename to drivers/pinctrl/realtek/pinctrl-rtd1195.h
index f0dd91f416e8..74139345083c 100644
--- a/drivers/pinctrl/pinctrl-rtd1195.h
+++ b/drivers/pinctrl/realtek/pinctrl-rtd1195.h
@@ -107,7 +107,7 @@ static const unsigned int rtd1195_pwm_23_open_drain_pins[] = {
 		.num_pins = ARRAY_SIZE(rtd1195_ ## _name ## _pins), \
 	}
 
-static const struct rtd119x_pin_group_desc rtd1195_iso_pin_groups[] = {
+static const struct rtd_pin_group_desc rtd1195_iso_pin_groups[] = {
 	RTD1195_GROUP(iso_gpio_0),
 	RTD1195_GROUP(iso_gpio_1),
 	RTD1195_GROUP(usb0),
@@ -212,7 +212,7 @@ static const char * const rtd1195_iso_pwm_23_open_drain_groups[] = {
 		.num_groups = ARRAY_SIZE(rtd1195_iso_ ## _name ## _groups), \
 	}
 
-static const struct rtd119x_pin_func_desc rtd1195_iso_pin_functions[] = {
+static const struct rtd_pin_func_desc rtd1195_iso_pin_functions[] = {
 	RTD1195_FUNC(gpio),
 	RTD1195_FUNC(ai_ur1),
 	RTD1195_FUNC(ai_vfd),
@@ -239,7 +239,7 @@ static const struct rtd119x_pin_func_desc rtd1195_iso_pin_functions[] = {
 
 #undef RTD1195_FUNC
 
-static const struct rtd119x_pin_desc rtd1195_iso_muxes[] = {
+static const struct rtd_pin_desc rtd1195_iso_muxes[] = {
 	RTK_PIN_MUX(vfd_d, 0x10, GENMASK(1, 0),
 		RTK_PIN_FUNC(0x0 << 0, "gpio"),
 		RTK_PIN_FUNC(0x1 << 0, "vfd"),
@@ -337,7 +337,7 @@ static const struct rtd119x_pin_desc rtd1195_iso_muxes[] = {
 		RTK_PIN_FUNC(0x2 << 30, "ai_vfd")),
 };
 
-static const struct rtd119x_pin_config_desc rtd1195_iso_configs[] = {
+static const struct rtd_pin_config_desc rtd1195_iso_configs[] = {
 	RTK_PIN_CONFIG(ir_rx, 0x0, 8, 1, 0, 2, 3, PADDRI_2_4),
 	RTK_PIN_CONFIG(vfd_cs_n, 0x0, 12, 1, 0, 2, 3, PADDRI_2_4),
 	RTK_PIN_CONFIG(vfd_clk, 0x0, 16, 1, 0, 2, 3, PADDRI_2_4),
@@ -358,7 +358,7 @@ static const struct rtd119x_pin_config_desc rtd1195_iso_configs[] = {
 };
 
 
-static const struct rtd119x_pinctrl_desc rtd1195_iso_pinctrl_desc = {
+static const struct rtd_pinctrl_desc rtd1195_iso_pinctrl_desc = {
 	.pins = rtd1195_iso_pins,
 	.num_pins = ARRAY_SIZE(rtd1195_iso_pins),
 	.groups = rtd1195_iso_pin_groups,
@@ -586,7 +586,7 @@ static const unsigned int rtd1195_ao_loc_pins[] = { RTD1195_AO_LOC };
 		.num_pins = ARRAY_SIZE(rtd1195_ ## _name ## _pins), \
 	}
 
-static const struct rtd119x_pin_group_desc rtd1195_crt_pin_groups[] = {
+static const struct rtd_pin_group_desc rtd1195_crt_pin_groups[] = {
 	RTD1195_GROUP(gpio_0),
 	RTD1195_GROUP(gpio_1),
 	RTD1195_GROUP(gpio_2),
@@ -764,7 +764,7 @@ static const char * const rtd1195_crt_usb_groups[] = { "sensor_cko_1" };
 		.num_groups = ARRAY_SIZE(rtd1195_crt_ ## _name ## _groups), \
 	}
 
-static const struct rtd119x_pin_func_desc rtd1195_crt_pin_functions[] = {
+static const struct rtd_pin_func_desc rtd1195_crt_pin_functions[] = {
 	RTD1195_FUNC(gpio),
 	RTD1195_FUNC(ao_tp0),
 	RTD1195_FUNC(ao_gpio),
@@ -794,7 +794,7 @@ static const struct rtd119x_pin_func_desc rtd1195_crt_pin_functions[] = {
 
 #undef RTD1195_FUNC
 
-static const struct rtd119x_pin_desc rtd1195_crt_muxes[] = {
+static const struct rtd_pin_desc rtd1195_crt_muxes[] = {
 	RTK_PIN_MUX(nf_rdy, 0x60, GENMASK(3, 2),
 		RTK_PIN_FUNC(0x0 << 2, "gpio"),
 		RTK_PIN_FUNC(0x1 << 2, "nand"),
@@ -1045,7 +1045,7 @@ static const struct rtd119x_pin_desc rtd1195_crt_muxes[] = {
 		RTK_PIN_FUNC(0x2 << 2, "ao_gpio")),
 };
 
-static const struct rtd119x_pin_config_desc rtd1195_crt_configs[] = {
+static const struct rtd_pin_config_desc rtd1195_crt_configs[] = {
 	RTK_PIN_CONFIG(nf_ale, 0x78, 4, 1, 0, 2, 3, PADDRI_4_8),
 	RTK_PIN_CONFIG(nf_ce_n_0, 0x78, 8, 1, 0, 2, 3, PADDRI_4_8),
 	RTK_PIN_CONFIG(nf_ce_n_1, 0x78, 12, 1, 0, 2, 3, PADDRI_4_8),
@@ -1111,7 +1111,7 @@ static const struct rtd119x_pin_config_desc rtd1195_crt_configs[] = {
 };
 
 
-static const struct rtd119x_pinctrl_desc rtd1195_crt_pinctrl_desc = {
+static const struct rtd_pinctrl_desc rtd1195_crt_pinctrl_desc = {
 	.pins = rtd1195_crt_pins,
 	.num_pins = ARRAY_SIZE(rtd1195_crt_pins),
 	.groups = rtd1195_crt_pin_groups,
diff --git a/drivers/pinctrl/pinctrl-rtd1295.h b/drivers/pinctrl/realtek/pinctrl-rtd1295.h
similarity index 98%
rename from drivers/pinctrl/pinctrl-rtd1295.h
rename to drivers/pinctrl/realtek/pinctrl-rtd1295.h
index 5c550bd8ee12..84feacabae7d 100644
--- a/drivers/pinctrl/pinctrl-rtd1295.h
+++ b/drivers/pinctrl/realtek/pinctrl-rtd1295.h
@@ -171,7 +171,7 @@ static const unsigned int rtd1295_uart2_1_pins[] = {
 		.num_pins = ARRAY_SIZE(rtd1295_ ## _name ## _pins), \
 	}
 
-static const struct rtd119x_pin_group_desc rtd1295_iso_pin_groups[] = {
+static const struct rtd_pin_group_desc rtd1295_iso_pin_groups[] = {
 	RTD1295_GROUP(iso_gpio_0),
 	RTD1295_GROUP(iso_gpio_1),
 	RTD1295_GROUP(iso_gpio_2),
@@ -317,7 +317,7 @@ static const char * const rtd1295_iso_acpu_ejtag_loc_nf_groups[] = {
 		.num_groups = ARRAY_SIZE(rtd1295_iso_ ## _name ## _groups), \
 	}
 
-static const struct rtd119x_pin_func_desc rtd1295_iso_pin_functions[] = {
+static const struct rtd_pin_func_desc rtd1295_iso_pin_functions[] = {
 	RTD1295_FUNC(gpio),
 	RTD1295_FUNC(acpu_ejtag_loc_iso),
 	RTD1295_FUNC(edp_hpd),
@@ -350,7 +350,7 @@ static const struct rtd119x_pin_func_desc rtd1295_iso_pin_functions[] = {
 
 #undef RTD1295_FUNC
 
-static const struct rtd119x_pin_desc rtd1295_iso_muxes[] = {
+static const struct rtd_pin_desc rtd1295_iso_muxes[] = {
 	RTK_PIN_MUX(iso_gpio_4, 0x10, GENMASK(1, 0),
 		RTK_PIN_FUNC(0x0 << 0, "gpio"),
 		RTK_PIN_FUNC(0x1 << 0, "uart2_0"),
@@ -489,7 +489,7 @@ static const struct rtd119x_pin_desc rtd1295_iso_muxes[] = {
 		RTK_PIN_FUNC(0x2 << 12, "uart2_1")),
 };
 
-static const struct rtd119x_pin_config_desc rtd1295_iso_configs[] = {
+static const struct rtd_pin_config_desc rtd1295_iso_configs[] = {
 	RTK_PIN_CONFIG(iso_gpio_2, 0x0, 0, 1, 0, 2, 3, PADDRI_2_4),
 	RTK_PIN_CONFIG(iso_gpio_3, 0x0, 4, 1, 0, 2, 3, PADDRI_2_4),
 	RTK_PIN_CONFIG(ir_rx, 0x0, 8, 1, 0, 2, 3, PADDRI_2_4),
@@ -527,7 +527,7 @@ static const struct rtd119x_pin_config_desc rtd1295_iso_configs[] = {
 
 
 
-static const struct rtd119x_pinctrl_desc rtd1295_iso_pinctrl_desc = {
+static const struct rtd_pinctrl_desc rtd1295_iso_pinctrl_desc = {
 	.pins = rtd1295_iso_pins,
 	.num_pins = ARRAY_SIZE(rtd1295_iso_pins),
 	.groups = rtd1295_iso_pin_groups,
@@ -756,7 +756,7 @@ static const unsigned int rtd1295_tp1_loc_pins[] = { RTD1295_TP1_LOC };
 
 
 
-static const struct rtd119x_pin_group_desc rtd1295_sb2_pin_groups[] = {
+static const struct rtd_pin_group_desc rtd1295_sb2_pin_groups[] = {
 	RTD1295_GROUP(gpio_0),
 	RTD1295_GROUP(gpio_1),
 	RTD1295_GROUP(gpio_2),
@@ -921,7 +921,7 @@ static const char * const rtd1295_sb2_hif_loc_nf_groups[] = { "hif_loc" };
 		.num_groups = ARRAY_SIZE(rtd1295_sb2_ ## _name ## _groups), \
 	}
 
-static const struct rtd119x_pin_func_desc rtd1295_sb2_pin_functions[] = {
+static const struct rtd_pin_func_desc rtd1295_sb2_pin_functions[] = {
 	RTD1295_FUNC(gpio),
 	RTD1295_FUNC(ai),
 	RTD1295_FUNC(dc_fan_sensor),
@@ -951,7 +951,7 @@ static const struct rtd119x_pin_func_desc rtd1295_sb2_pin_functions[] = {
 
 #undef RTD1295_FUNC
 
-static const struct rtd119x_pin_desc rtd1295_sb2_muxes[] = {
+static const struct rtd_pin_desc rtd1295_sb2_muxes[] = {
 	RTK_PIN_MUX(tp0_data, 0x08, GENMASK(2, 0),
 		RTK_PIN_FUNC(0x0 << 0, "gpio"),
 		RTK_PIN_FUNC(0x1 << 0, "tp0_loc_tp0"),
@@ -1168,7 +1168,7 @@ static const struct rtd119x_pin_desc rtd1295_sb2_muxes[] = {
 		RTK_PIN_FUNC(0x1 << 22, "rgmii")),
 };
 
-static const struct rtd119x_pin_config_desc rtd1295_sb2_configs[] = {
+static const struct rtd_pin_config_desc rtd1295_sb2_configs[] = {
 	RTK_PIN_CONFIG(tp0_clk, 0x28, 0, 1, 0, 2, 3, PADDRI_4_8),
 	RTK_PIN_CONFIG(tp0_sync, 0x28, 4, 1, 0, 2, 3, PADDRI_4_8),
 	RTK_PIN_CONFIG(tp0_valid, 0x28, 8, 1, 0, 2, 3, PADDRI_4_8),
@@ -1226,7 +1226,7 @@ static const struct rtd119x_pin_config_desc rtd1295_sb2_configs[] = {
 };
 
 
-static const struct rtd119x_pinctrl_desc rtd1295_sb2_pinctrl_desc = {
+static const struct rtd_pinctrl_desc rtd1295_sb2_pinctrl_desc = {
 	.pins = rtd1295_sb2_pins,
 	.num_pins = ARRAY_SIZE(rtd1295_sb2_pins),
 	.groups = rtd1295_sb2_pin_groups,
@@ -1278,7 +1278,7 @@ static const unsigned int rtd1295_ao_sd_1_pins[] = { RTD1295_AO_SD_1 };
 static const unsigned int rtd1295_ao_sd_2_pins[] = { RTD1295_AO_SD_2 };
 static const unsigned int rtd1295_ao_sd_3_pins[] = { RTD1295_AO_SD_3 };
 
-static const struct rtd119x_pin_group_desc rtd1295_disp_pin_groups[] = {
+static const struct rtd_pin_group_desc rtd1295_disp_pin_groups[] = {
 	RTD1295_GROUP(spdif),
 	RTD1295_GROUP(dmic_clk),
 	RTD1295_GROUP(dmic_data),
@@ -1313,7 +1313,7 @@ static const char * const rtd1295_disp_spdif_out_groups[] = { "spdif" };
 		.num_groups = ARRAY_SIZE(rtd1295_disp_ ## _name ## _groups), \
 	}
 
-static const struct rtd119x_pin_func_desc rtd1295_disp_pin_functions[] = {
+static const struct rtd_pin_func_desc rtd1295_disp_pin_functions[] = {
 	RTD1295_FUNC(gpio),
 	RTD1295_FUNC(ai),
 	RTD1295_FUNC(ao),
@@ -1323,7 +1323,7 @@ static const struct rtd119x_pin_func_desc rtd1295_disp_pin_functions[] = {
 
 #undef RTD1295_FUNC
 
-static const struct rtd119x_pin_desc rtd1295_disp_muxes[] = {
+static const struct rtd_pin_desc rtd1295_disp_muxes[] = {
 	RTK_PIN_MUX(spdif, 0x08, GENMASK(1, 0),
 		RTK_PIN_FUNC(0x0 << 0, "gpio"),
 		RTK_PIN_FUNC(0x1 << 0, "spdif_out")),
@@ -1360,7 +1360,7 @@ static const struct rtd119x_pin_desc rtd1295_disp_muxes[] = {
 		RTK_PIN_FUNC(0x2 << 18, "ai")),
 };
 
-static const struct rtd119x_pin_config_desc rtd1295_disp_configs[] = {
+static const struct rtd_pin_config_desc rtd1295_disp_configs[] = {
 	RTK_PIN_CONFIG(spdif, 0x0, 0, 1, 0, 2, 3, PADDRI_2_4),
 	RTK_PIN_CONFIG(dmic_clk, 0x0, 4, 1, 0, 2, 3, PADDRI_2_4),
 	RTK_PIN_CONFIG(dmic_data, 0x0, 8, 1, 0, 2, 3, PADDRI_2_4),
@@ -1374,7 +1374,7 @@ static const struct rtd119x_pin_config_desc rtd1295_disp_configs[] = {
 };
 
 
-static const struct rtd119x_pinctrl_desc rtd1295_disp_pinctrl_desc = {
+static const struct rtd_pinctrl_desc rtd1295_disp_pinctrl_desc = {
 	.pins = rtd1295_disp_pins,
 	.num_pins = ARRAY_SIZE(rtd1295_disp_pins),
 	.groups = rtd1295_disp_pin_groups,
@@ -1513,7 +1513,7 @@ static const unsigned int rtd1295_prob_3_pins[] = { RTD1295_PROB_3 };
 static const unsigned int rtd1295_sdio_loc_pins[] = { RTD1295_SDIO_LOC };
 
 
-static const struct rtd119x_pin_group_desc rtd1295_cr_pin_groups[] = {
+static const struct rtd_pin_group_desc rtd1295_cr_pin_groups[] = {
 	RTD1295_GROUP(nf_cle),
 	RTD1295_GROUP(nf_ale),
 	RTD1295_GROUP(nf_rd_n),
@@ -1616,7 +1616,7 @@ static const char * const rtd1295_cr_sdio_1_groups[] = {
 		.num_groups = ARRAY_SIZE(rtd1295_cr_ ## _name ## _groups), \
 	}
 
-static const struct rtd119x_pin_func_desc rtd1295_cr_pin_functions[] = {
+static const struct rtd_pin_func_desc rtd1295_cr_pin_functions[] = {
 	RTD1295_FUNC(gpio),
 	RTD1295_FUNC(avcpu_ej),
 	RTD1295_FUNC(emmc),
@@ -1633,7 +1633,7 @@ static const struct rtd119x_pin_func_desc rtd1295_cr_pin_functions[] = {
 
 #undef RTD1295_FUNC
 
-static const struct rtd119x_pin_desc rtd1295_cr_muxes[] = {
+static const struct rtd_pin_desc rtd1295_cr_muxes[] = {
 	RTK_PIN_MUX(nf_dqs, 0x00, GENMASK(1, 0),
 		RTK_PIN_FUNC(0x0 << 0, "gpio"),
 		RTK_PIN_FUNC(0x1 << 0, "nand")),
@@ -1785,7 +1785,7 @@ static const struct rtd119x_pin_desc rtd1295_cr_muxes[] = {
 		RTK_PIN_FUNC(0x1 << 12, "pll_test")),
 };
 
-static const struct rtd119x_pin_config_desc rtd1295_cr_configs[] = {
+static const struct rtd_pin_config_desc rtd1295_cr_configs[] = {
 	RTK_PIN_CONFIG(nf_dqs, 0x8, 0, 1, 0, 2, 3, PCONF_UNSUPP),
 	RTK_PIN_CONFIG(nf_ale, 0x8, 4, 1, 0, 2, 3, PCONF_UNSUPP),
 	RTK_PIN_CONFIG(nf_ce_n_0, 0x8, 8, 1, 0, 2, 3, PCONF_UNSUPP),
@@ -1825,7 +1825,7 @@ static const struct rtd119x_pin_config_desc rtd1295_cr_configs[] = {
 	RTK_PIN_CONFIG(prob_3, 0x18, 24, 1, 0, 2, 3, PADDRI_4_8),
 };
 
-static const struct rtd119x_pin_sconfig_desc rtd1295_cr_sconfigs[] = {
+static const struct rtd_pin_sconfig_desc rtd1295_cr_sconfigs[] = {
 	RTK_PIN_SCONFIG(nf_ce_n_1, 0x20, 0, 4, 4, 4),
 	RTK_PIN_SCONFIG(nf_ce_n_0, 0x20, 8, 4, 12, 4),
 	RTK_PIN_SCONFIG(nf_rdy, 0x20, 16, 4, 20, 4),
@@ -1859,7 +1859,7 @@ static const struct rtd119x_pin_sconfig_desc rtd1295_cr_sconfigs[] = {
 
 
 
-static const struct rtd119x_pinctrl_desc rtd1295_cr_pinctrl_desc = {
+static const struct rtd_pinctrl_desc rtd1295_cr_pinctrl_desc = {
 	.pins = rtd1295_cr_pins,
 	.num_pins = ARRAY_SIZE(rtd1295_cr_pins),
 	.groups = rtd1295_cr_pin_groups,
-- 
2.28.0

