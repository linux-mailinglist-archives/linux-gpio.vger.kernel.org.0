Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEA692AC660
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 21:53:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730260AbgKIUxw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 15:53:52 -0500
Received: from mga02.intel.com ([134.134.136.20]:60885 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729817AbgKIUxw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Nov 2020 15:53:52 -0500
IronPort-SDR: VcGrCk3y4Z0+T+KBASCPAGRF9KJ5A+f64WfjPBhqMtBGmIy6h0o2m2A+2G+o8G3Pl4+2poqpRx
 KEq9834QAnug==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="156876107"
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="156876107"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 12:53:51 -0800
IronPort-SDR: bYKvPhwNODVCHNAhYPF8vxKFjUWox1A853PUmY69BA7NaFaQ6G35QtdVZGMASIQdx8gLK7Jff+
 R2Hl7eaMrFEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="308142929"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 09 Nov 2020 12:53:48 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id EEC8E1CC; Mon,  9 Nov 2020 22:53:47 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v5 02/17] gpiolib: add missed break statement
Date:   Mon,  9 Nov 2020 22:53:17 +0200
Message-Id: <20201109205332.19592-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It's no difference in the functionality, but after the change the code
is less error prone to various checkers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f94225d7817b..b45487aace7e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2108,6 +2108,7 @@ static int gpio_set_config(struct gpio_desc *desc, enum pin_config_param mode)
 
 	default:
 		arg = 0;
+		break;
 	}
 
 	config = PIN_CONF_PACKED(mode, arg);
-- 
2.28.0

