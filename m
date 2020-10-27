Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE47B29C6A0
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Oct 2020 19:28:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753820AbgJ0SVj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Oct 2020 14:21:39 -0400
Received: from smtp2.axis.com ([195.60.68.18]:14093 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753663AbgJ0OBY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 27 Oct 2020 10:01:24 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Tue, 27 Oct 2020 10:01:23 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1841; q=dns/txt; s=axis-central1;
  t=1603807284; x=1635343284;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uAN2e5G3WcdT+cTOp4JBtFE0vznyZLRyeShhV3oIqGM=;
  b=RdfBRU8iHpDTxIl7mRT7+1+gjrQO7JkZZ+XKFwNhik+vwZ5M4gnl0+4F
   ymGBklJammhWiFGEHutsp2FjJe5G3TVifIlnXvZbbnG6X8I9kC7BNLUrC
   Th4UD+KsF3HKAkZRLM5An3D+5ytZzStDBSxwaLx+oBraot4+FJnpRL7h6
   JjTccvT/6jsp0JARKjQ0Q53TJYeZcaEvNqqFjuXJkBk+SOEOcerI4A+4h
   AH2gpqBRkGnGVRO168GC32sMxXWju4VOXuAld1ICDw3EU4IR6ndLPbQru
   tEP5+r0uOA8Ah65FkTCbOSw3HwDqBGG5rwjlgUs6vMiXWeFQqoQXhSWan
   w==;
IronPort-SDR: DP5SbzFMLwpxHViDs5672DnOGm8eyiW076asrV0u1HrOdGhEEEMRbgkt7x9oRSHvcFdy304U5Z
 OjR4Py+c/8JVxKZnB3mOD3c9dWpUSTESWXPiyCboT+fBme8oJTHv9XP0gLI+kW/BkugQJe+uAe
 ChElU+jL2wPfu5DrO0IdiEkTxk+uztJoJkh9k8yNHkQIHLRpjHU/Ba5Z6g74COAGk40nToM8WN
 etWljz/RjGR4hA/VMwFYQVR0qVvKsvQI7S10e7UzfipJQi/xkGPGCEU1q2PUA4rykCDzsGxDQo
 pS0=
X-IronPort-AV: E=Sophos;i="5.77,424,1596492000"; 
   d="scan'208";a="13956774"
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     <kernel@axis.com>, <devicetree@vger.kernel.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] gpio: mockup: Allow probing from device tree
Date:   Tue, 27 Oct 2020 14:53:25 +0100
Message-ID: <20201027135325.22235-1-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Allow the mockup driver to be probed via the device tree without any
module parameters, allowing it to be used to configure and test higher
level drivers like the leds-gpio driver and corresponding userspace
before actual hardware is available.

Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
v2: Remove most of the added code, since the latest driver doesn't need it.
    Drop DT binding document, since Rob Herring was OK with not documenting
    this:
    https://lore.kernel.org/linux-devicetree/5baa1ae6.1c69fb81.847f2.3ab1@mx.google.com/

 drivers/gpio/gpio-mockup.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 67ed4f238d43..c93892a6936a 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -13,6 +13,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/of.h>
 #include <linux/irq_sim.h>
 #include <linux/irqdomain.h>
 #include <linux/module.h>
@@ -460,9 +461,18 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id gpio_mockup_of_match[] = {
+	{ .compatible = "gpio-mockup", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, gpio_mockup_of_match);
+#endif
+
 static struct platform_driver gpio_mockup_driver = {
 	.driver = {
 		.name = "gpio-mockup",
+		.of_match_table = of_match_ptr(gpio_mockup_of_match),
 	},
 	.probe = gpio_mockup_probe,
 };
@@ -556,8 +566,7 @@ static int __init gpio_mockup_init(void)
 {
 	int i, num_chips, err;
 
-	if ((gpio_mockup_num_ranges < 2) ||
-	    (gpio_mockup_num_ranges % 2) ||
+	if ((gpio_mockup_num_ranges % 2) ||
 	    (gpio_mockup_num_ranges > GPIO_MOCKUP_MAX_RANGES))
 		return -EINVAL;
 
-- 
2.28.0

