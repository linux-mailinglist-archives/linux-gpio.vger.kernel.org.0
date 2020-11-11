Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C43CD2AFB09
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 23:06:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgKKWGZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 17:06:25 -0500
Received: from mga02.intel.com ([134.134.136.20]:65375 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726849AbgKKWGY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 17:06:24 -0500
IronPort-SDR: DVT077+iPXPGVSSw802dnyExxW9vn3V4N13P0NUwUzUhjLKlULMOyAZMDGLkAr7i3F2c5ibBEB
 RblvP/V2ApRg==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="157241316"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="157241316"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 14:06:23 -0800
IronPort-SDR: uX5Lt0jCwKYl+0hYntFKx/Dlo/ohaT7WhanTiiNe2Ap8P3NHlJgRSr/OKZy+HAvdqm69F1vfst
 OjjVpnrAnkpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="360718158"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2020 14:06:20 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id AC16752A; Thu, 12 Nov 2020 00:06:17 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v6 09/18] gpiolib: acpi: Move non-critical code outside of critical section
Date:   Thu, 12 Nov 2020 00:05:50 +0200
Message-Id: <20201111220559.39680-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
References: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Mika noticed that some code is run under mutex when it doesn't require
the lock, like an error code assignment.

Move non-critical code outside of critical section.

Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index a9254de964cc..b00171d2aaf5 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -1063,8 +1063,8 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 							 GPIO_ACTIVE_HIGH,
 							 flags);
 			if (IS_ERR(desc)) {
-				status = AE_ERROR;
 				mutex_unlock(&achip->conn_lock);
+				status = AE_ERROR;
 				goto out;
 			}
 
@@ -1078,9 +1078,9 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 
 			conn = kzalloc(sizeof(*conn), GFP_KERNEL);
 			if (!conn) {
-				status = AE_NO_MEMORY;
 				gpiochip_free_own_desc(desc);
 				mutex_unlock(&achip->conn_lock);
+				status = AE_NO_MEMORY;
 				goto out;
 			}
 
-- 
2.28.0

