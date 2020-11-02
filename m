Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 513352A33E5
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Nov 2020 20:18:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbgKBTSD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Nov 2020 14:18:03 -0500
Received: from mga11.intel.com ([192.55.52.93]:65152 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726493AbgKBTSC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 2 Nov 2020 14:18:02 -0500
IronPort-SDR: +tH7qbqrFfY2OMWFk+UDMb3X0K1KKptOOelylrRc74D58knmVaCuFMqw6F5a3yakMdtHQZJItT
 zVyrBBm5fggw==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="165433910"
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="165433910"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 11:18:02 -0800
IronPort-SDR: 46nG/xMctroRdTZZJneRFaN42WJ8uRJa6i2WJ017/NtGnJ0btWH3fi620CLTK0EhMcs54UTq85
 PG+Zl9iSbHEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="305550045"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 02 Nov 2020 11:18:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E43B7D2; Mon,  2 Nov 2020 21:17:59 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v3 2/4] gpiolib: acpi: Use named item for enum gpiod_flags variable
Date:   Mon,  2 Nov 2020 21:17:20 +0200
Message-Id: <20201102191722.81502-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201102191722.81502-1-andriy.shevchenko@linux.intel.com>
References: <20201102191722.81502-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use named item instead of plain integer for enum gpiod_flags
to make it clear that even 0 has its own meaning.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/gpio/gpiolib-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 3a39e8a93226..c127b410a7a2 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -1136,7 +1136,7 @@ acpi_gpiochip_parse_own_gpio(struct acpi_gpio_chip *achip,
 	int ret;
 
 	*lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
-	*dflags = 0;
+	*dflags = GPIOD_ASIS;
 	*name = NULL;
 
 	ret = fwnode_property_read_u32_array(fwnode, "gpios", gpios,
-- 
2.28.0

