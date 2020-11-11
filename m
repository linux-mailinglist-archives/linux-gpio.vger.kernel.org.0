Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 314A02AFAFF
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 23:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbgKKWGU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 17:06:20 -0500
Received: from mga09.intel.com ([134.134.136.24]:1069 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725996AbgKKWGU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 17:06:20 -0500
IronPort-SDR: 04zdcvQpAIRZOrtTC3QkXr4iFb1V0WJq7XAtUynap8ENHr0IAi679rKWz9E/gDuoF6j5Q8eKeU
 +we3+Utx+CEg==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="170391842"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="170391842"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 14:06:20 -0800
IronPort-SDR: rM/ENGk5ZM1TMullU2QHXcfQBTURLeJeFpeqlV06TSwMEgADjsEeJIFjR2Dt/S3SAgCsLdSMGO
 vep8/TgYrofA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="366093065"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Nov 2020 14:06:18 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 52ACCD2; Thu, 12 Nov 2020 00:06:17 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v6 01/18] gpiolib: use proper API to pack pin configuration parameters
Date:   Thu, 12 Nov 2020 00:05:42 +0200
Message-Id: <20201111220559.39680-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
References: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Instead of open coded macro use, call pinconf_to_config_packed().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b45487aace7e..87bb73991337 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2111,7 +2111,7 @@ static int gpio_set_config(struct gpio_desc *desc, enum pin_config_param mode)
 		break;
 	}
 
-	config = PIN_CONF_PACKED(mode, arg);
+	config = pinconf_to_config_packed(mode, arg);
 	return gpio_do_set_config(gc, gpio_chip_hwgpio(desc), config);
 }
 
-- 
2.28.0

