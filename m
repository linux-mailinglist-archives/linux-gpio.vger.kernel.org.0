Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB05446383
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 13:43:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233070AbhKEMqJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 08:46:09 -0400
Received: from mga18.intel.com ([134.134.136.126]:7144 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232965AbhKEMpx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Nov 2021 08:45:53 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="218789436"
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="218789436"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2021 05:43:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="498356092"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 05 Nov 2021 05:43:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D409E931; Fri,  5 Nov 2021 14:43:01 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Cc:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Andy Shevchenko <andy@kernel.org>
Subject: [PATCH v1 16/19] pinctrl: st: Convert to use dev_err_probe()
Date:   Fri,  5 Nov 2021 14:42:39 +0200
Message-Id: <20211105124242.27288-16-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
References: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It's fine to call dev_err_probe() in ->probe() when error code is known.
Convert the driver to use dev_err_probe().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-st.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index bccde0b8f012..9cb0da88b098 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -1255,10 +1255,8 @@ static int st_pctl_parse_functions(struct device_node *np,
 	func = &info->functions[index];
 	func->name = np->name;
 	func->ngroups = of_get_child_count(np);
-	if (func->ngroups == 0) {
-		dev_err(dev, "No groups defined\n");
-		return -EINVAL;
-	}
+	if (func->ngroups == 0)
+		return dev_err_probe(dev, -EINVAL, "No groups defined\n");
 	func->groups = devm_kcalloc(dev, func->ngroups, sizeof(*func->groups), GFP_KERNEL);
 	if (!func->groups)
 		return -ENOMEM;
@@ -1555,10 +1553,8 @@ static int st_gpiolib_register_bank(struct st_pinctrl *info,
 
 skip_irq:
 	err  = gpiochip_add_data(&bank->gpio_chip, bank);
-	if (err) {
-		dev_err(dev, "Failed to add gpiochip(%d)!\n", bank_num);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err, "Failed to add gpiochip(%d)!\n", bank_num);
 	dev_info(dev, "%s bank added.\n", range->name);
 
 	return 0;
@@ -1585,10 +1581,8 @@ static int st_pctl_probe_dt(struct platform_device *pdev,
 	int irq = 0;
 
 	st_pctl_dt_child_count(info, np);
-	if (!info->nbanks) {
-		dev_err(dev, "you need at least one gpio bank\n");
-		return -EINVAL;
-	}
+	if (!info->nbanks)
+		return dev_err_probe(dev, -EINVAL, "you need at least one gpio bank\n");
 
 	dev_info(dev, "nbanks = %d\n", info->nbanks);
 	dev_info(dev, "nfunctions = %d\n", info->nfunctions);
@@ -1604,10 +1598,8 @@ static int st_pctl_probe_dt(struct platform_device *pdev,
 		return -ENOMEM;
 
 	info->regmap = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
-	if (IS_ERR(info->regmap)) {
-		dev_err(dev, "No syscfg phandle specified\n");
-		return PTR_ERR(info->regmap);
-	}
+	if (IS_ERR(info->regmap))
+		return dev_err_probe(dev, PTR_ERR(info->regmap), "No syscfg phandle specified\n");
 	info->data = of_match_node(st_pctl_of_match, np)->data;
 
 	irq = platform_get_irq(pdev, 0);
@@ -1695,10 +1687,8 @@ static int st_pctl_probe(struct platform_device *pdev)
 	pctl_desc->name		= dev_name(dev);
 
 	info->pctl = devm_pinctrl_register(dev, pctl_desc, info);
-	if (IS_ERR(info->pctl)) {
-		dev_err(dev, "Failed pinctrl registration\n");
-		return PTR_ERR(info->pctl);
-	}
+	if (IS_ERR(info->pctl))
+		return dev_err_probe(dev, PTR_ERR(info->pctl), "Failed pinctrl registration\n");
 
 	for (i = 0; i < info->nbanks; i++)
 		pinctrl_add_gpio_range(info->pctl, &info->banks[i].range);
-- 
2.33.0

