Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4413C3977DC
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 18:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233904AbhFAQW5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 12:22:57 -0400
Received: from mga17.intel.com ([192.55.52.151]:16173 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234021AbhFAQW5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 1 Jun 2021 12:22:57 -0400
IronPort-SDR: 1Crhr4A11propdC2FZgbjAg5DGww/nBjqBSkyf/nmhtNEg/3/YkTuLiY2zsvni+hTxN71MfhGQ
 7eX3g0rMVmEA==
X-IronPort-AV: E=McAfee;i="6200,9189,10002"; a="183941753"
X-IronPort-AV: E=Sophos;i="5.83,240,1616482800"; 
   d="scan'208";a="183941753"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2021 09:21:14 -0700
IronPort-SDR: inWOS2hhhCu2cW/feIREiAOO5utYQe3WzK78RD19zipr2n+kMFIAX16ytZp/GP6xls++SDtAFn
 8fW1NeUEdZcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,240,1616482800"; 
   d="scan'208";a="479340729"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 01 Jun 2021 09:21:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2830EFD; Tue,  1 Jun 2021 19:21:34 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v1 2/2] gpio: dwapb: Switch to use fwnode_irq_get()
Date:   Tue,  1 Jun 2021 19:21:28 +0300
Message-Id: <20210601162128.35663-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210601162128.35663-1-andriy.shevchenko@linux.intel.com>
References: <20210601162128.35663-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We have open coded variant of fwnode_irq_get() in dwapb_get_irq().
Replace it with a simple call.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-dwapb.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 939701c1465e..7d61f5821e32 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -528,17 +528,13 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
 static void dwapb_get_irq(struct device *dev, struct fwnode_handle *fwnode,
 			  struct dwapb_port_property *pp)
 {
-	struct device_node *np = NULL;
-	int irq = -ENXIO, j;
-
-	if (fwnode_property_read_bool(fwnode, "interrupt-controller"))
-		np = to_of_node(fwnode);
+	int irq, j;
 
 	for (j = 0; j < pp->ngpio; j++) {
-		if (np)
-			irq = of_irq_get(np, j);
-		else if (has_acpi_companion(dev))
+		if (has_acpi_companion(dev))
 			irq = platform_get_irq_optional(to_platform_device(dev), j);
+		else
+			irq = fwnode_irq_get(fwnode, j);
 		if (irq > 0)
 			pp->irq[j] = irq;
 	}
-- 
2.30.2

