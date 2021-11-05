Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1B0446380
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 13:43:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233023AbhKEMqG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 08:46:06 -0400
Received: from mga06.intel.com ([134.134.136.31]:53541 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232679AbhKEMpv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Nov 2021 08:45:51 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="292724128"
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="292724128"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2021 05:43:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="542718192"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 05 Nov 2021 05:43:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 89BCA69F; Fri,  5 Nov 2021 14:43:01 +0200 (EET)
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
Subject: [PATCH v1 10/19] pinctrl: armada-37xx: Make use of the devm_platform_ioremap_resource()
Date:   Fri,  5 Nov 2021 14:42:33 +0200
Message-Id: <20211105124242.27288-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
References: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the devm_platform_ioremap_resource() helper instead of
calling of_address_to_resource() and devm_ioremap_resource()
separately.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 37f92dc54d7a..282b3fac3bec 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -727,7 +727,6 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
 	struct gpio_irq_chip *girq = &gc->irq;
 	struct device *dev = &pdev->dev;
 	struct device_node *np;
-	struct resource res;
 	int ret = -ENODEV, i, nr_irq_parent;
 
 	/* Check if we have at least one gpio-controller child node */
@@ -750,12 +749,7 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
 		return 0;
 	}
 
-	if (of_address_to_resource(dev->of_node, 1, &res)) {
-		dev_err(dev, "cannot find IO resource\n");
-		return -ENOENT;
-	}
-
-	info->base = devm_ioremap_resource(dev, &res);
+	info->base = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(info->base))
 		return PTR_ERR(info->base);
 
-- 
2.33.0

