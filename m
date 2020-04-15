Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA2A71AA9A0
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 16:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636536AbgDOOPw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 10:15:52 -0400
Received: from mga04.intel.com ([192.55.52.120]:29682 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2636541AbgDOOPo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 10:15:44 -0400
IronPort-SDR: wXpZIDWv/gVhKdoMJC21IVmzfUa/8bEWKEkRxf3eXrAyfzkTA3egoHQRYEvrB5Yo85Dfrkz7Hi
 z8hbJUIizCCg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 07:15:40 -0700
IronPort-SDR: 6rbYQSBBdO01ZY6UtgcDv6sl4G/z3B23n4MNywzw7VOsCFbgwXawNGeRyXXmCqkhl9xq3BwXyP
 GTnoKKFokEGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; 
   d="scan'208";a="256870442"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 15 Apr 2020 07:15:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1298CF20; Wed, 15 Apr 2020 17:15:36 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v2 13/14] gpio: dwapb: Use positive conditional in dwapb_configure_irqs()
Date:   Wed, 15 Apr 2020 17:15:33 +0300
Message-Id: <20200415141534.31240-14-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The negative conditionals are harder to parse by reader.
Switch to positive one in dwapb_configure_irqs().

Cc: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 31d29ec6ab5c..84c971e0adf0 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -413,15 +413,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 	irq_gc->chip_types[1].type = IRQ_TYPE_EDGE_BOTH;
 	irq_gc->chip_types[1].handler = handle_edge_irq;
 
-	if (!pp->irq_shared) {
-		int i;
-
-		for (i = 0; i < pp->ngpio; i++) {
-			if (pp->irq[i] >= 0)
-				irq_set_chained_handler_and_data(pp->irq[i],
-						dwapb_irq_handler, gpio);
-		}
-	} else {
+	if (pp->irq_shared) {
 		/*
 		 * Request a shared IRQ since where MFD would have devices
 		 * using the same irq pin
@@ -435,6 +427,14 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 			gpio->domain = NULL;
 			return;
 		}
+	} else {
+		int i;
+
+		for (i = 0; i < pp->ngpio; i++) {
+			if (pp->irq[i] >= 0)
+				irq_set_chained_handler_and_data(pp->irq[i],
+						dwapb_irq_handler, gpio);
+		}
 	}
 
 	for (hwirq = 0 ; hwirq < ngpio ; hwirq++)
-- 
2.25.1

