Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F18F387CD7
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 17:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244861AbhERPvT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 May 2021 11:51:19 -0400
Received: from mga11.intel.com ([192.55.52.93]:45895 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244533AbhERPvT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 May 2021 11:51:19 -0400
IronPort-SDR: /pYI1ZoLG7TMiPJEk7OoexsZC0C/R4B3PGmXwKj4rIOnD2D5H15gAd+DGbV8cE/JwMUK0eSaj1
 pAXRelGtjLcA==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="197657331"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="197657331"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2021 08:50:00 -0700
IronPort-SDR: J6YrVZQkYKx+An4K5vDSlHfYFMiKMlVYAMS24LqhM5IAE+L/X8KC0+BQgEDuPhPz+Etyswjc4I
 8nMojLixL2/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="411328265"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 18 May 2021 08:49:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id B15BF348; Tue, 18 May 2021 18:50:19 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Suresh Balakrishnan <suresh.balakrishnan@intel.com>
Subject: [PATCH v1 1/2] gpiolib: Never return internal error codes to user space
Date:   Tue, 18 May 2021 18:50:12 +0300
Message-Id: <20210518155013.45622-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently it's possible that character device interface may return
the error codes which are not supposed to be seen by user space.
In this case it's EPROBE_DEFER.

Wrap it to return -ENODEV instead as sysfs does.

Fixes: d7c51b47ac11 ("gpio: userspace ABI for reading/writing GPIO lines")
Fixes: 61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
Fixes: 3c0d9c635ae2 ("gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and GPIO_V2_LINE_GET_VALUES_IOCTL")
Reported-by: Suresh Balakrishnan <suresh.balakrishnan@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-cdev.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 1631727bf0da..1d8f66880d63 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -331,8 +331,11 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 		}
 
 		ret = gpiod_request(desc, lh->label);
-		if (ret)
+		if (ret) {
+			if (ret == -EPROBE_DEFER)
+				ret = -ENODEV;
 			goto out_free_lh;
+		}
 		lh->descs[i] = desc;
 		linehandle_flags_to_desc_flags(handlereq.flags, &desc->flags);
 
@@ -1379,8 +1382,11 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 		}
 
 		ret = gpiod_request(desc, lr->label);
-		if (ret)
+		if (ret) {
+			if (ret == -EPROBE_DEFER)
+				ret = -ENODEV;
 			goto out_free_linereq;
+		}
 
 		lr->lines[i].desc = desc;
 		flags = gpio_v2_line_config_flags(lc, i);
@@ -1765,8 +1771,11 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	}
 
 	ret = gpiod_request(desc, le->label);
-	if (ret)
+	if (ret) {
+		if (ret == -EPROBE_DEFER)
+			ret = -ENODEV;
 		goto out_free_le;
+	}
 	le->desc = desc;
 	le->eflags = eflags;
 
-- 
2.30.2

