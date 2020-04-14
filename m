Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 319F91A87F3
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 19:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502861AbgDNRuC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 13:50:02 -0400
Received: from mga06.intel.com ([134.134.136.31]:42138 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502812AbgDNRt7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 13:49:59 -0400
IronPort-SDR: BEaAbIxwopgDOkXAjrH8r1hIVwmTvaQpB1Qms2QR0quoLjZyDbSv1seg9AflI5maDWwktbcvIn
 cu2MuDwg5Wjw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 10:49:04 -0700
IronPort-SDR: X5i9CRqdec3Sz7hzeo4iuFsu1+sgatN1l8RaeaJeEnQZYeHgkpFkgeLHN76OChtw0W55nFDtsx
 mslLKgYsrFiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; 
   d="scan'208";a="453623131"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 14 Apr 2020 10:49:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 96241298; Tue, 14 Apr 2020 20:49:01 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 4/4] gpio: pch: Use in pch_irq_type() macros provided by IRQ core
Date:   Tue, 14 Apr 2020 20:49:00 +0300
Message-Id: <20200414174900.5099-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414174900.5099-1-andriy.shevchenko@linux.intel.com>
References: <20200414174900.5099-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use in pch_irq_type() the macros provided by IRQ core for IRQ type.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: new patch
 drivers/gpio/gpio-pch.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index 9c34230f2e84..e96d28bf43b4 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -265,9 +265,9 @@ static int pch_irq_type(struct irq_data *d, unsigned int type)
 	iowrite32(im | (val << (im_pos * 4)), im_reg);
 
 	/* And the handler */
-	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
+	if (type & IRQ_TYPE_LEVEL_MASK)
 		irq_set_handler_locked(d, handle_level_irq);
-	else if (type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
+	else if (type & IRQ_TYPE_EDGE_BOTH)
 		irq_set_handler_locked(d, handle_edge_irq);
 
 	spin_unlock_irqrestore(&chip->spinlock, flags);
-- 
2.25.1

