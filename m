Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46BF21AA9A8
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 16:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636542AbgDOOQv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 10:16:51 -0400
Received: from mga11.intel.com ([192.55.52.93]:43694 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2636534AbgDOOPo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 10:15:44 -0400
IronPort-SDR: 5Pumu5PYRBlP3lYjUfL7RidH/ywaNol+7VeJTYvsUn5luLSqsFzgFasEK4NKkwG5ENYZtpzV2g
 gNFGbrve75hw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 07:15:40 -0700
IronPort-SDR: yVQevDPK2dAUDetaohQH70jKArmXYWpyX3IwpOuZP3nBZCYHI0tMwmkPMSFvoLCody2FGHICLW
 EZAb5SV9+BfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; 
   d="scan'208";a="277627690"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 15 Apr 2020 07:15:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 02F67CA1; Wed, 15 Apr 2020 17:15:36 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v2 12/14] gpio: dwapb: Split out dwapb_get_irq() helper
Date:   Wed, 15 Apr 2020 17:15:32 +0300
Message-Id: <20200415141534.31240-13-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Split out dwapb_get_irq() helper for better readability and maintenance.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 56 ++++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 98e1ffcd432b..31d29ec6ab5c 100644
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

