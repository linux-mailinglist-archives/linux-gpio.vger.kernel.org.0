Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 394613797E4
	for <lists+linux-gpio@lfdr.de>; Mon, 10 May 2021 21:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231859AbhEJTrp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 May 2021 15:47:45 -0400
Received: from mga11.intel.com ([192.55.52.93]:13050 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231888AbhEJTrp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 May 2021 15:47:45 -0400
IronPort-SDR: c+krxA4hbDXpUTmMkuV+Az/cAVkxYaFogPmccbU/0HKEGPn+oS+Sa65BKu0WL7X1V5wHf/C1Dz
 XhrV+N9D0pvg==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="196181164"
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="196181164"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2021 12:46:39 -0700
IronPort-SDR: buGZfkBkjYKxe70vzI2EcwTs2CzIQFx9sTc4F0k1O0OqkDCpdVanWV0E0+m70/ySmcH3kSXbCr
 1C5kiKBllJhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="391096812"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 10 May 2021 12:46:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DEA15147; Mon, 10 May 2021 22:46:56 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Neeli Srinivas <sneeli@xilinx.com>
Subject: [PATCH v2 5/5] gpio: xilinx: No need to disable IRQs in the handler
Date:   Mon, 10 May 2021 22:46:33 +0300
Message-Id: <20210510194633.11943-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510194633.11943-1-andriy.shevchenko@linux.intel.com>
References: <20210510194633.11943-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In IRQ handler interrupts are already disabled, hence no need
to repeat it. Even in the threaded case, it is not a problem
because IRQ framework keeps interrupt disabled there as well.
Remove disabling IRQ part in the handler.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Neeli Srinivas <sneeli@xilinx.com>
---
 drivers/gpio/gpio-xilinx.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index d2b7458b1d69..109b32104867 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -509,14 +509,13 @@ static void xgpio_irqhandler(struct irq_desc *desc)
 	int irq_offset;
 	u32 status;
 	u32 bit;
-	unsigned long flags;
 
 	status = xgpio_readreg(chip->regs + XGPIO_IPISR_OFFSET);
 	xgpio_writereg(chip->regs + XGPIO_IPISR_OFFSET, status);
 
 	chained_irq_enter(irqchip, desc);
 
-	spin_lock_irqsave(&chip->gpio_lock, flags);
+	spin_lock(&chip->gpio_lock);
 
 	xgpio_read_ch_all(chip, XGPIO_DATA_OFFSET, all);
 
@@ -533,7 +532,7 @@ static void xgpio_irqhandler(struct irq_desc *desc)
 	bitmap_copy(chip->last_irq_read, all, 64);
 	bitmap_or(all, rising, falling, 64);
 
-	spin_unlock_irqrestore(&chip->gpio_lock, flags);
+	spin_unlock(&chip->gpio_lock);
 
 	dev_dbg(gc->parent, "IRQ rising %*pb falling %*pb\n", 64, rising, 64, falling);
 
-- 
2.30.2

