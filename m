Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B442927EACC
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 16:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730198AbgI3OUR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 10:20:17 -0400
Received: from mga18.intel.com ([134.134.136.126]:48773 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730483AbgI3OUQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Sep 2020 10:20:16 -0400
IronPort-SDR: lfpVfMQmhbkqWhOx4KRG5fhqp/R2sycZyUnGvRzuRAG4F/g+Rxs81y3h6eWdB6m047yGVKgcaC
 /6HArlR7UrLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="150241082"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="150241082"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 07:20:15 -0700
IronPort-SDR: R1YHU71BcWzjk83saH5O/LvD+vJR3zKkKmk5X9LC/jy9/Bdj+zZqlsfnwA1O9QGCykyPQBjmKt
 sTdLbCrW29yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="341216154"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 30 Sep 2020 07:20:14 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id CF9DF92; Wed, 30 Sep 2020 17:20:13 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] gpio: pca953x: Correctly initialize registers 6 and 7 for PCA957x
Date:   Wed, 30 Sep 2020 17:20:13 +0300
Message-Id: <20200930142013.59247-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930142013.59247-1-andriy.shevchenko@linux.intel.com>
References: <20200930142013.59247-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When driver has been converted to the bitmap API the non-bitmap functions
started behaving differently on 32-bit BE architectures since the bytes in
two consequent unsigned longs are in different order in comparison to byte
array. Hence if the chip had had more than 32 lines the memset() call over
it would have not set up upper lines correctly.
Although it's currently a theoretical case (no supported chips of this type
has 32+ lines), it's better to provide a clean code to avoid people thinking
this is okay and potentially producing not fully working things.

Fixes: 35d13d94893f ("gpio: pca953x: convert to use bitmap API")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 3f24cfabb1d7..6263a4d55f8b 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -942,6 +942,7 @@ static int device_pca95xx_init(struct pca953x_chip *chip, u32 invert)
 static int device_pca957x_init(struct pca953x_chip *chip, u32 invert)
 {
 	DECLARE_BITMAP(val, MAX_LINE);
+	unsigned int i;
 	int ret;
 
 	ret = device_pca95xx_init(chip, invert);
@@ -949,7 +950,9 @@ static int device_pca957x_init(struct pca953x_chip *chip, u32 invert)
 		goto out;
 
 	/* To enable register 6, 7 to control pull up and pull down */
-	memset(val, 0x02, NBANK(chip));
+	for (i = 0; i < NBANK(chip); i++)
+		bitmap_set_value8(val, 0x02, i * BANK_SZ);
+
 	ret = pca953x_write_regs(chip, PCA957X_BKEN, val);
 	if (ret)
 		goto out;
-- 
2.28.0

