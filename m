Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA77100B08
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 19:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbfKRSC7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 13:02:59 -0500
Received: from mga03.intel.com ([134.134.136.65]:23158 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726317AbfKRSC6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Nov 2019 13:02:58 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Nov 2019 10:02:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,321,1569308400"; 
   d="scan'208";a="356852591"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 18 Nov 2019 10:02:53 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C1E812D5; Mon, 18 Nov 2019 20:02:52 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] gpio: lynxpoint: Setup correct IRQ handlers
Date:   Mon, 18 Nov 2019 20:02:51 +0200
Message-Id: <20191118180251.31439-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When commit 75e99bf5ed8f ("gpio: lynxpoint: set default handler to be
handle_bad_irq()") switched default handler to be handle_bad_irq() the
lp_irq_type() function remained untouched. It means that even request_irq()
can't change the handler and we are not able to handle IRQs properly anymore.
Fix it by setting correct handlers in the lp_irq_type() callback.

Fixes: 75e99bf5ed8f ("gpio: lynxpoint: set default handler to be handle_bad_irq()")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-lynxpoint.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpio-lynxpoint.c b/drivers/gpio/gpio-lynxpoint.c
index e9e47c0d5be7..490ce7bae25e 100644
--- a/drivers/gpio/gpio-lynxpoint.c
+++ b/drivers/gpio/gpio-lynxpoint.c
@@ -164,6 +164,12 @@ static int lp_irq_type(struct irq_data *d, unsigned type)
 		value |= TRIG_SEL_BIT | INT_INV_BIT;
 
 	outl(value, reg);
+
+	if (type & IRQ_TYPE_EDGE_BOTH)
+		irq_set_handler_locked(d, handle_edge_irq);
+	else if (type & IRQ_TYPE_LEVEL_MASK)
+		irq_set_handler_locked(d, handle_level_irq);
+
 	spin_unlock_irqrestore(&lg->lock, flags);
 
 	return 0;
-- 
2.24.0

