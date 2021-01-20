Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E552E2FDE13
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 01:48:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732497AbhAUAXA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Jan 2021 19:23:00 -0500
Received: from mga11.intel.com ([192.55.52.93]:43959 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732931AbhATVrm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Jan 2021 16:47:42 -0500
IronPort-SDR: Rn0DUpTj005Iz2xL2hlEj8B3sHifnburLYd3RX7eDl6zW+VJm2L+DrAVmrBBCazYe1hINjl5VZ
 2SknO+ANiPbQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="175675352"
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; 
   d="scan'208";a="175675352"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2021 13:45:50 -0800
IronPort-SDR: WFdx1aDfd2vjC1REN1RMmWgvGtYhnWFz/FpsRfpPHVGYzQjujPSaNjWVk/P1pniM4693cNUhUL
 mUFU8CM1kZvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; 
   d="scan'208";a="356207857"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 20 Jan 2021 13:45:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BF2E3184; Wed, 20 Jan 2021 23:45:48 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 4/5] gpio: aggregator: Replace isrange() by using get_options()
Date:   Wed, 20 Jan 2021 23:45:46 +0200
Message-Id: <20210120214547.89770-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120214547.89770-1-andriy.shevchenko@linux.intel.com>
References: <20210120214547.89770-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We already have a nice helper called get_options() which can be used
to validate the input format. Replace isrange() by using it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
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

