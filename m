Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BEBD44637A
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 13:43:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233093AbhKEMqB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 08:46:01 -0400
Received: from mga07.intel.com ([134.134.136.100]:41496 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232656AbhKEMpv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Nov 2021 08:45:51 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="295333851"
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="295333851"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2021 05:43:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="501921083"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 05 Nov 2021 05:43:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 970FE74D; Fri,  5 Nov 2021 14:43:01 +0200 (EET)
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
Subject: [PATCH v1 11/19] pinctrl: armada-37xx: Convert to use dev_err_probe()
Date:   Fri,  5 Nov 2021 14:42:34 +0200
Message-Id: <20211105124242.27288-11-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 282b3fac3bec..f48745c43419 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -736,10 +736,8 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
 			break;
 		}
 	}
-	if (ret) {
-		dev_err(dev, "no gpio-controller child node\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "no gpio-controller child node\n");
 
 	nr_irq_parent = of_irq_count(np);
 	spin_lock_init(&info->irq_lock);
@@ -996,10 +994,8 @@ static int armada_37xx_pinctrl_register(struct platform_device *pdev,
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
@@ -1135,10 +1131,8 @@ static int __init armada_37xx_pinctrl_probe(struct platform_device *pdev)
 	info->dev = dev;
 
 	regmap = syscon_node_to_regmap(np);
-	if (IS_ERR(regmap)) {
-		dev_err(dev, "cannot get regmap\n");
-		return PTR_ERR(regmap);
-	}
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap), "cannot get regmap\n");
 	info->regmap = regmap;
 
 	info->data = of_device_get_match_data(dev);
-- 
2.33.0

