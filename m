Return-Path: <linux-gpio+bounces-36735-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOoYBXJFBGowGgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36735-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 11:33:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1B7530B1F
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 11:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6891F309D299
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 09:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06BF73E63BF;
	Wed, 13 May 2026 09:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VNRGAfAl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902333E5EF7;
	Wed, 13 May 2026 09:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663512; cv=none; b=B+eleFzOU13qFu8R1QwNBQUtvdEFGCiADRMbPIb7xD3SADA2tSbGf0MrJFsljnLeCvDEH62WxxQqE1uOk3pD8R3cjRmGte0uh+C7L+bSjroIfeEBjd/v3M5o+LFYkfHoQablWfDKGwQ6nzp+pMYSKlVHbbERnToTHL3aMAedCSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663512; c=relaxed/simple;
	bh=3WNb9RBykiiRcbsrWg+VsLnkPYf5X0akzCxR1z7nSkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uLphT5guPvZ818SKpnlWzDRVRPzfaXew3/haz7cw2WVAw8QFlXPvHCaQmepBdW1Wglx7i6D88CwqseYOgq0WBD8pLuqwlczqTR24oIUuFDOn8OxyYXdQSnwDwWgvlSboAXyDu7UKYi2qHmoPnppG+ZJgP0Wfs4rJB2pXqZzI4rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VNRGAfAl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85DA5C2BCB7;
	Wed, 13 May 2026 09:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778663512;
	bh=3WNb9RBykiiRcbsrWg+VsLnkPYf5X0akzCxR1z7nSkQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VNRGAfAlz6qTU4uK+YW73tUbHHJX7m1BHI4qI6E+tQudGRPQcgs2XKTFxcKfUlBvI
	 t7c0cp4XREJsEbKBy5A5dglrqeVnIOKW6VffMxDu3mZpGSj6JvxydFHF5ypLQwpXyl
	 DnLici9bet3H6C4Z+VvfrfwLub5jPS7A62/raL1DaUSBG0ivHN9Ho+81AWY//bX2OS
	 bw57uvu5B0dT59msKV752IppqH3FQYX5je19B3QLV9OstI/QA1WWJvRC8hQrWi0Nfu
	 dspJM92PttR7CEHoOwkRmzOaD/G8mkmO6kybaS4wwE2MllXWT7WACt7xPY2SpbSIHY
	 lxQG/57G+qMrw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v11 3/5] gpio: Leverage revocable for accessing struct gpio_chip
Date: Wed, 13 May 2026 17:10:41 +0800
Message-ID: <20260513091043.6766-4-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260513091043.6766-1-tzungbi@kernel.org>
References: <20260513091043.6766-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3B1B7530B1F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-36735-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

The underlying chip can be removed asynchronously.  `gdev->srcu` is used
to ensure the synchronization before accessing `gdev->chip`.

Revocable encapsulates the details.  Leverage revocable for accessing
the struct gpio_chip and remove the `gdev->srcu`.

Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v11:
- Add Tested-by tag.
- Squash
  - https://lore.kernel.org/all/20260508105448.31799-5-tzungbi@kernel.org
  - https://lore.kernel.org/all/20260508105448.31799-6-tzungbi@kernel.org
  - https://lore.kernel.org/all/20260508105448.31799-7-tzungbi@kernel.org
  - https://lore.kernel.org/all/20260508105448.31799-8-tzungbi@kernel.org

v10: https://lore.kernel.org/all/20260508105448.31799-4-tzungbi@kernel.org
- Change revocable API usages accordingly.

v9: https://lore.kernel.org/all/20260427135841.96266-4-tzungbi@kernel.org
- New to the series.
- Use static allocated resource provider.
- Rename "chip_rp" -> "chip_rev".

v4 - v8:
- Doesn't exist.

v3: https://lore.kernel.org/all/20260213092958.864411-8-tzungbi@kernel.org
- Change revocable API usages accordingly.

v2: https://lore.kernel.org/all/20260203061059.975605-8-tzungbi@kernel.org
- Change usages accordingly after applying
  https://lore.kernel.org/all/20260129143733.45618-2-tzungbi@kernel.org.
  - Add __rcu for `chip_rp`.
  - Pass pointer of pointer to revocable_provider_revoke().
- Rebase accordingly after applying
  https://lore.kernel.org/all/20260203060210.972243-1-tzungbi@kernel.org.

v1: https://lore.kernel.org/all/20260116081036.352286-13-tzungbi@kernel.org

---
 drivers/gpio/gpiolib-cdev.c  |  77 ++++------
 drivers/gpio/gpiolib-sysfs.c |  31 ++---
 drivers/gpio/gpiolib.c       | 263 ++++++++++++++---------------------
 drivers/gpio/gpiolib.h       |  28 +---
 4 files changed, 150 insertions(+), 249 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index f36b7c06996d..4837497c5e6e 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -22,6 +22,7 @@
 #include <linux/overflow.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/poll.h>
+#include <linux/revocable.h>
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
@@ -210,11 +211,9 @@ static long linehandle_ioctl(struct file *file, unsigned int cmd,
 	DECLARE_BITMAP(vals, GPIOHANDLES_MAX);
 	unsigned int i;
 	int ret;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&lh->gdev->srcu);
-
-	if (!rcu_access_pointer(lh->gdev->chip))
-		return -ENODEV;
+	revocable_try_access_or_return(&lh->gdev->chip_rev, gc);
 
 	switch (cmd) {
 	case GPIOHANDLE_GET_LINE_VALUES_IOCTL:
@@ -1432,11 +1431,9 @@ static long linereq_ioctl(struct file *file, unsigned int cmd,
 {
 	struct linereq *lr = file->private_data;
 	void __user *ip = (void __user *)arg;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&lr->gdev->srcu);
-
-	if (!rcu_access_pointer(lr->gdev->chip))
-		return -ENODEV;
+	revocable_try_access_or_return(&lr->gdev->chip_rev, gc);
 
 	switch (cmd) {
 	case GPIO_V2_LINE_GET_VALUES_IOCTL:
@@ -1463,10 +1460,10 @@ static __poll_t linereq_poll(struct file *file,
 {
 	struct linereq *lr = file->private_data;
 	__poll_t events = 0;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&lr->gdev->srcu);
-
-	if (!rcu_access_pointer(lr->gdev->chip))
+	revocable_try_access_with(&lr->gdev->chip_rev, gc);
+	if (!gc)
 		return EPOLLHUP | EPOLLERR;
 
 	poll_wait(file, &lr->wait, wait);
@@ -1485,11 +1482,9 @@ static ssize_t linereq_read(struct file *file, char __user *buf,
 	struct gpio_v2_line_event le;
 	ssize_t bytes_read = 0;
 	int ret;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&lr->gdev->srcu);
-
-	if (!rcu_access_pointer(lr->gdev->chip))
-		return -ENODEV;
+	revocable_try_access_or_return(&lr->gdev->chip_rev, gc);
 
 	if (count < sizeof(le))
 		return -EINVAL;
@@ -1759,10 +1754,10 @@ static __poll_t lineevent_poll(struct file *file,
 {
 	struct lineevent_state *le = file->private_data;
 	__poll_t events = 0;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&le->gdev->srcu);
-
-	if (!rcu_access_pointer(le->gdev->chip))
+	revocable_try_access_with(&le->gdev->chip_rev, gc);
+	if (!gc)
 		return EPOLLHUP | EPOLLERR;
 
 	poll_wait(file, &le->wait, wait);
@@ -1797,11 +1792,9 @@ static ssize_t lineevent_read(struct file *file, char __user *buf,
 	ssize_t bytes_read = 0;
 	ssize_t ge_size;
 	int ret;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&le->gdev->srcu);
-
-	if (!rcu_access_pointer(le->gdev->chip))
-		return -ENODEV;
+	revocable_try_access_or_return(&le->gdev->chip_rev, gc);
 
 	/*
 	 * When compatible system call is being used the struct gpioevent_data,
@@ -1879,11 +1872,9 @@ static long lineevent_ioctl(struct file *file, unsigned int cmd,
 	struct lineevent_state *le = file->private_data;
 	void __user *ip = (void __user *)arg;
 	struct gpiohandle_data ghd;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&le->gdev->srcu);
-
-	if (!rcu_access_pointer(le->gdev->chip))
-		return -ENODEV;
+	revocable_try_access_or_return(&le->gdev->chip_rev, gc);
 
 	/*
 	 * We can get the value for an event line but not set it,
@@ -2165,10 +2156,9 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	u32 debounce_period_us;
 	unsigned long dflags;
 	const char *label;
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return;
+	revocable_try_access_or_return_void(&desc->gdev->chip_rev, gc);
 
 	memset(info, 0, sizeof(*info));
 	info->offset = gpiod_hwgpio(desc);
@@ -2201,10 +2191,10 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	    test_bit(GPIOD_FLAG_IS_HOGGED, &dflags) ||
 	    test_bit(GPIOD_FLAG_EXPORT, &dflags) ||
 	    test_bit(GPIOD_FLAG_SYSFS, &dflags) ||
-	    !gpiochip_line_is_valid(guard.gc, info->offset)) {
+	    !gpiochip_line_is_valid(gc, info->offset)) {
 		info->flags |= GPIO_V2_LINE_FLAG_USED;
 	} else if (!atomic) {
-		if (!pinctrl_gpio_can_use_line(guard.gc, info->offset))
+		if (!pinctrl_gpio_can_use_line(gc, info->offset))
 			info->flags |= GPIO_V2_LINE_FLAG_USED;
 	}
 
@@ -2385,12 +2375,10 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	struct gpio_chardev_data *cdev = file->private_data;
 	struct gpio_device *gdev = cdev->gdev;
 	void __user *ip = (void __user *)arg;
-
-	guard(srcu)(&gdev->srcu);
+	struct gpio_chip *gc;
 
 	/* We fail any subsequent ioctl():s when the chip is gone */
-	if (!rcu_access_pointer(gdev->chip))
-		return -ENODEV;
+	revocable_try_access_or_return(&gdev->chip_rev, gc);
 
 	/* Fill in the struct and pass to userspace */
 	switch (cmd) {
@@ -2448,12 +2436,9 @@ static void lineinfo_changed_func(struct work_struct *work)
 		 * Pin functions are in general much more static and while it's
 		 * not 100% bullet-proof, it's good enough for most cases.
 		 */
-		scoped_guard(srcu, &ctx->gdev->srcu) {
-			gc = srcu_dereference(ctx->gdev->chip, &ctx->gdev->srcu);
-			if (gc &&
-			    !pinctrl_gpio_can_use_line(gc, ctx->chg.info.offset))
+		revocable_try_access_or_skip_scoped(&ctx->gdev->chip_rev, gc)
+			if (!pinctrl_gpio_can_use_line(gc, ctx->chg.info.offset))
 				ctx->chg.info.flags |= GPIO_V2_LINE_FLAG_USED;
-		}
 	}
 
 	ret = kfifo_in_spinlocked(&ctx->cdev->events, &ctx->chg, 1,
@@ -2534,10 +2519,10 @@ static __poll_t lineinfo_watch_poll(struct file *file,
 {
 	struct gpio_chardev_data *cdev = file->private_data;
 	__poll_t events = 0;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&cdev->gdev->srcu);
-
-	if (!rcu_access_pointer(cdev->gdev->chip))
+	revocable_try_access_with(&cdev->gdev->chip_rev, gc);
+	if (!gc)
 		return EPOLLHUP | EPOLLERR;
 
 	poll_wait(file, &cdev->wait, pollt);
@@ -2557,11 +2542,9 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
 	ssize_t bytes_read = 0;
 	int ret;
 	size_t event_size;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&cdev->gdev->srcu);
-
-	if (!rcu_access_pointer(cdev->gdev->chip))
-		return -ENODEV;
+	revocable_try_access_or_return(&cdev->gdev->chip_rev, gc);
 
 #ifndef CONFIG_GPIO_CDEV_V1
 	event_size = sizeof(struct gpio_v2_line_info_changed);
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index fc06b0c2881b..c40320433ff7 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -10,6 +10,7 @@
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/printk.h>
+#include <linux/revocable.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/srcu.h>
@@ -215,10 +216,9 @@ static int gpio_sysfs_request_irq(struct gpiod_data *data, unsigned char flags)
 	struct gpio_desc *desc = data->desc;
 	unsigned long irq_flags;
 	int ret;
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->chip_rev, gc);
 
 	data->irq = gpiod_to_irq(desc);
 	if (data->irq < 0)
@@ -244,7 +244,7 @@ static int gpio_sysfs_request_irq(struct gpiod_data *data, unsigned char flags)
 	 * Remove this redundant call (along with the corresponding unlock)
 	 * when those drivers have been fixed.
 	 */
-	ret = gpiochip_lock_as_irq(guard.gc, gpiod_hwgpio(desc));
+	ret = gpiochip_lock_as_irq(gc, gpiod_hwgpio(desc));
 	if (ret < 0)
 		goto err_clr_bits;
 
@@ -258,7 +258,7 @@ static int gpio_sysfs_request_irq(struct gpiod_data *data, unsigned char flags)
 	return 0;
 
 err_unlock:
-	gpiochip_unlock_as_irq(guard.gc, gpiod_hwgpio(desc));
+	gpiochip_unlock_as_irq(gc, gpiod_hwgpio(desc));
 err_clr_bits:
 	clear_bit(GPIOD_FLAG_EDGE_RISING, &desc->flags);
 	clear_bit(GPIOD_FLAG_EDGE_FALLING, &desc->flags);
@@ -273,14 +273,13 @@ static int gpio_sysfs_request_irq(struct gpiod_data *data, unsigned char flags)
 static void gpio_sysfs_free_irq(struct gpiod_data *data)
 {
 	struct gpio_desc *desc = data->desc;
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return;
+	revocable_try_access_or_return_void(&desc->gdev->chip_rev, gc);
 
 	data->irq_flags = 0;
 	free_irq(data->irq, data);
-	gpiochip_unlock_as_irq(guard.gc, gpiod_hwgpio(desc));
+	gpiochip_unlock_as_irq(gc, gpiod_hwgpio(desc));
 	clear_bit(GPIOD_FLAG_EDGE_RISING, &desc->flags);
 	clear_bit(GPIOD_FLAG_EDGE_FALLING, &desc->flags);
 }
@@ -473,13 +472,12 @@ static DEVICE_ATTR_RO(ngpio);
 static int export_gpio_desc(struct gpio_desc *desc)
 {
 	int offset, ret;
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->chip_rev, gc);
 
 	offset = gpiod_hwgpio(desc);
-	if (!gpiochip_line_is_valid(guard.gc, offset)) {
+	if (!gpiochip_line_is_valid(gc, offset)) {
 		pr_debug_ratelimited("%s: GPIO %d masked\n", __func__,
 				     gpiod_hwgpio(desc));
 		return -EINVAL;
@@ -732,6 +730,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	struct gpio_device *gdev;
 	struct attribute **attrs;
 	int status;
+	struct gpio_chip *gc;
 
 	/* can't export until sysfs is available ... */
 	if (!class_is_registered(&gpio_class)) {
@@ -744,9 +743,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 		return -EINVAL;
 	}
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->chip_rev, gc);
 
 	if (test_and_set_bit(GPIOD_FLAG_EXPORT, &desc->flags))
 		return -EPERM;
@@ -769,7 +766,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 
 	desc_data->desc = desc;
 	mutex_init(&desc_data->mutex);
-	if (guard.gc->direction_input && guard.gc->direction_output)
+	if (gc->direction_input && gc->direction_output)
 		desc_data->direction_can_change = direction_may_change;
 	else
 		desc_data->direction_can_change = false;
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1e6dce430dca..5ce12f3b753f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -23,6 +23,7 @@
 #include <linux/nospec.h>
 #include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/revocable.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/srcu.h>
@@ -334,7 +335,10 @@ EXPORT_SYMBOL(gpio_device_get_label);
  */
 struct gpio_chip *gpio_device_get_chip(struct gpio_device *gdev)
 {
-	return rcu_dereference_check(gdev->chip, 1);
+	struct gpio_chip *gc;
+
+	revocable_try_access_with(&gdev->chip_rev, gc);
+	return gc;
 }
 EXPORT_SYMBOL_GPL(gpio_device_get_chip);
 
@@ -424,8 +428,6 @@ static int gpiochip_get_direction(struct gpio_chip *gc, unsigned int offset)
 {
 	int ret;
 
-	lockdep_assert_held(&gc->gpiodev->srcu);
-
 	if (WARN_ON(!gc->get_direction))
 		return -EOPNOTSUPP;
 
@@ -453,14 +455,13 @@ int gpiod_get_direction(struct gpio_desc *desc)
 	unsigned long flags;
 	unsigned int offset;
 	int ret;
+	struct gpio_chip *gc;
 
 	ret = validate_desc(desc, __func__);
 	if (ret <= 0)
 		return -EINVAL;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->chip_rev, gc);
 
 	offset = gpiod_hwgpio(desc);
 	flags = READ_ONCE(desc->flags);
@@ -473,7 +474,7 @@ int gpiod_get_direction(struct gpio_desc *desc)
 	    test_bit(GPIOD_FLAG_IS_OUT, &flags))
 		return 0;
 
-	ret = gpiochip_get_direction(guard.gc, offset);
+	ret = gpiochip_get_direction(gc, offset);
 	if (ret < 0)
 		return ret;
 
@@ -561,9 +562,7 @@ static struct gpio_desc *gpio_name_to_desc(const char * const name)
 
 	list_for_each_entry_srcu(gdev, &gpio_devices, list,
 				 srcu_read_lock_held(&gpio_devices_srcu)) {
-		guard(srcu)(&gdev->srcu);
-
-		gc = srcu_dereference(gdev->chip, &gdev->srcu);
+		revocable_try_access_with(&gdev->chip_rev, gc);
 		if (!gc)
 			continue;
 
@@ -874,10 +873,10 @@ static void gpiodev_release(struct device *dev)
 	synchronize_srcu(&gdev->desc_srcu);
 	cleanup_srcu_struct(&gdev->desc_srcu);
 
+	revocable_put(&gdev->chip_rev);
 	ida_free(&gpio_ida, gdev->id);
 	kfree_const(gdev->label);
 	kfree(gdev->descs);
-	cleanup_srcu_struct(&gdev->srcu);
 	kfree(gdev);
 }
 
@@ -1049,9 +1048,7 @@ static void gpiochip_setup_devs(void)
 
 	list_for_each_entry_srcu(gdev, &gpio_devices, list,
 				 srcu_read_lock_held(&gpio_devices_srcu)) {
-		guard(srcu)(&gdev->srcu);
-
-		gc = srcu_dereference(gdev->chip, &gdev->srcu);
+		revocable_try_access_with(&gdev->chip_rev, gc);
 		if (!gc) {
 			dev_err(&gdev->dev, "Underlying GPIO chip is gone\n");
 			continue;
@@ -1154,14 +1151,9 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		goto err_free_gdev;
 	gdev->id = ret;
 
-	ret = init_srcu_struct(&gdev->srcu);
-	if (ret)
-		goto err_free_ida;
-	rcu_assign_pointer(gdev->chip, gc);
-
 	ret = init_srcu_struct(&gdev->desc_srcu);
 	if (ret)
-		goto err_cleanup_gdev_srcu;
+		goto err_free_ida;
 
 	ret = dev_set_name(&gdev->dev, GPIOCHIP_NAME "%d", gdev->id);
 	if (ret)
@@ -1210,6 +1202,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	else
 		gdev->owner = THIS_MODULE;
 
+	ret = revocable_init(&gdev->chip_rev, gc);
+	if (ret)
+		goto err_put_device;
+
 	scoped_guard(mutex, &gpio_devices_lock) {
 		/*
 		 * TODO: this allocates a Linux GPIO number base in the global
@@ -1224,7 +1220,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 			if (base < 0) {
 				ret = base;
 				base = 0;
-				goto err_put_device;
+				goto err_revoke_chip_rev;
 			}
 
 			/*
@@ -1244,7 +1240,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		ret = gpiodev_add_to_list_unlocked(gdev);
 		if (ret) {
 			gpiochip_err(gc, "GPIO integer space overlap, cannot add chip\n");
-			goto err_put_device;
+			goto err_revoke_chip_rev;
 		}
 	}
 
@@ -1343,14 +1339,14 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	scoped_guard(mutex, &gpio_devices_lock)
 		list_del_rcu(&gdev->list);
 	synchronize_srcu(&gpio_devices_srcu);
+err_revoke_chip_rev:
+	revocable_revoke(&gdev->chip_rev);
 err_put_device:
 	gpio_device_put(gdev);
 	goto err_print_message;
 
 err_cleanup_desc_srcu:
 	cleanup_srcu_struct(&gdev->desc_srcu);
-err_cleanup_gdev_srcu:
-	cleanup_srcu_struct(&gdev->srcu);
 err_free_ida:
 	ida_free(&gpio_ida, gdev->id);
 err_free_gdev:
@@ -1387,8 +1383,7 @@ void gpiochip_remove(struct gpio_chip *gc)
 	synchronize_srcu(&gpio_devices_srcu);
 
 	/* Numb the device, cancelling all outstanding operations */
-	rcu_assign_pointer(gdev->chip, NULL);
-	synchronize_srcu(&gdev->srcu);
+	revocable_revoke(&gdev->chip_rev);
 	gpio_device_teardown_shared(gdev);
 	gpiochip_irqchip_remove(gc);
 	acpi_gpiochip_remove(gc);
@@ -1449,11 +1444,11 @@ struct gpio_device *gpio_device_find(const void *data,
 		if (!device_is_registered(&gdev->dev))
 			continue;
 
-		guard(srcu)(&gdev->srcu);
-
-		gc = srcu_dereference(gdev->chip, &gdev->srcu);
+		revocable_try_access_with(&gdev->chip_rev, gc);
+		if (!gc)
+			continue;
 
-		if (gc && match(gc, data))
+		if (match(gc, data))
 			return gpio_device_get(gdev);
 	}
 
@@ -2554,16 +2549,15 @@ int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 {
 	unsigned int offset;
 	int ret;
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->chip_rev, gc);
 
 	if (test_and_set_bit(GPIOD_FLAG_REQUESTED, &desc->flags))
 		return -EBUSY;
 
 	offset = gpiod_hwgpio(desc);
-	if (!gpiochip_line_is_valid(guard.gc, offset)) {
+	if (!gpiochip_line_is_valid(gc, offset)) {
 		ret = -EINVAL;
 		goto out_clear_bit;
 	}
@@ -2572,15 +2566,15 @@ int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 	 * before IRQs are enabled, for non-sleeping (SOC) GPIOs.
 	 */
 
-	if (guard.gc->request) {
-		ret = guard.gc->request(guard.gc, offset);
+	if (gc->request) {
+		ret = gc->request(gc, offset);
 		if (ret > 0)
 			ret = -EBADE;
 		if (ret)
 			goto out_clear_bit;
 	}
 
-	if (guard.gc->get_direction)
+	if (gc->get_direction)
 		gpiod_get_direction(desc);
 
 	ret = desc_set_label(desc, label ? : "?");
@@ -2617,16 +2611,17 @@ int gpiod_request(struct gpio_desc *desc, const char *label)
 void gpiod_free_commit(struct gpio_desc *desc)
 {
 	unsigned long flags;
+	struct gpio_chip *gc;
 
 	might_sleep();
 
-	CLASS(gpio_chip_guard, guard)(desc);
+	revocable_try_access_or_return_void(&desc->gdev->chip_rev, gc);
 
 	flags = READ_ONCE(desc->flags);
 
-	if (guard.gc && test_bit(GPIOD_FLAG_REQUESTED, &flags)) {
-		if (guard.gc->free)
-			guard.gc->free(guard.gc, gpiod_hwgpio(desc));
+	if (test_bit(GPIOD_FLAG_REQUESTED, &flags)) {
+		if (gc->free)
+			gc->free(gc, gpiod_hwgpio(desc));
 
 		clear_bit(GPIOD_FLAG_ACTIVE_LOW, &flags);
 		clear_bit(GPIOD_FLAG_REQUESTED, &flags);
@@ -2778,15 +2773,14 @@ EXPORT_SYMBOL_GPL(gpiochip_free_own_desc);
 int gpio_do_set_config(struct gpio_desc *desc, unsigned long config)
 {
 	int ret;
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->chip_rev, gc);
 
-	if (!guard.gc->set_config)
+	if (!gc->set_config)
 		return -ENOTSUPP;
 
-	ret = guard.gc->set_config(guard.gc, gpiod_hwgpio(desc), config);
+	ret = gc->set_config(gc, gpiod_hwgpio(desc), config);
 	if (ret > 0)
 		ret = -EBADE;
 
@@ -2899,8 +2893,6 @@ static int gpiochip_direction_input(struct gpio_chip *gc, unsigned int offset)
 {
 	int ret;
 
-	lockdep_assert_held(&gc->gpiodev->srcu);
-
 	if (WARN_ON(!gc->direction_input))
 		return -EOPNOTSUPP;
 
@@ -2916,8 +2908,6 @@ static int gpiochip_direction_output(struct gpio_chip *gc, unsigned int offset,
 {
 	int ret;
 
-	lockdep_assert_held(&gc->gpiodev->srcu);
-
 	if (WARN_ON(!gc->direction_output))
 		return -EOPNOTSUPP;
 
@@ -2955,17 +2945,16 @@ EXPORT_SYMBOL_GPL(gpiod_direction_input);
 int gpiod_direction_input_nonotify(struct gpio_desc *desc)
 {
 	int ret = 0, dir;
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->chip_rev, gc);
 
 	/*
 	 * It is legal to have no .get() and .direction_input() specified if
 	 * the chip is output-only, but you can't specify .direction_input()
 	 * and not support the .get() operation, that doesn't make sense.
 	 */
-	if (!guard.gc->get && guard.gc->direction_input) {
+	if (!gc->get && gc->direction_input) {
 		gpiod_warn(desc,
 			   "%s: missing get() but have direction_input()\n",
 			   __func__);
@@ -2978,11 +2967,10 @@ int gpiod_direction_input_nonotify(struct gpio_desc *desc)
 	 * direction (if .get_direction() is supported) else we silently
 	 * assume we are in input mode after this.
 	 */
-	if (guard.gc->direction_input) {
-		ret = gpiochip_direction_input(guard.gc,
-					       gpiod_hwgpio(desc));
-	} else if (guard.gc->get_direction) {
-		dir = gpiochip_get_direction(guard.gc, gpiod_hwgpio(desc));
+	if (gc->direction_input) {
+		ret = gpiochip_direction_input(gc, gpiod_hwgpio(desc));
+	} else if (gc->get_direction) {
+		dir = gpiochip_get_direction(gc, gpiod_hwgpio(desc));
 		if (dir < 0)
 			return dir;
 
@@ -3007,8 +2995,6 @@ static int gpiochip_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	int ret;
 
-	lockdep_assert_held(&gc->gpiodev->srcu);
-
 	if (WARN_ON(unlikely(!gc->set)))
 		return -EOPNOTSUPP;
 
@@ -3022,31 +3008,28 @@ static int gpiochip_set(struct gpio_chip *gc, unsigned int offset, int value)
 static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 {
 	int val = !!value, ret = 0, dir;
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->chip_rev, gc);
 
 	/*
 	 * It's OK not to specify .direction_output() if the gpiochip is
 	 * output-only, but if there is then not even a .set() operation it
 	 * is pretty tricky to drive the output line.
 	 */
-	if (!guard.gc->set && !guard.gc->direction_output) {
+	if (!gc->set && !gc->direction_output) {
 		gpiod_warn(desc,
 			   "%s: missing set() and direction_output() operations\n",
 			   __func__);
 		return -EIO;
 	}
 
-	if (guard.gc->direction_output) {
-		ret = gpiochip_direction_output(guard.gc,
-						gpiod_hwgpio(desc), val);
+	if (gc->direction_output) {
+		ret = gpiochip_direction_output(gc, gpiod_hwgpio(desc), val);
 	} else {
 		/* Check that we are in output mode if we can */
-		if (guard.gc->get_direction) {
-			dir = gpiochip_get_direction(guard.gc,
-						     gpiod_hwgpio(desc));
+		if (gc->get_direction) {
+			dir = gpiochip_get_direction(gc, gpiod_hwgpio(desc));
 			if (dir < 0)
 				return dir;
 
@@ -3061,7 +3044,7 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 		 * If we can't actively set the direction, we are some
 		 * output-only chip, so just drive the output as desired.
 		 */
-		ret = gpiochip_set(guard.gc, gpiod_hwgpio(desc), val);
+		ret = gpiochip_set(gc, gpiod_hwgpio(desc), val);
 		if (ret)
 			return ret;
 	}
@@ -3199,20 +3182,18 @@ int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value)
 int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags)
 {
 	int ret;
+	struct gpio_chip *gc;
 
 	VALIDATE_DESC(desc);
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->chip_rev, gc);
 
-	if (!guard.gc->en_hw_timestamp) {
+	if (!gc->en_hw_timestamp) {
 		gpiod_warn(desc, "%s: hw ts not supported\n", __func__);
 		return -ENOTSUPP;
 	}
 
-	ret = guard.gc->en_hw_timestamp(guard.gc,
-					gpiod_hwgpio(desc), flags);
+	ret = gc->en_hw_timestamp(gc, gpiod_hwgpio(desc), flags);
 	if (ret)
 		gpiod_warn(desc, "%s: hw ts request failed\n", __func__);
 
@@ -3232,20 +3213,18 @@ EXPORT_SYMBOL_GPL(gpiod_enable_hw_timestamp_ns);
 int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags)
 {
 	int ret;
+	struct gpio_chip *gc;
 
 	VALIDATE_DESC(desc);
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->chip_rev, gc);
 
-	if (!guard.gc->dis_hw_timestamp) {
+	if (!gc->dis_hw_timestamp) {
 		gpiod_warn(desc, "%s: hw ts not supported\n", __func__);
 		return -ENOTSUPP;
 	}
 
-	ret = guard.gc->dis_hw_timestamp(guard.gc, gpiod_hwgpio(desc),
-					 flags);
+	ret = gc->dis_hw_timestamp(gc, gpiod_hwgpio(desc), flags);
 	if (ret)
 		gpiod_warn(desc, "%s: hw ts release failed\n", __func__);
 
@@ -3363,8 +3342,6 @@ static int gpiochip_get(struct gpio_chip *gc, unsigned int offset)
 {
 	int ret;
 
-	lockdep_assert_held(&gc->gpiodev->srcu);
-
 	/* Make sure this is called after checking for gc->get(). */
 	ret = gc->get(gc, offset);
 	if (ret > 1) {
@@ -3406,18 +3383,10 @@ static int gpio_chip_get_value(struct gpio_chip *gc, const struct gpio_desc *des
 
 static int gpiod_get_raw_value_commit(const struct gpio_desc *desc)
 {
-	struct gpio_device *gdev;
 	struct gpio_chip *gc;
 	int value;
 
-	/* FIXME Unable to use gpio_chip_guard due to const desc. */
-	gdev = desc->gdev;
-
-	guard(srcu)(&gdev->srcu);
-
-	gc = srcu_dereference(gdev->chip, &gdev->srcu);
-	if (!gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->chip_rev, gc);
 
 	value = gpio_chip_get_value(gc, desc);
 	value = value < 0 ? value : !!value;
@@ -3428,8 +3397,6 @@ static int gpiod_get_raw_value_commit(const struct gpio_desc *desc)
 static int gpio_chip_get_multiple(struct gpio_chip *gc,
 				  unsigned long *mask, unsigned long *bits)
 {
-	lockdep_assert_held(&gc->gpiodev->srcu);
-
 	if (gc->get_multiple) {
 		int ret;
 
@@ -3456,9 +3423,10 @@ static int gpio_chip_get_multiple(struct gpio_chip *gc,
 /* The 'other' chip must be protected with its GPIO device's SRCU. */
 static bool gpio_device_chip_cmp(struct gpio_device *gdev, struct gpio_chip *gc)
 {
-	guard(srcu)(&gdev->srcu);
+	struct gpio_chip *chip;
 
-	return gc == srcu_dereference(gdev->chip, &gdev->srcu);
+	revocable_try_access_with(&gdev->chip_rev, chip);
+	return chip ? chip == gc : false;
 }
 
 int gpiod_get_array_value_complex(bool raw, bool can_sleep,
@@ -3481,11 +3449,7 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 		if (!can_sleep)
 			WARN_ON(array_info->gdev->can_sleep);
 
-		guard(srcu)(&array_info->gdev->srcu);
-		gc = srcu_dereference(array_info->gdev->chip,
-				      &array_info->gdev->srcu);
-		if (!gc)
-			return -ENODEV;
+		revocable_try_access_or_return(&array_info->gdev->chip_rev, gc);
 
 		ret = gpio_chip_get_multiple(gc, array_info->get_mask,
 					     value_bitmap);
@@ -3509,31 +3473,29 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 		unsigned long *mask, *bits;
 		int first, j;
 
-		CLASS(gpio_chip_guard, guard)(desc_array[i]);
-		if (!guard.gc)
-			return -ENODEV;
+		revocable_try_access_or_return(&desc_array[i]->gdev->chip_rev, gc);
 
-		if (likely(guard.gc->ngpio <= FASTPATH_NGPIO)) {
+		if (likely(gc->ngpio <= FASTPATH_NGPIO)) {
 			mask = fastpath_mask;
 			bits = fastpath_bits;
 		} else {
 			gfp_t flags = can_sleep ? GFP_KERNEL : GFP_ATOMIC;
 
-			mask = bitmap_alloc(guard.gc->ngpio, flags);
+			mask = bitmap_alloc(gc->ngpio, flags);
 			if (!mask)
 				return -ENOMEM;
 
-			bits = bitmap_alloc(guard.gc->ngpio, flags);
+			bits = bitmap_alloc(gc->ngpio, flags);
 			if (!bits) {
 				bitmap_free(mask);
 				return -ENOMEM;
 			}
 		}
 
-		bitmap_zero(mask, guard.gc->ngpio);
+		bitmap_zero(mask, gc->ngpio);
 
 		if (!can_sleep)
-			WARN_ON(guard.gc->can_sleep);
+			WARN_ON(gc->can_sleep);
 
 		/* collect all inputs belonging to the same chip */
 		first = i;
@@ -3548,9 +3510,9 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 				i = find_next_zero_bit(array_info->get_mask,
 						       array_size, i);
 		} while ((i < array_size) &&
-			 gpio_device_chip_cmp(desc_array[i]->gdev, guard.gc));
+			 gpio_device_chip_cmp(desc_array[i]->gdev, gc));
 
-		ret = gpio_chip_get_multiple(guard.gc, mask, bits);
+		ret = gpio_chip_get_multiple(gc, mask, bits);
 		if (ret) {
 			if (mask != fastpath_mask)
 				bitmap_free(mask);
@@ -3699,15 +3661,14 @@ EXPORT_SYMBOL_GPL(gpiod_get_array_value);
 static int gpio_set_open_drain_value_commit(struct gpio_desc *desc, bool value)
 {
 	int ret = 0, offset = gpiod_hwgpio(desc);
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->chip_rev, gc);
 
 	if (value) {
-		ret = gpiochip_direction_input(guard.gc, offset);
+		ret = gpiochip_direction_input(gc, offset);
 	} else {
-		ret = gpiochip_direction_output(guard.gc, offset, 0);
+		ret = gpiochip_direction_output(gc, offset, 0);
 		if (!ret)
 			set_bit(GPIOD_FLAG_IS_OUT, &desc->flags);
 	}
@@ -3728,17 +3689,16 @@ static int gpio_set_open_drain_value_commit(struct gpio_desc *desc, bool value)
 static int gpio_set_open_source_value_commit(struct gpio_desc *desc, bool value)
 {
 	int ret = 0, offset = gpiod_hwgpio(desc);
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->chip_rev, gc);
 
 	if (value) {
-		ret = gpiochip_direction_output(guard.gc, offset, 1);
+		ret = gpiochip_direction_output(gc, offset, 1);
 		if (!ret)
 			set_bit(GPIOD_FLAG_IS_OUT, &desc->flags);
 	} else {
-		ret = gpiochip_direction_input(guard.gc, offset);
+		ret = gpiochip_direction_input(gc, offset);
 	}
 	trace_gpio_direction(desc_to_gpio(desc), !value, ret);
 	if (ret < 0)
@@ -3751,15 +3711,15 @@ static int gpio_set_open_source_value_commit(struct gpio_desc *desc, bool value)
 
 static int gpiod_set_raw_value_commit(struct gpio_desc *desc, bool value)
 {
+	struct gpio_chip *gc;
+
 	if (unlikely(!test_bit(GPIOD_FLAG_IS_OUT, &desc->flags)))
 		return -EPERM;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->chip_rev, gc);
 
 	trace_gpio_value(desc_to_gpio(desc), 0, value);
-	return gpiochip_set(guard.gc, gpiod_hwgpio(desc), value);
+	return gpiochip_set(gc, gpiod_hwgpio(desc), value);
 }
 
 /*
@@ -3780,8 +3740,6 @@ static int gpiochip_set_multiple(struct gpio_chip *gc,
 	unsigned int i;
 	int ret;
 
-	lockdep_assert_held(&gc->gpiodev->srcu);
-
 	if (gc->set_multiple) {
 		ret = gc->set_multiple(gc, mask, bits);
 		if (ret > 0)
@@ -3826,11 +3784,7 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 				return -EPERM;
 		}
 
-		guard(srcu)(&array_info->gdev->srcu);
-		gc = srcu_dereference(array_info->gdev->chip,
-				      &array_info->gdev->srcu);
-		if (!gc)
-			return -ENODEV;
+		revocable_try_access_or_return(&array_info->gdev->chip_rev, gc);
 
 		if (!raw && !bitmap_empty(array_info->invert_mask, array_size))
 			bitmap_xor(value_bitmap, value_bitmap,
@@ -3854,31 +3808,30 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 		unsigned long *mask, *bits;
 		int count = 0;
 
-		CLASS(gpio_chip_guard, guard)(desc_array[i]);
-		if (!guard.gc)
-			return -ENODEV;
+		revocable_try_access_or_return(&desc_array[i]->gdev->chip_rev,
+					       gc);
 
-		if (likely(guard.gc->ngpio <= FASTPATH_NGPIO)) {
+		if (likely(gc->ngpio <= FASTPATH_NGPIO)) {
 			mask = fastpath_mask;
 			bits = fastpath_bits;
 		} else {
 			gfp_t flags = can_sleep ? GFP_KERNEL : GFP_ATOMIC;
 
-			mask = bitmap_alloc(guard.gc->ngpio, flags);
+			mask = bitmap_alloc(gc->ngpio, flags);
 			if (!mask)
 				return -ENOMEM;
 
-			bits = bitmap_alloc(guard.gc->ngpio, flags);
+			bits = bitmap_alloc(gc->ngpio, flags);
 			if (!bits) {
 				bitmap_free(mask);
 				return -ENOMEM;
 			}
 		}
 
-		bitmap_zero(mask, guard.gc->ngpio);
+		bitmap_zero(mask, gc->ngpio);
 
 		if (!can_sleep)
-			WARN_ON(guard.gc->can_sleep);
+			WARN_ON(gc->can_sleep);
 
 		do {
 			struct gpio_desc *desc = desc_array[i];
@@ -3917,10 +3870,10 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 				i = find_next_zero_bit(array_info->set_mask,
 						       array_size, i);
 		} while ((i < array_size) &&
-			 gpio_device_chip_cmp(desc_array[i]->gdev, guard.gc));
+			 gpio_device_chip_cmp(desc_array[i]->gdev, gc));
 		/* push collected bits to outputs */
 		if (count != 0) {
-			ret = gpiochip_set_multiple(guard.gc, mask, bits);
+			ret = gpiochip_set_multiple(gc, mask, bits);
 			if (ret)
 				return ret;
 		}
@@ -4126,7 +4079,6 @@ EXPORT_SYMBOL_GPL(gpiod_is_shared);
  */
 int gpiod_to_irq(const struct gpio_desc *desc)
 {
-	struct gpio_device *gdev;
 	struct gpio_chip *gc;
 	int offset;
 	int ret;
@@ -4135,12 +4087,7 @@ int gpiod_to_irq(const struct gpio_desc *desc)
 	if (ret <= 0)
 		return -EINVAL;
 
-	gdev = desc->gdev;
-	/* FIXME Cannot use gpio_chip_guard due to const desc. */
-	guard(srcu)(&gdev->srcu);
-	gc = srcu_dereference(gdev->chip, &gdev->srcu);
-	if (!gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->chip_rev, gc);
 
 	offset = gpiod_hwgpio(desc);
 	if (gc->to_irq) {
@@ -5100,18 +5047,16 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 	struct gpio_desc *local_desc;
 	int hwnum;
 	int ret;
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->chip_rev, gc);
 
 	if (test_and_set_bit(GPIOD_FLAG_IS_HOGGED, &desc->flags))
 		return 0;
 
 	hwnum = gpiod_hwgpio(desc);
 
-	local_desc = gpiochip_request_own_desc(guard.gc, hwnum, name,
-					       lflags, dflags);
+	local_desc = gpiochip_request_own_desc(gc, hwnum, name, lflags, dflags);
 	if (IS_ERR(local_desc)) {
 		clear_bit(GPIOD_FLAG_IS_HOGGED, &desc->flags);
 		ret = PTR_ERR(local_desc);
@@ -5481,9 +5426,7 @@ static int gpiolib_seq_show(struct seq_file *s, void *v)
 	if (priv->newline)
 		seq_putc(s, '\n');
 
-	guard(srcu)(&gdev->srcu);
-
-	gc = srcu_dereference(gdev->chip, &gdev->srcu);
+	revocable_try_access_with(&gdev->chip_rev, gc);
 	if (!gc) {
 		seq_printf(s, "%s: (dangling chip)\n", dev_name(&gdev->dev));
 		return 0;
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index dc4cb61a9318..efbff4a1cd4e 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -16,6 +16,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/notifier.h>
+#include <linux/revocable.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
 #include <linux/srcu.h>
@@ -31,7 +32,6 @@ struct fwnode_handle;
  * @chrdev: character device for the GPIO device
  * @id: numerical ID number for the GPIO chip
  * @owner: helps prevent removal of modules exporting active GPIOs
- * @chip: pointer to the corresponding gpiochip, holding static
  * data for this device
  * @descs: array of ngpio descriptors.
  * @valid_mask: If not %NULL, holds bitmask of GPIOs which are valid to be
@@ -54,7 +54,7 @@ struct fwnode_handle;
  *                 process context
  * @device_notifier: used to notify character device wait queues about the GPIO
  *                   device being unregistered
- * @srcu: protects the pointer to the underlying GPIO chip
+ * @chip_rev: revocable provider handle for the corresponding struct gpio_chip.
  * @pin_ranges: range of pins served by the GPIO driver
  *
  * This state container holds most of the runtime variable data
@@ -67,7 +67,6 @@ struct gpio_device {
 	struct cdev		chrdev;
 	int			id;
 	struct module		*owner;
-	struct gpio_chip __rcu	*chip;
 	struct gpio_desc	*descs;
 	unsigned long		*valid_mask;
 	struct srcu_struct	desc_srcu;
@@ -81,7 +80,7 @@ struct gpio_device {
 	rwlock_t		line_state_lock;
 	struct workqueue_struct	*line_state_wq;
 	struct blocking_notifier_head device_notifier;
-	struct srcu_struct	srcu;
+	struct revocable	chip_rev;
 
 #ifdef CONFIG_PINCTRL
 	/*
@@ -225,27 +224,6 @@ struct gpio_desc {
 
 #define gpiod_not_found(desc)		(IS_ERR(desc) && PTR_ERR(desc) == -ENOENT)
 
-struct gpio_chip_guard {
-	struct gpio_device *gdev;
-	struct gpio_chip *gc;
-	int idx;
-};
-
-DEFINE_CLASS(gpio_chip_guard,
-	     struct gpio_chip_guard,
-	     srcu_read_unlock(&_T.gdev->srcu, _T.idx),
-	     ({
-		struct gpio_chip_guard _guard;
-
-		_guard.gdev = desc->gdev;
-		_guard.idx = srcu_read_lock(&_guard.gdev->srcu);
-		_guard.gc = srcu_dereference(_guard.gdev->chip,
-					     &_guard.gdev->srcu);
-
-		_guard;
-	     }),
-	     struct gpio_desc *desc)
-
 int gpiod_request(struct gpio_desc *desc, const char *label);
 int gpiod_request_commit(struct gpio_desc *desc, const char *label);
 void gpiod_free(struct gpio_desc *desc);
-- 
2.51.0


