Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C170296330
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Oct 2020 18:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2898456AbgJVQ66 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Oct 2020 12:58:58 -0400
Received: from mga18.intel.com ([134.134.136.126]:27299 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2898409AbgJVQ65 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 22 Oct 2020 12:58:57 -0400
IronPort-SDR: 3Zfz/KHm9M/QNbfTEi54k437tg0QVb7UTrEZC0yYtAnp51jPUclil5+YrEH9u4XNtAPupDWAMt
 N/e+H6dGd+BA==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="155346224"
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; 
   d="scan'208";a="155346224"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2020 09:58:57 -0700
IronPort-SDR: LCYUlsMJaxV6DDb5cbSKEIYC/NtTeFXfWGLPKu7SIWcsyjwJOmmeJp5yxigptbXQGD+7xgHRvo
 OKhsd35oJ7Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; 
   d="scan'208";a="359317205"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Oct 2020 09:58:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0F5D5F2; Thu, 22 Oct 2020 19:58:49 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-gpio@vger.kernel.org, Linus@black.fi.intel.com,
        Walleij@black.fi.intel.com, linus.walleij@linaro.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 3/3] gpiolib: of: Use named item for enum gpiod_flags variable
Date:   Thu, 22 Oct 2020 19:58:47 +0300
Message-Id: <20201022165847.56153-3-andriy.shevchenko@linux.intel.com>
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

Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: no changes
 drivers/gpio/gpiolib-of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 2f895a2b8411..892a513b7a64 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -593,7 +593,7 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 
 	xlate_flags = 0;
 	*lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
-	*dflags = 0;
+	*dflags = GPIOD_ASIS;
 
 	ret = of_property_read_u32(chip_np, "#gpio-cells", &tmp);
 	if (ret)
-- 
2.28.0

