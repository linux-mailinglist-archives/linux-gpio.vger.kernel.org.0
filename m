Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D940029E31E
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 03:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730189AbgJ2Cp3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 22:45:29 -0400
Received: from smtp2.axis.com ([195.60.68.18]:29487 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726199AbgJ1Vdm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Oct 2020 17:33:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1903; q=dns/txt; s=axis-central1;
  t=1603920823; x=1635456823;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8WighlFxUCPG64E8rsKp51mjFDumWu/9Js1XeZaqNfY=;
  b=hWTC//3AXQl4vaj8Ub2OfTMByzTPkg8QlLoaJXRnBy9EWaRSnBVSQNBY
   ROMkSZcGUTT6p0+8ednqJZf4iT0Mi/0vo4u2ea/W2feTOFTL7ZYdIUjCA
   KFboJmuKUstnT8NGyfUUBFwaN9RIX38WuD9uV3xYvW93exJ/PMKOuwfJQ
   3iItUnHJM/OuY+j1QS+vL8mMFPl2L5xjBea8h84+1TS5H4zgYAl5WfVUm
   AsmdT4EHFc8VrIUtBaO5Qg2fsmlkARZvjkOnh61awP6dKYp4XLHr5KoH6
   D4oT9SKviNxnvcXfPAJ7Mqqff5ydEj668CRF9Ot2j09h5swLevNiRBe71
   g==;
IronPort-SDR: 9zQLRP0OGoRnoLBhjIuJp4l2jQDybWCBoKOjYwOSfnl3EMs1BA8SKp2nUvG+7u4f4TuoyXe4H1
 mOU2i9QicPYfCXj9ZrG1jC/E+f5wg4rLNDTNRZfYLbj4zdGjhYmZJFu41i/19SfvcAETkigbQD
 5gzyICUvb/TfZwlRPKgucXIuzf91M3UdHzhXQ7RRw+wWci7JPguXiZN9ldODeEuyIWGog18yIg
 8NhArZgXNFNMnTw2dcE/92y7KhdzQJmLJ37m1VHd0Mr2RPTWpoMP70nGMQhQ14BtqlzPtZ5oER
 mWM=
X-IronPort-AV: E=Sophos;i="5.77,425,1596492000"; 
   d="scan'208";a="13984864"
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     <kernel@axis.com>, <devicetree@vger.kernel.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] gpio: mockup: Allow probing from device tree
Date:   Wed, 28 Oct 2020 09:57:48 +0100
Message-ID: <20201028085748.17388-1-vincent.whitchurch@axis.com>
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
    v3:
    - Keep includes sorted alphabetically
    - Drop CONFIG_OF ifdefs
    
    v2:
    - Remove most of the added code, since the latest driver doesn't need it.
    - Drop DT binding document, since Rob Herring was OK with not documenting this:
      https://lore.kernel.org/linux-devicetree/5baa1ae6.1c69fb81.847f2.3ab1@mx.google.com/

 drivers/gpio/gpio-mockup.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 67ed4f238d43..ca87c590ef3f 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -16,6 +16,7 @@
 #include <linux/irq_sim.h>
 #include <linux/irqdomain.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/slab.h>
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
+		.of_match_table = of_match_ptr(gpio_mockup_of_match),
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

