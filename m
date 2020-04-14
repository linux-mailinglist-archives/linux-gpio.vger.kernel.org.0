Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A84C51A87F4
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 19:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502812AbgDNRuC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 13:50:02 -0400
Received: from mga06.intel.com ([134.134.136.31]:42046 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502810AbgDNRt7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 13:49:59 -0400
IronPort-SDR: odRXMTNID2OE9dZLkOHhE5xN0ISTugsykz/svCTwfK6CalH0v4Q7WUR+FbiZbBOhvdnuZ5DAvZ
 smTcuzEjlhFg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 10:49:03 -0700
IronPort-SDR: QVL/lhv82ns5+hjE0D0Ssu7yJdrsJjSauiLP0V2gu6k54YNAMq9yc16jxFUJj+0YwNrhJRLFJL
 mhWazJWj5IkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; 
   d="scan'208";a="453623130"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 14 Apr 2020 10:49:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8B0AA1A1; Tue, 14 Apr 2020 20:49:01 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 3/4] gpio: pch: Refactor pch_irq_type() to avoid unnecessary locking
Date:   Tue, 14 Apr 2020 20:48:59 +0300
Message-Id: <20200414174900.5099-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414174900.5099-1-andriy.shevchenko@linux.intel.com>
References: <20200414174900.5099-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When type is not supported there is no need to lock and check.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: new patch
 drivers/gpio/gpio-pch.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index 708272db6baf..9c34230f2e84 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -229,17 +229,15 @@ static int pch_irq_type(struct irq_data *d, unsigned int type)
 	int ch, irq = d->irq;
 
 	ch = irq - chip->irq_base;
-	if (irq <= chip->irq_base + 7) {
+	if (irq < chip->irq_base + 8) {
 		im_reg = &chip->reg->im0;
-		im_pos = ch;
+		im_pos = ch - 0;
 	} else {
 		im_reg = &chip->reg->im1;
 		im_pos = ch - 8;
 	}
 	dev_dbg(chip->dev, "irq=%d type=%d ch=%d pos=%d\n", irq, type, ch, im_pos);
 
-	spin_lock_irqsave(&chip->spinlock, flags);
-
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
 		val = PCH_EDGE_RISING;
@@ -257,9 +255,11 @@ static int pch_irq_type(struct irq_data *d, unsigned int type)
 		val = PCH_LEVEL_L;
 		break;
 	default:
-		goto unlock;
+		return 0;
 	}
 
+	spin_lock_irqsave(&chip->spinlock, flags);
+
 	/* Set interrupt mode */
 	im = ioread32(im_reg) & ~(PCH_IM_MASK << (im_pos * 4));
 	iowrite32(im | (val << (im_pos * 4)), im_reg);
@@ -270,7 +270,6 @@ static int pch_irq_type(struct irq_data *d, unsigned int type)
 	else if (type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
 		irq_set_handler_locked(d, handle_edge_irq);
 
-unlock:
 	spin_unlock_irqrestore(&chip->spinlock, flags);
 	return 0;
 }
-- 
2.25.1

