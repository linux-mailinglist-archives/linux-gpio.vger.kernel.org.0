Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6E392AFB4F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 23:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727173AbgKKWUp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 17:20:45 -0500
Received: from mga11.intel.com ([192.55.52.93]:62550 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727159AbgKKWUn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 17:20:43 -0500
IronPort-SDR: h1jK4lKWx9z54KzvYLLriegAD4x2LAvz/98AWqHJSDqvTtxRp0jTQu1ORn6/tEMZX2RrccwQEw
 9B/plOUVOIyA==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="166719136"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="166719136"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 14:20:30 -0800
IronPort-SDR: TXv7LshxYPhqv916np938hMIKsUGWmmmT2DVoImZ4eN9bkLkY5bEXKnrMhpqpPNKqRA+uaNyHB
 hZ0pWTPmYz0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="354991218"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 11 Nov 2020 14:20:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 854F3142; Thu, 12 Nov 2020 00:20:27 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v7 03/18] gpiolib: use proper API to pack pin configuration parameters
Date:   Thu, 12 Nov 2020 00:19:53 +0200
Message-Id: <20201111222008.39993-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
References: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
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

