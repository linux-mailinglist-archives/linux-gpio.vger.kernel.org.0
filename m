Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC821CFD7F
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2020 20:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbgELSpQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 May 2020 14:45:16 -0400
Received: from mga17.intel.com ([192.55.52.151]:64667 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725950AbgELSpQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 May 2020 14:45:16 -0400
IronPort-SDR: Tv9N8zXmVJlaFMbvXx6I5RkzAACJR6C5OHwzKk9SoceI8FTljiuS7yWtG44eAxOqbeQa33t2cv
 dVU3HYbHA5/Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2020 11:45:15 -0700
IronPort-SDR: tiWvtfu9SUARkm0VQrFjGv94Eq47Ws2coK5VJ3cqVG/sd1x04J8Ehl65a56svw8t3Ck3pw6XIY
 HiuuxaT+Kljw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,384,1583222400"; 
   d="scan'208";a="252966987"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 12 May 2020 11:45:14 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 99D896A; Tue, 12 May 2020 21:45:13 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v1 2/4] gpio: dwapb: Don't use 0 as valid Linux interrupt number
Date:   Tue, 12 May 2020 21:45:11 +0300
Message-Id: <20200512184513.86883-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512184513.86883-1-andriy.shevchenko@linux.intel.com>
References: <20200512184513.86883-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

0 is not valid IRQ number in Linux interrupt number space.
Refactor the code with this kept in mind.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 5bc5057f071f37..78662d6d73634e 100644
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
@@ -531,23 +531,23 @@ static void dwapb_get_irq(struct device *dev, struct fwnode_handle *fwnode,
 			  struct dwapb_port_property *pp)
 {
 	struct device_node *np = NULL;
-	int j;
+	int err, j;
 
 	if (fwnode_property_read_bool(fwnode, "interrupt-controller"))
 		np = to_of_node(fwnode);
 
 	for (j = 0; j < pp->ngpio; j++) {
-		pp->irq[j] = -ENXIO;
-
 		if (np)
-			pp->irq[j] = of_irq_get(np, j);
+			err = of_irq_get(np, j);
 		else if (has_acpi_companion(dev))
-			pp->irq[j] = platform_get_irq_optional(to_platform_device(dev), j);
+			err = platform_get_irq_optional(to_platform_device(dev), j);
+		if (err < 0)
+			continue;
 
-		if (pp->irq[j] >= 0)
-			pp->has_irq = true;
+		pp->irq[j] = err;
 	}
 
+	pp->has_irq = memchr_inv(pp->irq, 0, sizeof(pp->irq)) != NULL;
 	if (!pp->has_irq)
 		dev_warn(dev, "no irq for port%d\n", pp->idx);
 }
-- 
2.26.2

