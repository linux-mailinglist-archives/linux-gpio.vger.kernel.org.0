Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21EC43F631E
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Aug 2021 18:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbhHXQtQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Aug 2021 12:49:16 -0400
Received: from mga02.intel.com ([134.134.136.20]:10207 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232943AbhHXQtH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Aug 2021 12:49:07 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="204550694"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="204550694"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:48:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="684036762"
Received: from inlubt0177.iind.intel.com ([10.223.67.91])
  by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2021 09:48:20 -0700
From:   lakshmi.sowjanya.d@intel.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, mgross@linux.intel.com,
        andriy.shevchenko@linux.intel.com, tamal.saha@intel.com,
        bala.senthil@intel.com, lakshmi.sowjanya.d@intel.com
Subject: [RFC PATCH v1 06/20] gpio: Add set_input and polling interface to GPIO lib code
Date:   Tue, 24 Aug 2021 22:17:47 +0530
Message-Id: <20210824164801.28896-7-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>

Some Intel Timed I/O devices do not implement IRQ functionality. Augment
read() interface to allow polling.

Move input setup functionality to a separate function simplifying
linereq_create() to add output code in subsequent commit.

Co-developed-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Tamal Saha <tamal.saha@intel.com>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Reviewed-by: Mark Gross <mgross@linux.intel.com>
---
 drivers/gpio/gpiolib-cdev.c | 52 +++++++++++++++++++++++++++++++++----
 1 file changed, 47 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 4741bf34750b..cb6b9155884c 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1331,6 +1331,52 @@ static const struct file_operations line_fileops = {
 #endif
 };
 
+static int setup_input(struct linereq *lr, struct gpio_v2_line_config *lc,
+		       u32 line_no, unsigned int offset, u32 lflags)
+{
+	int err, ret;
+
+	/* Only one bias flag can be set. */
+	if (((lflags & GPIO_V2_LINE_FLAG_BIAS_DISABLED) &&
+	     (lflags & (GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN |
+			GPIO_V2_LINE_FLAG_BIAS_PULL_UP))) ||
+	    ((lflags & GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN) &&
+	     (lflags & GPIO_V2_LINE_FLAG_BIAS_PULL_UP)))
+		return -EINVAL;
+
+	if (lflags & GPIO_V2_LINE_FLAG_ACTIVE_LOW)
+		set_bit(FLAG_ACTIVE_LOW, &lr->lines[line_no].desc->flags);
+	if (lflags & GPIO_V2_LINE_FLAG_BIAS_DISABLED)
+		set_bit(FLAG_BIAS_DISABLE, &lr->lines[line_no].desc->flags);
+	if (lflags & GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN)
+		set_bit(FLAG_PULL_DOWN, &lr->lines[line_no].desc->flags);
+	if (lflags & GPIO_V2_LINE_FLAG_BIAS_PULL_UP)
+		set_bit(FLAG_PULL_UP, &lr->lines[line_no].desc->flags);
+
+	err = gpiod_direction_input(lr->lines[line_no].desc);
+	if (err)
+		return err;
+
+	ret = edge_detector_setup(&lr->lines[line_no], lc, line_no,
+				  lflags & GPIO_V2_LINE_EDGE_FLAGS);
+	if (ret < 0) {
+		if (ret != -ENXIO) {
+			if (lr->gdev->chip->setup_poll &&
+			    lr->gdev->chip->setup_poll(lr->gdev->chip, offset,
+						       &lflags) == 0 &&
+			    lr->gdev->chip->do_poll)
+				ret = 0;
+			else
+				return -ENODEV;
+		} else {
+			return -ENODEV;
+		}
+	}
+
+	lr->lines[line_no].eflags = lflags;
+	return ret;
+}
+
 static int linereq_create(struct gpio_device *gdev, void __user *ip)
 {
 	struct gpio_v2_line_request ulr;
@@ -1423,12 +1469,8 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 			if (ret)
 				goto out_free_linereq;
 		} else if (flags & GPIO_V2_LINE_FLAG_INPUT) {
-			ret = gpiod_direction_input(desc);
-			if (ret)
-				goto out_free_linereq;
+			ret = setup_input(lr, lc, i, offset, flags);
 
-			ret = edge_detector_setup(&lr->lines[i], lc, i,
-					flags & GPIO_V2_LINE_EDGE_FLAGS);
 			if (ret)
 				goto out_free_linereq;
 		}
-- 
2.17.1

