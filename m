Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED321300366
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 13:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbhAVMm1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 07:42:27 -0500
Received: from mga03.intel.com ([134.134.136.65]:47127 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728038AbhAVMmO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 Jan 2021 07:42:14 -0500
IronPort-SDR: nfFSITXxLbfUU98Y9eQuSqZEISV1CCsTuOoVQ3D/Z4Z7xWPef/a6/xT1jKE/zAeq6G4h5BLcDX
 JvFp1mVnLOeA==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="179520761"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="179520761"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 04:38:59 -0800
IronPort-SDR: q/WI+RujMJUmG5WowZBt2RFZ2QWJFJxwEPFAgOImt+a015pjL2X09OXO6dRBJtRZV693EXTwcG
 kqCgw79yX1Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="574626615"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 22 Jan 2021 04:38:57 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id F136332E; Fri, 22 Jan 2021 14:38:56 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 5/6] gpio: aggregator: Use compound literal from the header
Date:   Fri, 22 Jan 2021 14:38:52 +0200
Message-Id: <20210122123853.75162-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122123853.75162-1-andriy.shevchenko@linux.intel.com>
References: <20210122123853.75162-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Instead of doing it in place, convert GPIO_LOOKUP_IDX() and GPIO_HOG()
to be compund literals that's allow to use them as rvalue in assignments.

Due to above conversion, use compound literal from the header
in the gpio-aggregator.c.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v3: new patch
 drivers/gpio/gpio-aggregator.c | 3 +--
 include/linux/gpio/machine.h   | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 40a081b095fb..13e473c97ce4 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -72,8 +72,7 @@ static int aggr_add_gpio(struct gpio_aggregator *aggr, const char *key,
 	if (!lookups)
 		return -ENOMEM;
 
-	lookups->table[*n] =
-		(struct gpiod_lookup)GPIO_LOOKUP_IDX(key, hwnum, NULL, *n, 0);
+	lookups->table[*n] = GPIO_LOOKUP_IDX(key, hwnum, NULL, *n, 0);
 
 	(*n)++;
 	memset(&lookups->table[*n], 0, sizeof(lookups->table[*n]));
diff --git a/include/linux/gpio/machine.h b/include/linux/gpio/machine.h
index 781a053abbb9..d755e529c1e3 100644
--- a/include/linux/gpio/machine.h
+++ b/include/linux/gpio/machine.h
@@ -75,7 +75,7 @@ struct gpiod_hog {
  * gpiod_get_index()
  */
 #define GPIO_LOOKUP_IDX(_key, _chip_hwnum, _con_id, _idx, _flags)         \
-{                                                                         \
+(struct gpiod_lookup) {                                                   \
 	.key = _key,                                                      \
 	.chip_hwnum = _chip_hwnum,                                        \
 	.con_id = _con_id,                                                \
@@ -87,7 +87,7 @@ struct gpiod_hog {
  * Simple definition of a single GPIO hog in an array.
  */
 #define GPIO_HOG(_chip_label, _chip_hwnum, _line_name, _lflags, _dflags)  \
-{                                                                         \
+(struct gpiod_hog) {                                                      \
 	.chip_label = _chip_label,                                        \
 	.chip_hwnum = _chip_hwnum,                                        \
 	.line_name = _line_name,                                          \
-- 
2.29.2

