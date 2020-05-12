Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECAF81CFD8C
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2020 20:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728324AbgELSpg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 May 2020 14:45:36 -0400
Received: from mga17.intel.com ([192.55.52.151]:64723 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725987AbgELSpg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 May 2020 14:45:36 -0400
IronPort-SDR: lhn3FNKlCLMm3X/MnloJuHP5L0tAooJyoGRRzdv25Rc6/9vB3awcRSzwCqZHVS8Hhr/X0umBoZ
 ORRLxf0wynxA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2020 11:45:35 -0700
IronPort-SDR: XjMfYwbYEPxAW6x7y8SZlGa19SAncrUbvZnRmWXKvz4O/sQvv5n0kSKOilty/WUOCzeJ1pIJcD
 iCFwGQoEQ/dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,384,1583222400"; 
   d="scan'208";a="252967041"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 12 May 2020 11:45:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9EEB725F; Tue, 12 May 2020 21:45:13 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v1 3/4] gpio: dwapb: Drop extra check to call acpi_gpiochip_request_interrupts()
Date:   Tue, 12 May 2020 21:45:12 +0300
Message-Id: <20200512184513.86883-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512184513.86883-1-andriy.shevchenko@linux.intel.com>
References: <20200512184513.86883-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is no need to have an additional check to call
acpi_gpiochip_request_interrupts(). Even without any interrupts available
the registered ACPI Event handlers can be useful for debugging purposes.

While at it, add missed acpi_gpiochip_free_interrupts() call when
unregistering ports.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 78662d6d73634e..2975f2d369874a 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -505,26 +505,33 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
 		dwapb_configure_irqs(gpio, port, pp);
 
 	err = gpiochip_add_data(&port->gc, port);
-	if (err)
+	if (err) {
 		dev_err(gpio->dev, "failed to register gpiochip for port%d\n",
 			port->idx);
-	else
-		port->is_registered = true;
+		return err;
+	}
 
 	/* Add GPIO-signaled ACPI event support */
-	if (pp->has_irq)
-		acpi_gpiochip_request_interrupts(&port->gc);
+	acpi_gpiochip_request_interrupts(&port->gc);
 
-	return err;
+	port->is_registered = true;
+
+	return 0;
 }
 
 static void dwapb_gpio_unregister(struct dwapb_gpio *gpio)
 {
 	unsigned int m;
 
-	for (m = 0; m < gpio->nr_ports; ++m)
-		if (gpio->ports[m].is_registered)
-			gpiochip_remove(&gpio->ports[m].gc);
+	for (m = 0; m < gpio->nr_ports; ++m) {
+		struct dwapb_gpio_port *port = &gpio->ports[m];
+
+		if (!port->is_registered)
+			continue;
+
+		acpi_gpiochip_free_interrupts(&port->gc);
+		gpiochip_remove(&port->gc);
+	}
 }
 
 static void dwapb_get_irq(struct device *dev, struct fwnode_handle *fwnode,
-- 
2.26.2

