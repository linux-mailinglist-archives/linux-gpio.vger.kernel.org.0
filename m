Return-Path: <linux-gpio+bounces-31651-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wK/rHHTejmlSFgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31651-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 09:19:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F939133EAF
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 09:19:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC64230CAE4A
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 08:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB5E31D39A;
	Fri, 13 Feb 2026 08:18:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE2F31E0EB;
	Fri, 13 Feb 2026 08:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770970691; cv=none; b=V2KVeVjWpR3x/2VZiKrO2EJGWxrtnuBIhbVyf90CpExLsPqMvY4jB5GWmqfJBDsSKwCQyrMmSElebC+Dti2F0jrPLvvbezacE23WO79Pog6ZO42XK4S7bstiQJT6/rjRYsdK8L4c2jpBCVFndeGoUa+DVYbZDP0eT4Ri4GCBc8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770970691; c=relaxed/simple;
	bh=x34CwRDps5hRNuSH3yeJ1AdDZ44/2EIE/QI4SaohkYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HUSiKNw5sckxXkMtjDAkVtV8DUpS4g3W+qR2HfGSoDSGMAFdGih2vjA3ChkZ3bNkxT3+HewlKCUOmjkKoQD9k3omchGcG500bSjMKXjuE7UZahi6X1ypXlxO6SMyuolWi4e91XRKG7+VdY+xV7GLsm7SE1U0Jz+dPP3pMBZjUKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 13 Feb
 2026 16:17:55 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Feb 2026 16:17:55 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Fri, 13 Feb 2026 16:17:43 +0800
Subject: [PATCH RFC 2/2] pinctrl: add syscon-backed packed-field pin
 controller driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260213-pinctrl-single-bit-v1-2-c60f2fb80efb@aspeedtech.com>
References: <20260213-pinctrl-single-bit-v1-0-c60f2fb80efb@aspeedtech.com>
In-Reply-To: <20260213-pinctrl-single-bit-v1-0-c60f2fb80efb@aspeedtech.com>
To: Linus Walleij <linusw@kernel.org>, Tony Lindgren <tony@atomide.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>
CC: <patrickw3@meta.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<BMC-SW@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770970675; l=35175;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=x34CwRDps5hRNuSH3yeJ1AdDZ44/2EIE/QI4SaohkYM=;
 b=XErTtKtgMuGBkdkoOuIhvm2ITwM9IjXPMURcEML7XCdd6j7W6UpD64NYbHPuIrdgX+ew6Vl4g
 KMabIRqUbjlBJbSU/ZOLbxS91jeWtBhqxQLugx3Fc0/CcBYpo+dpRnP
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31651-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 2F939133EAF
X-Rspamd-Action: no action

Introduce a new pinctrl driver for controllers where pinmux and/or pin
configuration fields are represented as fixed-width packed fields within
shared registers.

The driver is designed to be used as a child of a syscon node and
obtains a regmap from the parent, avoiding direct MMIO ownership and
allowing shared access to SCU-style register blocks.

This driver is derived from pinctrl-single but reworked as a standalone
implementation focused on packed-field controllers.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/pinctrl/Kconfig          |   13 +
 drivers/pinctrl/Makefile         |    1 +
 drivers/pinctrl/pinctrl-packed.c | 1168 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 1182 insertions(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 7b9f792acb0e..d1fd6a2e767c 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -443,6 +443,19 @@ config PINCTRL_OCELOT
 
 	  If conpiled as a module, the module name will be pinctrl-ocelot.
 
+config PINCTRL_PACKED
+	tristate "Packed-field type device tree based pinctrl driver"
+	depends on OF
+	depends on HAS_IOMEM
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
+	select GENERIC_PINCONF
+	help
+	  This selects the device tree based generic pinctrl driver with
+	  fixed-width packed-field register layout.
+	  The driver is derived from pinctrl-single but reworked as a standalone
+	  implementation focused on packed-field controllers.
+
 config PINCTRL_PALMAS
 	tristate "Pinctrl driver for the PALMAS Series MFD devices"
 	depends on OF && MFD_PALMAS
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index be5200c23e60..fd71da9901b9 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -45,6 +45,7 @@ obj-$(CONFIG_PINCTRL_MCP23S08)	+= pinctrl-mcp23s08.o
 obj-$(CONFIG_PINCTRL_MICROCHIP_SGPIO)	+= pinctrl-microchip-sgpio.o
 obj-$(CONFIG_PINCTRL_MLXBF3)	+= pinctrl-mlxbf3.o
 obj-$(CONFIG_PINCTRL_OCELOT)	+= pinctrl-ocelot.o
+obj-$(CONFIG_PINCTRL_PACKED)	+= pinctrl-packed.o
 obj-$(CONFIG_PINCTRL_PALMAS)	+= pinctrl-palmas.o
 obj-$(CONFIG_PINCTRL_PEF2256)	+= pinctrl-pef2256.o
 obj-$(CONFIG_PINCTRL_PIC32)	+= pinctrl-pic32.o
diff --git a/drivers/pinctrl/pinctrl-packed.c b/drivers/pinctrl/pinctrl-packed.c
new file mode 100644
index 000000000000..cfb43894cfaa
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-packed.c
@@ -0,0 +1,1168 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Generic device tree based pinctrl driver for fixed-width
+ * packed-field pin controllers
+ *
+ * Copyright (C) 2026 ASPEED Technology Inc.
+ *
+ * This driver targets controllers where pinmux and/or pinconf fields
+ * are arranged as fixed-width fields packed sequentially within
+ * shared registers.
+ *
+ * Derived from drivers/pinctrl/pinctrl-single.c
+ *
+ * Original author:
+ *   Tony Lindgren <tony@atomide.com>
+ *
+ * Reworked for packed-field / syscon-based pin controllers:
+ *   Billy Tsai <billy_tsai@aspeedtech.com>
+ */
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/list.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+
+#include "core.h"
+#include "devicetree.h"
+#include "pinconf.h"
+#include "pinmux.h"
+
+#define DRIVER_NAME			"pinctrl-packed"
+
+/**
+ * struct pcp_func_vals - mux function register offset and value pair
+ * @reg:	register offset
+ * @val:	register value
+ * @mask:	mask
+ */
+struct pcp_func_vals {
+	unsigned int reg;
+	unsigned int val;
+	unsigned int mask;
+};
+
+/**
+ * struct pcp_conf_vals - pinconf parameter, pinconf register offset
+ * and value, enable, disable, mask
+ * @param:	config parameter
+ * @val:	user input bits in the pinconf register
+ * @enable:	enable bits in the pinconf register
+ * @disable:	disable bits in the pinconf register
+ * @mask:	mask bits in the register value
+ */
+struct pcp_conf_vals {
+	enum pin_config_param param;
+	unsigned int val;
+	unsigned int enable;
+	unsigned int disable;
+	unsigned int mask;
+};
+
+/**
+ * struct pcp_conf_type - pinconf property name, pinconf param pair
+ * @name:	property name in DTS file
+ * @param:	config parameter
+ */
+struct pcp_conf_type {
+	const char *name;
+	enum pin_config_param param;
+};
+
+/**
+ * struct pcp_function - pinctrl function
+ * @name:	pinctrl function name
+ * @vals:	register and vals array
+ * @nvals:	number of entries in vals array
+ * @conf:	array of pin configurations
+ * @nconfs:	number of pin configurations available
+ * @node:	list node
+ */
+struct pcp_function {
+	const char *name;
+	struct pcp_func_vals *vals;
+	unsigned int nvals;
+	struct pcp_conf_vals *conf;
+	int nconfs;
+	struct list_head node;
+};
+
+/**
+ * struct pcp_gpiofunc_range - pin ranges with same mux value of gpio function
+ * @offset:	offset base of pins
+ * @npins:	number pins with the same mux value of gpio function
+ * @gpiofunc:	mux value of gpio function
+ * @node:	list node
+ */
+struct pcp_gpiofunc_range {
+	unsigned int offset;
+	unsigned int npins;
+	unsigned int gpiofunc;
+	struct list_head node;
+};
+
+/**
+ * struct pcp_data - wrapper for data needed by pinctrl framework
+ * @pa:		pindesc array
+ * @cur:	index to current element
+ *
+ * REVISIT: We should be able to drop this eventually by adding
+ * support for registering pins individually in the pinctrl
+ * framework for those drivers that don't need a static array.
+ */
+struct pcp_data {
+	struct pinctrl_pin_desc *pa;
+	int cur;
+};
+
+/**
+ * struct pcp_soc_data - SoC specific settings
+ * @flags:	initial SoC specific PCP_FEAT_xxx values
+ */
+struct pcp_soc_data {
+	unsigned int flags;
+};
+
+/**
+ * struct pcp_device - pinctrl device instance
+ * @regmap:	regmap for the controller
+ * @base_offset: offset from the regmap base
+ * @size:	size of the area
+ * @dev:	device entry
+ * @np:		device tree node
+ * @pctl:	pin controller device
+ * @flags:	mask of PCP_FEAT_xxx values
+ * @mutex:	mutex protecting the lists
+ * @width:	bits per mux register
+ * @fmask:	function register mask
+ * @bits_per_pin: number of bits per pin
+ * @pins:	physical pins on the SoC
+ * @gpiofuncs:	list of gpio functions
+ * @desc:	pin controller descriptor
+ */
+struct pcp_device {
+	struct regmap *regmap;
+	unsigned int base_offset;
+	unsigned int size;
+	struct device *dev;
+	struct device_node *np;
+	struct pinctrl_dev *pctl;
+	unsigned int flags;
+#define PCP_FEAT_PINCONF	(1 << 0)
+	struct mutex mutex;
+	unsigned int width;
+	unsigned int fmask;
+	unsigned int bits_per_pin;
+	struct pcp_data pins;
+	struct list_head gpiofuncs;
+	struct pinctrl_desc desc;
+};
+
+#define PCP_HAS_PINCONF		(pcp->flags & PCP_FEAT_PINCONF)
+
+static int pcp_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
+			   unsigned long *config);
+static int pcp_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
+			   unsigned long *configs, unsigned int num_configs);
+
+static enum pin_config_param pcp_bias[] = {
+	PIN_CONFIG_BIAS_PULL_DOWN,
+	PIN_CONFIG_BIAS_PULL_UP,
+};
+
+static inline void pcp_writel(unsigned int val, struct pcp_device *pcp,
+			      unsigned int reg)
+{
+	regmap_write(pcp->regmap, reg, val);
+}
+
+static inline unsigned int pcp_readl(struct pcp_device *pcp, unsigned int reg)
+{
+	unsigned int val;
+
+	regmap_read(pcp->regmap, reg, &val);
+	return val;
+}
+
+static unsigned int pcp_pin_reg_offset_get(struct pcp_device *pcp,
+					   unsigned int pin)
+{
+	unsigned int mux_bytes = pcp->width / BITS_PER_BYTE;
+	unsigned int pin_offset_bytes;
+
+	pin_offset_bytes = (pcp->bits_per_pin * pin) / BITS_PER_BYTE;
+	return (pin_offset_bytes / mux_bytes) * mux_bytes;
+}
+
+static unsigned int pcp_pin_shift_reg_get(struct pcp_device *pcp,
+					  unsigned int pin)
+{
+	return (pin % (pcp->width / pcp->bits_per_pin)) * pcp->bits_per_pin;
+}
+
+static void pcp_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
+			     unsigned int pin)
+{
+	unsigned int val, offset;
+	struct pcp_device *pcp;
+
+	pcp = pinctrl_dev_get_drvdata(pctldev);
+
+	offset = pcp_pin_reg_offset_get(pcp, pin);
+	val = pcp_readl(pcp, pcp->base_offset + offset);
+
+	val &= pcp->fmask << pcp_pin_shift_reg_get(pcp, pin);
+
+	seq_printf(s, "%08x %08x %s ", pcp->base_offset + offset, val, DRIVER_NAME);
+}
+
+static void pcp_dt_free_map(struct pinctrl_dev *pctldev, struct pinctrl_map *map,
+			    unsigned int num_maps)
+{
+	struct pcp_device *pcp;
+
+	pcp = pinctrl_dev_get_drvdata(pctldev);
+	devm_kfree(pcp->dev, map);
+}
+
+static int pcp_dt_node_to_map(struct pinctrl_dev *pctldev,
+			      struct device_node *np_config,
+			      struct pinctrl_map **map, unsigned int *num_maps);
+
+static const struct pinctrl_ops pcp_pinctrl_ops = {
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name = pinctrl_generic_get_group_name,
+	.get_group_pins = pinctrl_generic_get_group_pins,
+	.pin_dbg_show = pcp_pin_dbg_show,
+	.dt_node_to_map = pcp_dt_node_to_map,
+	.dt_free_map = pcp_dt_free_map,
+};
+
+static int pcp_get_function(struct pinctrl_dev *pctldev, unsigned int pin,
+			    struct pcp_function **func)
+{
+	struct pcp_device *pcp = pinctrl_dev_get_drvdata(pctldev);
+	struct pin_desc *pdesc = pin_desc_get(pctldev, pin);
+	const struct pinctrl_setting_mux *setting;
+	const struct function_desc *function;
+	unsigned int fselector;
+
+	/* If pin is not described in DTS & enabled, mux_setting is NULL. */
+	setting = pdesc->mux_setting;
+	if (!setting)
+		return -EOPNOTSUPP;
+	fselector = setting->func;
+	function = pinmux_generic_get_function(pctldev, fselector);
+	if (!function)
+		return -EINVAL;
+	*func = function->data;
+	if (!(*func)) {
+		dev_err(pcp->dev, "%s could not find function%i\n",
+			__func__, fselector);
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static int pcp_set_mux(struct pinctrl_dev *pctldev, unsigned int fselector,
+		       unsigned int group)
+{
+	const struct function_desc *function;
+	struct pcp_function *func;
+	struct pcp_device *pcp;
+	int i;
+
+	pcp = pinctrl_dev_get_drvdata(pctldev);
+	/* If function mask is null, needn't enable it. */
+	if (!pcp->fmask)
+		return 0;
+	function = pinmux_generic_get_function(pctldev, fselector);
+	if (!function)
+		return -EINVAL;
+	func = function->data;
+	if (!func)
+		return -EINVAL;
+
+	dev_dbg(pcp->dev, "enabling %s function%i\n",
+		func->name, fselector);
+
+	for (i = 0; i < func->nvals; i++) {
+		struct pcp_func_vals *vals;
+
+		vals = &func->vals[i];
+		regmap_update_bits(pcp->regmap, vals->reg, vals->mask, vals->val);
+	}
+
+	return 0;
+}
+
+static int pcp_request_gpio(struct pinctrl_dev *pctldev,
+			    struct pinctrl_gpio_range *range, unsigned int pin)
+{
+	struct pcp_device *pcp = pinctrl_dev_get_drvdata(pctldev);
+	struct pcp_gpiofunc_range *frange = NULL;
+	struct list_head *pos, *tmp;
+	int pin_shift;
+
+	/* If function mask is null, return directly. */
+	if (!pcp->fmask)
+		return -EOPNOTSUPP;
+
+	list_for_each_safe(pos, tmp, &pcp->gpiofuncs) {
+		u32 offset;
+
+		frange = list_entry(pos, struct pcp_gpiofunc_range, node);
+		if (pin >= frange->offset + frange->npins
+			|| pin < frange->offset)
+			continue;
+
+		offset = pcp_pin_reg_offset_get(pcp, pin);
+
+		pin_shift = pcp_pin_shift_reg_get(pcp, pin);
+
+		regmap_update_bits(pcp->regmap, pcp->base_offset + offset,
+					pcp->fmask << pin_shift,
+					frange->gpiofunc << pin_shift);
+		break;
+	}
+	return 0;
+}
+
+static const struct pinmux_ops pcp_pinmux_ops = {
+	.get_functions_count = pinmux_generic_get_function_count,
+	.get_function_name = pinmux_generic_get_function_name,
+	.get_function_groups = pinmux_generic_get_function_groups,
+	.set_mux = pcp_set_mux,
+	.gpio_request_enable = pcp_request_gpio,
+};
+
+/* Clear BIAS value */
+static void pcp_pinconf_clear_bias(struct pinctrl_dev *pctldev, unsigned int pin)
+{
+	unsigned long config;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pcp_bias); i++) {
+		config = pinconf_to_config_packed(pcp_bias[i], 0);
+		pcp_pinconf_set(pctldev, pin, &config, 1);
+	}
+}
+
+/*
+ * Check whether PIN_CONFIG_BIAS_DISABLE is valid.
+ * It's depend on that PULL_DOWN & PULL_UP configs are all invalid.
+ */
+static bool pcp_pinconf_bias_disable(struct pinctrl_dev *pctldev, unsigned int pin)
+{
+	unsigned long config;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pcp_bias); i++) {
+		config = pinconf_to_config_packed(pcp_bias[i], 0);
+		if (!pcp_pinconf_get(pctldev, pin, &config))
+			return false;
+	}
+	return true;
+}
+
+static int pcp_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
+			   unsigned long *config)
+{
+	struct pcp_device *pcp = pinctrl_dev_get_drvdata(pctldev);
+	unsigned int offset, data, i, j;
+	enum pin_config_param param;
+	struct pcp_function *func;
+	int ret;
+
+	offset = 0;
+	data = 0;
+	ret = pcp_get_function(pctldev, pin, &func);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < func->nconfs; i++) {
+		param = pinconf_to_config_param(*config);
+		if (param == PIN_CONFIG_BIAS_DISABLE) {
+			if (pcp_pinconf_bias_disable(pctldev, pin)) {
+				*config = 0;
+				return 0;
+			} else {
+				return -EOPNOTSUPP;
+			}
+		} else if (param != func->conf[i].param) {
+			continue;
+		}
+
+		offset = pcp_pin_reg_offset_get(pcp, pin);
+		data = pcp_readl(pcp, pcp->base_offset + offset) & func->conf[i].mask;
+		switch (func->conf[i].param) {
+		/* 4 parameters */
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+		case PIN_CONFIG_BIAS_PULL_UP:
+		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+			if ((data != func->conf[i].enable) ||
+			    (data == func->conf[i].disable))
+				return -EOPNOTSUPP;
+			*config = 0;
+			break;
+		/* 2 parameters */
+		case PIN_CONFIG_INPUT_SCHMITT:
+			for (j = 0; j < func->nconfs; j++) {
+				switch (func->conf[j].param) {
+				case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+					if (data != func->conf[j].enable)
+						return -EOPNOTSUPP;
+					break;
+				default:
+					break;
+				}
+			}
+			*config = data;
+			break;
+		case PIN_CONFIG_DRIVE_STRENGTH:
+		case PIN_CONFIG_SLEW_RATE:
+		case PIN_CONFIG_MODE_LOW_POWER:
+		case PIN_CONFIG_INPUT_ENABLE:
+		default:
+			*config = data;
+			break;
+		}
+		return 0;
+	}
+	return -EOPNOTSUPP;
+}
+
+static int pcp_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
+			   unsigned long *configs, unsigned int num_configs)
+{
+	struct pcp_device *pcp = pinctrl_dev_get_drvdata(pctldev);
+	unsigned int offset, shift, i, data;
+	enum pin_config_param param;
+	struct pcp_function *func;
+	int j, ret;
+	u32 arg;
+
+	offset = 0;
+	shift = 0;
+	ret = pcp_get_function(pctldev, pin, &func);
+	if (ret)
+		return ret;
+
+	for (j = 0; j < num_configs; j++) {
+		param = pinconf_to_config_param(configs[j]);
+
+		/* BIAS_DISABLE has no entry in the func->conf table */
+		if (param == PIN_CONFIG_BIAS_DISABLE) {
+			/* This just disables all bias entries */
+			pcp_pinconf_clear_bias(pctldev, pin);
+			continue;
+		}
+
+		for (i = 0; i < func->nconfs; i++) {
+			if (param != func->conf[i].param)
+				continue;
+
+			/* Use the same offset mapping as pinmux (handles bit-per-mux) */
+			offset = pcp_pin_reg_offset_get(pcp, pin);
+			data = pcp_readl(pcp, pcp->base_offset + offset);
+			arg = pinconf_to_config_argument(configs[j]);
+			switch (param) {
+			/* 2 parameters */
+			case PIN_CONFIG_INPUT_SCHMITT:
+			case PIN_CONFIG_DRIVE_STRENGTH:
+			case PIN_CONFIG_SLEW_RATE:
+			case PIN_CONFIG_MODE_LOW_POWER:
+			case PIN_CONFIG_INPUT_ENABLE:
+				shift = ffs(func->conf[i].mask) - 1;
+				data &= ~func->conf[i].mask;
+				data |= (arg << shift) & func->conf[i].mask;
+				break;
+			/* 4 parameters */
+			case PIN_CONFIG_BIAS_PULL_DOWN:
+			case PIN_CONFIG_BIAS_PULL_UP:
+				if (arg) {
+					pcp_pinconf_clear_bias(pctldev, pin);
+					data = pcp_readl(pcp, pcp->base_offset + offset);
+				}
+				fallthrough;
+			case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+				data &= ~func->conf[i].mask;
+				if (arg)
+					data |= func->conf[i].enable;
+				else
+					data |= func->conf[i].disable;
+				break;
+			default:
+				return -EOPNOTSUPP;
+			}
+			pcp_writel(data, pcp, pcp->base_offset + offset);
+
+			break;
+		}
+		if (i >= func->nconfs)
+			return -EOPNOTSUPP;
+	} /* for each config */
+
+	return 0;
+}
+
+static int pcp_pinconf_group_get(struct pinctrl_dev *pctldev,
+				 unsigned int group, unsigned long *config)
+{
+	const unsigned int *pins;
+	unsigned int npins, old;
+	int i, ret;
+
+	old = 0;
+	ret = pinctrl_generic_get_group_pins(pctldev, group, &pins, &npins);
+	if (ret)
+		return ret;
+	for (i = 0; i < npins; i++) {
+		if (pcp_pinconf_get(pctldev, pins[i], config))
+			return -EOPNOTSUPP;
+		/* configs do not match between two pins */
+		if (i && (old != *config))
+			return -EOPNOTSUPP;
+		old = *config;
+	}
+	return 0;
+}
+
+static int pcp_pinconf_group_set(struct pinctrl_dev *pctldev, unsigned int group,
+				 unsigned long *configs, unsigned int num_configs)
+{
+	const unsigned int *pins;
+	unsigned int npins;
+	int i, ret;
+
+	ret = pinctrl_generic_get_group_pins(pctldev, group, &pins, &npins);
+	if (ret)
+		return ret;
+	for (i = 0; i < npins; i++) {
+		if (pcp_pinconf_set(pctldev, pins[i], configs, num_configs))
+			return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static void pcp_pinconf_config_dbg_show(struct pinctrl_dev *pctldev,
+					struct seq_file *s, unsigned long config)
+{
+	pinconf_generic_dump_config(pctldev, s, config);
+}
+
+static const struct pinconf_ops pcp_pinconf_ops = {
+	.pin_config_get = pcp_pinconf_get,
+	.pin_config_set = pcp_pinconf_set,
+	.pin_config_group_get = pcp_pinconf_group_get,
+	.pin_config_group_set = pcp_pinconf_group_set,
+	.pin_config_config_dbg_show = pcp_pinconf_config_dbg_show,
+	.is_generic = true,
+};
+
+/**
+ * pcp_add_pin() - add a pin to the static per controller pin array
+ * @pcp: pcp driver instance
+ * @offset: register offset from base
+ */
+static int pcp_add_pin(struct pcp_device *pcp, unsigned int offset)
+{
+	struct pinctrl_pin_desc *pin;
+	int i;
+
+	i = pcp->pins.cur;
+	if (i >= pcp->desc.npins) {
+		dev_err(pcp->dev, "too many pins, max %i\n",
+			pcp->desc.npins);
+		return -ENOMEM;
+	}
+
+	pin = &pcp->pins.pa[i];
+	pin->number = i;
+	pcp->pins.cur++;
+
+	return i;
+}
+
+/**
+ * pcp_allocate_pin_table() - adds all the pins for the pinctrl driver
+ * @pcp: pcp driver instance
+ *
+ * If your hardware needs holes in the address space, then just set
+ * up multiple driver instances.
+ */
+static int pcp_allocate_pin_table(struct pcp_device *pcp)
+{
+	int nr_pins, i;
+
+	if (!pcp->fmask) {
+		dev_err(pcp->dev, "invalid function mask\n");
+		return -EINVAL;
+	}
+	pcp->bits_per_pin = fls(pcp->fmask);
+	nr_pins = (pcp->size * BITS_PER_BYTE) / pcp->bits_per_pin;
+
+	dev_dbg(pcp->dev, "allocating %i pins\n", nr_pins);
+	pcp->pins.pa = devm_kcalloc(pcp->dev,
+				nr_pins, sizeof(*pcp->pins.pa),
+				GFP_KERNEL);
+	if (!pcp->pins.pa)
+		return -ENOMEM;
+
+	pcp->desc.pins = pcp->pins.pa;
+	pcp->desc.npins = nr_pins;
+
+	for (i = 0; i < pcp->desc.npins; i++) {
+		unsigned int offset;
+		int res;
+
+		offset = pcp_pin_reg_offset_get(pcp, i);
+		res = pcp_add_pin(pcp, offset);
+		if (res < 0) {
+			dev_err(pcp->dev, "error adding pins: %i\n", res);
+			return res;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * pcp_add_function() - adds a new function to the function list
+ * @pcp: pcp driver instance
+ * @fcn: new function allocated
+ * @name: name of the function
+ * @vals: array of mux register value pairs used by the function
+ * @nvals: number of mux register value pairs
+ * @pgnames: array of pingroup names for the function
+ * @npgnames: number of pingroup names
+ *
+ * Caller must take care of locking.
+ */
+static int pcp_add_function(struct pcp_device *pcp, struct pcp_function **fcn,
+			    const char *name, struct pcp_func_vals *vals,
+			    unsigned int nvals, const char **pgnames,
+			    unsigned int npgnames)
+{
+	struct pcp_function *function;
+	int selector;
+
+	function = devm_kzalloc(pcp->dev, sizeof(*function), GFP_KERNEL);
+	if (!function)
+		return -ENOMEM;
+
+	function->vals = vals;
+	function->nvals = nvals;
+	function->name = name;
+
+	selector = pinmux_generic_add_function(pcp->pctl, name,
+					       pgnames, npgnames,
+					       function);
+	if (selector < 0) {
+		devm_kfree(pcp->dev, function);
+		*fcn = NULL;
+	} else {
+		*fcn = function;
+	}
+
+	return selector;
+}
+
+/*
+ * check whether data matches enable bits or disable bits
+ * Return value: 1 for matching enable bits, 0 for matching disable bits,
+ *               and negative value for matching failure.
+ */
+static int pcp_config_match(unsigned int data, unsigned int enable,
+			    unsigned int disable)
+{
+	int ret = -EINVAL;
+
+	if (data == enable)
+		ret = 1;
+	else if (data == disable)
+		ret = 0;
+	return ret;
+}
+
+static void add_config(struct pcp_conf_vals **conf, enum pin_config_param param,
+		       unsigned int value, unsigned int enable,
+		       unsigned int disable, unsigned int mask)
+{
+	(*conf)->param = param;
+	(*conf)->val = value;
+	(*conf)->enable = enable;
+	(*conf)->disable = disable;
+	(*conf)->mask = mask;
+	(*conf)++;
+}
+
+static void add_setting(unsigned long **setting, enum pin_config_param param,
+			unsigned int arg)
+{
+	**setting = pinconf_to_config_packed(param, arg);
+	(*setting)++;
+}
+
+/* add pinconf setting with 2 parameters */
+static void pcp_add_conf2(struct pcp_device *pcp, struct device_node *np,
+			  const char *name, enum pin_config_param param,
+			  struct pcp_conf_vals **conf, unsigned long **settings)
+{
+	unsigned int value[2], shift;
+	int ret;
+
+	ret = of_property_read_u32_array(np, name, value, 2);
+	if (ret)
+		return;
+	/* set value & mask */
+	value[0] &= value[1];
+	shift = ffs(value[1]) - 1;
+	/* skip enable & disable */
+	add_config(conf, param, value[0], 0, 0, value[1]);
+	add_setting(settings, param, value[0] >> shift);
+}
+
+/* add pinconf setting with 4 parameters */
+static void pcp_add_conf4(struct pcp_device *pcp, struct device_node *np,
+			  const char *name, enum pin_config_param param,
+			  struct pcp_conf_vals **conf, unsigned long **settings)
+{
+	unsigned int value[4];
+	int ret;
+
+	/* value to set, enable, disable, mask */
+	ret = of_property_read_u32_array(np, name, value, 4);
+	if (ret)
+		return;
+	if (!value[3]) {
+		dev_err(pcp->dev, "mask field of the property can't be 0\n");
+		return;
+	}
+	value[0] &= value[3];
+	value[1] &= value[3];
+	value[2] &= value[3];
+	ret = pcp_config_match(value[0], value[1], value[2]);
+	if (ret < 0)
+		dev_dbg(pcp->dev, "failed to match enable or disable bits\n");
+	add_config(conf, param, value[0], value[1], value[2], value[3]);
+	add_setting(settings, param, ret);
+}
+
+static int pcp_parse_pinconf(struct pcp_device *pcp, struct device_node *np,
+			     struct pcp_function *func, struct pinctrl_map **map)
+
+{
+	static const struct pcp_conf_type prop2[] = {
+		{ "pinctrl-packed,drive-strength", PIN_CONFIG_DRIVE_STRENGTH, },
+		{ "pinctrl-packed,slew-rate", PIN_CONFIG_SLEW_RATE, },
+		{ "pinctrl-packed,input-enable", PIN_CONFIG_INPUT_ENABLE, },
+		{ "pinctrl-packed,input-schmitt", PIN_CONFIG_INPUT_SCHMITT, },
+		{ "pinctrl-packed,low-power-mode", PIN_CONFIG_MODE_LOW_POWER, },
+	};
+	static const struct pcp_conf_type prop4[] = {
+		{ "pinctrl-packed,bias-pullup", PIN_CONFIG_BIAS_PULL_UP, },
+		{ "pinctrl-packed,bias-pulldown", PIN_CONFIG_BIAS_PULL_DOWN, },
+		{ "pinctrl-packed,input-schmitt-enable",
+			PIN_CONFIG_INPUT_SCHMITT_ENABLE, },
+	};
+
+	unsigned long *settings = NULL, *s = NULL;
+	struct pcp_conf_vals *conf = NULL;
+	struct pinctrl_map *m = *map;
+	int i = 0, nconfs = 0;
+
+	/* If pinconf isn't supported, don't parse properties in below. */
+	if (!PCP_HAS_PINCONF)
+		return -EOPNOTSUPP;
+
+	/* calculate how many properties are supported in the current node */
+	for (i = 0; i < ARRAY_SIZE(prop2); i++) {
+		if (of_property_present(np, prop2[i].name))
+			nconfs++;
+	}
+	for (i = 0; i < ARRAY_SIZE(prop4); i++) {
+		if (of_property_present(np, prop4[i].name))
+			nconfs++;
+	}
+	if (!nconfs)
+		return -EOPNOTSUPP;
+
+	func->conf = devm_kcalloc(pcp->dev,
+				  nconfs, sizeof(struct pcp_conf_vals),
+				  GFP_KERNEL);
+	if (!func->conf)
+		return -ENOMEM;
+	func->nconfs = nconfs;
+	conf = &(func->conf[0]);
+	m++;
+	settings = devm_kcalloc(pcp->dev, nconfs, sizeof(unsigned long),
+				GFP_KERNEL);
+	if (!settings)
+		return -ENOMEM;
+	s = &settings[0];
+
+	for (i = 0; i < ARRAY_SIZE(prop2); i++)
+		pcp_add_conf2(pcp, np, prop2[i].name, prop2[i].param,
+			      &conf, &s);
+	for (i = 0; i < ARRAY_SIZE(prop4); i++)
+		pcp_add_conf4(pcp, np, prop4[i].name, prop4[i].param,
+			      &conf, &s);
+	m->type = PIN_MAP_TYPE_CONFIGS_GROUP;
+	m->data.configs.group_or_pin = np->name;
+	m->data.configs.configs = settings;
+	m->data.configs.num_configs = nconfs;
+	return 0;
+}
+
+/**
+ * pcp_parse_one_pinctrl_entry() - parses a device tree mux entry
+ * @pcp: pinctrl driver instance
+ * @np: device node of the mux entry
+ * @map: map entry
+ * @num_maps: number of map
+ * @pgnames: pingroup names
+ *
+ * Note that this binding currently supports only sets of one register + value.
+ *
+ * Also note that this driver tries to avoid understanding pin and function
+ * names because of the extra bloat they would cause especially in the case of
+ * a large number of pins. This driver just sets what is specified for the board
+ * in the .dts file. Further user space debugging tools can be developed to
+ * decipher the pin and function names using debugfs.
+ *
+ * If you are concerned about the boot time, set up the static pins in
+ * the bootloader, and only set up selected pins as device tree entries.
+ */
+static int pcp_parse_one_pinctrl_entry(struct pcp_device *pcp,
+				       struct device_node *np,
+				       struct pinctrl_map **map,
+				       unsigned int *num_maps,
+				       const char **pgnames)
+{
+	int rows, *pins, found, res, i, fsel, gsel;
+	const char *name = "pinctrl-packed,pins";
+	struct pcp_function *function = NULL;
+	struct pcp_func_vals *vals;
+
+	res = -ENOMEM;
+	found = 0;
+	rows = pinctrl_count_index_with_args(np, name);
+	if (rows <= 0) {
+		dev_err(pcp->dev, "Invalid number of rows: %d\n", rows);
+		return -EINVAL;
+	}
+
+	vals = devm_kcalloc(pcp->dev, rows, sizeof(*vals), GFP_KERNEL);
+	if (!vals)
+		return -ENOMEM;
+
+	pins = devm_kcalloc(pcp->dev, rows, sizeof(*pins), GFP_KERNEL);
+	if (!pins)
+		goto free_vals;
+
+	for (i = 0; i < rows; i++) {
+		struct of_phandle_args pinctrl_spec;
+		unsigned int offset;
+		unsigned int pin_index, func_sel;
+		unsigned int shift, mask, val;
+
+		res = pinctrl_parse_index_with_args(np, name, i, &pinctrl_spec);
+		if (res)
+			return res;
+
+		/* Expect <pin_index func_sel> for bit-per-mux users. */
+		if (pinctrl_spec.args_count < 2) {
+			dev_err(pcp->dev,
+				"invalid args_count for bit-per-mux spec: %i\n",
+				pinctrl_spec.args_count);
+			break;
+		}
+
+		pin_index = pinctrl_spec.args[0];
+		func_sel = pinctrl_spec.args[1];
+
+		if (pin_index >= pcp->desc.npins) {
+			dev_err(pcp->dev,
+				"pin index out of range for %pOFn: %u (npins %u)\n",
+				np, pin_index, pcp->desc.npins);
+			break;
+		}
+
+		offset = pcp_pin_reg_offset_get(pcp, pin_index);
+		shift = pcp_pin_shift_reg_get(pcp, pin_index);
+
+		mask = pcp->fmask << shift;
+		val = (func_sel << shift) & mask;
+
+		vals[found].reg = pcp->base_offset + offset;
+		vals[found].val = val;
+		vals[found].mask = mask;
+
+		dev_dbg(pcp->dev,
+			 "%pOFn pin: %u offset: 0x%x func: 0x%x val: 0x%x mask: 0x%x\n",
+			 pinctrl_spec.np, pin_index, offset,
+			 func_sel, val, mask);
+
+		pins[found++] = pin_index;
+	}
+
+	pgnames[0] = np->name;
+	mutex_lock(&pcp->mutex);
+	fsel = pcp_add_function(pcp, &function, np->name, vals, found,
+				pgnames, 1);
+	if (fsel < 0) {
+		res = fsel;
+		goto free_pins;
+	}
+
+	gsel = pinctrl_generic_add_group(pcp->pctl, np->name, pins, found, pcp);
+	if (gsel < 0) {
+		res = gsel;
+		goto free_function;
+	}
+
+	(*map)->type = PIN_MAP_TYPE_MUX_GROUP;
+	(*map)->data.mux.group = np->name;
+	(*map)->data.mux.function = np->name;
+
+	if (PCP_HAS_PINCONF && function) {
+		res = pcp_parse_pinconf(pcp, np, function, map);
+		if (res == 0)
+			*num_maps = 2;
+		else if (res == -EOPNOTSUPP)
+			*num_maps = 1;
+		else
+			goto free_pingroups;
+	} else {
+		*num_maps = 1;
+	}
+	mutex_unlock(&pcp->mutex);
+
+	return 0;
+
+free_pingroups:
+	pinctrl_generic_remove_group(pcp->pctl, gsel);
+	*num_maps = 1;
+free_function:
+	pinmux_generic_remove_function(pcp->pctl, fsel);
+free_pins:
+	mutex_unlock(&pcp->mutex);
+	devm_kfree(pcp->dev, pins);
+
+free_vals:
+	devm_kfree(pcp->dev, vals);
+
+	return res;
+}
+
+/**
+ * pcp_dt_node_to_map() - allocates and parses pinctrl maps
+ * @pctldev: pinctrl instance
+ * @np_config: device tree pinmux entry
+ * @map: array of map entries
+ * @num_maps: number of maps
+ */
+static int pcp_dt_node_to_map(struct pinctrl_dev *pctldev,
+			      struct device_node *np_config,
+			      struct pinctrl_map **map, unsigned int *num_maps)
+{
+	struct pcp_device *pcp;
+	const char **pgnames;
+	int ret;
+
+	pcp = pinctrl_dev_get_drvdata(pctldev);
+	/* create 2 maps. One is for pinmux, and the other is for pinconf. */
+	*map = devm_kcalloc(pcp->dev, 2, sizeof(**map), GFP_KERNEL);
+	if (!*map)
+		return -ENOMEM;
+
+	*num_maps = 0;
+
+	pgnames = devm_kzalloc(pcp->dev, sizeof(*pgnames), GFP_KERNEL);
+	if (!pgnames) {
+		ret = -ENOMEM;
+		goto free_map;
+	}
+
+	if (of_find_property(np_config, "pinctrl-packed,pins", NULL)) {
+		ret = pcp_parse_one_pinctrl_entry(pcp, np_config, map, num_maps,
+						  pgnames);
+	} else {
+		ret = -EINVAL;
+	}
+
+	if (ret < 0) {
+		dev_err(pcp->dev, "no pins entries for %pOFn\n", np_config);
+		goto free_pgnames;
+	}
+
+	return 0;
+
+free_pgnames:
+	devm_kfree(pcp->dev, pgnames);
+free_map:
+	devm_kfree(pcp->dev, *map);
+	return ret;
+}
+
+static int pcp_add_gpio_func(struct device_node *node, struct pcp_device *pcp)
+{
+	const char *cellname = "#pinctrl-packed,gpio-range-cells";
+	const char *propname = "pinctrl-packed,gpio-range";
+	struct pcp_gpiofunc_range *range;
+	struct of_phandle_args gpiospec;
+	int ret, i;
+
+	for (i = 0; ; i++) {
+		ret = of_parse_phandle_with_args(node, propname, cellname,
+						 i, &gpiospec);
+		/* Do not treat it as error. Only treat it as end condition. */
+		if (ret) {
+			ret = 0;
+			break;
+		}
+		range = devm_kzalloc(pcp->dev, sizeof(*range), GFP_KERNEL);
+		if (!range) {
+			ret = -ENOMEM;
+			break;
+		}
+		range->offset = gpiospec.args[0];
+		range->npins = gpiospec.args[1];
+		range->gpiofunc = gpiospec.args[2];
+		mutex_lock(&pcp->mutex);
+		list_add_tail(&range->node, &pcp->gpiofuncs);
+		mutex_unlock(&pcp->mutex);
+	}
+	return ret;
+}
+
+static int pcp_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct resource res, parent_res;
+	const struct pcp_soc_data *soc;
+	struct pcp_device *pcp;
+	int ret;
+
+	soc = of_device_get_match_data(&pdev->dev);
+	if (WARN_ON(!soc))
+		return -EINVAL;
+
+	pcp = devm_kzalloc(&pdev->dev, sizeof(*pcp), GFP_KERNEL);
+	if (!pcp)
+		return -ENOMEM;
+
+	pcp->dev = &pdev->dev;
+	pcp->np = np;
+	mutex_init(&pcp->mutex);
+	INIT_LIST_HEAD(&pcp->gpiofuncs);
+	pcp->flags = soc->flags;
+
+	pcp->regmap = syscon_node_to_regmap(np->parent);
+	if (IS_ERR(pcp->regmap)) {
+		dev_err(pcp->dev, "could not get regmap from parent\n");
+		return PTR_ERR(pcp->regmap);
+	}
+	pcp->width = regmap_get_reg_stride(pcp->regmap) * BITS_PER_BYTE;
+
+	ret = of_address_to_resource(np, 0, &res);
+	if (ret) {
+		dev_err(pcp->dev, "could not get resource from node\n");
+		return ret;
+	}
+
+	ret = of_address_to_resource(np->parent, 0, &parent_res);
+	if (ret) {
+		dev_err(pcp->dev,
+			"could not get resource from parent syscon\n");
+		return ret;
+	}
+
+	pcp->base_offset = res.start - parent_res.start;
+	pcp->size = resource_size(&res);
+
+	ret = of_property_read_u32(np, "pinctrl-packed,function-mask",
+				   &pcp->fmask);
+	if (ret) {
+		dev_err(pcp->dev, "function mask property not specified\n");
+		return ret;
+	}
+	platform_set_drvdata(pdev, pcp);
+
+	pcp->desc.name = dev_name(&pdev->dev);
+	pcp->desc.pctlops = &pcp_pinctrl_ops;
+	pcp->desc.pmxops = &pcp_pinmux_ops;
+	if (PCP_HAS_PINCONF)
+		pcp->desc.confops = &pcp_pinconf_ops;
+	pcp->desc.owner = THIS_MODULE;
+
+	ret = pcp_allocate_pin_table(pcp);
+	if (ret < 0) {
+		dev_err(pcp->dev, "failed to allocate pin table\n");
+		return ret;
+	}
+
+	ret = devm_pinctrl_register_and_init(pcp->dev, &pcp->desc, pcp, &pcp->pctl);
+	if (ret) {
+		dev_err(pcp->dev, "could not register packed pinctrl driver\n");
+		return ret;
+	}
+
+	ret = pcp_add_gpio_func(np, pcp);
+	if (ret < 0) {
+		dev_err(pcp->dev, "failed to add gpio functions\n");
+		return ret;
+	}
+
+	dev_info(pcp->dev, "%i pins registered\n", pcp->desc.npins);
+
+	ret = pinctrl_enable(pcp->pctl);
+	if (ret) {
+		dev_err(pcp->dev, "failed to enable pinctrl\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct pcp_soc_data pinctrl_data = {
+};
+static const struct pcp_soc_data pinconf_data = {
+	.flags = PCP_FEAT_PINCONF,
+};
+
+static const struct of_device_id pcp_of_match[] = {
+	{ .compatible = "pinctrl-packed", .data = &pinctrl_data },
+	{ .compatible = "pinconf-packed", .data = &pinconf_data },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, pcp_of_match);
+
+static struct platform_driver pcp_driver = {
+	.probe		= pcp_probe,
+	.driver = {
+		.name		= DRIVER_NAME,
+		.of_match_table	= pcp_of_match,
+	},
+};
+
+module_platform_driver(pcp_driver);
+
+MODULE_AUTHOR("Tony Lindgren <tony@atomide.com>");
+MODULE_AUTHOR("Billy Tsai <billy_tsai@aspeedtech.com>");
+MODULE_DESCRIPTION("packed-field type device tree based pinctrl driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


