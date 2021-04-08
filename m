Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB7935879D
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Apr 2021 16:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231984AbhDHO4I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Apr 2021 10:56:08 -0400
Received: from mga05.intel.com ([192.55.52.43]:31802 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231975AbhDHO4H (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Apr 2021 10:56:07 -0400
IronPort-SDR: W0sc57qQeO0RSCXTYjmmQj8c6UiyL/zO4tl5o0pZAbfyIEa0+CatHKqn8ULlJmL6/H1t1BrYHX
 TTcCFBN2ZcuQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="278832346"
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; 
   d="scan'208";a="278832346"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 07:55:55 -0700
IronPort-SDR: Rukh+CthRp+DiW2Y3EEQRTplqQgfqFUKtmgr9AltKMll3WKloKL2Jkwu96Y1O/IVf3LE2HHdJL
 x/ro+J+BOZ2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; 
   d="scan'208";a="419172789"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 08 Apr 2021 07:55:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 333CE619; Thu,  8 Apr 2021 17:56:05 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Syed Nayyar Waris <syednwaris@gmail.com>,
        vilhelm.gray@gmail.com
Subject: [PATCH v1 5/5] gpio: xilinx: No need to disable IRQs in the handler
Date:   Thu,  8 Apr 2021 17:56:01 +0300
Message-Id: <20210408145601.68651-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210408145601.68651-1-andriy.shevchenko@linux.intel.com>
References: <20210408145601.68651-1-andriy.shevchenko@linux.intel.com>
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
---
 drivers/gpio/gpio-xilinx.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 98d90b4c4d2b..d5a08dcdd677 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -503,14 +503,13 @@ static void xgpio_irqhandler(struct irq_desc *desc)
 	DECLARE_BITMAP(all, 64);
 	u32 status;
 	u32 bit;
-	unsigned long flags;
 
 	status = xgpio_readreg(chip->regs + XGPIO_IPISR_OFFSET);
 	xgpio_writereg(chip->regs + XGPIO_IPISR_OFFSET, status);
 
 	chained_irq_enter(irqchip, desc);
 
-	spin_lock_irqsave(&chip->gpio_lock, flags);
+	spin_lock(&chip->gpio_lock);
 
 	xgpio_read_ch_all(chip, XGPIO_DATA_OFFSET, all);
 
@@ -527,7 +526,7 @@ static void xgpio_irqhandler(struct irq_desc *desc)
 	bitmap_copy(chip->last_irq_read, all, 64);
 	bitmap_or(all, rising, falling, 64);
 
-	spin_unlock_irqrestore(&chip->gpio_lock, flags);
+	spin_unlock(&chip->gpio_lock);
 
 	dev_dbg(gc->parent, "IRQ rising %*pb falling %*pb\n", 64, rising, 64, falling);
 
-- 
2.30.2

