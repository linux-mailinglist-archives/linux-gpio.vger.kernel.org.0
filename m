Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBF80358881
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Apr 2021 17:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232203AbhDHPbd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Apr 2021 11:31:33 -0400
Received: from mga06.intel.com ([134.134.136.31]:26865 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232245AbhDHPbb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Apr 2021 11:31:31 -0400
IronPort-SDR: 0VPPR/EsZg0ViJ85bCbiX5HlOBSD7Dqax6S0QYdbzXERrFdzY5VOv8kXU5FXae/UbeyW5QS5Qg
 bT/vlPfPNq/Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="254903592"
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; 
   d="scan'208";a="254903592"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 08:31:02 -0700
IronPort-SDR: AMoFeEDi9BjzfvhdZSHH6j8m5Z0sEJmZNKIeFJjDniEURWfLQ0S3WyI+m2gfml+P5TqU9xGpeO
 33A7tocTJeug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; 
   d="scan'208";a="422295421"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 08 Apr 2021 08:30:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id ABBCFFC; Thu,  8 Apr 2021 18:31:12 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Syed Nayyar Waris <syednwaris@gmail.com>,
        vilhelm.gray@gmail.com
Subject: [PATCH 1/1] drivers/gpio/gpio-xilinx.c (updated): bitmap-fix
Date:   Thu,  8 Apr 2021 18:31:08 +0300
Message-Id: <20210408153108.81738-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <YG8cWBkcF8ulHW0D@smile.fi.intel.com>
References: <YG8cWBkcF8ulHW0D@smile.fi.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-xilinx.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index d5a08dcdd677..109b32104867 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -75,9 +75,14 @@ struct xgpio_instance {
 	struct clk *clk;
 };
 
+static inline int xgpio_from_bit(struct xgpio_instance *chip, int bit)
+{
+	return bitmap_bitremap(bit, chip->hw_map, chip->sw_map, 64);
+}
+
 static inline int xgpio_to_bit(struct xgpio_instance *chip, int gpio)
 {
-	return bitmap_bitremap(gpio, chip->sw_map, chip->hw_map, chip->gc.ngpio);
+	return bitmap_bitremap(gpio, chip->sw_map, chip->hw_map, 64);
 }
 
 static inline u32 xgpio_get_value32(const unsigned long *map, int bit)
@@ -207,11 +212,11 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 
 	spin_lock_irqsave(&chip->gpio_lock, flags);
 
-	bitmap_replace(state, chip->state, hw_bits, hw_mask, gc->ngpio);
+	bitmap_replace(state, chip->state, hw_bits, hw_mask, 64);
 
 	xgpio_write_ch_all(chip, XGPIO_DATA_OFFSET, state);
 
-	bitmap_copy(chip->state, state, gc->ngpio);
+	bitmap_copy(chip->state, state, 64);
 
 	spin_unlock_irqrestore(&chip->gpio_lock, flags);
 }
@@ -501,6 +506,7 @@ static void xgpio_irqhandler(struct irq_desc *desc)
 	DECLARE_BITMAP(rising, 64);
 	DECLARE_BITMAP(falling, 64);
 	DECLARE_BITMAP(all, 64);
+	int irq_offset;
 	u32 status;
 	u32 bit;
 
@@ -530,8 +536,10 @@ static void xgpio_irqhandler(struct irq_desc *desc)
 
 	dev_dbg(gc->parent, "IRQ rising %*pb falling %*pb\n", 64, rising, 64, falling);
 
-	for_each_set_bit(bit, all, 64)
-		generic_handle_irq(irq_find_mapping(gc->irq.domain, bit));
+	for_each_set_bit(bit, all, 64) {
+		irq_offset = xgpio_from_bit(chip, bit);
+		generic_handle_irq(irq_find_mapping(gc->irq.domain, irq_offset));
+	}
 
 	chained_irq_exit(irqchip, desc);
 }
-- 
2.30.2

