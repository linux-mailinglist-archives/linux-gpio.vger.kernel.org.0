Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96261446386
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 13:43:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233178AbhKEMqK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 08:46:10 -0400
Received: from mga17.intel.com ([192.55.52.151]:39696 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233006AbhKEMpy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Nov 2021 08:45:54 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="212634184"
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="212634184"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2021 05:43:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="490310854"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 05 Nov 2021 05:43:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id F15A8B0F; Fri,  5 Nov 2021 14:43:01 +0200 (EET)
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
Subject: [PATCH v1 19/19] gpio: mockup: Switch to use kasprintf_strarray()
Date:   Fri,  5 Nov 2021 14:42:42 +0200
Message-Id: <20211105124242.27288-19-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
References: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since we have a generic helper, switch the module to use it.
No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-mockup.c | 23 +----------------------
 1 file changed, 1 insertion(+), 22 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index d26bff29157b..8943cea92764 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -491,27 +491,6 @@ static void gpio_mockup_unregister_pdevs(void)
 	}
 }
 
-static __init char **gpio_mockup_make_line_names(const char *label,
-						 unsigned int num_lines)
-{
-	unsigned int i;
-	char **names;
-
-	names = kcalloc(num_lines + 1, sizeof(char *), GFP_KERNEL);
-	if (!names)
-		return NULL;
-
-	for (i = 0; i < num_lines; i++) {
-		names[i] = kasprintf(GFP_KERNEL, "%s-%u", label, i);
-		if (!names[i]) {
-			kfree_strarray(names, i);
-			return NULL;
-		}
-	}
-
-	return names;
-}
-
 static int __init gpio_mockup_register_chip(int idx)
 {
 	struct property_entry properties[GPIO_MOCKUP_MAX_PROP];
@@ -538,7 +517,7 @@ static int __init gpio_mockup_register_chip(int idx)
 	properties[prop++] = PROPERTY_ENTRY_U16("nr-gpios", ngpio);
 
 	if (gpio_mockup_named_lines) {
-		line_names = gpio_mockup_make_line_names(chip_label, ngpio);
+		line_names = kasprintf_strarray(GFP_KERNEL, chip_label, ngpio);
 		if (!line_names)
 			return -ENOMEM;
 
-- 
2.33.0

