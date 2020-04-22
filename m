Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C36951B42CA
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2020 13:07:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgDVLG7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Apr 2020 07:06:59 -0400
Received: from mga02.intel.com ([134.134.136.20]:5028 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726119AbgDVLG7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Apr 2020 07:06:59 -0400
IronPort-SDR: 6MMg7Hmz8dA1ECxLdJqU+/dMeGmRMDoouAmiovECiUHl1y5jpshf6mCaGzoV+wZV8D8xqjNQFC
 KxjeWopCtRZw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2020 04:06:58 -0700
IronPort-SDR: nlyuZhMoHhNSnww/g8mnrbz6bjSwonMNswErViaANW2imQEkPeZAbcwmBemut1qJ1BkRk9WpdL
 RvZBbPJHXtGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,414,1580803200"; 
   d="scan'208";a="456467127"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 22 Apr 2020 04:06:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id B898D578; Wed, 22 Apr 2020 14:06:55 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v1 1/2] gpio: dwapb: Get rid of unnecessary conjunction over 32-bit value
Date:   Wed, 22 Apr 2020 14:06:53 +0300
Message-Id: <20200422110654.23442-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When we mask interrupts before sleep, there is no need to have a conjunction
with 0xffffffff since the accepted by dwapb_write() value is 32-bit.

Cc: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-dwapb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 31d29ec6ab5c3..9d8476afaba3d 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -743,8 +743,7 @@ static int dwapb_gpio_suspend(struct device *dev)
 			ctx->int_deb	= dwapb_read(gpio, GPIO_PORTA_DEBOUNCE);
 
 			/* Mask out interrupts */
-			dwapb_write(gpio, GPIO_INTMASK,
-				    0xffffffff & ~ctx->wake_en);
+			dwapb_write(gpio, GPIO_INTMASK, ~ctx->wake_en);
 		}
 	}
 	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
-- 
2.26.1

