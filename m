Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 820871F9B6D
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 17:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730946AbgFOPFx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 11:05:53 -0400
Received: from mga03.intel.com ([134.134.136.65]:41068 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730829AbgFOPFu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 11:05:50 -0400
IronPort-SDR: gO4HMVIgyhVqc8qFXH+P2LDZVcBKGj1jGtqUo2GRNdgL3Jq8dJXiZaPK94pzZ+i2AmDYDlUcYn
 6oeGOs1PAzrw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 08:05:49 -0700
IronPort-SDR: L3wQOHu8Np4ntkxpOfyTIcMq9hcRCBgvstC4j+YlYoYwoPg/lk5B90sUD9zf8xUOopvkMFtYas
 j7i2YfujoH/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="308755733"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 15 Jun 2020 08:05:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0B97C8CA; Mon, 15 Jun 2020 18:05:47 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Nandor Han <nandor.han@ge.com>,
        Semi Malinen <semi.malinen@ge.com>
Subject: [PATCH v1 4/5] gpio: xra1403: Make use of for_each_requested_gpio()
Date:   Mon, 15 Jun 2020 18:05:44 +0300
Message-Id: <20200615150545.87964-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200615150545.87964-1-andriy.shevchenko@linux.intel.com>
References: <20200615150545.87964-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make use of for_each_requested_gpio() instead of home grown analogue.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Nandor Han <nandor.han@ge.com>
Cc: Semi Malinen <semi.malinen@ge.com>
---
 drivers/gpio/gpio-xra1403.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-xra1403.c b/drivers/gpio/gpio-xra1403.c
index 31b5072b2df0..e2cac12092af 100644
--- a/drivers/gpio/gpio-xra1403.c
+++ b/drivers/gpio/gpio-xra1403.c
@@ -121,6 +121,7 @@ static void xra1403_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	struct xra1403 *xra = gpiochip_get_data(chip);
 	int value[XRA_LAST];
 	int i;
+	const char *label;
 	unsigned int gcr;
 	unsigned int gsr;
 
@@ -136,12 +137,7 @@ static void xra1403_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 
 	gcr = value[XRA_GCR + 1] << 8 | value[XRA_GCR];
 	gsr = value[XRA_GSR + 1] << 8 | value[XRA_GSR];
-	for (i = 0; i < chip->ngpio; i++) {
-		const char *label = gpiochip_is_requested(chip, i);
-
-		if (!label)
-			continue;
-
+	for_each_requested_gpio(chip, i, label) {
 		seq_printf(s, " gpio-%-3d (%-12s) %s %s\n",
 			   chip->base + i, label,
 			   (gcr & BIT(i)) ? "in" : "out",
-- 
2.27.0.rc2

