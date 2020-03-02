Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A247175784
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2020 10:43:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgCBJnV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Mar 2020 04:43:21 -0500
Received: from mga11.intel.com ([192.55.52.93]:7607 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726654AbgCBJnV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 2 Mar 2020 04:43:21 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Mar 2020 01:43:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,506,1574150400"; 
   d="scan'208";a="440076819"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 02 Mar 2020 01:43:19 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D0689FD; Mon,  2 Mar 2020 11:43:18 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] gpiolib: Fix wrong appearance of critical message in gpiochip_remove()
Date:   Mon,  2 Mar 2020 11:43:17 +0200
Message-Id: <20200302094317.79002-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When the commit 869233f81337 ("gpiolib: Optimize gpiochip_remove()
when check for requested line") refactored a for-loop, the condition
to check if we found requested line was mistakenly inverted. So, fix
the condition to avoid critical message when it's not supposed to be
printed.

Fixes: 869233f81337 ("gpiolib: Optimize gpiochip_remove() when check for requested line")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ea2d05cfb5eb..1f986ba3502a 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1846,7 +1846,7 @@ void gpiochip_remove(struct gpio_chip *chip)
 	}
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
-	if (i == gdev->ngpio)
+	if (i < gdev->ngpio)
 		dev_crit(&gdev->dev,
 			 "REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED\n");
 
-- 
2.25.0

