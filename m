Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13784446387
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 13:43:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233181AbhKEMqL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 08:46:11 -0400
Received: from mga17.intel.com ([192.55.52.151]:39696 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232997AbhKEMpx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Nov 2021 08:45:53 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="212634182"
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="212634182"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2021 05:43:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="490310853"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 05 Nov 2021 05:43:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E7B6EB02; Fri,  5 Nov 2021 14:43:01 +0200 (EET)
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
Subject: [PATCH v1 18/19] pinctrl: zynqmp: Unify pin naming
Date:   Fri,  5 Nov 2021 14:42:41 +0200
Message-Id: <20211105124242.27288-18-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
References: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since we have devm_kasprintf_strarray() helper, which is used in
the rest of pin control drivers, it makes sense to switch this
driver to it. The pin names are not part of any ABI and hence
there will be no regression based on that. Otherwise all generated
pin names will follow the same schema in the pin control subsystem.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-zynqmp.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
index e14012209992..6cc307595783 100644
--- a/drivers/pinctrl/pinctrl-zynqmp.c
+++ b/drivers/pinctrl/pinctrl-zynqmp.c
@@ -809,6 +809,7 @@ static int zynqmp_pinctrl_prepare_pin_desc(struct device *dev,
 					   unsigned int *npins)
 {
 	struct pinctrl_pin_desc *pins, *pin;
+	char **pin_names;
 	int ret;
 	int i;
 
@@ -820,13 +821,14 @@ static int zynqmp_pinctrl_prepare_pin_desc(struct device *dev,
 	if (!pins)
 		return -ENOMEM;
 
+	pin_names = devm_kasprintf_strarray(dev, ZYNQMP_PIN_PREFIX, *npins);
+	if (IS_ERR(pin->name))
+		return PTR_ERR(pin_names);
+
 	for (i = 0; i < *npins; i++) {
 		pin = &pins[i];
 		pin->number = i;
-		pin->name = devm_kasprintf(dev, GFP_KERNEL, "%s%d",
-					   ZYNQMP_PIN_PREFIX, i);
-		if (!pin->name)
-			return -ENOMEM;
+		pin->name = pin_names[i];
 	}
 
 	*zynqmp_pins = pins;
-- 
2.33.0

