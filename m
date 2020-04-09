Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 123331A357A
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2020 16:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727162AbgDIOMe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Apr 2020 10:12:34 -0400
Received: from mga02.intel.com ([134.134.136.20]:21918 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727041AbgDIOMe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Apr 2020 10:12:34 -0400
IronPort-SDR: ssTTxvjOVXfJ8kYSW6EK35phu1FTzowAsP+Q+e8m7VaLq0t7hv6ocnGbHn+CIpuINFrDf6Zxkn
 NTjBdy97JIAw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 07:12:34 -0700
IronPort-SDR: 5qQHVphe5gQhSSVPeDyPhsrc/E7a88tgU7uTMvUUwWxRULzeC6gQYa5eE0fQ60WRCLIuJuKqBn
 o7KgVd6kmmmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; 
   d="scan'208";a="244327337"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 09 Apr 2020 07:12:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 754BB766; Thu,  9 Apr 2020 17:12:29 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 02/13] gpio: dwapb: Refactor IRQ handler
Date:   Thu,  9 Apr 2020 17:12:17 +0300
Message-Id: <20200409141228.49561-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Refactor IRQ handler in order to:
- enter and exit chained IRQ
- use for_each_set_bit() helper

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-dwapb.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index c1b6d4f7307e..f61139f787d9 100644
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
@@ -216,10 +215,9 @@ static void dwapb_irq_handler(struct irq_desc *desc)
 	struct dwapb_gpio *gpio = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 
+	chained_irq_enter(chip, desc);
 	dwapb_do_irq(gpio);
-
-	if (chip->irq_eoi)
-		chip->irq_eoi(irq_desc_get_irq_data(desc));
+	chained_irq_exit(chip, desc);
 }
 
 static void dwapb_irq_enable(struct irq_data *d)
-- 
2.25.1

