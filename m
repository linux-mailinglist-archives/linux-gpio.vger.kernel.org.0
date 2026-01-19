Return-Path: <linux-gpio+bounces-30727-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C27CD3A620
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 12:04:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 709B730286C1
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 11:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D7A500945;
	Mon, 19 Jan 2026 11:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WMfVAmVS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D273590BF;
	Mon, 19 Jan 2026 11:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768820671; cv=none; b=WFu1RdWXGuD/XyVjPDYutC7rgJT/RBHlDI0HNeVglN6w9NbM26b8xQLymiln8C6BWx/LX/injqPjKAXmdpt9kzMLptBc7yQrDdrNaFFDhYmekviD5YI/yC+plCPyqxc9RS3jlgagH5nhpimR9sxsIn8lsoxq1qDR8c4GPwVgYm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768820671; c=relaxed/simple;
	bh=qrE0iyx32CrlLykRMkHpplSrDxoo8JgPJRkbCoPqrWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fohZkIIxKLx2FPtWzaD2hTHUnh48YHa4nkRH8Q4qaIiPmAZJ3elOiOXxz03F3IFIOGg4Azg6tIp3ao64hDVaToCPTdhAzKCPMR4iOR1XxGm7HOnOdq/0MqnZFmvHqQQz9WZSyCK30+XkhLbEjHMG14VXSVi0g1Dhk+4u50xrt1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WMfVAmVS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35777C116C6;
	Mon, 19 Jan 2026 11:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768820671;
	bh=qrE0iyx32CrlLykRMkHpplSrDxoo8JgPJRkbCoPqrWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WMfVAmVSNSc+GuelgspJmRBi9+fcFw5KSD6qIL96ktHCfkqIKBrxt4oUJ4JfkwwQi
	 k4DiYmhZzbQk11e46qUXXPMHVhyykran/FqXYpHGZeorSm3q9j9ogc9E0n8LptHFBx
	 OYHX65HXQlsehcZpvwgNfseYlHr+m2hJxdxMk7ghD/Ypb1Av2BWmMMvrsSC+UHeiJb
	 XIANzzUuibyu10mLskEZwRISzakRuhDnIL0RPgo19SysxmoSqXmixLIT9/VBbZ6Yyk
	 qOgsct5zg32k8VQs1VRxHX8K/O+cqY9OMoyvnxtEPJdqP/uMGlxvVK0gDvzvkRsHdm
	 GYcRxZJ8YpqAg==
From: Conor Dooley <conor@kernel.org>
To: linusw@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com
Subject: [PATCH v3 2/6] pinctrl: add generic functions + pins mapper
Date: Mon, 19 Jan 2026 11:03:53 +0000
Message-ID: <20260119-altitude-hardhead-dbf4fb6f1798@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260119-rearrange-germproof-3e3096cc0da4@spud>
References: <20260119-rearrange-germproof-3e3096cc0da4@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8218; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=zZ8BxvgX6/g/itLznDT3+eEO8kxCEFsQrBjzmr/TzIY=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJl5/BuSP27/q1hj81I04JHegn/8cq9LlwtHZc32E/zxw t2zYOrjjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzkojIjw4FjaywdKnT/5Jaa vqoPLFhwJLRRfMLqpW3hbQVn/l5zt2Nk2LRy+/SdXm6vD2h8+RbcIlBpmfz9hdPp9OI3O12r7/+ /xwcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Add a generic function to allow creation of groups and functions at
runtime based on devicetree content, before setting up mux mappings.
It works similarly to pinconf_generic_dt_node_to_map(), and
therefore parses pinconf properties and maps those too, allowing it
to be used as the dt_node_to_map member of the pinctrl_ops struct.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pinctrl/Kconfig           |   6 +
 drivers/pinctrl/Makefile          |   1 +
 drivers/pinctrl/pinconf.h         |  16 +++
 drivers/pinctrl/pinctrl-generic.c | 189 ++++++++++++++++++++++++++++++
 4 files changed, 212 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-generic.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index d2a414450c16..6cc5e214f4f3 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -25,6 +25,12 @@ config GENERIC_PINCONF
 	bool
 	select PINCONF
 
+config GENERIC_PINCTRL
+	bool
+	depends on GENERIC_PINCONF
+	depends on GENERIC_PINCTRL_GROUPS
+	depends on GENERIC_PINMUX_FUNCTIONS
+
 config DEBUG_PINCTRL
 	bool "Debug PINCTRL calls"
 	depends on DEBUG_KERNEL
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 05737b1afec9..f7d5d5f76d0c 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -7,6 +7,7 @@ obj-y				+= core.o pinctrl-utils.o
 obj-$(CONFIG_PINMUX)		+= pinmux.o
 obj-$(CONFIG_PINCONF)		+= pinconf.o
 obj-$(CONFIG_GENERIC_PINCONF)	+= pinconf-generic.o
+obj-$(CONFIG_GENERIC_PINCTRL)	+= pinctrl-generic.o
 obj-$(CONFIG_OF)		+= devicetree.o
 
 obj-$(CONFIG_PINCTRL_AMD)	+= pinctrl-amd.o
diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
index e1ae71610526..2880adef476e 100644
--- a/drivers/pinctrl/pinconf.h
+++ b/drivers/pinctrl/pinconf.h
@@ -160,3 +160,19 @@ pinconf_generic_parse_dt_pinmux(struct device_node *np, struct device *dev,
 	return -ENOTSUPP;
 }
 #endif
+
+#if defined(CONFIG_GENERIC_PINCTRL) && defined (CONFIG_OF)
+int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
+						 struct device_node *np,
+						 struct pinctrl_map **maps,
+						 unsigned int *num_maps);
+#else
+static inline int
+pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
+					     struct device_node *np,
+					     struct pinctrl_map **maps,
+					     unsigned int *num_maps)
+{
+	return -ENOTSUPP;
+}
+#endif
diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-generic.c
new file mode 100644
index 000000000000..efb39c6a6703
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-generic.c
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#define pr_fmt(fmt) "generic pinconfig core: " fmt
+
+#include <linux/array_size.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "core.h"
+#include "pinconf.h"
+#include "pinctrl-utils.h"
+#include "pinmux.h"
+
+static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *pctldev,
+							   struct device_node *parent,
+							   struct device_node *np,
+							   struct pinctrl_map **maps,
+							   unsigned int *num_maps,
+							   unsigned int *num_reserved_maps,
+							   const char **group_names,
+							   unsigned int ngroups)
+{
+	struct device *dev = pctldev->dev;
+	const char **functions;
+	const char *group_name;
+	unsigned long *configs;
+	unsigned int num_configs, pin, *pins;
+	int npins, ret, reserve = 1;
+
+	npins = of_property_count_u32_elems(np, "pins");
+
+	if (npins < 1) {
+		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
+			parent, np, npins);
+		return npins;
+	}
+
+	group_name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", parent, np);
+	if (!group_name)
+		return -ENOMEM;
+
+	group_names[ngroups] = group_name;
+
+	pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+
+	functions = devm_kcalloc(dev, npins, sizeof(*functions), GFP_KERNEL);
+	if (!functions)
+		return -ENOMEM;
+
+	for (int i = 0; i < npins; i++) {
+		ret = of_property_read_u32_index(np, "pins", i, &pin);
+		if (ret)
+			return ret;
+
+		pins[i] = pin;
+
+		ret = of_property_read_string(np, "function", &functions[i]);
+		if (ret)
+			return ret;
+	}
+
+	ret = pinctrl_utils_reserve_map(pctldev, maps, num_reserved_maps, num_maps, reserve);
+	if (ret)
+		return ret;
+
+	ret = pinctrl_utils_add_map_mux(pctldev, maps, num_reserved_maps, num_maps, group_name,
+					parent->name);
+	if (ret < 0)
+		return ret;
+
+	ret = pinctrl_generic_add_group(pctldev, group_name, pins, npins, functions);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to add group %s: %d\n",
+				     group_name, ret);
+
+	ret = pinconf_generic_parse_dt_config(np, pctldev, &configs, &num_configs);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse pin config of group %s\n",
+			group_name);
+
+	if (num_configs == 0)
+		return 0;
+
+	ret = pinctrl_utils_reserve_map(pctldev, maps, num_reserved_maps, num_maps, reserve);
+	if (ret)
+		return ret;
+
+	ret = pinctrl_utils_add_map_configs(pctldev, maps, num_reserved_maps, num_maps, group_name,
+					    configs,
+			num_configs, PIN_MAP_TYPE_CONFIGS_GROUP);
+	kfree(configs);
+	if (ret)
+		return ret;
+
+	return 0;
+};
+
+/*
+ * For platforms that do not define groups or functions in the driver, but
+ * instead use the devicetree to describe them. This function will, unlike
+ * pinconf_generic_dt_node_to_map() etc which rely on driver defined groups
+ * and functions, create them in addition to parsing pinconf properties and
+ * adding mappings.
+ */
+int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
+						 struct device_node *np,
+						 struct pinctrl_map **maps,
+						 unsigned int *num_maps)
+{
+	struct device *dev = pctldev->dev;
+	struct device_node *child_np;
+	const char **group_names;
+	unsigned int num_reserved_maps = 0;
+	int ngroups = 0;
+	int ret;
+
+	*maps = NULL;
+	*num_maps = 0;
+
+	/*
+	 * Check if this is actually the pins node, or a parent containing
+	 * multiple pins nodes.
+	 */
+	if (!of_property_present(np, "pins"))
+		goto parent;
+
+	group_names = devm_kcalloc(dev, 1, sizeof(*group_names), GFP_KERNEL);
+	if (!group_names)
+		return -ENOMEM;
+
+	ret = pinctrl_generic_pins_function_dt_subnode_to_map(pctldev, np, np,
+							      maps, num_maps,
+							      &num_reserved_maps,
+							      group_names,
+							      ngroups);
+	if (ret) {
+		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
+		return dev_err_probe(dev, ret, "error figuring out mappings for %s\n", np->name);
+	}
+
+	ret = pinmux_generic_add_function(pctldev, np->name, group_names, 1, NULL);
+	if (ret < 0) {
+		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
+		return dev_err_probe(dev, ret, "error adding function %s\n", np->name);
+	}
+
+	return 0;
+
+parent:
+	for_each_available_child_of_node(np, child_np)
+		ngroups += 1;
+
+	group_names = devm_kcalloc(dev, ngroups, sizeof(*group_names), GFP_KERNEL);
+	if (!group_names)
+		return -ENOMEM;
+
+	ngroups = 0;
+	for_each_available_child_of_node_scoped(np, child_np) {
+		ret = pinctrl_generic_pins_function_dt_subnode_to_map(pctldev, np, child_np,
+								      maps, num_maps,
+								      &num_reserved_maps,
+								      group_names,
+								      ngroups);
+		if (ret) {
+			pinctrl_utils_free_map(pctldev, *maps, *num_maps);
+			return dev_err_probe(dev, ret, "error figuring out mappings for %s\n",
+					     np->name);
+		}
+
+		ngroups++;
+	}
+
+	ret = pinmux_generic_add_function(pctldev, np->name, group_names, ngroups, NULL);
+	if (ret < 0) {
+		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
+		return dev_err_probe(dev, ret, "error adding function %s\n", np->name);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pinctrl_generic_pins_function_dt_node_to_map);
-- 
2.51.0


