Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B692B230AB6
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jul 2020 14:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729565AbgG1MzI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jul 2020 08:55:08 -0400
Received: from mga11.intel.com ([192.55.52.93]:16828 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729562AbgG1MzI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Jul 2020 08:55:08 -0400
IronPort-SDR: BWD749oRXiFRRF5t2AwuEzLMBj9z6pGnNRTWin5rQuTq3sOcaIX/Cd5V+rwP8KMGICy9T81LL1
 AtmDp//mbLqA==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="149060267"
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; 
   d="scan'208";a="149060267"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 05:55:07 -0700
IronPort-SDR: W8oPZn8T9UCt6aZxcQgaE0JRgYN6PwmruGqxmMGOEmhbdGMngdRAoILOGiCMpdGzDvc1CAQs4a
 PtLmtjRdafhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; 
   d="scan'208";a="290157937"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 28 Jul 2020 05:55:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0697D5B; Tue, 28 Jul 2020 15:55:04 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/3] gpio: crystalcove: Free IRQ on error path
Date:   Tue, 28 Jul 2020 15:55:03 +0300
Message-Id: <20200728125504.27786-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200728125504.27786-1-andriy.shevchenko@linux.intel.com>
References: <20200728125504.27786-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It appears that all, but request_irq(), calls in the driver are device managed.
In unlikely case of devm_gpiochip_add_data() failure the IRQ left requested.
Free IRQ on error path by switching to devm_request_threaded_irq() API.

Byproduct of this change is a drop of ->remove() callback completely.

Fixes: 945e72db36bd ("gpio: crystalcove: Use irqchip template")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-crystalcove.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
index f60ff7579cd0..2ba225720086 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -364,9 +364,9 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
 	girq->handler = handle_simple_irq;
 	girq->threaded = true;
 
-	retval = request_threaded_irq(irq, NULL, crystalcove_gpio_irq_handler,
-				      IRQF_ONESHOT, KBUILD_MODNAME, cg);
-
+	retval = devm_request_threaded_irq(&pdev->dev, irq, NULL,
+					   crystalcove_gpio_irq_handler,
+					   IRQF_ONESHOT, KBUILD_MODNAME, cg);
 	if (retval) {
 		dev_warn(&pdev->dev, "request irq failed: %d\n", retval);
 		return retval;
@@ -381,24 +381,12 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int crystalcove_gpio_remove(struct platform_device *pdev)
-{
-	struct crystalcove_gpio *cg = platform_get_drvdata(pdev);
-	int irq = platform_get_irq(pdev, 0);
-
-	if (irq >= 0)
-		free_irq(irq, cg);
-	return 0;
-}
-
 static struct platform_driver crystalcove_gpio_driver = {
 	.probe = crystalcove_gpio_probe,
-	.remove = crystalcove_gpio_remove,
 	.driver = {
 		.name = "crystal_cove_gpio",
 	},
 };
-
 module_platform_driver(crystalcove_gpio_driver);
 
 MODULE_AUTHOR("Yang, Bin <bin.yang@intel.com>");
-- 
2.27.0

