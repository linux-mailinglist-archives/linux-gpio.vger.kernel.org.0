Return-Path: <linux-gpio+bounces-30820-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOouMObPb2mgMQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30820-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 19:56:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5A149E16
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 19:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1DBCCA67165
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 18:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF06453491;
	Tue, 20 Jan 2026 18:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X60bTRIp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF402451054;
	Tue, 20 Jan 2026 18:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932975; cv=none; b=kORqB+08jSlATTsYuzTTE3do00hGOrF+t6A0hLhYgfzIzyNxu2x/1myEmXKt/nOEJh+z9ggpoi1tPKF51YsHqWqNwtAir8YjnHLt6Ltuhwri5xz2qZgQUs0EuTWgNj08p8VP4E5Vr8TWjmrJ1QjKQSZfBWfNbboutimqm6W7r+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932975; c=relaxed/simple;
	bh=qrE0iyx32CrlLykRMkHpplSrDxoo8JgPJRkbCoPqrWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qXaCvUOdU35H3sOLCyw8ppWjplHSYxYDqERlvyjW8sMtQPavwjNl2QPnVBx+PnA1bgx36ctwpvprMuGqY8RmXPfMbRmg8qHmNOCEvm69ruJ5F7gwHlIczf9cHo8m98VRI0IMPYbrLm9PCS49D7EbGtnwa6y8mkI84u0Y8ae+VaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X60bTRIp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12C24C16AAE;
	Tue, 20 Jan 2026 18:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768932973;
	bh=qrE0iyx32CrlLykRMkHpplSrDxoo8JgPJRkbCoPqrWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X60bTRIp6iBuYMCEmmE6ttaeDQ1DpsjYd/RErVlHlAwXwCdGrXLKFMRw6vdMQnW1I
	 itm4eWufwADbx1/Ws41mI/N41OUfOUgvGPMr13kpCg3uwzJfSnV1P4B9qt0gGNyHpa
	 0fcUiOKhf9ePqWTnNG9spgZiTPf2v39le9q8MSXKjd8vX9snKRkv3ynlSjUZEUk4Bl
	 hKZbK7pPcKy8ubYIPFM5XX6yM0xpvIlRdK0PDNGyBxYAaD4wNlIsoGEAO/0m03Smjc
	 BzlsoD6EgBv0qY41x9Fy3FBAbtK/JI9W9rH/kknGghqabmmEcdaJipHBu5ngENICdB
	 Wl/jt5EMCepWA==
From: Conor Dooley <conor@kernel.org>
To: linusw@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com
Subject: [PATCH v4 2/5] pinctrl: add generic functions + pins mapper
Date: Tue, 20 Jan 2026 18:15:40 +0000
Message-ID: <20260120-glucose-scary-de7fba2616b2@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260120-elixir-salute-dd6ec3d9f5fe@spud>
References: <20260120-elixir-salute-dd6ec3d9f5fe@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8218; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=zZ8BxvgX6/g/itLznDT3+eEO8kxCEFsQrBjzmr/TzIY=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJn5x7w+ztydr1ysXva09UrVde3NXDq7Em5d3uB55E7hg Zywxbn8HaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIXXWG/1Er2kr1qp/vaZp4 KfnFzzVtikXnS37N/3pKkP1E5z2frN+MDCd/amTbyOaZyu+a5CJ9c7X9/12lEk9EtMwZDR9XOBZ FsQIA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-30820-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,microchip.com:email]
X-Rspamd-Queue-Id: 3B5A149E16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


