Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFE68116DAC
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 14:09:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727648AbfLINJh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 08:09:37 -0500
Received: from mga02.intel.com ([134.134.136.20]:29936 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727645AbfLINJf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 08:09:35 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Dec 2019 05:09:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; 
   d="scan'208";a="295551565"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 09 Dec 2019 05:09:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 3A529C3F; Mon,  9 Dec 2019 15:09:28 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 24/24] pinctrl: lynxpoint: Update summary in the driver
Date:   Mon,  9 Dec 2019 15:09:26 +0200
Message-Id: <20191209130926.86483-25-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
References: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Reflect in the driver that it is now a pin control one.

While here, update copyright years and authors.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index 774b226f3a4d..e928742c7181 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -1,9 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * GPIO controller driver for Intel Lynxpoint PCH chipset>
- * Copyright (c) 2012, Intel Corporation.
+ * Intel Lynxpoint PCH pinctrl/GPIO driver
  *
- * Author: Mathias Nyman <mathias.nyman@linux.intel.com>
+ * Copyright (c) 2012, 2019, Intel Corporation
+ * Authors: Mathias Nyman <mathias.nyman@linux.intel.com>
+ *          Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  */
 
 #include <linux/acpi.h>
@@ -968,6 +969,7 @@ subsys_initcall(lp_gpio_init);
 module_exit(lp_gpio_exit);
 
 MODULE_AUTHOR("Mathias Nyman (Intel)");
-MODULE_DESCRIPTION("GPIO interface for Intel Lynxpoint");
+MODULE_AUTHOR("Andy Shevchenko (Intel)");
+MODULE_DESCRIPTION("Intel Lynxpoint pinctrl driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:lp_gpio");
-- 
2.24.0

