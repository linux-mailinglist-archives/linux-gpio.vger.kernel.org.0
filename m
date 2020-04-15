Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41EC61AA9AB
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 16:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634150AbgDOOQx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 10:16:53 -0400
Received: from mga14.intel.com ([192.55.52.115]:9848 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2636547AbgDOOPo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 10:15:44 -0400
IronPort-SDR: spGpC7BXw1vGEKsJRens762VIVGxd7cJuJ4nyW5c6BaN7IpI5Pbk2ElLf/QwIWf3op/pNXxsfY
 vZi3l5PgX+NQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 07:15:40 -0700
IronPort-SDR: l7bXwqLT92kk8e4MqmmOspqgN5/R4fw3wXCfcqUtG9L0jdqNlVCyLWwhdoQ83trx6XEk4e+m+I
 4MJWRLlYwdHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; 
   d="scan'208";a="244112402"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 15 Apr 2020 07:15:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DE4D9E2F; Wed, 15 Apr 2020 17:15:35 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v2 09/14] gpio: dwapb: Switch to more usual pattern of RMW in dwapb_gpio_set_debounce()
Date:   Wed, 15 Apr 2020 17:15:29 +0300
Message-Id: <20200415141534.31240-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

More usual pattern is to prepare value and then write it in a single place.
Switch code in dwapb_gpio_set_debounce() to it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 4edac592c253..0b073cbc003b 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -327,9 +327,10 @@ static int dwapb_gpio_set_debounce(struct gpio_chip *gc,
 
 	val_deb = dwapb_read(gpio, GPIO_PORTA_DEBOUNCE);
 	if (debounce)
-		dwapb_write(gpio, GPIO_PORTA_DEBOUNCE, val_deb | mask);
+		val_deb |= mask;
 	else
-		dwapb_write(gpio, GPIO_PORTA_DEBOUNCE, val_deb & ~mask);
+		val_deb &= ~mask;
+	dwapb_write(gpio, GPIO_PORTA_DEBOUNCE, val_deb);
 
 	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 
-- 
2.25.1

