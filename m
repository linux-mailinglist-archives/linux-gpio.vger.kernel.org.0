Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA5531A3576
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2020 16:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726940AbgDIOMc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Apr 2020 10:12:32 -0400
Received: from mga03.intel.com ([134.134.136.65]:39386 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726977AbgDIOMb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Apr 2020 10:12:31 -0400
IronPort-SDR: mt82g9IRGRIatdAwxkwsJiXhp0djpBihLAgEuNY7w1UDcvHbjm3moVz7XXiqf+qdVYT+f2hI+v
 gvPixSQpUrog==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 07:12:32 -0700
IronPort-SDR: 4XLBhm9LH5G67V40SFwcEyDr4Y7hj1g/IzaBxLr1666LsmLD8z4FWmuOiFXfgibjRe+nIMnwMn
 PY3jRIqWh7DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; 
   d="scan'208";a="270085162"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 09 Apr 2020 07:12:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7CE8779A; Thu,  9 Apr 2020 17:12:29 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 03/13] gpio: dwapb: set default handler to be handle_bad_irq()
Date:   Thu,  9 Apr 2020 17:12:18 +0300
Message-Id: <20200409141228.49561-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We switch the default handler to be handle_bad_irq() instead of
handle_level_irq(), though for now apply it later in the code,
to make the difference between IRQ chips more visible.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-dwapb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index f61139f787d9..588d5c61ae42 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -400,7 +400,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 		return;
 
 	err = irq_alloc_domain_generic_chips(gpio->domain, ngpio, 2,
-					     DWAPB_DRIVER_NAME, handle_level_irq,
+					     DWAPB_DRIVER_NAME, handle_bad_irq,
 					     IRQ_NOREQUEST, 0,
 					     IRQ_GC_INIT_NESTED_LOCK);
 	if (err) {
@@ -439,6 +439,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 	}
 
 	irq_gc->chip_types[0].type = IRQ_TYPE_LEVEL_MASK;
+	irq_gc->chip_types[0].handler = handle_level_irq;
 	irq_gc->chip_types[1].type = IRQ_TYPE_EDGE_BOTH;
 	irq_gc->chip_types[1].handler = handle_edge_irq;
 
-- 
2.25.1

