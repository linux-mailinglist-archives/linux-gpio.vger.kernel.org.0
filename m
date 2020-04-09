Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7668E1A3582
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2020 16:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727244AbgDIOMm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Apr 2020 10:12:42 -0400
Received: from mga14.intel.com ([192.55.52.115]:57753 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727220AbgDIOMl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Apr 2020 10:12:41 -0400
IronPort-SDR: tacuXIJnlYbQh9OnpV8gc7hK+z7WEl3aZ0F6WWwwD0fHZMomQYgE0pk1HoKjV8Ulg9NT6f1lGs
 7TcqjAyQqFoA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 07:12:35 -0700
IronPort-SDR: a+eXNgdKK92g8LkY3EYm0VtI/hw92+Y5sYdFbXImdXnjFZJVcavM0ikD/LQskFqgUT1z/grIHh
 PzPaRUWGb3EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; 
   d="scan'208";a="251905224"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 09 Apr 2020 07:12:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id CB4E3CBC; Thu,  9 Apr 2020 17:12:29 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 11/13] gpio: dwapb: Split out dwapb_get_irq() helper
Date:   Thu,  9 Apr 2020 17:12:26 +0300
Message-Id: <20200409141228.49561-12-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Split out dwapb_get_irq() helper for better readability and maintenance.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-dwapb.c | 56 ++++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 5b93967a4c96..7789410fe15e 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -528,14 +528,38 @@ static void dwapb_gpio_unregister(struct dwapb_gpio *gpio)
 			gpiochip_remove(&gpio->ports[m].gc);
 }
 
-static struct dwapb_platform_data *
-dwapb_gpio_get_pdata(struct device *dev)
+static void dwapb_get_irq(struct device *dev, struct fwnode_handle *fwnode,
+			  struct dwapb_port_property *pp)
+{
+	struct device_node *np = NULL;
+	int j;
+
+	if (fwnode_property_read_bool(fwnode, "interrupt-controller"))
+		np = to_of_node(fwnode);
+
+	for (j = 0; j < pp->ngpio; j++) {
+		pp->irq[j] = -ENXIO;
+
+		if (np)
+			pp->irq[j] = of_irq_get(np, j);
+		else if (has_acpi_companion(dev))
+			pp->irq[j] = platform_get_irq(to_platform_device(dev), j);
+
+		if (pp->irq[j] >= 0)
+			pp->has_irq = true;
+	}
+
+	if (!pp->has_irq)
+		dev_warn(dev, "no irq for port%d\n", pp->idx);
+}
+
+static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
 {
 	struct fwnode_handle *fwnode;
 	struct dwapb_platform_data *pdata;
 	struct dwapb_port_property *pp;
 	int nports;
-	int i, j;
+	int i;
 
 	nports = device_get_child_node_count(dev);
 	if (nports == 0)
@@ -553,8 +577,6 @@ dwapb_gpio_get_pdata(struct device *dev)
 
 	i = 0;
 	device_for_each_child_node(dev, fwnode)  {
-		struct device_node *np = NULL;
-
 		pp = &pdata->properties[i++];
 		pp->fwnode = fwnode;
 
@@ -581,28 +603,8 @@ dwapb_gpio_get_pdata(struct device *dev)
 		 * Only port A can provide interrupts in all configurations of
 		 * the IP.
 		 */
-		if (pp->idx != 0)
-			continue;
-
-		if (dev->of_node && fwnode_property_read_bool(fwnode,
-						  "interrupt-controller")) {
-			np = to_of_node(fwnode);
-		}
-
-		for (j = 0; j < pp->ngpio; j++) {
-			pp->irq[j] = -ENXIO;
-
-			if (np)
-				pp->irq[j] = of_irq_get(np, j);
-			else if (has_acpi_companion(dev))
-				pp->irq[j] = platform_get_irq(to_platform_device(dev), j);
-
-			if (pp->irq[j] >= 0)
-				pp->has_irq = true;
-		}
-
-		if (!pp->has_irq)
-			dev_warn(dev, "no irq for port%d\n", pp->idx);
+		if (pp->idx == 0)
+			dwapb_get_irq(dev, fwnode, pp);
 	}
 
 	return pdata;
-- 
2.25.1

