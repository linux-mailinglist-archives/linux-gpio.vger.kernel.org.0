Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8843446372
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 13:43:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232992AbhKEMpx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 08:45:53 -0400
Received: from mga05.intel.com ([192.55.52.43]:64724 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232593AbhKEMpp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Nov 2021 08:45:45 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="318091779"
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="318091779"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2021 05:43:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="600603504"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 05 Nov 2021 05:43:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4B82849B; Fri,  5 Nov 2021 14:43:01 +0200 (EET)
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
Subject: [PATCH v1 05/19] pinctrl/rockchip: Make use of the devm_platform_get_and_ioremap_resource()
Date:   Fri,  5 Nov 2021 14:42:28 +0200
Message-Id: <20211105124242.27288-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
References: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the devm_platform_get_and_ioremap_resource() helper instead of
calling platform_get_resource() and devm_ioremap_resource()
separately.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index ae80c95bae87..7206ee30a6b2 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -2697,8 +2697,7 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 		if (IS_ERR(info->regmap_base))
 			return PTR_ERR(info->regmap_base);
 	} else {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		base = devm_ioremap_resource(&pdev->dev, res);
+		base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 		if (IS_ERR(base))
 			return PTR_ERR(base);
 
@@ -2712,8 +2711,7 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 
 		/* Honor the old binding, with pull registers as 2nd resource */
 		if (ctrl->type == RK3188 && info->reg_size < 0x200) {
-			res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-			base = devm_ioremap_resource(&pdev->dev, res);
+			base = devm_platform_get_and_ioremap_resource(pdev, 1, &res);
 			if (IS_ERR(base))
 				return PTR_ERR(base);
 
-- 
2.33.0

