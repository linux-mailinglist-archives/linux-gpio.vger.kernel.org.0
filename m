Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 713241F9B73
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 17:06:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730784AbgFOPGK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 11:06:10 -0400
Received: from mga06.intel.com ([134.134.136.31]:19525 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730898AbgFOPGA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 11:06:00 -0400
IronPort-SDR: Eyi3MD6nU8Ds/JiD3StRT3YjCwePXrvzzCgFE96KK0liRpkagQ8hUmoAv1y3OO2rcBt8trj2l+
 IfSlu48Ft1ag==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 08:05:50 -0700
IronPort-SDR: PIP2IbfjRAo5T34ZC8+bKxrd4QS8nmpw4Sa+hkLl5MW8as1Z3w1v0CbF2n/28ObE5MkZuOgHG2
 FcbRa9x4xY8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="420401938"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 15 Jun 2020 08:05:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 04D9D795; Mon, 15 Jun 2020 18:05:46 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v1 3/5] gpio: mvebu: Make use of for_each_requested_gpio()
Date:   Mon, 15 Jun 2020 18:05:43 +0300
Message-Id: <20200615150545.87964-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200615150545.87964-1-andriy.shevchenko@linux.intel.com>
References: <20200615150545.87964-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make use of for_each_requested_gpio() instead of home grown analogue.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpio/gpio-mvebu.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index bd65114eb170..433e2c3f3fd5 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -846,6 +846,7 @@ static void mvebu_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 {
 	struct mvebu_gpio_chip *mvchip = gpiochip_get_data(chip);
 	u32 out, io_conf, blink, in_pol, data_in, cause, edg_msk, lvl_msk;
+	const char *label;
 	int i;
 
 	regmap_read(mvchip->regs, GPIO_OUT_OFF + mvchip->offset, &out);
@@ -857,15 +858,10 @@ static void mvebu_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	edg_msk	= mvebu_gpio_read_edge_mask(mvchip);
 	lvl_msk	= mvebu_gpio_read_level_mask(mvchip);
 
-	for (i = 0; i < chip->ngpio; i++) {
-		const char *label;
+	for_each_requested_gpio(chip, i, label) {
 		u32 msk;
 		bool is_out;
 
-		label = gpiochip_is_requested(chip, i);
-		if (!label)
-			continue;
-
 		msk = BIT(i);
 		is_out = !(io_conf & msk);
 
-- 
2.27.0.rc2

