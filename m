Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71EB5446371
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 13:43:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232105AbhKEMpw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 08:45:52 -0400
Received: from mga04.intel.com ([192.55.52.120]:61253 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232647AbhKEMpv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Nov 2021 08:45:51 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="230614543"
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="230614543"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2021 05:43:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="730520446"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 05 Nov 2021 05:43:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 64BAB512; Fri,  5 Nov 2021 14:43:01 +0200 (EET)
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
Subject: [PATCH v1 07/19] pinctrl/rockchip: Switch to use devm_kasprintf_strarray()
Date:   Fri,  5 Nov 2021 14:42:30 +0200
Message-Id: <20211105124242.27288-7-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/pinctrl-rockchip.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 929c96ea621a..438808a867cf 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -33,6 +33,8 @@
 #include <linux/clk.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
+#include <linux/string_helpers.h>
+
 #include <dt-bindings/pinctrl/rockchip.h>
 
 #include "core.h"
@@ -2452,6 +2454,7 @@ static int rockchip_pinctrl_register(struct platform_device *pdev,
 	struct pinctrl_pin_desc *pindesc, *pdesc;
 	struct rockchip_pin_bank *pin_bank;
 	struct device *dev = &pdev->dev;
+	char **pin_names;
 	int pin, bank, ret;
 	int k;
 
@@ -2471,10 +2474,14 @@ static int rockchip_pinctrl_register(struct platform_device *pdev,
 	pdesc = pindesc;
 	for (bank = 0, k = 0; bank < info->ctrl->nr_banks; bank++) {
 		pin_bank = &info->ctrl->pin_banks[bank];
+
+		pin_names = devm_kasprintf_strarray(dev, pin_bank->name, pin_bank->nr_pins);
+		if (IS_ERR(pin_names))
+			return PTR_ERR(pin_names);
+
 		for (pin = 0; pin < pin_bank->nr_pins; pin++, k++) {
 			pdesc->number = k;
-			pdesc->name = kasprintf(GFP_KERNEL, "%s-%d",
-						pin_bank->name, pin);
+			pdesc->name = pin_names[pin];
 			pdesc++;
 		}
 
-- 
2.33.0

