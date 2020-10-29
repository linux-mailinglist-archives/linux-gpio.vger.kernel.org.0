Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC0E29E637
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 09:17:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbgJ2IRe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 04:17:34 -0400
Received: from smtp2.axis.com ([195.60.68.18]:11815 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726231AbgJ2IRb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Oct 2020 04:17:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=3148; q=dns/txt; s=axis-central1;
  t=1603959450; x=1635495450;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZzrBKQ+s9dk85lZZfiJG0UtohbsCcBMHvXllHKW91mw=;
  b=EV2mBWtKGeNDKZjkkpjEiqyd9f/U6ahEiOZRwo2Hjzlz+CjVjO0iWMEE
   n42U0GYiAs4XguhUR3vwKfQ9y2wt/IWy7rvAnp/Eq7ZyiR7iDqTcVNF7n
   RbOn6xCl4TP18d8czdMe8xVfO7KyEIIvvjwxuGaj2b+vLX1S7oCwkoGol
   AeTQ4441GEpa5T4mhMSFdGb6RE1csZhVQo3Z66qe64EmEroSPvXTqVawi
   4VMZJFbrBONkqMh2BiDxNnMIdScOEJWiedH2AqDs1d4RnBBYGmAx/o4Xk
   /rzm5o/JP4RijyHg5NuAmJSAYH4wQYxaNwa1xZbR1qeMHjtxQb3Txi9HX
   Q==;
IronPort-SDR: k/BMqfxgNlRV9WmHIiQcDyvvKgrh4iESeehFl82DmRXwOq7zRPLaqqlPIyLd0/yyf8kF9SfJwr
 6IIeHaj9TbqJ+/BPrxCaZaFh7hO7KELxmpPg+ZDk0cYMu/42AVQlPH/57OmGds2oMFd341mw+o
 koWF31u9kNUwVZbyJ10T7HkZ3q6GDPlPX6k6nLD/1CZb4fCTuuz9OMQbDiIdCbOyZ1lqQhwKER
 isZBQykQYJnD2jzeJs0WoOkvzlsWkCDkHOU2ARrb7kqsQeMxrel9xep4UL1zEA94RkVqIeA7vV
 BXw=
X-IronPort-AV: E=Sophos;i="5.77,429,1596492000"; 
   d="scan'208";a="14031930"
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     <kernel@axis.com>, <devicetree@vger.kernel.org>,
        <andy.shevchenko@gmail.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4] gpio: mockup: Allow probing from device tree
Date:   Thu, 29 Oct 2020 09:17:20 +0100
Message-ID: <20201029081721.9593-1-vincent.whitchurch@axis.com>
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

Notes:
    v4:
    - Remove of_match_ptr() to fix unused variable warning with W=1
    - Include linux/mod_devicetable.h instead of linux/of.h
    
    v3:
    - Keep includes sorted alphabetically
    - Drop CONFIG_OF ifdefs
    
    v2:
    - Remove most of the added code, since the latest driver doesn't need it.
    - Drop DT binding document, since Rob Herring was OK with not documenting this:
      https://lore.kernel.org/linux-devicetree/5baa1ae6.1c69fb81.847f2.3ab1@mx.google.com/

Range-diff against v3:
1:  1e9b8f36676d ! 1:  4e8fdcfe1a47 gpio: mockup: Allow probing from device tree
    @@ Commit message
     
     
      ## Notes ##
    +    v4:
    +    - Remove of_match_ptr() to fix unused variable warning with W=1
    +    - Include linux/mod_devicetable.h instead of linux/of.h
    +
         v3:
         - Keep includes sorted alphabetically
         - Drop CONFIG_OF ifdefs
    @@ Notes
     
      ## drivers/gpio/gpio-mockup.c ##
     @@
    + #include <linux/irq.h>
      #include <linux/irq_sim.h>
      #include <linux/irqdomain.h>
    ++#include <linux/mod_devicetable.h>
      #include <linux/module.h>
    -+#include <linux/of.h>
      #include <linux/platform_device.h>
      #include <linux/property.h>
    - #include <linux/slab.h>
     @@ drivers/gpio/gpio-mockup.c: static int gpio_mockup_probe(struct platform_device *pdev)
      	return 0;
      }
    @@ drivers/gpio/gpio-mockup.c: static int gpio_mockup_probe(struct platform_device
      static struct platform_driver gpio_mockup_driver = {
      	.driver = {
      		.name = "gpio-mockup",
    -+		.of_match_table = of_match_ptr(gpio_mockup_of_match),
    ++		.of_match_table = gpio_mockup_of_match,
      	},
      	.probe = gpio_mockup_probe,
      };

 drivers/gpio/gpio-mockup.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 67ed4f238d43..28b757d34046 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -15,6 +15,7 @@
 #include <linux/irq.h>
 #include <linux/irq_sim.h>
 #include <linux/irqdomain.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
@@ -460,9 +461,16 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id gpio_mockup_of_match[] = {
+	{ .compatible = "gpio-mockup", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, gpio_mockup_of_match);
+
 static struct platform_driver gpio_mockup_driver = {
 	.driver = {
 		.name = "gpio-mockup",
+		.of_match_table = gpio_mockup_of_match,
 	},
 	.probe = gpio_mockup_probe,
 };
@@ -556,8 +564,7 @@ static int __init gpio_mockup_init(void)
 {
 	int i, num_chips, err;
 
-	if ((gpio_mockup_num_ranges < 2) ||
-	    (gpio_mockup_num_ranges % 2) ||
+	if ((gpio_mockup_num_ranges % 2) ||
 	    (gpio_mockup_num_ranges > GPIO_MOCKUP_MAX_RANGES))
 		return -EINVAL;
 
-- 
2.28.0

