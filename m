Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5BAB230AB4
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jul 2020 14:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729578AbgG1MzH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jul 2020 08:55:07 -0400
Received: from mga04.intel.com ([192.55.52.120]:36182 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728604AbgG1MzH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Jul 2020 08:55:07 -0400
IronPort-SDR: XLvYTL/iAJ5Qkm4HQezsu8BRxYB0dseJZUnhn0s9+ZNySAFhgW+YQM4ZhIfM5raKOcxaLbo/zV
 C0Ero4+DeTtw==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="148663880"
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; 
   d="scan'208";a="148663880"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 05:55:07 -0700
IronPort-SDR: AkZjsKlBlI3hcWJniDAgksZc+HsljkDDgyTopSdKw3gf6URVzKus7UER6OqgkR0TNnsUeXVsnT
 Bwh3GtcTKRlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; 
   d="scan'208";a="272308199"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 28 Jul 2020 05:55:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 101F9198; Tue, 28 Jul 2020 15:55:05 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/3] gpio: wcove: Request IRQ after all initialisation done
Date:   Tue, 28 Jul 2020 15:55:04 +0300
Message-Id: <20200728125504.27786-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200728125504.27786-1-andriy.shevchenko@linux.intel.com>
References: <20200728125504.27786-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is logically better to request IRQ when we initialise all structures.
Align the driver with the rest on the same matter.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-wcove.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index 135645096575..b5fbba5a783a 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -449,13 +449,6 @@ static int wcove_gpio_probe(struct platform_device *pdev)
 		return virq;
 	}
 
-	ret = devm_request_threaded_irq(dev, virq, NULL,
-		wcove_gpio_irq_handler, IRQF_ONESHOT, pdev->name, wg);
-	if (ret) {
-		dev_err(dev, "Failed to request irq %d\n", virq);
-		return ret;
-	}
-
 	girq = &wg->chip.irq;
 	girq->chip = &wcove_irqchip;
 	/* This will let us handle the parent IRQ in the driver */
@@ -466,6 +459,13 @@ static int wcove_gpio_probe(struct platform_device *pdev)
 	girq->handler = handle_simple_irq;
 	girq->threaded = true;
 
+	ret = devm_request_threaded_irq(dev, virq, NULL, wcove_gpio_irq_handler,
+					IRQF_ONESHOT, pdev->name, wg);
+	if (ret) {
+		dev_err(dev, "Failed to request irq %d\n", virq);
+		return ret;
+	}
+
 	ret = devm_gpiochip_add_data(dev, &wg->chip, wg);
 	if (ret) {
 		dev_err(dev, "Failed to add gpiochip: %d\n", ret);
-- 
2.27.0

