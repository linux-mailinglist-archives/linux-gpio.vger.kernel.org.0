Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 477DD27EACB
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 16:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730517AbgI3OUQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 10:20:16 -0400
Received: from mga18.intel.com ([134.134.136.126]:48773 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730198AbgI3OUQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Sep 2020 10:20:16 -0400
IronPort-SDR: LUwn7q9/9t86tOo9MEV4H8MIZvdfrQAwe0TyyHEvwE1hdbrramc1Hr7kv5cV6z+vIW/8NMpHEz
 lK3C6yokA8kg==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="150241084"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="150241084"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 07:20:15 -0700
IronPort-SDR: JNicjoTVNJFsNUROfXsYTnQ04MaOYMQOoDuIqXBgG5k4PbnWlJu8YOmPaKPcBbGlQTAzG4/CDW
 VEXPbBt7BUMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="415722892"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 30 Sep 2020 07:20:14 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C49ED327; Wed, 30 Sep 2020 17:20:13 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] gpio: pca953x: Use bitmap API over implicit GCC extension
Date:   Wed, 30 Sep 2020 17:20:12 +0300
Message-Id: <20200930142013.59247-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In IRQ handler we have to clear bitmap before use. Currently
the GCC extension has been used for that. For sake of the consistency
switch to bitmap API. As expected bloat-o-meter shows no difference
in the object size.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 0a49ab62cbbd..3f24cfabb1d7 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -814,10 +814,12 @@ static irqreturn_t pca953x_irq_handler(int irq, void *devid)
 {
 	struct pca953x_chip *chip = devid;
 	struct gpio_chip *gc = &chip->gpio_chip;
-	DECLARE_BITMAP(pending, MAX_LINE) = {};
+	DECLARE_BITMAP(pending, MAX_LINE);
 	int level;
 	bool ret;
 
+	bitmap_zero(pending, MAX_LINE);
+
 	mutex_lock(&chip->i2c_lock);
 	ret = pca953x_irq_pending(chip, pending);
 	mutex_unlock(&chip->i2c_lock);
-- 
2.28.0

