Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B328A1E14E6
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 21:40:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390219AbgEYTkb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 15:40:31 -0400
Received: from mga01.intel.com ([192.55.52.88]:7415 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388705AbgEYTkb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 25 May 2020 15:40:31 -0400
IronPort-SDR: Ecj7cs0Juw4gIrXbqk9fIW1YS16glwuKgyyB+Kc4iyy1PEzjeDWFttzbBp4tlAVzoWIGfPOqdl
 uj9CTlcVfHIQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2020 12:40:31 -0700
IronPort-SDR: CIZHBOe0ybjnsBA1KpFb8Cs3cFXGDADE3Eu5VBDw5i8189fn6h5oAareahslkbbLENljD+fglA
 +UHGYWtJTD5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,434,1583222400"; 
   d="scan'208";a="256281640"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 25 May 2020 12:40:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 88299101; Mon, 25 May 2020 22:40:29 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] gpiolib: Separate GPIO_GET_LINEINFO_WATCH_IOCTL conditional
Date:   Mon, 25 May 2020 22:40:28 +0300
Message-Id: <20200525194028.74236-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We already have two conditionals inside the outer one to check
if the command is GPIO_GET_LINEINFO_WATCH_IOCTL. I think it's
time to actually do what I have proposed in the first place, i.e.
to separate GPIO_GET_LINEINFO_WATCH_IOCTL from GPIO_GET_LINEINFO_IOCTL.
It's +13 LOCs, and surprisingly only +13 bytes of binary on x86_32,
but for the price of much better readability.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index eaa0e209188d..8e3945eb41e3 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1272,8 +1272,7 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		if (copy_to_user(ip, &chipinfo, sizeof(chipinfo)))
 			return -EFAULT;
 		return 0;
-	} else if (cmd == GPIO_GET_LINEINFO_IOCTL ||
-		   cmd == GPIO_GET_LINEINFO_WATCH_IOCTL) {
+	} else if (cmd == GPIO_GET_LINEINFO_IOCTL) {
 		struct gpioline_info lineinfo;
 
 		if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
@@ -1285,23 +1284,37 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 
 		hwgpio = gpio_chip_hwgpio(desc);
 
-		if (cmd == GPIO_GET_LINEINFO_WATCH_IOCTL &&
-		    test_bit(hwgpio, priv->watched_lines))
-			return -EBUSY;
-
 		gpio_desc_to_lineinfo(desc, &lineinfo);
 
 		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
 			return -EFAULT;
-
-		if (cmd == GPIO_GET_LINEINFO_WATCH_IOCTL)
-			set_bit(hwgpio, priv->watched_lines);
-
 		return 0;
 	} else if (cmd == GPIO_GET_LINEHANDLE_IOCTL) {
 		return linehandle_create(gdev, ip);
 	} else if (cmd == GPIO_GET_LINEEVENT_IOCTL) {
 		return lineevent_create(gdev, ip);
+	} else if (cmd == GPIO_GET_LINEINFO_WATCH_IOCTL) {
+		struct gpioline_info lineinfo;
+
+		if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
+			return -EFAULT;
+
+		desc = gpiochip_get_desc(gc, lineinfo.line_offset);
+		if (IS_ERR(desc))
+			return PTR_ERR(desc);
+
+		hwgpio = gpio_chip_hwgpio(desc);
+
+		if (test_bit(hwgpio, priv->watched_lines))
+			return -EBUSY;
+
+		gpio_desc_to_lineinfo(desc, &lineinfo);
+
+		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
+			return -EFAULT;
+
+		set_bit(hwgpio, priv->watched_lines);
+		return 0;
 	} else if (cmd == GPIO_GET_LINEINFO_UNWATCH_IOCTL) {
 		if (copy_from_user(&offset, ip, sizeof(offset)))
 			return -EFAULT;
-- 
2.26.2

