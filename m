Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A08DF1910
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 15:48:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728712AbfKFOsd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 09:48:33 -0500
Received: from mga14.intel.com ([192.55.52.115]:45533 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726945AbfKFOsd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 6 Nov 2019 09:48:33 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Nov 2019 06:48:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; 
   d="scan'208";a="192484618"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 06 Nov 2019 06:48:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1793F14E; Wed,  6 Nov 2019 16:48:30 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/8] pinctrl: lynxpoint: Correct amount of pins
Date:   Wed,  6 Nov 2019 16:48:24 +0200
Message-Id: <20191106144829.32275-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191106144829.32275-1-andriy.shevchenko@linux.intel.com>
References: <20191106144829.32275-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When we count from 0 it's possible to get into off-by-one error.
That's what had happened to this driver. So, correct amount of pins
and related typos in the code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index 6467095523cc..ebc523233df4 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -18,9 +18,9 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
-/* LynxPoint chipset has support for 94 gpio pins */
+/* LynxPoint chipset has support for 95 GPIO pins */
 
-#define LP_NUM_GPIO	94
+#define LP_NUM_GPIO	95
 
 /* Bitmapped register offsets */
 #define LP_ACPI_OWNED	0x00 /* Bitmap, set by bios, 0: pin reserved for ACPI */
@@ -54,11 +54,11 @@ struct lp_gpio {
 /*
  * Lynxpoint gpios are controlled through both bitmapped registers and
  * per gpio specific registers. The bitmapped registers are in chunks of
- * 3 x 32bit registers to cover all 94 gpios
+ * 3 x 32bit registers to cover all 95 GPIOs
  *
  * per gpio specific registers consist of two 32bit registers per gpio
- * (LP_CONFIG1 and LP_CONFIG2), with 94 gpios there's a total of
- * 188 config registers.
+ * (LP_CONFIG1 and LP_CONFIG2), with 95 GPIOs there's a total of
+ * 190 config registers.
  *
  * A simplified view of the register layout look like this:
  *
@@ -67,7 +67,7 @@ struct lp_gpio {
  * LP_ACPI_OWNED[94:64] gpio ownerships for gpios 63-94
  * ...
  * LP_INT_ENABLE[31:0] ...
- * LP_INT_ENABLE[63:31] ...
+ * LP_INT_ENABLE[63:32] ...
  * LP_INT_ENABLE[94:64] ...
  * LP0_CONFIG1 (gpio 0) config1 reg for gpio 0 (per gpio registers)
  * LP0_CONFIG2 (gpio 0) config2 reg for gpio 0
-- 
2.24.0.rc1

