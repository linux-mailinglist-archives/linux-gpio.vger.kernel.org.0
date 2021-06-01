Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ADBF3977DE
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 18:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234050AbhFAQXM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 12:23:12 -0400
Received: from mga03.intel.com ([134.134.136.65]:31283 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234127AbhFAQXL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 1 Jun 2021 12:23:11 -0400
IronPort-SDR: 0XLJNVcJMBo9wAsqMitQRV4TVoG9CYbjjUUCZ+qMjceeCvKSaX0AsLGTFsODmLILztIcHyeIBJ
 2q/27bjhNJgg==
X-IronPort-AV: E=McAfee;i="6200,9189,10002"; a="203614077"
X-IronPort-AV: E=Sophos;i="5.83,240,1616482800"; 
   d="scan'208";a="203614077"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2021 09:21:14 -0700
IronPort-SDR: 5i7QGMfN7LM23BdaW5FLA2mGTTRGNaJ2WNUxxX0en59aaHoBQDq2fAv7mNJD2WE1/TNtALOwX5
 x6eZVkyYZtHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,240,1616482800"; 
   d="scan'208";a="399655545"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 01 Jun 2021 09:21:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1C2A11FC; Tue,  1 Jun 2021 19:21:34 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v1 1/2] gpio: dwapb: Drop redundant check in dwapb_irq_set_type()
Date:   Tue,  1 Jun 2021 19:21:27 +0300
Message-Id: <20210601162128.35663-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

For more than 15 years we may not get into ->irq_set_type()
without any meaningful type provided.

Drop redundant check in dwapb_irq_set_type().

See the commit e76de9f8eb67 ("[PATCH] genirq: add SA_TRIGGER support")
out of curiosity.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-dwapb.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index d3233cc4b76b..939701c1465e 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -297,9 +297,6 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
 	irq_hw_number_t bit = irqd_to_hwirq(d);
 	unsigned long level, polarity, flags;
 
-	if (type & ~IRQ_TYPE_SENSE_MASK)
-		return -EINVAL;
-
 	spin_lock_irqsave(&gc->bgpio_lock, flags);
 	level = dwapb_read(gpio, GPIO_INTTYPE_LEVEL);
 	polarity = dwapb_read(gpio, GPIO_INT_POLARITY);
-- 
2.30.2

