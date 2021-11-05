Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9682446378
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 13:43:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233072AbhKEMqA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 08:46:00 -0400
Received: from mga18.intel.com ([134.134.136.126]:7144 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232642AbhKEMpv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Nov 2021 08:45:51 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="218789419"
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="218789419"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2021 05:43:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="498356083"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 05 Nov 2021 05:43:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 5863A4B4; Fri,  5 Nov 2021 14:43:01 +0200 (EET)
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
Subject: [PATCH v1 06/19] pinctrl/rockchip: Convert to use dev_err_probe()
Date:   Fri,  5 Nov 2021 14:42:29 +0200
Message-Id: <20211105124242.27288-6-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/pinctrl-rockchip.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 7206ee30a6b2..929c96ea621a 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -2331,10 +2331,8 @@ static int rockchip_pinctrl_parse_groups(struct device_node *np,
 	list = of_get_property(np, "rockchip,pins", &size);
 	/* we do not check return since it's safe node passed down */
 	size /= sizeof(*list);
-	if (!size || size % 4) {
-		dev_err(dev, "wrong pins number or pins and configs should be by 4\n");
-		return -EINVAL;
-	}
+	if (!size || size % 4)
+		return dev_err_probe(dev, -EINVAL, "wrong pins number or pins and configs should be by 4\n");
 
 	grp->npins = size / 4;
 
@@ -2489,10 +2487,8 @@ static int rockchip_pinctrl_register(struct platform_device *pdev,
 		return ret;
 
 	info->pctl_dev = devm_pinctrl_register(dev, ctrldesc, info);
-	if (IS_ERR(info->pctl_dev)) {
-		dev_err(dev, "could not register pinctrl driver\n");
-		return PTR_ERR(info->pctl_dev);
-	}
+	if (IS_ERR(info->pctl_dev))
+		return dev_err_probe(dev, PTR_ERR(info->pctl_dev), "could not register pinctrl driver\n");
 
 	return 0;
 }
@@ -2673,10 +2669,8 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	void __iomem *base;
 	int ret;
 
-	if (!dev->of_node) {
-		dev_err(dev, "device tree node not found\n");
-		return -ENODEV;
-	}
+	if (!dev->of_node)
+		return dev_err_probe(dev, -ENODEV, "device tree node not found\n");
 
 	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
@@ -2685,10 +2679,8 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	info->dev = dev;
 
 	ctrl = rockchip_pinctrl_get_soc_data(info, pdev);
-	if (!ctrl) {
-		dev_err(dev, "driver data not available\n");
-		return -EINVAL;
-	}
+	if (!ctrl)
+		return dev_err_probe(dev, -EINVAL, "driver data not available\n");
 	info->ctrl = ctrl;
 
 	node = of_parse_phandle(np, "rockchip,grf", 0);
@@ -2737,10 +2729,8 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, info);
 
 	ret = of_platform_populate(np, rockchip_bank_match, NULL, NULL);
-	if (ret) {
-		dev_err(dev, "failed to register gpio device\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register gpio device\n");
 
 	return 0;
 }
-- 
2.33.0

