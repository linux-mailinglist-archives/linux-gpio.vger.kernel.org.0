Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48CAB1A844C
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 18:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389370AbgDNQNr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 12:13:47 -0400
Received: from mga12.intel.com ([192.55.52.136]:43395 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388615AbgDNQNq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 12:13:46 -0400
IronPort-SDR: 1ZcgqzEbpf6WMzyimJfE3OUD/sZvh4E90EfZoNsE4azQ6tVcn8MyzJ8Mq4Lz/VhnAI02RC55Sc
 RZIjZEl738ow==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 09:13:46 -0700
IronPort-SDR: mORPftCPmd0A6YCk/JHRGpxk0svGfDGCvrJD/lgkmFCQGMYzIeXzrFeloB9lL+WF6+vnhGmK0j
 r2YjyLHTq+yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; 
   d="scan'208";a="427110946"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 14 Apr 2020 09:13:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9A4C216B; Tue, 14 Apr 2020 19:13:39 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] pinctrl: baytrail: Use platform_get_irq_optional() explicitly
Date:   Tue, 14 Apr 2020 19:13:37 +0300
Message-Id: <20200414161338.3025-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is no need to repeat functionality of platform_get_irq_optional()
in the driver. Replace it with explicit call to the helper.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 9b821c9cbd16..0ff7c55173da 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1506,8 +1506,7 @@ static int byt_gpio_probe(struct intel_pinctrl *vg)
 {
 	struct platform_device *pdev = to_platform_device(vg->dev);
 	struct gpio_chip *gc;
-	struct resource *irq_rc;
-	int ret;
+	int irq, ret;
 
 	/* Set up gpio chip */
 	vg->chip	= byt_gpio_chip;
@@ -1527,8 +1526,8 @@ static int byt_gpio_probe(struct intel_pinctrl *vg)
 #endif
 
 	/* set up interrupts  */
-	irq_rc = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (irq_rc && irq_rc->start) {
+	irq = platform_get_irq_optional(pdev, 0);
+	if (irq > 0) {
 		struct gpio_irq_chip *girq;
 
 		vg->irqchip.name = "BYT-GPIO",
@@ -1548,7 +1547,7 @@ static int byt_gpio_probe(struct intel_pinctrl *vg)
 					     sizeof(*girq->parents), GFP_KERNEL);
 		if (!girq->parents)
 			return -ENOMEM;
-		girq->parents[0] = (unsigned int)irq_rc->start;
+		girq->parents[0] = irq;
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_bad_irq;
 	}
-- 
2.25.1

