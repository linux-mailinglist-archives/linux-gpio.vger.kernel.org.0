Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03B721F9B6E
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 17:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730829AbgFOPFy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 11:05:54 -0400
Received: from mga11.intel.com ([192.55.52.93]:44017 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730936AbgFOPFw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 11:05:52 -0400
IronPort-SDR: PmKJ/bqX1hnNle0bZ16nBjAvo7xxunIBQm8ReMO5DAR2n2AH9G+t66CUyKI5ajQvJJuUYwMk41
 1wbh2rHYXxWA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 08:05:50 -0700
IronPort-SDR: rgYlEmvlyFrPhXeBlLqAAA84/xJijD93yqnpaUrAnFDTvCTCKlTE1b2Qw8yiidZMOmfUKweHmm
 9HY2/uoG4QgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="276588005"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 15 Jun 2020 08:05:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E7B9092; Mon, 15 Jun 2020 18:05:46 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/5] gpiolib: Introduce for_each_requested_gpio_in_range() macro
Date:   Mon, 15 Jun 2020 18:05:41 +0300
Message-Id: <20200615150545.87964-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200615150545.87964-1-andriy.shevchenko@linux.intel.com>
References: <20200615150545.87964-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Introduce for_each_requested_gpio_in_range() macro which helps
to iterate over requested GPIO in a range. There are already
potential users of it, which are going to be converted
by the following patches.

For most of them for_each_requested_gpio() shortcut has been added.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/gpio/driver.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 4d949e82fd19..b0402f884999 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -474,6 +474,22 @@ struct gpio_chip {
 extern const char *gpiochip_is_requested(struct gpio_chip *gc,
 			unsigned int offset);
 
+/**
+ * for_each_requested_gpio_in_range - iterates over requested GPIOs in a given range
+ * @chip:	the chip to query
+ * @i:		loop variable
+ * @base:	first GPIO in the range
+ * @size:	amount of GPIOs to check starting from @base
+ * @label:	label of current GPIO
+ */
+#define for_each_requested_gpio_in_range(chip, i, base, size, label)			\
+	for (i = 0; i < size; i++)							\
+		if ((label = gpiochip_is_requested(chip, base + i)) == NULL) {} else
+
+/* Iterates over all requested GPIO of the given @chip */
+#define for_each_requested_gpio(chip, i, label)						\
+	for_each_requested_gpio_in_range(chip, i, 0, chip->ngpio, label)
+
 /* add/remove chips */
 extern int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 				      struct lock_class_key *lock_key,
-- 
2.27.0.rc2

