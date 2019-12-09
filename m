Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67D7D116D9A
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 14:09:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727268AbfLINJa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 08:09:30 -0500
Received: from mga04.intel.com ([192.55.52.120]:15272 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727038AbfLINJa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 08:09:30 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Dec 2019 05:09:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; 
   d="scan'208";a="219976294"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 09 Dec 2019 05:09:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4952114E; Mon,  9 Dec 2019 15:09:27 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 03/24] pinctrl: lynxpoint: Correct amount of pins
Date:   Mon,  9 Dec 2019 15:09:05 +0200
Message-Id: <20191209130926.86483-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
References: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
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
index c30fd86846a7..162fc38c929d 100644
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
2.24.0

