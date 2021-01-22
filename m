Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 386EB30035A
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 13:41:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbhAVMk4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 07:40:56 -0500
Received: from mga04.intel.com ([192.55.52.120]:54650 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727875AbhAVMku (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 Jan 2021 07:40:50 -0500
IronPort-SDR: 9xg/SgbBsKlLvWRzt/BSMBV8y1aVqJwwq+yt+LqJMt6r5Tvu/npjxB5UUnIVwueCAok91BhRuV
 /L2+X2YpduBQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="176865606"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="176865606"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 04:39:01 -0800
IronPort-SDR: o9fbGnk/crlOw9W9LS9mMI7SXsggAseC9At/NufOQpaMtWE604lgaOdG3MJOqenN0Ux8n5YPJV
 AdT4CEkunU1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="355225545"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 22 Jan 2021 04:38:59 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 080E1348; Fri, 22 Jan 2021 14:38:57 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 6/6] gpio: aggregator: Remove trailing comma in terminator entries
Date:   Fri, 22 Jan 2021 14:38:53 +0200
Message-Id: <20210122123853.75162-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122123853.75162-1-andriy.shevchenko@linux.intel.com>
References: <20210122123853.75162-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove trailing comma in terminator entries to avoid potential
expanding an array behind it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3: added tags (Linus, Bart, Geert)
 drivers/gpio/gpio-aggregator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 13e473c97ce4..08171431bb8f 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -243,7 +243,7 @@ static DRIVER_ATTR_WO(delete_device);
 static struct attribute *gpio_aggregator_attrs[] = {
 	&driver_attr_new_device.attr,
 	&driver_attr_delete_device.attr,
-	NULL,
+	NULL
 };
 ATTRIBUTE_GROUPS(gpio_aggregator);
 
@@ -517,7 +517,7 @@ static const struct of_device_id gpio_aggregator_dt_ids[] = {
 	 * Add GPIO-operated devices controlled from userspace below,
 	 * or use "driver_override" in sysfs
 	 */
-	{},
+	{}
 };
 MODULE_DEVICE_TABLE(of, gpio_aggregator_dt_ids);
 #endif
-- 
2.29.2

