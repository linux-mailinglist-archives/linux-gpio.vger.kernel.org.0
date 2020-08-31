Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B754257513
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 10:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbgHaILd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 04:11:33 -0400
Received: from mo-csw1516.securemx.jp ([210.130.202.155]:53032 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728077AbgHaILb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 04:11:31 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 07V8AmLP006467; Mon, 31 Aug 2020 17:10:49 +0900
X-Iguazu-Qid: 34tMSeeoT6LW6Qy6d1
X-Iguazu-QSIG: v=2; s=0; t=1598861448; q=34tMSeeoT6LW6Qy6d1; m=aGo23sy6s5FxTX/ZDXL2kVAQ8G+8SR6ZSri75qQq3CU=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1510) id 07V8AkCb023416;
        Mon, 31 Aug 2020 17:10:47 +0900
Received: from enc03.toshiba.co.jp ([106.186.93.13])
        by imx2.toshiba.co.jp  with ESMTP id 07V8AkCd025500;
        Mon, 31 Aug 2020 17:10:46 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc03.toshiba.co.jp  with ESMTP id 07V8AjKa026337;
        Mon, 31 Aug 2020 17:10:46 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@misterjones.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v3 2/8] pinctrl: visconti: Add Toshiba Visconti SoCs pinctrl support
Date:   Mon, 31 Aug 2020 17:10:19 +0900
X-TSB-HOP: ON
Message-Id: <20200831081025.2721320-3-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200831081025.2721320-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20200831081025.2721320-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pinctrl support to Toshiba Visconti SoCs.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 drivers/pinctrl/Kconfig                     |   1 +
 drivers/pinctrl/Makefile                    |   1 +
 drivers/pinctrl/visconti/Kconfig            |  14 +
 drivers/pinctrl/visconti/Makefile           |   3 +
 drivers/pinctrl/visconti/pinctrl-common.c   | 305 +++++++++++++++++
 drivers/pinctrl/visconti/pinctrl-common.h   |  96 ++++++
 drivers/pinctrl/visconti/pinctrl-tmpv7700.c | 355 ++++++++++++++++++++
 7 files changed, 775 insertions(+)
 create mode 100644 drivers/pinctrl/visconti/Kconfig
 create mode 100644 drivers/pinctrl/visconti/Makefile
 create mode 100644 drivers/pinctrl/visconti/pinctrl-common.c
 create mode 100644 drivers/pinctrl/visconti/pinctrl-common.h
 create mode 100644 drivers/pinctrl/visconti/pinctrl-tmpv7700.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 8828613c4e0e..6f62b9bb79bb 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -429,6 +429,7 @@ source "drivers/pinctrl/mediatek/Kconfig"
 source "drivers/pinctrl/zte/Kconfig"
 source "drivers/pinctrl/meson/Kconfig"
 source "drivers/pinctrl/cirrus/Kconfig"
+source "drivers/pinctrl/visconti/Kconfig"
 
 config PINCTRL_XWAY
 	bool
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 1731b2154df9..576cbedcbf73 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -74,3 +74,4 @@ obj-$(CONFIG_ARCH_VT8500)	+= vt8500/
 obj-y				+= mediatek/
 obj-$(CONFIG_PINCTRL_ZX)	+= zte/
 obj-y				+= cirrus/
+obj-$(CONFIG_PINCTRL_VISCONTI)	+= visconti/
diff --git a/drivers/pinctrl/visconti/Kconfig b/drivers/pinctrl/visconti/Kconfig
new file mode 100644
index 000000000000..198ec33189cc
--- /dev/null
+++ b/drivers/pinctrl/visconti/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config PINCTRL_VISCONTI
+	bool
+	select PINMUX
+	select GENERIC_PINCONF
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
+
+config PINCTRL_TMPV7700
+	bool "Toshiba Visconti TMPV7700 series pinctrl driver"
+	depends on OF
+	depends on ARM64 || COMPILE_TEST
+	select PINCTRL_VISCONTI
+	default ARM64 && ARCH_VISCONTI
diff --git a/drivers/pinctrl/visconti/Makefile b/drivers/pinctrl/visconti/Makefile
new file mode 100644
index 000000000000..43b2eb663bce
--- /dev/null
+++ b/drivers/pinctrl/visconti/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_PINCTRL_VISCONTI)	+= pinctrl-common.o
+obj-$(CONFIG_PINCTRL_TMPV7700)	+= pinctrl-tmpv7700.o
diff --git a/drivers/pinctrl/visconti/pinctrl-common.c b/drivers/pinctrl/visconti/pinctrl-common.c
new file mode 100644
index 000000000000..f831296dbc47
--- /dev/null
+++ b/drivers/pinctrl/visconti/pinctrl-common.c
@@ -0,0 +1,305 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 TOSHIBA CORPORATION
+ * Copyright (c) 2020 Toshiba Electronic Devices & Storage Corporation
+ * Copyright (c) 2020 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+ */
+
+#include <linux/init.h>
+#include <linux/of.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include "pinctrl-common.h"
+#include "../core.h"
+#include "../pinconf.h"
+#include "../pinctrl-utils.h"
+
+#define DSEL_MASK GENMASK(3, 0)
+
+/* private data */
+struct visconti_pinctrl {
+	void __iomem *base;
+	struct device *dev;
+	struct pinctrl_dev *pctl;
+	struct pinctrl_desc pctl_desc;
+
+	const struct visconti_pinctrl_devdata  *devdata;
+
+	spinlock_t lock; /* protect gpio register */
+};
+
+/* pinconf */
+static int visconti_pin_config_set(struct pinctrl_dev *pctldev,
+				  unsigned int _pin,
+				  unsigned long *configs,
+				  unsigned int num_configs)
+{
+	struct visconti_pinctrl *priv = pinctrl_dev_get_drvdata(pctldev);
+	const struct visconti_desc_pin *pin = &priv->devdata->pins[_pin];
+	enum pin_config_param param;
+	unsigned int arg;
+	int i, ret = 0;
+	unsigned int val, set_val, pude_val;
+	unsigned long flags;
+
+	dev_dbg(priv->dev, "%s: pin = %d (%s)\n", __func__, _pin, pin->pin.name);
+
+	spin_lock_irqsave(&priv->lock, flags);
+
+	for (i = 0; i < num_configs; i++) {
+		set_val = 0;
+		pude_val = 0;
+
+		param = pinconf_to_config_param(configs[i]);
+		switch (param) {
+		case PIN_CONFIG_BIAS_PULL_UP:
+			set_val = 1;
+			fallthrough;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			/* update pudsel setting */
+			val = readl(priv->base + pin->pudsel_offset);
+			val &= ~BIT(pin->pud_shift);
+			val |= set_val << pin->pud_shift;
+			writel(val, priv->base + pin->pudsel_offset);
+			pude_val = 1;
+			fallthrough;
+		case PIN_CONFIG_BIAS_DISABLE:
+			/* update pude setting */
+			val = readl(priv->base + pin->pude_offset);
+			val &= ~BIT(pin->pud_shift);
+			val |= pude_val << pin->pud_shift;
+			writel(val, priv->base + pin->pude_offset);
+			dev_dbg(priv->dev, "BIAS(%d): off = 0x%x val = 0x%x\n",
+				param, pin->pude_offset, val);
+			break;
+
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			arg = pinconf_to_config_argument(configs[i]);
+			dev_dbg(priv->dev, "DRV_STR arg = %d\n", arg);
+			switch (arg) {
+			case 2:
+			case 4:
+			case 8:
+			case 16:
+			case 24:
+			case 32:
+				/*
+				 * I/O drive capacity setting:
+				 * 2mA: 0
+				 * 4mA: 1
+				 * 8mA: 3
+				 * 16mA: 7
+				 * 24mA: 11
+				 * 32mA: 15
+				 */
+				set_val = DIV_ROUND_CLOSEST(arg, 2) - 1;
+				break;
+			default:
+				ret = -EINVAL;
+				goto err;
+			}
+			/* update drive setting */
+			val = readl(priv->base + pin->dsel_offset);
+			val &= ~(DSEL_MASK << pin->dsel_shift);
+			val |= set_val << pin->dsel_shift;
+			writel(val, priv->base + pin->dsel_offset);
+			break;
+
+		default:
+			ret = -EOPNOTSUPP;
+			goto err;
+		}
+	}
+err:
+	spin_unlock_irqrestore(&priv->lock, flags);
+	return ret;
+}
+
+static int visconti_pin_config_group_set(struct pinctrl_dev *pctldev,
+					unsigned int selector,
+					unsigned long *configs,
+					unsigned int num_configs)
+{
+	struct visconti_pinctrl *priv = pinctrl_dev_get_drvdata(pctldev);
+	const unsigned int *pins;
+	unsigned int num_pins;
+	int i, ret;
+
+	pins = priv->devdata->groups[selector].pins;
+	num_pins = priv->devdata->groups[selector].nr_pins;
+
+	dev_dbg(priv->dev, "%s: select = %d, n_pin = %d, n_config = %d\n",
+		__func__, selector, num_pins, num_configs);
+
+	for (i = 0; i < num_pins; i++) {
+		ret = visconti_pin_config_set(pctldev, pins[i],
+					     configs, num_configs);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+static const struct pinconf_ops visconti_pinconf_ops = {
+	.is_generic			= true,
+	.pin_config_set			= visconti_pin_config_set,
+	.pin_config_group_set		= visconti_pin_config_group_set,
+	.pin_config_config_dbg_show	= pinconf_generic_dump_config,
+};
+
+/* pinctrl */
+static int visconti_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct visconti_pinctrl *priv = pinctrl_dev_get_drvdata(pctldev);
+
+	return priv->devdata->nr_groups;
+}
+
+static const char *visconti_get_group_name(struct pinctrl_dev *pctldev,
+					      unsigned int selector)
+{
+	struct visconti_pinctrl *priv = pinctrl_dev_get_drvdata(pctldev);
+
+	return priv->devdata->groups[selector].name;
+}
+
+static int visconti_get_group_pins(struct pinctrl_dev *pctldev,
+				      unsigned int selector,
+				      const unsigned int **pins,
+				      unsigned int *num_pins)
+{
+	struct visconti_pinctrl *priv = pinctrl_dev_get_drvdata(pctldev);
+
+	*pins = priv->devdata->groups[selector].pins;
+	*num_pins = priv->devdata->groups[selector].nr_pins;
+
+	return 0;
+}
+
+static const struct pinctrl_ops visconti_pinctrl_ops = {
+	.get_groups_count	= visconti_get_groups_count,
+	.get_group_name		= visconti_get_group_name,
+	.get_group_pins		= visconti_get_group_pins,
+	.dt_node_to_map		= pinconf_generic_dt_node_to_map_group,
+	.dt_free_map		= pinctrl_utils_free_map,
+};
+
+/* pinmux */
+static int visconti_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	struct visconti_pinctrl *priv = pinctrl_dev_get_drvdata(pctldev);
+
+	return priv->devdata->nr_functions;
+}
+
+static const char *visconti_get_function_name(struct pinctrl_dev *pctldev,
+					     unsigned int selector)
+{
+	struct visconti_pinctrl *priv = pinctrl_dev_get_drvdata(pctldev);
+
+	return priv->devdata->functions[selector].name;
+}
+
+static int visconti_get_function_groups(struct pinctrl_dev *pctldev,
+				       unsigned int selector,
+				       const char * const **groups,
+				       unsigned * const num_groups)
+{
+	struct visconti_pinctrl *priv = pinctrl_dev_get_drvdata(pctldev);
+
+	*groups = priv->devdata->functions[selector].groups;
+	*num_groups = priv->devdata->functions[selector].nr_groups;
+
+	return 0;
+}
+
+static int visconti_set_mux(struct pinctrl_dev *pctldev,
+			   unsigned int function, unsigned int group)
+{
+	struct visconti_pinctrl *priv = pinctrl_dev_get_drvdata(pctldev);
+	const struct visconti_pin_function *func = &priv->devdata->functions[function];
+	const struct visconti_pin_group *grp = &priv->devdata->groups[group];
+	const struct visconti_mux *mux = &grp->mux;
+	unsigned int val;
+	unsigned long flags;
+
+	dev_dbg(priv->dev, "%s: function = %d(%s) group = %d(%s)\n", __func__,
+		function, func->name, group, grp->name);
+
+	spin_lock_irqsave(&priv->lock, flags);
+
+	/* update mux */
+	val = readl(priv->base + mux->offset);
+	val &= ~mux->mask;
+	val |= mux->val;
+	writel(val, priv->base + mux->offset);
+
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	dev_dbg(priv->dev, "[%x]: 0x%x\n", mux->offset, val);
+
+	return 0;
+}
+
+static const struct pinmux_ops visconti_pinmux_ops = {
+	.get_functions_count	= visconti_get_functions_count,
+	.get_function_name	= visconti_get_function_name,
+	.get_function_groups	= visconti_get_function_groups,
+	.set_mux		= visconti_set_mux,
+	.strict			= true,
+};
+
+int visconti_pinctrl_probe(struct platform_device *pdev,
+			  const struct visconti_pinctrl_devdata *devdata)
+{
+	struct device *dev = &pdev->dev;
+	struct visconti_pinctrl *priv;
+	struct pinctrl_pin_desc *pins;
+	int i, ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->devdata = devdata;
+	spin_lock_init(&priv->lock);
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base)) {
+		dev_err(dev, "unable to map I/O space\n");
+		return PTR_ERR(priv->base);
+	}
+
+	pins = devm_kcalloc(dev, devdata->nr_pins,
+			    sizeof(*pins), GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+
+	for (i = 0; i < devdata->nr_pins; i++)
+		pins[i] = devdata->pins[i].pin;
+
+	priv->pctl_desc.name = dev_name(dev);
+	priv->pctl_desc.owner = THIS_MODULE;
+	priv->pctl_desc.pins = pins;
+	priv->pctl_desc.npins = devdata->nr_pins;
+	priv->pctl_desc.confops = &visconti_pinconf_ops;
+	priv->pctl_desc.pctlops = &visconti_pinctrl_ops;
+	priv->pctl_desc.pmxops = &visconti_pinmux_ops;
+
+	ret = devm_pinctrl_register_and_init(dev, &priv->pctl_desc,
+					     priv, &priv->pctl);
+	if (ret) {
+		dev_err(dev, "couldn't register pinctrl: %d\n", ret);
+		return ret;
+	}
+
+	if (devdata->unlock)
+		devdata->unlock(priv->base);
+
+	return pinctrl_enable(priv->pctl);
+}
diff --git a/drivers/pinctrl/visconti/pinctrl-common.h b/drivers/pinctrl/visconti/pinctrl-common.h
new file mode 100644
index 000000000000..56a2eb0225fb
--- /dev/null
+++ b/drivers/pinctrl/visconti/pinctrl-common.h
@@ -0,0 +1,96 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 TOSHIBA CORPORATION
+ * Copyright (c) 2020 Toshiba Electronic Devices & Storage Corporation
+ * Copyright (c) 2020 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+ */
+
+#ifndef __VISCONTI_PINCTRL_COMMON_H__
+#define __VISCONTI_PINCTRL_COMMON_H__
+
+struct pinctrl_pin_desc;
+
+/* PIN */
+#define VISCONTI_PINS(pins_name, ...)  \
+	static const unsigned int pins_name ## _pins[] = { __VA_ARGS__ }
+
+struct visconti_desc_pin {
+	struct pinctrl_pin_desc pin;
+	unsigned int dsel_offset;
+	unsigned int dsel_shift;
+	unsigned int pude_offset;
+	unsigned int pudsel_offset;
+	unsigned int pud_shift;
+};
+
+#define VISCONTI_PIN(_pin, dsel, d_sh, pude, pudsel, p_sh)	\
+{								\
+	.pin = _pin,						\
+	.dsel_offset = dsel,					\
+	.dsel_shift = d_sh,					\
+	.pude_offset = pude,					\
+	.pudsel_offset = pudsel,				\
+	.pud_shift = p_sh,					\
+}
+
+/* Group */
+#define VISCONTI_GROUPS(groups_name, ...)	\
+	static const char * const groups_name ## _grps[] = { __VA_ARGS__ }
+
+struct visconti_mux {
+	unsigned int offset;
+	unsigned int mask;
+	unsigned int val;
+};
+
+struct visconti_pin_group {
+	const char *name;
+	const unsigned int *pins;
+	unsigned int nr_pins;
+	struct visconti_mux mux;
+};
+
+#define VISCONTI_PIN_GROUP(group_name, off, msk, v)	\
+{							\
+	.name = __stringify(group_name) "_grp",		\
+	.pins = group_name ## _pins,			\
+	.nr_pins = ARRAY_SIZE(group_name ## _pins),	\
+	.mux = {					\
+		.offset = off,				\
+		.mask = msk,				\
+		.val = v,				\
+	}						\
+}
+
+/* MUX */
+struct visconti_pin_function {
+	const char *name;
+	const char * const *groups;
+	unsigned int nr_groups;
+};
+
+#define VISCONTI_PIN_FUNCTION(func)		\
+{						\
+	.name = #func,				\
+	.groups = func ## _grps,		\
+	.nr_groups = ARRAY_SIZE(func ## _grps),	\
+}
+
+/* chip dependent data */
+struct visconti_pinctrl_devdata {
+	const struct visconti_desc_pin *pins;
+	unsigned int nr_pins;
+	const struct visconti_pin_group *groups;
+	unsigned int nr_groups;
+	const struct visconti_pin_function *functions;
+	unsigned int nr_functions;
+
+	const struct visconti_mux *gpio_mux;
+
+	void (*unlock)(void __iomem *base);
+};
+
+int visconti_pinctrl_probe(struct platform_device *pdev,
+			   const struct visconti_pinctrl_devdata *devdata);
+
+#endif /* __VISCONTI_PINCTRL_COMMON_H__ */
diff --git a/drivers/pinctrl/visconti/pinctrl-tmpv7700.c b/drivers/pinctrl/visconti/pinctrl-tmpv7700.c
new file mode 100644
index 000000000000..38a00d514f74
--- /dev/null
+++ b/drivers/pinctrl/visconti/pinctrl-tmpv7700.c
@@ -0,0 +1,355 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 TOSHIBA CORPORATION
+ * Copyright (c) 2020 Toshiba Electronic Devices & Storage Corporation
+ * Copyright (c) 2020 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+ */
+
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+#include "pinctrl-common.h"
+
+#define tmpv7700_MAGIC_NUM 0x4932f70e
+
+/* register offset */
+#define REG_KEY_CTRL	0x0000
+#define REG_KEY_CMD	0x0004
+#define REG_PINMUX1	0x3000
+#define REG_PINMUX2	0x3004
+#define REG_PINMUX3	0x3008
+#define REG_PINMUX4	0x300c
+#define REG_PINMUX5	0x3010
+#define REG_IOSET	0x3014
+#define REG_IO_VSEL	0x3018
+#define REG_IO_DSEL1	0x301c
+#define REG_IO_DSEL2	0x3020
+#define REG_IO_DSEL3	0x3024
+#define REG_IO_DSEL4	0x3028
+#define REG_IO_DSEL5	0x302c
+#define REG_IO_DSEL6	0x3030
+#define REG_IO_DSEL7	0x3034
+#define REG_IO_DSEL8	0x3038
+#define REG_IO_PUDE1	0x303c
+#define REG_IO_PUDE2	0x3040
+#define REG_IO_PUDSEL1	0x3044
+#define REG_IO_PUDSEL2	0x3048
+
+/* PIN */
+static const struct visconti_desc_pin pins_tmpv7700[] = {
+	VISCONTI_PIN(PINCTRL_PIN(0, "gpio0"), REG_IO_DSEL4, 24,
+		    REG_IO_PUDE1, REG_IO_PUDSEL1, 30),
+	VISCONTI_PIN(PINCTRL_PIN(1, "gpio1"), REG_IO_DSEL4, 28,
+		    REG_IO_PUDE1, REG_IO_PUDSEL1, 31),
+	VISCONTI_PIN(PINCTRL_PIN(2, "gpio2"), REG_IO_DSEL5, 0,
+		    REG_IO_PUDE2, REG_IO_PUDSEL2, 0),
+	VISCONTI_PIN(PINCTRL_PIN(3, "gpio3"), REG_IO_DSEL5, 4,
+		    REG_IO_PUDE2, REG_IO_PUDSEL2, 1),
+	VISCONTI_PIN(PINCTRL_PIN(4, "gpio4"), REG_IO_DSEL5, 8,
+		    REG_IO_PUDE2, REG_IO_PUDSEL2, 2),
+	VISCONTI_PIN(PINCTRL_PIN(5, "gpio5"), REG_IO_DSEL5, 12,
+		    REG_IO_PUDE2, REG_IO_PUDSEL2, 3),
+	VISCONTI_PIN(PINCTRL_PIN(6, "gpio6"), REG_IO_DSEL5, 16,
+		    REG_IO_PUDE2, REG_IO_PUDSEL2, 4),
+	VISCONTI_PIN(PINCTRL_PIN(7, "gpio7"), REG_IO_DSEL5, 20,
+		    REG_IO_PUDE2, REG_IO_PUDSEL2, 5),
+	VISCONTI_PIN(PINCTRL_PIN(8, "gpio8"), REG_IO_DSEL5, 24,
+		    REG_IO_PUDE2, REG_IO_PUDSEL2, 6),
+	VISCONTI_PIN(PINCTRL_PIN(9, "gpio9"), REG_IO_DSEL5, 28,
+		    REG_IO_PUDE2, REG_IO_PUDSEL2, 7),
+	VISCONTI_PIN(PINCTRL_PIN(10, "gpio10"), REG_IO_DSEL6, 0,
+		    REG_IO_PUDE2, REG_IO_PUDSEL2, 8),
+	VISCONTI_PIN(PINCTRL_PIN(11, "gpio11"), REG_IO_DSEL6, 4,
+		    REG_IO_PUDE2, REG_IO_PUDSEL2, 9),
+	VISCONTI_PIN(PINCTRL_PIN(12, "gpio12"), REG_IO_DSEL6, 8,
+		    REG_IO_PUDE2, REG_IO_PUDSEL2, 10),
+	VISCONTI_PIN(PINCTRL_PIN(13, "gpio13"), REG_IO_DSEL6, 12,
+		    REG_IO_PUDE2, REG_IO_PUDSEL2, 11),
+	VISCONTI_PIN(PINCTRL_PIN(14, "gpio14"), REG_IO_DSEL6, 16,
+		    REG_IO_PUDE2, REG_IO_PUDSEL2, 12),
+	VISCONTI_PIN(PINCTRL_PIN(15, "gpio15"), REG_IO_DSEL6, 20,
+		    REG_IO_PUDE2, REG_IO_PUDSEL2, 13),
+	VISCONTI_PIN(PINCTRL_PIN(16, "gpio16"), REG_IO_DSEL6, 24,
+		    REG_IO_PUDE2, REG_IO_PUDSEL2, 14),
+	VISCONTI_PIN(PINCTRL_PIN(17, "gpio17"), REG_IO_DSEL6, 28,
+		    REG_IO_PUDE2, REG_IO_PUDSEL2, 15),
+	VISCONTI_PIN(PINCTRL_PIN(18, "gpio18"), REG_IO_DSEL7, 0,
+		    REG_IO_PUDE2, REG_IO_PUDSEL2, 16),
+	VISCONTI_PIN(PINCTRL_PIN(19, "gpio19"), REG_IO_DSEL7, 4,
+		    REG_IO_PUDE2, REG_IO_PUDSEL2, 17),
+	VISCONTI_PIN(PINCTRL_PIN(20, "gpio20"), REG_IO_DSEL7, 8,
+		    REG_IO_PUDE2, REG_IO_PUDSEL2, 18),
+	VISCONTI_PIN(PINCTRL_PIN(21, "gpio21"), REG_IO_DSEL7, 12,
+		    REG_IO_PUDE2, REG_IO_PUDSEL2, 19),
+	VISCONTI_PIN(PINCTRL_PIN(22, "gpio22"), REG_IO_DSEL7, 16,
+		    REG_IO_PUDE2, REG_IO_PUDSEL2, 20),
+	VISCONTI_PIN(PINCTRL_PIN(23, "gpio23"), REG_IO_DSEL7, 20,
+		    REG_IO_PUDE2, REG_IO_PUDSEL2, 21),
+	VISCONTI_PIN(PINCTRL_PIN(24, "gpio24"), REG_IO_DSEL7, 24,
+		    REG_IO_PUDE2, REG_IO_PUDSEL2, 22),
+	VISCONTI_PIN(PINCTRL_PIN(25, "gpio25"), REG_IO_DSEL7, 28,
+		    REG_IO_PUDE2, REG_IO_PUDSEL2, 23),
+	VISCONTI_PIN(PINCTRL_PIN(26, "gpio26"), REG_IO_DSEL8, 0,
+		    REG_IO_PUDE2, REG_IO_PUDSEL2, 24),
+	VISCONTI_PIN(PINCTRL_PIN(27, "gpio27"), REG_IO_DSEL8, 4,
+		    REG_IO_PUDE2, REG_IO_PUDSEL2, 25),
+	VISCONTI_PIN(PINCTRL_PIN(28, "gpio28"), REG_IO_DSEL8, 8,
+		    REG_IO_PUDE2, REG_IO_PUDSEL2, 26),
+	VISCONTI_PIN(PINCTRL_PIN(29, "gpio29"), REG_IO_DSEL4, 8,
+		    REG_IO_PUDE1, REG_IO_PUDSEL1, 26),
+	VISCONTI_PIN(PINCTRL_PIN(30, "gpio30"), REG_IO_DSEL4, 4,
+		    REG_IO_PUDE1, REG_IO_PUDSEL1, 25),
+	VISCONTI_PIN(PINCTRL_PIN(31, "gpio31"), REG_IO_DSEL4, 0,
+		    REG_IO_PUDE1, REG_IO_PUDSEL1, 24),
+	VISCONTI_PIN(PINCTRL_PIN(32, "spi_sck"), REG_IO_DSEL4, 12,
+		    REG_IO_PUDE1, REG_IO_PUDSEL1, 27),
+	VISCONTI_PIN(PINCTRL_PIN(33, "spi_sdo"), REG_IO_DSEL4, 16,
+		    REG_IO_PUDE1, REG_IO_PUDSEL1, 28),
+	VISCONTI_PIN(PINCTRL_PIN(34, "spi_sdi"), REG_IO_DSEL4, 20,
+		    REG_IO_PUDE1, REG_IO_PUDSEL1, 29),
+};
+
+/* Group */
+VISCONTI_PINS(i2c0, 0, 1);
+VISCONTI_PINS(i2c1, 2, 3);
+VISCONTI_PINS(i2c2, 12, 13);
+VISCONTI_PINS(i2c3, 14, 15);
+VISCONTI_PINS(i2c4, 16, 17);
+VISCONTI_PINS(i2c5, 18, 19);
+VISCONTI_PINS(i2c6, 33, 34);
+VISCONTI_PINS(i2c7, 29, 32);
+VISCONTI_PINS(i2c8, 30, 31);
+VISCONTI_PINS(spi0_cs0, 29);
+VISCONTI_PINS(spi0_cs1, 30);
+VISCONTI_PINS(spi0_cs2, 31);
+VISCONTI_PINS(spi1_cs, 3);
+VISCONTI_PINS(spi2_cs, 7);
+VISCONTI_PINS(spi3_cs, 11);
+VISCONTI_PINS(spi4_cs, 15);
+VISCONTI_PINS(spi5_cs, 19);
+VISCONTI_PINS(spi6_cs, 27);
+VISCONTI_PINS(spi0, 32, 33, 34);
+VISCONTI_PINS(spi1, 0, 1, 2);
+VISCONTI_PINS(spi2, 4, 5, 6);
+VISCONTI_PINS(spi3, 8, 9, 10);
+VISCONTI_PINS(spi4, 12, 13, 14);
+VISCONTI_PINS(spi5, 16, 17, 18);
+VISCONTI_PINS(spi6, 24, 25, 26);
+VISCONTI_PINS(uart0, 4, 5, 6, 7);
+VISCONTI_PINS(uart1, 8, 9, 10, 11);
+VISCONTI_PINS(uart2, 12, 13, 14, 15);
+VISCONTI_PINS(uart3, 16, 17, 18, 19);
+VISCONTI_PINS(pwm0_gpio4, 4);
+VISCONTI_PINS(pwm1_gpio5, 5);
+VISCONTI_PINS(pwm2_gpio6, 6);
+VISCONTI_PINS(pwm3_gpio7, 7);
+VISCONTI_PINS(pwm0_gpio8, 8);
+VISCONTI_PINS(pwm1_gpio9, 9);
+VISCONTI_PINS(pwm2_gpio10, 10);
+VISCONTI_PINS(pwm3_gpio11, 11);
+VISCONTI_PINS(pwm0_gpio12, 12);
+VISCONTI_PINS(pwm1_gpio13, 13);
+VISCONTI_PINS(pwm2_gpio14, 14);
+VISCONTI_PINS(pwm3_gpio15, 15);
+VISCONTI_PINS(pwm0_gpio16, 16);
+VISCONTI_PINS(pwm1_gpio17, 17);
+VISCONTI_PINS(pwm2_gpio18, 18);
+VISCONTI_PINS(pwm3_gpio19, 19);
+VISCONTI_PINS(pcmif_out, 20, 21, 22);
+VISCONTI_PINS(pcmif_in, 24, 25, 26);
+
+static const struct visconti_pin_group groups_tmpv7700[] = {
+	VISCONTI_PIN_GROUP(i2c0, REG_PINMUX2, GENMASK(7, 0), 0x00000022),
+	VISCONTI_PIN_GROUP(i2c1, REG_PINMUX2, GENMASK(15, 8), 0x00002200),
+	VISCONTI_PIN_GROUP(i2c2, REG_PINMUX3, GENMASK(23, 16), 0x00770000),
+	VISCONTI_PIN_GROUP(i2c3, REG_PINMUX3, GENMASK(31, 24), 0x77000000),
+	VISCONTI_PIN_GROUP(i2c4, REG_PINMUX4, GENMASK(7, 0), 0x00000077),
+	VISCONTI_PIN_GROUP(i2c5, REG_PINMUX4, GENMASK(15, 8), 0x00007700),
+	VISCONTI_PIN_GROUP(i2c6, REG_PINMUX1, GENMASK(3, 0), 0x0000002),
+	VISCONTI_PIN_GROUP(i2c7, REG_PINMUX5, GENMASK(23, 20), 0x00200000),
+	VISCONTI_PIN_GROUP(i2c8, REG_PINMUX5, GENMASK(31, 24), 0x22000000),
+	VISCONTI_PIN_GROUP(spi0_cs0, REG_PINMUX5, GENMASK(23, 20), 0x00100000),
+	VISCONTI_PIN_GROUP(spi0_cs1, REG_PINMUX5, GENMASK(27, 24), 0x01000000),
+	VISCONTI_PIN_GROUP(spi0_cs2, REG_PINMUX5, GENMASK(31, 28), 0x10000000),
+	VISCONTI_PIN_GROUP(spi1_cs, REG_PINMUX2, GENMASK(15, 12), 0x00001000),
+	VISCONTI_PIN_GROUP(spi2_cs, REG_PINMUX2, GENMASK(31, 28), 0x10000000),
+	VISCONTI_PIN_GROUP(spi3_cs, REG_PINMUX3, GENMASK(15, 12), 0x00001000),
+	VISCONTI_PIN_GROUP(spi4_cs, REG_PINMUX4, GENMASK(31, 28), 0x10000000),
+	VISCONTI_PIN_GROUP(spi5_cs, REG_PINMUX4, GENMASK(15, 12), 0x00001000),
+	VISCONTI_PIN_GROUP(spi6_cs, REG_PINMUX5, GENMASK(15, 12), 0x00001000),
+	VISCONTI_PIN_GROUP(spi0, REG_PINMUX1, GENMASK(3, 0), 0x00000001),
+	VISCONTI_PIN_GROUP(spi1, REG_PINMUX2, GENMASK(11, 0), 0x00000111),
+	VISCONTI_PIN_GROUP(spi2, REG_PINMUX2, GENMASK(27, 16), 0x01110000),
+	VISCONTI_PIN_GROUP(spi3, REG_PINMUX3, GENMASK(11, 0), 0x00000111),
+	VISCONTI_PIN_GROUP(spi4, REG_PINMUX3, GENMASK(27, 16), 0x01110000),
+	VISCONTI_PIN_GROUP(spi5, REG_PINMUX4, GENMASK(11, 0), 0x00000111),
+	VISCONTI_PIN_GROUP(spi6, REG_PINMUX5, GENMASK(11, 0), 0x00000111),
+	VISCONTI_PIN_GROUP(uart0, REG_PINMUX2, GENMASK(31, 16), 0x22220000),
+	VISCONTI_PIN_GROUP(uart1, REG_PINMUX3, GENMASK(15, 0), 0x00002222),
+	VISCONTI_PIN_GROUP(uart2, REG_PINMUX3, GENMASK(31, 16), 0x22220000),
+	VISCONTI_PIN_GROUP(uart3, REG_PINMUX4, GENMASK(15, 0), 0x00002222),
+	VISCONTI_PIN_GROUP(pwm0_gpio4, REG_PINMUX2, GENMASK(19, 16), 0x00050000),
+	VISCONTI_PIN_GROUP(pwm1_gpio5, REG_PINMUX2, GENMASK(23, 20), 0x00500000),
+	VISCONTI_PIN_GROUP(pwm2_gpio6, REG_PINMUX2, GENMASK(27, 24), 0x05000000),
+	VISCONTI_PIN_GROUP(pwm3_gpio7, REG_PINMUX2, GENMASK(31, 28), 0x50000000),
+	VISCONTI_PIN_GROUP(pwm0_gpio8, REG_PINMUX3, GENMASK(3, 0), 0x00000005),
+	VISCONTI_PIN_GROUP(pwm1_gpio9, REG_PINMUX3, GENMASK(7, 4), 0x00000050),
+	VISCONTI_PIN_GROUP(pwm2_gpio10, REG_PINMUX3, GENMASK(11, 8), 0x00000500),
+	VISCONTI_PIN_GROUP(pwm3_gpio11, REG_PINMUX3, GENMASK(15, 12), 0x00005000),
+	VISCONTI_PIN_GROUP(pwm0_gpio12, REG_PINMUX3, GENMASK(19, 16), 0x00050000),
+	VISCONTI_PIN_GROUP(pwm1_gpio13, REG_PINMUX3, GENMASK(23, 20), 0x00500000),
+	VISCONTI_PIN_GROUP(pwm2_gpio14, REG_PINMUX3, GENMASK(27, 24), 0x05000000),
+	VISCONTI_PIN_GROUP(pwm3_gpio15, REG_PINMUX3, GENMASK(31, 28), 0x50000000),
+	VISCONTI_PIN_GROUP(pwm0_gpio16, REG_PINMUX4, GENMASK(3, 0), 0x00000005),
+	VISCONTI_PIN_GROUP(pwm1_gpio17, REG_PINMUX4, GENMASK(7, 4), 0x00000050),
+	VISCONTI_PIN_GROUP(pwm2_gpio18, REG_PINMUX4, GENMASK(11, 8), 0x00000500),
+	VISCONTI_PIN_GROUP(pwm3_gpio19, REG_PINMUX4, GENMASK(15, 12), 0x00005000),
+	VISCONTI_PIN_GROUP(pcmif_out, REG_PINMUX4, GENMASK(27, 16), 0x01110000),
+	VISCONTI_PIN_GROUP(pcmif_in, REG_PINMUX5, GENMASK(11, 0), 0x00000222),
+};
+
+/* MUX */
+VISCONTI_GROUPS(i2c0, "i2c0_grp");
+VISCONTI_GROUPS(i2c1, "i2c1_grp");
+VISCONTI_GROUPS(i2c2, "i2c2_grp");
+VISCONTI_GROUPS(i2c3, "i2c3_grp");
+VISCONTI_GROUPS(i2c4, "i2c4_grp");
+VISCONTI_GROUPS(i2c5, "i2c5_grp");
+VISCONTI_GROUPS(i2c6, "i2c6_grp");
+VISCONTI_GROUPS(i2c7, "i2c7_grp");
+VISCONTI_GROUPS(i2c8, "i2c8_grp");
+VISCONTI_GROUPS(spi0, "spi0_grp", "spi0_cs0_grp",
+		"spi0_cs1_grp", "spi0_cs2_grp");
+VISCONTI_GROUPS(spi1, "spi1_grp", "spi1_cs_grp");
+VISCONTI_GROUPS(spi2, "spi2_grp", "spi2_cs_grp");
+VISCONTI_GROUPS(spi3, "spi3_grp", "spi3_cs_grp");
+VISCONTI_GROUPS(spi4, "spi4_grp", "spi4_cs_grp");
+VISCONTI_GROUPS(spi5, "spi5_grp", "spi5_cs_grp");
+VISCONTI_GROUPS(spi6, "spi6_grp", "spi6_cs_grp");
+VISCONTI_GROUPS(uart0, "uart0_grp");
+VISCONTI_GROUPS(uart1, "uart1_grp");
+VISCONTI_GROUPS(uart2, "uart2_grp");
+VISCONTI_GROUPS(uart3, "uart3_grp");
+VISCONTI_GROUPS(pwm, "pwm0_gpio4_grp", "pwm0_gpio8_grp",
+		"pwm0_gpio12_grp", "pwm0_gpio16_grp",
+		"pwm1_gpio5_grp", "pwm1_gpio9_grp",
+		"pwm1_gpio13_grp", "pwm1_gpio17_grp",
+		"pwm2_gpio6_grp", "pwm2_gpio10_grp",
+		"pwm2_gpio14_grp", "pwm2_gpio18_grp",
+		"pwm3_gpio7_grp", "pwm3_gpio11_grp",
+		"pwm3_gpio15_grp", "pwm3_gpio19_grp");
+VISCONTI_GROUPS(pcmif_out, "pcmif_out_grp");
+VISCONTI_GROUPS(pcmif_in, "pcmif_in_grp");
+
+static const struct visconti_pin_function functions_tmpv7700[] = {
+	VISCONTI_PIN_FUNCTION(i2c0),
+	VISCONTI_PIN_FUNCTION(i2c1),
+	VISCONTI_PIN_FUNCTION(i2c2),
+	VISCONTI_PIN_FUNCTION(i2c3),
+	VISCONTI_PIN_FUNCTION(i2c4),
+	VISCONTI_PIN_FUNCTION(i2c5),
+	VISCONTI_PIN_FUNCTION(i2c6),
+	VISCONTI_PIN_FUNCTION(i2c7),
+	VISCONTI_PIN_FUNCTION(i2c8),
+	VISCONTI_PIN_FUNCTION(spi0),
+	VISCONTI_PIN_FUNCTION(spi1),
+	VISCONTI_PIN_FUNCTION(spi2),
+	VISCONTI_PIN_FUNCTION(spi3),
+	VISCONTI_PIN_FUNCTION(spi4),
+	VISCONTI_PIN_FUNCTION(spi5),
+	VISCONTI_PIN_FUNCTION(spi6),
+	VISCONTI_PIN_FUNCTION(uart0),
+	VISCONTI_PIN_FUNCTION(uart1),
+	VISCONTI_PIN_FUNCTION(uart2),
+	VISCONTI_PIN_FUNCTION(uart3),
+	VISCONTI_PIN_FUNCTION(pwm),
+	VISCONTI_PIN_FUNCTION(pcmif_in),
+	VISCONTI_PIN_FUNCTION(pcmif_out),
+};
+
+/* GPIO MUX */
+#define tmpv7700_GPIO_MUX(off, msk)	\
+{					\
+	.offset = off,			\
+	.mask = msk,			\
+	.val = 0,			\
+}
+
+static const struct visconti_mux gpio_mux_tmpv7700[] = {
+	tmpv7700_GPIO_MUX(REG_PINMUX2, GENMASK(3, 0)),
+	tmpv7700_GPIO_MUX(REG_PINMUX2, GENMASK(7, 4)),
+	tmpv7700_GPIO_MUX(REG_PINMUX2, GENMASK(11, 8)),
+	tmpv7700_GPIO_MUX(REG_PINMUX2, GENMASK(15, 12)),
+	tmpv7700_GPIO_MUX(REG_PINMUX2, GENMASK(19, 16)),
+	tmpv7700_GPIO_MUX(REG_PINMUX2, GENMASK(23, 20)),
+	tmpv7700_GPIO_MUX(REG_PINMUX2, GENMASK(27, 24)),
+	tmpv7700_GPIO_MUX(REG_PINMUX2, GENMASK(31, 28)),
+	tmpv7700_GPIO_MUX(REG_PINMUX3, GENMASK(3, 0)),
+	tmpv7700_GPIO_MUX(REG_PINMUX3, GENMASK(7, 4)),
+	tmpv7700_GPIO_MUX(REG_PINMUX3, GENMASK(11, 8)),
+	tmpv7700_GPIO_MUX(REG_PINMUX3, GENMASK(15, 12)),
+	tmpv7700_GPIO_MUX(REG_PINMUX3, GENMASK(19, 16)),
+	tmpv7700_GPIO_MUX(REG_PINMUX3, GENMASK(23, 20)),
+	tmpv7700_GPIO_MUX(REG_PINMUX3, GENMASK(27, 24)),
+	tmpv7700_GPIO_MUX(REG_PINMUX3, GENMASK(31, 28)),
+	tmpv7700_GPIO_MUX(REG_PINMUX4, GENMASK(3, 0)),
+	tmpv7700_GPIO_MUX(REG_PINMUX4, GENMASK(7, 4)),
+	tmpv7700_GPIO_MUX(REG_PINMUX4, GENMASK(11, 8)),
+	tmpv7700_GPIO_MUX(REG_PINMUX4, GENMASK(15, 12)),
+	tmpv7700_GPIO_MUX(REG_PINMUX4, GENMASK(19, 16)),
+	tmpv7700_GPIO_MUX(REG_PINMUX4, GENMASK(23, 20)),
+	tmpv7700_GPIO_MUX(REG_PINMUX4, GENMASK(27, 24)),
+	tmpv7700_GPIO_MUX(REG_PINMUX4, GENMASK(31, 28)),
+	tmpv7700_GPIO_MUX(REG_PINMUX5, GENMASK(3, 0)),
+	tmpv7700_GPIO_MUX(REG_PINMUX5, GENMASK(7, 4)),
+	tmpv7700_GPIO_MUX(REG_PINMUX5, GENMASK(11, 8)),
+	tmpv7700_GPIO_MUX(REG_PINMUX5, GENMASK(15, 12)),
+	tmpv7700_GPIO_MUX(REG_PINMUX5, GENMASK(19, 16)),
+	tmpv7700_GPIO_MUX(REG_PINMUX5, GENMASK(23, 20)),
+	tmpv7700_GPIO_MUX(REG_PINMUX5, GENMASK(27, 24)),
+	tmpv7700_GPIO_MUX(REG_PINMUX5, GENMASK(31, 28)),
+};
+
+static void tmpv7700_pinctrl_unlock(void __iomem *base)
+{
+	writel(1, base + REG_KEY_CTRL);
+	writel(tmpv7700_MAGIC_NUM, base + REG_KEY_CMD);
+}
+
+/* chip dependent data */
+static const struct visconti_pinctrl_devdata tmpv7700_pinctrl_data = {
+	.pins = pins_tmpv7700,
+	.nr_pins = ARRAY_SIZE(pins_tmpv7700),
+	.groups = groups_tmpv7700,
+	.nr_groups = ARRAY_SIZE(groups_tmpv7700),
+	.functions = functions_tmpv7700,
+	.nr_functions = ARRAY_SIZE(functions_tmpv7700),
+	.gpio_mux = gpio_mux_tmpv7700,
+	.unlock = tmpv7700_pinctrl_unlock,
+};
+
+static int tmpv7700_pinctrl_probe(struct platform_device *pdev)
+{
+	return visconti_pinctrl_probe(pdev, &tmpv7700_pinctrl_data);
+}
+
+static const struct of_device_id tmpv7700_pctrl_of_match[] = {
+	{ .compatible = "toshiba,tmpv7708-pinctrl", },
+	{},
+};
+
+static struct platform_driver tmpv7700_pinctrl_driver = {
+	.probe = tmpv7700_pinctrl_probe,
+	.driver = {
+		.name = "tmpv7700-pinctrl",
+		.of_match_table = tmpv7700_pctrl_of_match,
+	},
+};
+
+static int __init tmpv7700_pinctrl_init(void)
+{
+	return platform_driver_register(&tmpv7700_pinctrl_driver);
+}
+arch_initcall(tmpv7700_pinctrl_init);
-- 
2.27.0

