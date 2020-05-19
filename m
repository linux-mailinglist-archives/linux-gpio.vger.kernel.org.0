Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0811D9744
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2020 15:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728845AbgESNMj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 May 2020 09:12:39 -0400
Received: from mga02.intel.com ([134.134.136.20]:10267 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728954AbgESNMi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 19 May 2020 09:12:38 -0400
IronPort-SDR: IF/wTzaU6rNuyF+MWdcCXhoQMPk7gBNKKIMEGB8UBNfSyIxLGXJYnO/zf8HExSLMyogHb1oSdS
 lVeZ2/l957KQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 06:12:37 -0700
IronPort-SDR: 3yjeVBPOeSPga8QLAeqkXpib26FpwWCh53goDAoQUCfyHmaum4RROKsAH5ccm9KI/1WZ4IlP9I
 jtptPSJQleGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,410,1583222400"; 
   d="scan'208";a="439613510"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 19 May 2020 06:12:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A9AD919E; Tue, 19 May 2020 16:12:34 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v3 3/4] gpio: dwapb: Don't use IRQ 0 as valid Linux interrupt
Date:   Tue, 19 May 2020 16:12:32 +0300
Message-Id: <20200519131233.59032-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519131233.59032-1-andriy.shevchenko@linux.intel.com>
References: <20200519131233.59032-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

IRQ 0 is not valid in Linux interrupt number space.
Refactor the code with this kept in mind.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Serge Semin <fancer.lancer@gmail.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
---
v3: appended tags (Serge)

 drivers/gpio/gpio-dwapb.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 944dae80d687..d3765672c42b 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -417,7 +417,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 		int i;
 
 		for (i = 0; i < pp->ngpio; i++) {
-			if (pp->irq[i] >= 0)
+			if (pp->irq[i])
 				irq_set_chained_handler_and_data(pp->irq[i],
 						dwapb_irq_handler, gpio);
 		}
@@ -538,20 +538,20 @@ static void dwapb_get_irq(struct device *dev, struct fwnode_handle *fwnode,
 			  struct dwapb_port_property *pp)
 {
 	struct device_node *np = NULL;
-	int j;
+	int irq = -ENXIO, j;
 
 	if (fwnode_property_read_bool(fwnode, "interrupt-controller"))
 		np = to_of_node(fwnode);
 
 	for (j = 0; j < pp->ngpio; j++) {
-		pp->irq[j] = -ENXIO;
-
 		if (np)
-			pp->irq[j] = of_irq_get(np, j);
+			irq = of_irq_get(np, j);
 		else if (has_acpi_companion(dev))
-			pp->irq[j] = platform_get_irq_optional(to_platform_device(dev), j);
+			irq = platform_get_irq_optional(to_platform_device(dev), j);
+		if (irq > 0)
+			pp->irq[j] = irq;
 
-		if (pp->irq[j] >= 0)
+		if (pp->irq[j])
 			pp->has_irq = true;
 	}
 
-- 
2.26.2

