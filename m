Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0302287551
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Oct 2020 15:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729718AbgJHNlI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Oct 2020 09:41:08 -0400
Received: from mga04.intel.com ([192.55.52.120]:24226 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725871AbgJHNlI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Oct 2020 09:41:08 -0400
IronPort-SDR: siMILhWZj2j0+AiX3CJ47AOThgjDgBGGbb31Km+ACjZ4DiQDEMuPbb42RF8zWnvWmw3rP633U6
 S8k+klQgQNaQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9767"; a="162696951"
X-IronPort-AV: E=Sophos;i="5.77,350,1596524400"; 
   d="scan'208";a="162696951"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2020 06:41:07 -0700
IronPort-SDR: bFrT+3XcoPp1rw7CBKh0j5GnmPH1gXpjm6Qd35fgmx80NJ4sSgkla82wgfFuVJ3UVsNRE4wCXe
 zOtmpHGuCowA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,350,1596524400"; 
   d="scan'208";a="343413453"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 08 Oct 2020 06:41:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 91F4D1F5; Thu,  8 Oct 2020 16:41:05 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2] gpiolib: Switch to use compat_need_64bit_alignment_fixup() helper
Date:   Thu,  8 Oct 2020 16:41:05 +0300
Message-Id: <20201008134105.51387-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The new compat_need_64bit_alignment_fixup() helper allows to avoid
ugly ifdeffery in IOCTL compatible code. Use it in GPIO cdev code.

Depends-on: 527c412519eb ("compat: add a compat_need_64bit_alignment_fixup() helper")
Depends-on: cc7886d25bca ("compat: lift compat_s64 and compat_u64 to <asm-generic/compat.h>")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: removed lineevent_get_size() completely, fixed typo in commit message
 drivers/gpio/gpiolib-cdev.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index e9faeaf65d14..192721f829a3 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1479,21 +1479,10 @@ static __poll_t lineevent_poll(struct file *file,
 	return events;
 }
 
-static ssize_t lineevent_get_size(void)
-{
-#if defined(CONFIG_X86_64) && !defined(CONFIG_UML)
-	/* i386 has no padding after 'id' */
-	if (in_ia32_syscall()) {
-		struct compat_gpioeevent_data {
-			compat_u64	timestamp;
-			u32		id;
-		};
-
-		return sizeof(struct compat_gpioeevent_data);
-	}
-#endif
-	return sizeof(struct gpioevent_data);
-}
+struct compat_gpioeevent_data {
+	compat_u64	timestamp;
+	u32		id;
+};
 
 static ssize_t lineevent_read(struct file *file,
 			      char __user *buf,
@@ -1515,7 +1504,10 @@ static ssize_t lineevent_read(struct file *file,
 	 * actual sizeof() and pass this as an argument to copy_to_user() to
 	 * drop unneeded bytes from the output.
 	 */
-	ge_size = lineevent_get_size();
+	if (compat_need_64bit_alignment_fixup())
+		ge_size = sizeof(struct compat_gpioeevent_data);
+	else
+		ge_size = sizeof(struct gpioevent_data);
 	if (count < ge_size)
 		return -EINVAL;
 
-- 
2.28.0

