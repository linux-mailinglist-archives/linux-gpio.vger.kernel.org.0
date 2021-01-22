Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76270300365
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 13:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728056AbhAVMmZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 07:42:25 -0500
Received: from mga07.intel.com ([134.134.136.100]:62320 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728034AbhAVMmO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 Jan 2021 07:42:14 -0500
IronPort-SDR: TaV+gyIPAB+1gfiVaKTozugcQ+r521R9tmgh3MS6K+lDBlL61lUkVuwyF17nQgoAdJSAyiaxLt
 X8rVPW2T8aZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="243516880"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="243516880"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 04:38:59 -0800
IronPort-SDR: xwuFXJYy9r0M3ez/bXxxuNYEI+DKSlw1hPTgPLQh5Nqy+1wbCXb5bOnx3e/oYHXVy2pV5PwuMm
 nCF3XxSsqKMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="407733765"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Jan 2021 04:38:58 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E67FB29A; Fri, 22 Jan 2021 14:38:56 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 4/6] gpio: aggregator: Replace isrange() by using get_options()
Date:   Fri, 22 Jan 2021 14:38:51 +0200
Message-Id: <20210122123853.75162-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122123853.75162-1-andriy.shevchenko@linux.intel.com>
References: <20210122123853.75162-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We already have a nice helper called get_options() which can be used
to validate the input format. Replace isrange() by using it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
v3: added Rb tags (Linus, Bart)
 drivers/gpio/gpio-aggregator.c | 33 +++------------------------------
 1 file changed, 3 insertions(+), 30 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index dfd8a4876a27..40a081b095fb 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -62,34 +62,6 @@ static char *get_arg(char **args)
 	return start;
 }
 
-static bool isrange(const char *s)
-{
-	size_t n;
-
-	if (IS_ERR_OR_NULL(s))
-		return false;
-
-	while (1) {
-		n = strspn(s, "0123456789");
-		if (!n)
-			return false;
-
-		s += n;
-
-		switch (*s++) {
-		case '\0':
-			return true;
-
-		case '-':
-		case ',':
-			break;
-
-		default:
-			return false;
-		}
-	}
-}
-
 static int aggr_add_gpio(struct gpio_aggregator *aggr, const char *key,
 			 int hwnum, unsigned int *n)
 {
@@ -112,10 +84,10 @@ static int aggr_add_gpio(struct gpio_aggregator *aggr, const char *key,
 
 static int aggr_parse(struct gpio_aggregator *aggr)
 {
+	char *name, *offsets, *p;
 	char *args = aggr->args;
 	unsigned long *bitmap;
 	unsigned int i, n = 0;
-	char *name, *offsets;
 	int error = 0;
 
 	bitmap = bitmap_alloc(ARCH_NR_GPIOS, GFP_KERNEL);
@@ -130,7 +102,8 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 			goto free_bitmap;
 		}
 
-		if (!isrange(offsets)) {
+		p = get_options(offsets, 0, &error);
+		if (error == 0 || *p) {
 			/* Named GPIO line */
 			error = aggr_add_gpio(aggr, name, U16_MAX, &n);
 			if (error)
-- 
2.29.2

