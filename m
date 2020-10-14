Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E77D728E156
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 15:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbgJNNb7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 09:31:59 -0400
Received: from mga17.intel.com ([192.55.52.151]:1113 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727356AbgJNNb7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Oct 2020 09:31:59 -0400
IronPort-SDR: oJSyYJBTfFz8eYsNGbNbgGTLhMAs7VFiNgfD04hVNA5Z2KCzLYSMiL3xY6crgsWr3HPjYEb4uB
 uWj6vRnlEOyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="145966621"
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="145966621"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2020 06:31:58 -0700
IronPort-SDR: fZVzV7IB8vmi5n2ekwe2Qe8kLOdALW07/TcQtxNiXhBp7z6bzGFyfiZGULQax2g1WUkCfF2sCw
 SUzIsF4EiXHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="530830586"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 14 Oct 2020 06:31:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 13C2D163; Wed, 14 Oct 2020 16:31:56 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/3] gpiolib: acpi: Use named item for enum gpiod_flags variable
Date:   Wed, 14 Oct 2020 16:31:53 +0300
Message-Id: <20201014133154.30610-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201014133154.30610-1-andriy.shevchenko@linux.intel.com>
References: <20201014133154.30610-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use named item instead of plain integer for enum gpiod_flags
to make it clear that even 0 has its own meaning.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 52b961673f16..1b372f0dfe63 100644
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

