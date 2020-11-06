Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C6092A9DE6
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 20:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728091AbgKFTXM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 14:23:12 -0500
Received: from mga11.intel.com ([192.55.52.93]:17142 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728075AbgKFTXM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 6 Nov 2020 14:23:12 -0500
IronPort-SDR: 6iWnOKOFDFhipoKmH5V3D02IHHSFjo192lpresWzV8f4COkxKcxkJosvuD4dLYpgi86pwAu/5m
 coKsbifR2zFA==
X-IronPort-AV: E=McAfee;i="6000,8403,9797"; a="166079998"
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; 
   d="scan'208";a="166079998"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2020 11:23:12 -0800
IronPort-SDR: nWyxqDOvAInUd3p5PLqEf7S8LiTFcKg75mzSLeVoo73aVQCDAluoXqJ1lKOjbeCYANa6lzwzZn
 dlqYdSkOchrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; 
   d="scan'208";a="364272494"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Nov 2020 11:23:10 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D55C456E; Fri,  6 Nov 2020 21:23:07 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 8/9] gpiolib: acpi: Use BIT() macro to increase readability
Date:   Fri,  6 Nov 2020 21:23:03 +0200
Message-Id: <20201106192304.49179-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106192304.49179-1-andriy.shevchenko@linux.intel.com>
References: <20201106192304.49179-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We may use BIT() macro to increase readability in
acpi_gpio_adr_space_handler().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-acpi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index bcb76b4e82aa..64a898c8719e 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -1097,8 +1097,7 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 		mutex_unlock(&achip->conn_lock);
 
 		if (function == ACPI_WRITE)
-			gpiod_set_raw_value_cansleep(desc,
-						     !!((1 << i) & *value));
+			gpiod_set_raw_value_cansleep(desc, !!(*value & BIT(i)));
 		else
 			*value |= (u64)gpiod_get_raw_value_cansleep(desc) << i;
 	}
-- 
2.28.0

