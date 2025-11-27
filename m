Return-Path: <linux-gpio+bounces-29130-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 12612C8DDE3
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 11:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B05694E7464
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 10:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D198732C942;
	Thu, 27 Nov 2025 10:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hnz+T+cN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874C932C935;
	Thu, 27 Nov 2025 10:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764241092; cv=none; b=XLRYT0s4ciJ1Pux8693f/14AKz2yHK729jumtOCPmb1Q1TEk1AMfRCQtzWptz4WGmKMs1eq25rhFXvWPsna1OZvikLVpf059htTXFx5NIVVJaumTtuxrMpzBRpLZo6TMiij0nDfFrHDkZynviwYarv9wyFXiNAwhNV75YqBk0Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764241092; c=relaxed/simple;
	bh=Zcd6rBdAK/aFcWnv31LnKEzBmka0JuJ64ZZQUARY/U4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z3L/RBmnnlr/fLVUqXdu3MYFeundBsH7eBcqRiFCD5ZcLJ3fVz+TOLaZee01KByFw6eX6v9J1XoML2rg+cKfmPnifYbA9/YcDO1F3TwBwZE/qE5k34Zjiw57u0YzRr2Hsl2/hMfdSlRDFI+Lwn7xIe60diLMbk84dEB5GIdhTmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hnz+T+cN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91C79C116D0;
	Thu, 27 Nov 2025 10:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764241092;
	bh=Zcd6rBdAK/aFcWnv31LnKEzBmka0JuJ64ZZQUARY/U4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hnz+T+cNEUgDzLMFlZgSDw6uLh1mnMkUcXsiGfUzTo3u6yotCVvH84Y0kqGQ9WTEQ
	 QmK2vlfyXF/rZYxT0bTrLy9BZw932l2XsE8mwqi9Gc8JAiJjX10dObFr1zrZFad0oA
	 fNGvzFQhvNsxcpyhcdKHUdpsI+s8AZEE4FH+5ACAhlRAm/HuOWtpX7jJUX3rOLDJMx
	 q14FNIgMTaDJA+U860APmdlwvNGcwyGNdTWKGXBcutBDLCkwSDRLDE1Fhdi9lyz1JK
	 BG8B/w3KwsJrjpO5Aoxk9yHM//mJ2dTTMiMDw3AZ6MQx2WVzbwBVvF4zeMggmZ5Xp1
	 oUy0Wy2ZsAKew==
From: Conor Dooley <conor@kernel.org>
To: linus.walleij@linaro.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com
Subject: [RFC v2 2/5] pinctrl: add generic functions + pins mapper
Date: Thu, 27 Nov 2025 10:57:58 +0000
Message-ID: <20251127-approve-parsley-49302c061ea1@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251127-bogged-gauze-74aed9fdac0e@spud>
References: <20251127-bogged-gauze-74aed9fdac0e@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7660; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=oiTU0e+d+z6NxdjLGonXKwdzweO//AsEfnMLWr5gif0=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkaels/B2yZLMmW/FTxXuWOuBtnHs8XafZYPavR6KTnz N8ndA6qd5SyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAii3gYGW5635F/JZs8r/Df nH9BX67Mbgtg/neY8/TzjbMZuz8lpvky/NO9GnzsWPnP33kf8wzWmn2ITxNcZ5jjkmZ7P53/znK bc0wA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pinctrl/Kconfig           |   6 +
 drivers/pinctrl/Makefile          |   1 +
 drivers/pinctrl/pinconf.h         |   7 ++
 drivers/pinctrl/pinctrl-generic.c | 186 ++++++++++++++++++++++++++++++
 4 files changed, 200 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-generic.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 4ec2bb7f67cf..b43d4d7d25a8 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -25,6 +25,12 @@ config GENERIC_PINCONF
 	bool
 	select PINCONF
 
+config GENERIC_PINCTRL_BELLS_AND_WHISTLES
+	bool
+	depends on GENERIC_PINCONF
+	depends on GENERIC_PINCTRL_GROUPS
+	depends on GENERIC_PINMUX_FUNCTIONS
+
 config DEBUG_PINCTRL
 	bool "Debug PINCTRL calls"
 	depends on DEBUG_KERNEL
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index ea4e890766e1..ea679ca84d85 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -7,6 +7,7 @@ obj-y				+= core.o pinctrl-utils.o
 obj-$(CONFIG_PINMUX)		+= pinmux.o
 obj-$(CONFIG_PINCONF)		+= pinconf.o
 obj-$(CONFIG_GENERIC_PINCONF)	+= pinconf-generic.o
+obj-$(CONFIG_GENERIC_PINCTRL_BELLS_AND_WHISTLES) += pinctrl-generic.o
 obj-$(CONFIG_OF)		+= devicetree.o
 
 obj-$(CONFIG_PINCTRL_AMD)	+= pinctrl-amd.o
diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
index e1ae71610526..127da9a1e30e 100644
--- a/drivers/pinctrl/pinconf.h
+++ b/drivers/pinctrl/pinconf.h
@@ -160,3 +160,10 @@ pinconf_generic_parse_dt_pinmux(struct device_node *np, struct device *dev,
 	return -ENOTSUPP;
 }
 #endif
+
+#if defined(CONFIG_GENERIC_PINCTRL_BELLS_AND_WHISTLES) && defined (CONFIG_OF)
+int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
+						 struct device_node *np,
+						 struct pinctrl_map **maps,
+						 unsigned int *num_maps);
+#endif
diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-generic.c
new file mode 100644
index 000000000000..08f21e25e1eb
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-generic.c
@@ -0,0 +1,186 @@
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
+	ret = pinctrl_utils_add_map_mux(pctldev, maps, num_reserved_maps, num_maps, group_name, parent->name);
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
+	ret = pinctrl_utils_add_map_configs(pctldev, maps, num_reserved_maps, num_maps, group_name, configs,
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
+								      maps,num_maps,
+								      &num_reserved_maps,
+								      group_names,
+								      ngroups);
+		if (ret) {
+			pinctrl_utils_free_map(pctldev, *maps, *num_maps);
+			return dev_err_probe(dev, ret, "error figuring out mappings for %s\n", np->name);
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


