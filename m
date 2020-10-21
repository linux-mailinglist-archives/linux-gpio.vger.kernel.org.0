Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D45D8294BC1
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Oct 2020 13:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441984AbgJULZy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Oct 2020 07:25:54 -0400
Received: from mga07.intel.com ([134.134.136.100]:6607 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2439418AbgJULZy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Oct 2020 07:25:54 -0400
IronPort-SDR: GD4ejsujeA86kRcQ1/81fN19h1bdazjF9N4lIhr1Uxf62H0YO+QPlyX91r09mUIvqLiRJXiNsa
 f9pojW78Ev7A==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="231543261"
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; 
   d="scan'208";a="231543261"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 04:25:40 -0700
IronPort-SDR: Z/S+3Kz5wV+Udn6ls0tjyG3UaBTjoTzk9AYzlfcNxUzB4rwVmaUO9PhMIzYiSmW3W6kPZS2Ub8
 +Phoz9zF3lOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; 
   d="scan'208";a="466263048"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 21 Oct 2020 04:25:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0A446377; Wed, 21 Oct 2020 14:25:37 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] gpiolib: Unify expectations about ->request() returned value
Date:   Wed, 21 Oct 2020 14:25:36 +0300
Message-Id: <20201021112537.40738-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Half of the code in the GPIO library is written in an expectation that
any non-zero value returned from the ->request() callback is an error code,
while some code checks only for negative values.

Unify expectations about ->request() returned value to be non-zero
for an error and 0 for the success.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-sysfs.c | 2 +-
 drivers/gpio/gpiolib.c       | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index fe580d6b8d0d..f3b886e2132c 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -476,7 +476,7 @@ static ssize_t export_store(struct class *class,
 	 */
 
 	status = gpiod_request(desc, "sysfs");
-	if (status < 0) {
+	if (status) {
 		if (status == -EPROBE_DEFER)
 			status = -ENODEV;
 		goto done;
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4df1f1a23a8b..0e6dddce207d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1985,7 +1985,7 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 			ret = -EINVAL;
 		spin_lock_irqsave(&gpio_lock, flags);
 
-		if (ret < 0) {
+		if (ret) {
 			desc_set_label(desc, NULL);
 			kfree_const(label);
 			clear_bit(FLAG_REQUESTED, &desc->flags);
@@ -2051,7 +2051,7 @@ int gpiod_request(struct gpio_desc *desc, const char *label)
 
 	if (try_module_get(gdev->owner)) {
 		ret = gpiod_request_commit(desc, label);
-		if (ret < 0)
+		if (ret)
 			module_put(gdev->owner);
 		else
 			get_device(&gdev->dev);
@@ -3968,7 +3968,7 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
 	 * the device name as label
 	 */
 	ret = gpiod_request(desc, con_id ? con_id : devname);
-	if (ret < 0) {
+	if (ret) {
 		if (ret == -EBUSY && flags & GPIOD_FLAGS_BIT_NONEXCLUSIVE) {
 			/*
 			 * This happens when there are several consumers for
-- 
2.28.0

