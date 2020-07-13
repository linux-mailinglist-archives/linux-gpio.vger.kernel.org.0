Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 447D921DA76
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 17:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729649AbgGMPoi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 11:44:38 -0400
Received: from mga04.intel.com ([192.55.52.120]:27727 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729644AbgGMPoi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Jul 2020 11:44:38 -0400
IronPort-SDR: 9AGdzmPgkmWPK3sZZEr/O4difRhYYyAc7ns+mRy5oX+o+/eXVLb1x9xEEagtdFZCdpEp7k1aff
 a3fCf+63eBhA==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="146119690"
X-IronPort-AV: E=Sophos;i="5.75,347,1589266800"; 
   d="scan'208";a="146119690"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2020 08:44:32 -0700
IronPort-SDR: hFvQYUNIPspFgwPXwnDlGFRmh8vZKF+px8Bsy2Hjn/dkfOoVqRSNk7ectKqwoS7B6o+MwJlbDo
 eB7dfI0mxiRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,347,1589266800"; 
   d="scan'208";a="268403217"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 13 Jul 2020 08:44:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 85298F2; Mon, 13 Jul 2020 18:44:30 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] gpio: mmio: replace open-coded for_each_set_bit()
Date:   Mon, 13 Jul 2020 18:44:29 +0300
Message-Id: <20200713154429.23662-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use for_each_set_bit() instead of open-coding it to simplify the code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-mmio.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index b778f33cc6af..c335a0309ba3 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -195,8 +195,7 @@ static int bgpio_get_multiple_be(struct gpio_chip *gc, unsigned long *mask,
 	*bits &= ~*mask;
 
 	/* Create a mirrored mask */
-	bit = -1;
-	while ((bit = find_next_bit(mask, gc->ngpio, bit + 1)) < gc->ngpio)
+	for_each_set_bit(bit, mask, gc->ngpio)
 		readmask |= bgpio_line2mask(gc, bit);
 
 	/* Read the register */
@@ -206,8 +205,7 @@ static int bgpio_get_multiple_be(struct gpio_chip *gc, unsigned long *mask,
 	 * Mirror the result into the "bits" result, this will give line 0
 	 * in bit 0 ... line 31 in bit 31 for a 32bit register.
 	 */
-	bit = -1;
-	while ((bit = find_next_bit(&val, gc->ngpio, bit + 1)) < gc->ngpio)
+	for_each_set_bit(bit, &val, gc->ngpio)
 		*bits |= bgpio_line2mask(gc, bit);
 
 	return 0;
@@ -272,15 +270,11 @@ static void bgpio_multiple_get_masks(struct gpio_chip *gc,
 	*set_mask = 0;
 	*clear_mask = 0;
 
-	for (i = 0; i < gc->bgpio_bits; i++) {
-		if (*mask == 0)
-			break;
-		if (__test_and_clear_bit(i, mask)) {
-			if (test_bit(i, bits))
-				*set_mask |= bgpio_line2mask(gc, i);
-			else
-				*clear_mask |= bgpio_line2mask(gc, i);
-		}
+	for_each_set_bit(i, mask, gc->bgpio_bits) {
+		if (test_bit(i, bits))
+			*set_mask |= bgpio_line2mask(gc, i);
+		else
+			*clear_mask |= bgpio_line2mask(gc, i);
 	}
 }
 
-- 
2.27.0

