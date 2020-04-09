Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7EED1A3583
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2020 16:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727220AbgDIOMm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Apr 2020 10:12:42 -0400
Received: from mga14.intel.com ([192.55.52.115]:57758 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727181AbgDIOMm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Apr 2020 10:12:42 -0400
IronPort-SDR: sAMoVicTidBwtv5g+z7ZjqyMdQJcdNl+nYFrN999Ir7XksvnmbraDzxvQUQp+PkSS5u2ABZHkO
 RZw+i2eZBc0A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 07:12:35 -0700
IronPort-SDR: LnLSyMuXg2KQbPYEz1+0tgSmqkq1IpD+aLHul01SP59gm2fesoZcfk2h6Pn4ccEpXyrps+oxZn
 yCNy531IzM+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; 
   d="scan'208";a="251905223"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 09 Apr 2020 07:12:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D10F1CAE; Thu,  9 Apr 2020 17:12:29 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 12/13] gpio: dwapb: Use positive conditional in dwapb_configure_irqs()
Date:   Thu,  9 Apr 2020 17:12:27 +0300
Message-Id: <20200409141228.49561-13-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The negative conditionals are harder to parse by reader.
Switch to positive one in dwapb_configure_irqs().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-dwapb.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 7789410fe15e..bbaf909a463a 100644
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

