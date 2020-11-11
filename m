Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB422AFB40
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 23:20:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbgKKWUa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 17:20:30 -0500
Received: from mga14.intel.com ([192.55.52.115]:40626 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbgKKWUa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 17:20:30 -0500
IronPort-SDR: nrcfnW2dhfm2wRRyq7U7aj4b8fASJZiOUYQDmBPVFdmTteIINK0CbjkJLULoHflupAVVYSU0Xn
 HcpSYIaF6m3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="169441943"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="169441943"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 14:20:29 -0800
IronPort-SDR: 9rIObGCQZYpX0L5pchYWSksFzHBM4Cun88EWDpbW4g+MhW7Cq0+NeVjupGUnsl3S5Db2WoKKMi
 0LZ0uVJR/XPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="530388682"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 11 Nov 2020 14:20:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7CA07D2; Thu, 12 Nov 2020 00:20:27 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v7 02/18] gpiolib: add missed break statement
Date:   Thu, 12 Nov 2020 00:19:52 +0200
Message-Id: <20201111222008.39993-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
References: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It's no difference in the functionality, but after the change the code
is less error prone to various checkers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
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

