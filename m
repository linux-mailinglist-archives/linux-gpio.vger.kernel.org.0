Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20E29446375
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 13:43:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233013AbhKEMpy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 08:45:54 -0400
Received: from mga17.intel.com ([192.55.52.151]:39696 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232659AbhKEMpv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Nov 2021 08:45:51 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="212634175"
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="212634175"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2021 05:43:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="490310817"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 05 Nov 2021 05:43:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A3A167AF; Fri,  5 Nov 2021 14:43:01 +0200 (EET)
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
Subject: [PATCH v1 12/19] pinctrl: armada-37xx: Switch to use devm_kasprintf_strarray()
Date:   Fri,  5 Nov 2021 14:42:35 +0200
Message-Id: <20211105124242.27288-12-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
References: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since we have a generic helper, switch the module to use it.

As a side effect, add check for the memory allocation failures and
cleanup it either in error case or when driver is unloading.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index f48745c43419..08cad14042e2 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -23,6 +23,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/string_helpers.h>
 
 #include "../pinctrl-utils.h"
 
@@ -951,6 +952,7 @@ static int armada_37xx_pinctrl_register(struct platform_device *pdev,
 	struct pinctrl_desc *ctrldesc = &info->pctl;
 	struct pinctrl_pin_desc *pindesc, *pdesc;
 	struct device *dev = &pdev->dev;
+	char **pin_names;
 	int pin, ret;
 
 	info->groups = pin_data->groups;
@@ -969,11 +971,14 @@ static int armada_37xx_pinctrl_register(struct platform_device *pdev,
 	ctrldesc->pins = pindesc;
 	ctrldesc->npins = pin_data->nr_pins;
 
+	pin_names = devm_kasprintf_strarray(dev, pin_data->name, pin_data->nr_pins);
+	if (IS_ERR(pin_names))
+		return PTR_ERR(pin_names);
+
 	pdesc = pindesc;
 	for (pin = 0; pin < pin_data->nr_pins; pin++) {
 		pdesc->number = pin;
-		pdesc->name = kasprintf(GFP_KERNEL, "%s-%d",
-					pin_data->name, pin);
+		pdesc->name = pin_names[pin];
 		pdesc++;
 	}
 
-- 
2.33.0

