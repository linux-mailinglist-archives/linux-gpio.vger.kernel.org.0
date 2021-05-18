Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3B19387878
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 14:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244000AbhERMKR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 May 2021 08:10:17 -0400
Received: from mga14.intel.com ([192.55.52.115]:28990 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235289AbhERMKR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 May 2021 08:10:17 -0400
IronPort-SDR: 1aqobQwW3kxrz8MoD2qQNCd8ZHYLUL2To0M48+ItFvf2TBT7Naq10D3Dy7NgdtcPtawd0SYI1e
 Lr7OVmZK6f6Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="200389350"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="200389350"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2021 05:08:59 -0700
IronPort-SDR: vLeCAHE20ijNg3k4AUW4yxNtE3HlvJXu7AvNQxCLO4sH/XRMKqKRwAEH93LODTDIe2+O0kW3eN
 bWGmQmo8HbCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="433047511"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 18 May 2021 05:08:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2260D12F; Tue, 18 May 2021 15:09:19 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v1 1/1] gpiolib: Use sysfs_emit() in "show" functions
Date:   Tue, 18 May 2021 15:09:17 +0300
Message-Id: <20210518120917.30336-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The sysfs_emit() function was introduced to make it less ambiguous
which function is preferred when writing to the output buffer in
a "show" callback [1].

Convert the GPIO library sysfs interface from sprintf() to sysfs_emit()
accordingly, as the latter is aware of the PAGE_SIZE buffer and correctly
returns the number of bytes written into the buffer.

No functional change intended.

[1] Documentation/filesystems/sysfs.rst

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-sysfs.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 7c5afd999210..d836aba91d3c 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -66,9 +66,7 @@ static ssize_t direction_show(struct device *dev,
 	mutex_lock(&data->mutex);
 
 	gpiod_get_direction(desc);
-	status = sprintf(buf, "%s\n",
-			test_bit(FLAG_IS_OUT, &desc->flags)
-				? "out" : "in");
+	status = sysfs_emit(buf, "%s\n", test_bit(FLAG_IS_OUT, &desc->flags) ? "out" : "in");
 
 	mutex_unlock(&data->mutex);
 
@@ -109,13 +107,9 @@ static ssize_t value_show(struct device *dev,
 	mutex_lock(&data->mutex);
 
 	status = gpiod_get_value_cansleep(desc);
-	if (status < 0)
-		goto err;
+	if (status >= 0)
+		status = sysfs_emit(buf, "%zd\n", status);
 
-	buf[0] = '0' + status;
-	buf[1] = '\n';
-	status = 2;
-err:
 	mutex_unlock(&data->mutex);
 
 	return status;
@@ -249,11 +243,11 @@ static ssize_t edge_show(struct device *dev,
 	mutex_lock(&data->mutex);
 
 	for (i = 0; i < ARRAY_SIZE(trigger_types); i++) {
-		if (data->irq_flags == trigger_types[i].flags) {
-			status = sprintf(buf, "%s\n", trigger_types[i].name);
+		if (data->irq_flags == trigger_types[i].flags)
 			break;
-		}
 	}
+	if (i < ARRAY_SIZE(trigger_types))
+		status = sysfs_emit(buf, "%s\n", trigger_types[i].name);
 
 	mutex_unlock(&data->mutex);
 
@@ -333,8 +327,7 @@ static ssize_t active_low_show(struct device *dev,
 
 	mutex_lock(&data->mutex);
 
-	status = sprintf(buf, "%d\n",
-				!!test_bit(FLAG_ACTIVE_LOW, &desc->flags));
+	status = sysfs_emit(buf, "%d\n", !!test_bit(FLAG_ACTIVE_LOW, &desc->flags));
 
 	mutex_unlock(&data->mutex);
 
@@ -412,7 +405,7 @@ static ssize_t base_show(struct device *dev,
 {
 	const struct gpio_chip	*chip = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%d\n", chip->base);
+	return sysfs_emit(buf, "%d\n", chip->base);
 }
 static DEVICE_ATTR_RO(base);
 
@@ -421,7 +414,7 @@ static ssize_t label_show(struct device *dev,
 {
 	const struct gpio_chip	*chip = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%s\n", chip->label ? : "");
+	return sysfs_emit(buf, "%s\n", chip->label ?: "");
 }
 static DEVICE_ATTR_RO(label);
 
@@ -430,7 +423,7 @@ static ssize_t ngpio_show(struct device *dev,
 {
 	const struct gpio_chip	*chip = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%u\n", chip->ngpio);
+	return sysfs_emit(buf, "%u\n", chip->ngpio);
 }
 static DEVICE_ATTR_RO(ngpio);
 
-- 
2.30.2

