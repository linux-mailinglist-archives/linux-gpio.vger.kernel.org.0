Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13713268DEB
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 16:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgINOie (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 10:38:34 -0400
Received: from mga07.intel.com ([134.134.136.100]:14452 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726300AbgINOh7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Sep 2020 10:37:59 -0400
IronPort-SDR: jgkrzFs/tjOHkBNwd4fpSsvkEwU7voZU/CIOsIU4wkr8SSPSP6wE6BFYb1+/OXifmdn3YqEBVk
 T630ByKfMiIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="223269738"
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; 
   d="scan'208";a="223269738"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2020 07:37:47 -0700
IronPort-SDR: VZZc6BFEfbHen+jJ0J6mx0UWMtQvcOP2uAWQ23RaRo9T9eaqDL539ck3ZsVnnY+xZN+rgPioiB
 s7JXUpe0QG2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; 
   d="scan'208";a="338300657"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 14 Sep 2020 07:37:45 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 44F87165; Mon, 14 Sep 2020 17:37:43 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2] gpiolib: Fix line event handling in syscall compatible mode
Date:   Mon, 14 Sep 2020 17:37:43 +0300
Message-Id: <20200914143743.39871-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The introduced line even handling ABI in the commit

  61f922db7221 ("gpio: userspace ABI for reading GPIO line events")

missed the fact that 64-bit kernel may serve for 32-bit applications.
In such case the very first check in the lineevent_read() will fail
due to alignment differences.

To workaround this introduce lineeven_to_user() helper which returns actual
size of the structure and copies its content to user if asked.

Fixes: 61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: moved to just calculate size (Arnd, Kent), added good comment (Arnd)
 drivers/gpio/gpiolib-cdev.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index e6c9b78adfc2..95af4a470f1e 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -423,6 +423,21 @@ static __poll_t lineevent_poll(struct file *file,
 	return events;
 }
 
+static ssize_t lineevent_get_size(void)
+{
+#ifdef __x86_64__
+	/* i386 has no padding after 'id' */
+	if (in_ia32_syscall()) {
+		struct compat_gpioeevent_data {
+			compat_u64	timestamp;
+			u32		id;
+		};
+
+		return sizeof(struct compat_gpioeevent_data);
+	}
+#endif
+	return sizeof(struct gpioevent_data);
+}
 
 static ssize_t lineevent_read(struct file *file,
 			      char __user *buf,
@@ -432,9 +447,20 @@ static ssize_t lineevent_read(struct file *file,
 	struct lineevent_state *le = file->private_data;
 	struct gpioevent_data ge;
 	ssize_t bytes_read = 0;
+	ssize_t ge_size;
 	int ret;
 
-	if (count < sizeof(ge))
+	/*
+	 * When compatible system call is being used the struct gpioevent_data,
+	 * in case of at least ia32, has different size due to the alignment
+	 * differences. Because we have first member 64 bits followed by one of
+	 * 32 bits there is no gap between them. The only problematic is the
+	 * padding at the end of the data structure. Hence, we calculate the
+	 * actual sizeof() and pass this as an argument to copy_to_user() to
+	 * drop unneeded bytes from the output.
+	 */
+	ge_size = lineevent_get_size();
+	if (count < ge_size)
 		return -EINVAL;
 
 	do {
@@ -470,10 +496,10 @@ static ssize_t lineevent_read(struct file *file,
 			break;
 		}
 
-		if (copy_to_user(buf + bytes_read, &ge, sizeof(ge)))
+		if (copy_to_user(buf + bytes_read, &ge, ge_size))
 			return -EFAULT;
-		bytes_read += sizeof(ge);
-	} while (count >= bytes_read + sizeof(ge));
+		bytes_read += ge_size;
+	} while (count >= bytes_read + ge_size);
 
 	return bytes_read;
 }
-- 
2.28.0

