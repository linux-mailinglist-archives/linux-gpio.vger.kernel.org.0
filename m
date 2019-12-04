Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 572941135E1
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 20:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbfLDTmd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 14:42:33 -0500
Received: from mga03.intel.com ([134.134.136.65]:46291 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728072AbfLDTmd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Dec 2019 14:42:33 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Dec 2019 11:42:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,278,1571727600"; 
   d="scan'208";a="201512713"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 04 Dec 2019 11:42:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 42698F3; Wed,  4 Dec 2019 21:42:30 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] gpiolib: Fix line event handling in compatible mode
Date:   Wed,  4 Dec 2019 21:42:28 +0200
Message-Id: <20191204194229.64251-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
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

To workaround this we do several things here:
- put warning comment to UAPI header near to the structure description
- derive the size of the structure in the compatible mode from its members
- check for the size of this structure in the ->read() callback
- return only one event in the compatible mode at a time

Above mitigation will work at least with libgpiod which does one event
at a time.

Since the bug hasn't been reported earlier we assume that there is close
to zero actual users of the compatible mode to monitor GPIO events and thus
we might consider to rework this ABI in the future.

Fixes: 61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c    | 51 ++++++++++++++++++++++++++++++++++++---
 include/uapi/linux/gpio.h |  6 +++++
 2 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7340e4d0e873..134985210619 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -825,17 +825,26 @@ static __poll_t lineevent_poll(struct file *filep,
 	return events;
 }
 
-
 static ssize_t lineevent_read(struct file *filep,
 			      char __user *buf,
 			      size_t count,
 			      loff_t *f_ps)
 {
 	struct lineevent_state *le = filep->private_data;
+	struct gpioevent_data event, *e = &event;
+	/* We need size of each member to avoid endianess issues below */
+	size_t ts_sz = sizeof(e->timestamp), id_sz = sizeof(e->id), e_sz;
 	unsigned int copied;
 	int ret;
 
-	if (count < sizeof(struct gpioevent_data))
+	/*
+	 * In compatible mode, when kernel is 64-bit and user space is 32-bit,
+	 * we may not tell what user wanted here when count is bigger than size
+	 * of one event, so, we just assume that user asks for precisely one
+	 * event.
+	 */
+	e_sz = in_compat_syscall() ? ts_sz + id_sz : sizeof(*e);
+	if (count < e_sz)
 		return -EINVAL;
 
 	do {
@@ -851,7 +860,43 @@ static ssize_t lineevent_read(struct file *filep,
 
 		if (mutex_lock_interruptible(&le->read_lock))
 			return -ERESTARTSYS;
-		ret = kfifo_to_user(&le->events, buf, count, &copied);
+		if (in_compat_syscall()) {
+			/*
+			 * First we peek the one event and, if there is
+			 * no error during copying to user space, skip it
+			 * later.
+			 */
+			if (kfifo_peek(&le->events, e))
+				copied = e_sz;
+			else
+				copied = 0;
+
+			/* Do not try to copy garbage to the user */
+			ret = copied ? 0 : -EFAULT;
+
+			/*
+			 * Due to endianess concerns we have to copy this
+			 * member-by-member. Luckily there are no members
+			 * less than 32-bit.
+			 */
+			if (!ret)
+				ret = copy_to_user(buf, &e->timestamp, ts_sz);
+			if (!ret)
+				ret = copy_to_user(buf + ts_sz, &e->id, id_sz);
+
+			if (ret) {
+				/*
+				 * Either we have got nothing from the FIFO or
+				 * one of copy_to_user() calls failed.
+				 */
+				ret = -EFAULT;
+			} else {
+				/* Skip peeked event if no error happened */
+				kfifo_skip(&le->events);
+			}
+		} else {
+			ret = kfifo_to_user(&le->events, buf, count, &copied);
+		}
 		mutex_unlock(&le->read_lock);
 
 		if (ret)
diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 799cf823d493..054756bf6991 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -168,6 +168,12 @@ struct gpioevent_request {
  * struct gpioevent_data - The actual event being pushed to userspace
  * @timestamp: best estimate of time of event occurrence, in nanoseconds
  * @id: event identifier
+ *
+ * Warning! This structure has issues in the compatible mode, when
+ * kernel is 64-bit and user space is 32-bit, due to alignment
+ * differences.
+ *
+ * It's not recommended to retrieve more than one event at a time.
  */
 struct gpioevent_data {
 	__u64 timestamp;
-- 
2.24.0

