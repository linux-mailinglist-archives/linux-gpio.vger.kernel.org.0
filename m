Return-Path: <linux-gpio+bounces-17732-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A35CA671F2
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 12:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1F663BB1B6
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 11:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0060620A5E4;
	Tue, 18 Mar 2025 10:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CVaKu8vK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B7F209F24;
	Tue, 18 Mar 2025 10:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742295588; cv=none; b=D8JRMVvwjsVmvnNg9WeVoQyRigBqpivwrqzqTyO0YFwYvARyWuk+xCfTaaWoMjHbGwMl2eKe6AwrGQmEX8ZYa4RN20oXBenH1GHCzLpFNCXX+RBF0i67HRXSgyolaYb/qog6C9wsf3HzxsbV+Qz0pkOqIj+ZUyi8n2wKEFnO4BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742295588; c=relaxed/simple;
	bh=asp1AUmFkOlCpbFyxMT3/Whk2zXRSNCtJDEO+Z5wvBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=On0YkTo/mRsDUznmEVpI7HtnpJAMQ7ltEih8bOIP2HriEX4RgwWZrMwlCMJNA3mtKa9H6hEj0CD2LE8gyHUqGrjebn4ZuyD/IFXQhdy27xwthuH6u+pOC8TYgiLmu3dkoGMxFQXAW8HgN8XVdtgqCl5dOTZwdOl8T3iz3uJi7gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CVaKu8vK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742295583; x=1773831583;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=asp1AUmFkOlCpbFyxMT3/Whk2zXRSNCtJDEO+Z5wvBY=;
  b=CVaKu8vK4d/nqJyf5p5JKNazjDbpjD5DWQ3y3G+02tUNSR9FUwMJT4B/
   9Fzw8W87ZI7yUvxn0ey1hLahT7Au2x+cHMBsAzoDAoPI+z15HS67UcFay
   nQC+m5jXRqzV9g336VnFmz3InETjoZzHsKl9Bk02biTFIMGZ/CZsUKueb
   CaNL0BSOD96oVGUUS6HKbAeHta9uAh318ARb3mmghjHU1n4oBcHYkM1Nl
   YvTa2WiiBGMMWUjjpyhUZveGBwniLQ5118wz6YhMvh10Yyew7QqjtYf1s
   UdG9nVKs7viecEwbfs6SW0N47HKMGRETDvM6KrUm25jHkMIJ1t8dO/z5N
   A==;
X-CSE-ConnectionGUID: XnMx4PfFTBy6jq4Yx6asJQ==
X-CSE-MsgGUID: U2bRUEVXQ+enZ1MCpv2lRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="60959406"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="60959406"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 03:59:43 -0700
X-CSE-ConnectionGUID: dZKgkuFdQiKlfkKYVgnWMQ==
X-CSE-MsgGUID: XKUdbCKMQt+20wsV5rwcfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="127322164"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 18 Mar 2025 03:59:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 1D2EA677; Tue, 18 Mar 2025 12:59:34 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jacky Huang <ychuang3@nuvoton.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Cc: Shan-Chun Hung <schung@nuvoton.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 5/5] pinctrl: nuvoton: Reduce use of OF-specific APIs
Date: Tue, 18 Mar 2025 12:57:18 +0200
Message-ID: <20250318105932.2090926-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
References: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andy.shevchenko@gmail.com>

Some drivers are using device property APIs along with OF-specific ones.
At the same time few of the latter can be converted to device property
calls. Reduce use of OF-specific APIs in order to bring a bit more consistency
into the drivers.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/nuvoton/pinctrl-ma35.c    | 35 +++++++++++------------
 drivers/pinctrl/nuvoton/pinctrl-ma35d1.c  |  1 -
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 17 ++---------
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c |  2 +-
 4 files changed, 21 insertions(+), 34 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index da3c8d8e3eb3..06ae1fe8b8c5 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -519,7 +519,6 @@ static int ma35_gpiolib_register(struct platform_device *pdev, struct ma35_pinct
 		bank->irqtype = 0;
 		bank->irqinten = 0;
 		bank->chip.label = bank->name;
-		bank->chip.of_gpio_n_cells = 2;
 		bank->chip.parent = &pdev->dev;
 		bank->chip.request = ma35_gpio_core_to_request;
 		bank->chip.direction_input = ma35_gpio_core_direction_in;
@@ -976,9 +975,10 @@ static const struct pinconf_ops ma35_pinconf_ops = {
 	.is_generic = true,
 };
 
-static int ma35_pinctrl_parse_groups(struct device_node *np, struct group_desc *grp,
+static int ma35_pinctrl_parse_groups(struct fwnode_handle *fwnode, struct group_desc *grp,
 				     struct ma35_pinctrl *npctl, u32 index)
 {
+	struct device_node *np = to_of_node(fwnode);
 	struct ma35_pin_setting *pin;
 	unsigned long *configs;
 	unsigned int nconfigs;
@@ -990,7 +990,7 @@ static int ma35_pinctrl_parse_groups(struct device_node *np, struct group_desc *
 	if (ret)
 		return ret;
 
-	count = of_property_count_elems_of_size(np, "nuvoton,pins", sizeof(u32));
+	count = fwnode_property_count_u32(fwnode, "nuvoton,pins");
 	if (!count || count % 3)
 		return -EINVAL;
 
@@ -1000,7 +1000,7 @@ static int ma35_pinctrl_parse_groups(struct device_node *np, struct group_desc *
 
 	grp->grp.name = np->name;
 
-	ret = of_property_read_u32_array(np, "nuvoton,pins", elems, count);
+	ret = fwnode_property_read_u32_array(fwnode, "nuvoton,pins", elems, count);
 	if (ret)
 		return -EINVAL;
 	grp->grp.npins = count / 3;
@@ -1027,10 +1027,11 @@ static int ma35_pinctrl_parse_groups(struct device_node *np, struct group_desc *
 	return 0;
 }
 
-static int ma35_pinctrl_parse_functions(struct device_node *np, struct ma35_pinctrl *npctl,
+static int ma35_pinctrl_parse_functions(struct fwnode_handle *fwnode, struct ma35_pinctrl *npctl,
 					u32 index)
 {
-	struct device_node *child;
+	struct device_node *np = to_of_node(fwnode);
+	struct fwnode_handle *child;
 	struct pinfunction *func;
 	struct group_desc *grp;
 	static u32 grp_index;
@@ -1050,12 +1051,14 @@ static int ma35_pinctrl_parse_functions(struct device_node *np, struct ma35_pinc
 	if (!groups)
 		return -ENOMEM;
 
-	for_each_child_of_node(np, child) {
-		groups[i] = child->name;
+	fwnode_for_each_child_node(fwnode, child) {
+		struct device_node *node = to_of_node(child);
+
+		groups[i] = node->name;
 		grp = &npctl->groups[grp_index++];
 		ret = ma35_pinctrl_parse_groups(child, grp, npctl, i++);
 		if (ret) {
-			of_node_put(child);
+			fwnode_handle_put(child);
 			return ret;
 		}
 	}
@@ -1066,13 +1069,12 @@ static int ma35_pinctrl_parse_functions(struct device_node *np, struct ma35_pinc
 
 static int ma35_pinctrl_probe_dt(struct platform_device *pdev, struct ma35_pinctrl *npctl)
 {
+	struct device *dev = &pdev->dev;
 	struct fwnode_handle *child;
 	u32 idx = 0;
 	int ret;
 
-	device_for_each_child_node(&pdev->dev, child) {
-		if (fwnode_property_present(child, "gpio-controller"))
-			continue;
+	for_each_gpiochip_node(dev, child) {
 		npctl->nfunctions++;
 		npctl->ngroups += of_get_child_count(to_of_node(child));
 	}
@@ -1090,11 +1092,8 @@ static int ma35_pinctrl_probe_dt(struct platform_device *pdev, struct ma35_pinct
 	if (!npctl->groups)
 		return -ENOMEM;
 
-	device_for_each_child_node(&pdev->dev, child) {
-		if (fwnode_property_present(child, "gpio-controller"))
-			continue;
-
-		ret = ma35_pinctrl_parse_functions(to_of_node(child), npctl, idx++);
+	for_each_gpiochip_node(dev, child) {
+		ret = ma35_pinctrl_parse_functions(child, npctl, idx++);
 		if (ret) {
 			fwnode_handle_put(child);
 			dev_err(&pdev->dev, "failed to parse function\n");
@@ -1139,7 +1138,7 @@ int ma35_pinctrl_probe(struct platform_device *pdev, const struct ma35_pinctrl_s
 	npctl->info = info;
 	npctl->dev = &pdev->dev;
 
-	npctl->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "nuvoton,sys");
+	npctl->regmap = syscon_regmap_lookup_by_phandle(dev_of_node(dev), "nuvoton,sys");
 	if (IS_ERR(npctl->regmap))
 		return dev_err_probe(&pdev->dev, PTR_ERR(npctl->regmap),
 				     "No syscfg phandle specified\n");
diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35d1.c b/drivers/pinctrl/nuvoton/pinctrl-ma35d1.c
index 8bb9a5a35954..eafa06ca0879 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35d1.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35d1.c
@@ -9,7 +9,6 @@
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index c6b11a198c76..dfd32feb3428 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -7,10 +7,8 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mfd/syscon.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
@@ -1832,22 +1830,13 @@ static struct pinctrl_desc npcm7xx_pinctrl_desc = {
 static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 {
 	int ret = -ENXIO;
-	struct resource res;
 	struct device *dev = pctrl->dev;
 	struct fwnode_reference_args args;
 	struct fwnode_handle *child;
 	int id = 0;
 
 	for_each_gpiochip_node(dev, child) {
-		struct device_node *np = to_of_node(child);
-
-		ret = of_address_to_resource(np, 0, &res);
-		if (ret < 0) {
-			dev_err(dev, "Resource fail for GPIO bank %u\n", id);
-			return ret;
-		}
-
-		pctrl->gpio_bank[id].base = ioremap(res.start, resource_size(&res));
+		pctrl->gpio_bank[id].base = fwnode_iomap(child, 0);
 		if (!pctrl->gpio_bank[id].base)
 			return -EINVAL;
 
@@ -1869,7 +1858,7 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 			return ret;
 		}
 
-		ret = irq_of_parse_and_map(np, 0);
+		ret = fwnode_irq_get(child, 0);
 		if (!ret) {
 			dev_err(dev, "No IRQ for GPIO bank %u\n", id);
 			return -EINVAL;
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 62347a82282d..be3db8ab406c 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -2424,7 +2424,7 @@ static int npcm8xx_pinctrl_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, pctrl);
 
 	pctrl->gcr_regmap =
-		syscon_regmap_lookup_by_phandle(dev->of_node, "nuvoton,sysgcr");
+		syscon_regmap_lookup_by_phandle(dev_of_node(dev), "nuvoton,sysgcr");
 	if (IS_ERR(pctrl->gcr_regmap))
 		return dev_err_probe(dev, PTR_ERR(pctrl->gcr_regmap),
 				      "Failed to find nuvoton,sysgcr property\n");
-- 
2.47.2


