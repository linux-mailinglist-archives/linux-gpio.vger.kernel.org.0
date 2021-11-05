Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C9C2446385
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 13:43:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233027AbhKEMqJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 08:46:09 -0400
Received: from mga04.intel.com ([192.55.52.120]:61253 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232727AbhKEMpw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Nov 2021 08:45:52 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="230614570"
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="230614570"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2021 05:43:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="730520456"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 05 Nov 2021 05:43:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DDDE5ABE; Fri,  5 Nov 2021 14:43:01 +0200 (EET)
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
Subject: [PATCH v1 17/19] pinctrl: st: Switch to use devm_kasprintf_strarray()
Date:   Fri,  5 Nov 2021 14:42:40 +0200
Message-Id: <20211105124242.27288-17-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/pinctrl-st.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index 9cb0da88b098..0fea71fd9a00 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -1624,6 +1624,8 @@ static int st_pctl_probe_dt(struct platform_device *pdev,
 	for_each_child_of_node(np, child) {
 		if (of_property_read_bool(child, "gpio-controller")) {
 			const char *bank_name = NULL;
+			char **pin_names;
+
 			ret = st_gpiolib_register_bank(info, bank, child);
 			if (ret) {
 				of_node_put(child);
@@ -1632,10 +1634,16 @@ static int st_pctl_probe_dt(struct platform_device *pdev,
 
 			k = info->banks[bank].range.pin_base;
 			bank_name = info->banks[bank].range.name;
+
+			pin_names = devm_kasprintf_strarray(dev, bank_name, ST_GPIO_PINS_PER_BANK);
+			if (IS_ERR(pin_names)) {
+				of_node_put(child);
+				return PTR_ERR(pin_names);
+			}
+
 			for (j = 0; j < ST_GPIO_PINS_PER_BANK; j++, k++) {
 				pdesc->number = k;
-				pdesc->name = kasprintf(GFP_KERNEL, "%s[%d]",
-							bank_name, j);
+				pdesc->name = pin_names[j];
 				pdesc++;
 			}
 			st_parse_syscfgs(info, bank, child);
-- 
2.33.0

