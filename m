Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A595E2643BC
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Sep 2020 12:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730704AbgIJKUp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Sep 2020 06:20:45 -0400
Received: from mga07.intel.com ([134.134.136.100]:56374 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730760AbgIJKTk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Sep 2020 06:19:40 -0400
IronPort-SDR: 3W5Nzn5KVWcqNSmV0lbpf7ZB1jEl1NbZLdJ6S8xmd1DsinYHt7NmT9w3npWE4+9OeuMBk/1WHO
 Qp3KB+l5sdqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="222703888"
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; 
   d="scan'208";a="222703888"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2020 03:19:38 -0700
IronPort-SDR: 7f8fO1WVQXeA1DFSt1LyASPVZpCKsb+LYOjO2Zjj0a6yCt78ljSLXH4ztCfVY+gqzsIped2DiA
 y+oID+k0J6Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; 
   d="scan'208";a="344205094"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 10 Sep 2020 03:19:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 3025315C; Thu, 10 Sep 2020 13:19:36 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v1 1/2] gpiolib: Fix line event handling in syscall compatible mode
Date:   Thu, 10 Sep 2020 13:19:34 +0300
Message-Id: <20200910101935.47140-1-andriy.shevchenko@linux.intel.com>
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
 drivers/gpio/gpiolib-cdev.c | 41 ++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index e6c9b78adfc2..a6a8384c8255 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -423,6 +423,33 @@ static __poll_t lineevent_poll(struct file *file,
 	return events;
 }
 
+static ssize_t lineevent_to_user(char __user *buf, struct gpioevent_data *ge)
+{
+#ifdef __x86_64__
+	/* i386 has no padding after 'id' */
+	if (in_ia32_syscall()) {
+		struct compat_ge {
+			compat_u64	timestamp __packed;
+			u32		id;
+		} cge;
+
+		if (buf && ge) {
+			cge = (struct compat_ge){ ge->timestamp, ge->id };
+			if (copy_to_user(buf, &cge, sizeof(cge)))
+				return -EFAULT;
+		}
+
+		return sizeof(cge);
+	}
+#endif
+
+	if (buf && ge) {
+		if (copy_to_user(buf, ge, sizeof(*ge)))
+			return -EFAULT;
+	}
+
+	return sizeof(*ge);
+}
 
 static ssize_t lineevent_read(struct file *file,
 			      char __user *buf,
@@ -432,9 +459,12 @@ static ssize_t lineevent_read(struct file *file,
 	struct lineevent_state *le = file->private_data;
 	struct gpioevent_data ge;
 	ssize_t bytes_read = 0;
+	ssize_t ge_size;
 	int ret;
 
-	if (count < sizeof(ge))
+	/* When argument is NULL it returns size of the structure in user space */
+	ge_size = lineevent_to_user(NULL, NULL);
+	if (count < ge_size)
 		return -EINVAL;
 
 	do {
@@ -470,10 +500,11 @@ static ssize_t lineevent_read(struct file *file,
 			break;
 		}
 
-		if (copy_to_user(buf + bytes_read, &ge, sizeof(ge)))
-			return -EFAULT;
-		bytes_read += sizeof(ge);
-	} while (count >= bytes_read + sizeof(ge));
+		ret = lineevent_to_user(buf + bytes_read, &ge);
+		if (ret < 0)
+			return ret;
+		bytes_read += ret;
+	} while (count >= bytes_read + ge_size);
 
 	return bytes_read;
 }
-- 
2.28.0

