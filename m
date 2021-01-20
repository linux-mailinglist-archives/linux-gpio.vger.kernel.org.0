Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5C752FDDD1
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 01:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbhAUAWx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Jan 2021 19:22:53 -0500
Received: from mga17.intel.com ([192.55.52.151]:64342 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732972AbhATVrl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Jan 2021 16:47:41 -0500
IronPort-SDR: YYXx/PZ32LcSds0/lxIHqfeFd6gtYpR0bJ5wPrLu8+IyyLACe2UMfE13gJEhDx1F/34jFFT2tb
 JZFVQd6FItxA==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="158956878"
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; 
   d="scan'208";a="158956878"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2021 13:45:51 -0800
IronPort-SDR: rTPkBex/fJSxMVkK0f3ycSEgS3DYOuFvOAEZ5FWd6vOWmpx/0bX7wPmK+TLp+a33MT7xmTuxgg
 XCbmmBEGmR+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; 
   d="scan'208";a="385021657"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 20 Jan 2021 13:45:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C9EB71D7; Wed, 20 Jan 2021 23:45:48 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 5/5] gpio: aggregator: Remove trailing comma in terminator entries
Date:   Wed, 20 Jan 2021 23:45:47 +0200
Message-Id: <20210120214547.89770-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120214547.89770-1-andriy.shevchenko@linux.intel.com>
References: <20210120214547.89770-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove trailing comma in terminator entries to avoid potential
expanding an array behind it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-aggregator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 40a081b095fb..0cab833fbd81 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -244,7 +244,7 @@ static DRIVER_ATTR_WO(delete_device);
 static struct attribute *gpio_aggregator_attrs[] = {
 	&driver_attr_new_device.attr,
 	&driver_attr_delete_device.attr,
-	NULL,
+	NULL
 };
 ATTRIBUTE_GROUPS(gpio_aggregator);
 
@@ -518,7 +518,7 @@ static const struct of_device_id gpio_aggregator_dt_ids[] = {
 	 * Add GPIO-operated devices controlled from userspace below,
 	 * or use "driver_override" in sysfs
 	 */
-	{},
+	{}
 };
 MODULE_DEVICE_TABLE(of, gpio_aggregator_dt_ids);
 #endif
-- 
2.29.2

