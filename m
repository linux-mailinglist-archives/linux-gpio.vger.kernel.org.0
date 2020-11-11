Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9419A2AFB02
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 23:06:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgKKWGW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 17:06:22 -0500
Received: from mga04.intel.com ([192.55.52.120]:53545 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726255AbgKKWGW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 17:06:22 -0500
IronPort-SDR: l7toK0PSdfAB6d1CF9HrKcsBuQU6VM/VpZJriBujq7EcWsP+oiWh1/qXfOljmXQVeKYA6cGM4S
 nDz/y4JRRdNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="167641919"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="167641919"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 14:06:22 -0800
IronPort-SDR: LRDacouciD5W8t9T5p45XrZHa/5UOJ19642NTv96w6UqwSOpmd7gHWZgUoTG7b08WZRnjjE904
 daE+iSI0N30Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="356817214"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 11 Nov 2020 14:06:20 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 95E1F4B0; Thu, 12 Nov 2020 00:06:17 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v6 07/18] gpiolib: acpi: Use named item for enum gpiod_flags variable
Date:   Thu, 12 Nov 2020 00:05:48 +0200
Message-Id: <20201111220559.39680-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
References: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use named item instead of plain integer for enum gpiod_flags
to make it clear that even 0 has its own meaning.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
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

