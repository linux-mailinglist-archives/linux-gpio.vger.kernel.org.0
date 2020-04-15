Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF221AA99F
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 16:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636535AbgDOOPt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 10:15:49 -0400
Received: from mga04.intel.com ([192.55.52.120]:29678 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2636536AbgDOOPm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 10:15:42 -0400
IronPort-SDR: eZTVJ0E2FDrFftgR+jRYM4Be+Y1/WNaHPrfprMGGt2X55PbUpna4oJ7HxwCaZaqDWNTBu6kmPH
 Hv4AJrRN8lhA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 07:15:38 -0700
IronPort-SDR: DwIjJ1VGBrkDLu8hYfibqRG9SNwt2Sk3ZIP36FPPE7eBBSslPY3nOCbllKJAgd+8qjG74+6FO8
 4kr7FAPjP4qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; 
   d="scan'208";a="256870435"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 15 Apr 2020 07:15:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 96AEB4FD; Wed, 15 Apr 2020 17:15:35 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v2 02/14] gpio: dwapb: Refactor IRQ handler to use bit operations
Date:   Wed, 15 Apr 2020 17:15:22 +0300
Message-Id: <20200415141534.31240-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Refactor IRQ handler in order to use for_each_set_bit() helper.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index c1b6d4f7307e..e89a3c6877aa 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -193,22 +193,21 @@ static void dwapb_toggle_trigger(struct dwapb_gpio *gpio, unsigned int offs)
 
 static u32 dwapb_do_irq(struct dwapb_gpio *gpio)
 {
-	u32 irq_status = dwapb_read(gpio, GPIO_INTSTATUS);
-	u32 ret = irq_status;
+	unsigned long irq_status;
+	int hwirq;
 
-	while (irq_status) {
-		int hwirq = fls(irq_status) - 1;
+	irq_status = dwapb_read(gpio, GPIO_INTSTATUS);
+	for_each_set_bit(hwirq, &irq_status, 32) {
 		int gpio_irq = irq_find_mapping(gpio->domain, hwirq);
+		u32 irq_type = irq_get_trigger_type(gpio_irq);
 
 		generic_handle_irq(gpio_irq);
-		irq_status &= ~BIT(hwirq);
 
-		if ((irq_get_trigger_type(gpio_irq) & IRQ_TYPE_SENSE_MASK)
-			== IRQ_TYPE_EDGE_BOTH)
+		if ((irq_type & IRQ_TYPE_SENSE_MASK) == IRQ_TYPE_EDGE_BOTH)
 			dwapb_toggle_trigger(gpio, hwirq);
 	}
 
-	return ret;
+	return irq_status;
 }
 
 static void dwapb_irq_handler(struct irq_desc *desc)
-- 
2.25.1

