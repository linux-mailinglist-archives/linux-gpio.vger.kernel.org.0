Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D46392AC664
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 21:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgKIUxy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 15:53:54 -0500
Received: from mga01.intel.com ([192.55.52.88]:25510 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730267AbgKIUxy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Nov 2020 15:53:54 -0500
IronPort-SDR: Q0ktuYBrSe0RTfIPh86A9JNpwivahh1eVAZKTEtror6lHDWkcH7zfvPTkkcD8fs1Lfy8u1e8zI
 XFEt+4OQWkKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="187826509"
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="187826509"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 12:53:54 -0800
IronPort-SDR: L8/rPMq6yb18x4xQK8YyspE99IpZ2HT85X+nRtDiKaDzHJ0tYyayoXrYs6+JBUWPhpw+XhWOvl
 D63IBrlCbIGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="530911718"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 09 Nov 2020 12:53:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 05A6D1EA; Mon,  9 Nov 2020 22:53:47 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v5 03/17] gpiolib: use proper API to pack pin configuration parameters
Date:   Mon,  9 Nov 2020 22:53:18 +0200
Message-Id: <20201109205332.19592-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Instead of open coded macro use, call pinconf_to_config_packed().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

