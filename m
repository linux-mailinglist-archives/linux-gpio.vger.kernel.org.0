Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D475F296331
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Oct 2020 18:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2898409AbgJVQ66 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Oct 2020 12:58:58 -0400
Received: from mga18.intel.com ([134.134.136.126]:27299 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2898455AbgJVQ66 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 22 Oct 2020 12:58:58 -0400
IronPort-SDR: XOhFJesKWZeakbDPa9z1BhaXLVzL3NKwgoQa8EUfQULHARqexDVR74ePQr4HSaaSHnhIqmOpQJ
 doolxc66v3aw==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="155346225"
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; 
   d="scan'208";a="155346225"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2020 09:58:57 -0700
IronPort-SDR: PhI8w/z3Lstchtymdz09SDphI61dwK82CyaTG/CsEQb7Nwrd3W2PO1QagtiGqeZkoAhho97TI7
 bi4dMFsZRutA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; 
   d="scan'208";a="359317206"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Oct 2020 09:58:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 05C4287; Thu, 22 Oct 2020 19:58:48 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-gpio@vger.kernel.org, Linus@black.fi.intel.com,
        Walleij@black.fi.intel.com, linus.walleij@linaro.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 2/3] gpiolib: acpi: Use named item for enum gpiod_flags variable
Date:   Thu, 22 Oct 2020 19:58:46 +0300
Message-Id: <20201022165847.56153-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022165847.56153-1-andriy.shevchenko@linux.intel.com>
References: <20201022165847.56153-1-andriy.shevchenko@linux.intel.com>
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
v2: added Rb tag (Mika)
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

