Return-Path: <linux-gpio+bounces-36449-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIUQOVrB/WkpigAAu9opvQ
	(envelope-from <linux-gpio+bounces-36449-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 12:56:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B624F556A
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 12:56:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8798F30650B9
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 10:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B709035B653;
	Fri,  8 May 2026 10:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eg0UmVjR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F1C3290C3;
	Fri,  8 May 2026 10:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778237740; cv=none; b=rHFK2PQmsUvLL5b7EWnT8qZMlSPta/+P3oY1QQnEu1wxycKwldKPIq86KQ8MLPYkeDSip/OC4Az5iUZUbtasEY3bNWrRndSB4FWAmWAy3PeRNU5TX0qEg2YXtupw5oKBK6nwZfZL14B5+4QDE/8c1+Z4Vp9nMmSszWkKZ/L3ikk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778237740; c=relaxed/simple;
	bh=rjBzFVm3piWdc9p7lnFz1Jl4qDaTmPSJjMTNBJPnvI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UTeDf/1s2ddm0/8UJiFOIp3z+gOwqokT5uDRVN1rd7Hm8FeA2dJ0kYBn1pb8gABQeWJMOqpw4K1iWBxc6GGclR/zgXc8v+Jy6HLC0HAgDpkX/eM9daGLe7N+uJ10CtT18KFzzevBLQvXs+Lo6/OolYQvjlHLkFynD8Oo2pxDdMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eg0UmVjR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B2AC2BCC7;
	Fri,  8 May 2026 10:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778237740;
	bh=rjBzFVm3piWdc9p7lnFz1Jl4qDaTmPSJjMTNBJPnvI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Eg0UmVjRg606a+tWugKvMA/8Ke+rvcvHioNnc7FnYmvqT4NsAbL8ZuxjGQ1Ge2Wqg
	 jxKooHPMvvRFQojY8gAEx7LV7EiCk4exe5ypyc+QP4qssWPTGan5HhgDuFSq7zvosQ
	 NILqsLliA17suquIL43XBOPuWPE5mpFyQdDwNFFZJVMpx0two+Dr1vlHCVsxokVo11
	 aLhPYZ7VrAY2ItcDW13GCorTgn6BsX4YjEI1VKK3SsPf1f+dnuDZxZCshP+8+TCx0r
	 kH52hmw9/1BKgVuBootkmPDAhSo9+/CWGH1FYIJtx1LvEpIGZtZEDqaaVcOUu/41uZ
	 veYkj5H09nxzg==
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
	"Paul E . McKenney" <paulmck@kernel.org>
Subject: [PATCH v10 5/9] gpio: Remove gpio_chip_guard by using revocable
Date: Fri,  8 May 2026 18:54:44 +0800
Message-ID: <20260508105448.31799-6-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260508105448.31799-1-tzungbi@kernel.org>
References: <20260508105448.31799-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A8B624F556A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-36449-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Struct gpio_device now provides a revocable provider to the underlying
struct gpio_chip.  Leverage revocable for accessing the struct
gpio_chip instead of using gpio_chip_guard.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v10:
- No changes.

v9: https://lore.kernel.org/all/20260427135841.96266-6-tzungbi@kernel.org
- New to the series.
- Rename "chip_rp" -> "chip_rev".

v4 - v8:
- Doesn't exist.

v3: https://lore.kernel.org/all/20260213092958.864411-10-tzungbi@kernel.org
- Change revocable API usages accordingly.

v2: https://lore.kernel.org/all/20260203061059.975605-10-tzungbi@kernel.org
- Separate from v1 for including gpio_chip_guard only.

v1: https://lore.kernel.org/all/20260116081036.352286-23-tzungbi@kernel.org

---
 drivers/gpio/gpiolib-cdev.c  |   9 +-
 drivers/gpio/gpiolib-sysfs.c |  31 +++----
 drivers/gpio/gpiolib.c       | 164 ++++++++++++++++-------------------
 drivers/gpio/gpiolib.h       |  21 -----
 4 files changed, 91 insertions(+), 134 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index d8a7ccb406a5..4837497c5e6e 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2156,10 +2156,9 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
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
@@ -2192,10 +2191,10 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
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
index 9046fd923af0..0389d5f55282 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -454,14 +454,13 @@ int gpiod_get_direction(struct gpio_desc *desc)
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
@@ -474,7 +473,7 @@ int gpiod_get_direction(struct gpio_desc *desc)
 	    test_bit(GPIOD_FLAG_IS_OUT, &flags))
 		return 0;
 
-	ret = gpiochip_get_direction(guard.gc, offset);
+	ret = gpiochip_get_direction(gc, offset);
 	if (ret < 0)
 		return ret;
 
@@ -2563,16 +2562,15 @@ int gpiod_request_commit(struct gpio_desc *desc, const char *label)
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
@@ -2581,15 +2579,15 @@ int gpiod_request_commit(struct gpio_desc *desc, const char *label)
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
@@ -2626,16 +2624,17 @@ int gpiod_request(struct gpio_desc *desc, const char *label)
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
@@ -2787,15 +2786,14 @@ EXPORT_SYMBOL_GPL(gpiochip_free_own_desc);
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
 
@@ -2964,17 +2962,16 @@ EXPORT_SYMBOL_GPL(gpiod_direction_input);
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
@@ -2987,11 +2984,10 @@ int gpiod_direction_input_nonotify(struct gpio_desc *desc)
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
 
@@ -3031,31 +3027,28 @@ static int gpiochip_set(struct gpio_chip *gc, unsigned int offset, int value)
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
 
@@ -3070,7 +3063,7 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 		 * If we can't actively set the direction, we are some
 		 * output-only chip, so just drive the output as desired.
 		 */
-		ret = gpiochip_set(guard.gc, gpiod_hwgpio(desc), val);
+		ret = gpiochip_set(gc, gpiod_hwgpio(desc), val);
 		if (ret)
 			return ret;
 	}
@@ -3208,20 +3201,18 @@ int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value)
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
 
@@ -3241,20 +3232,18 @@ EXPORT_SYMBOL_GPL(gpiod_enable_hw_timestamp_ns);
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
 
@@ -3518,31 +3507,29 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
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
@@ -3557,9 +3544,9 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
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
@@ -3708,15 +3695,14 @@ EXPORT_SYMBOL_GPL(gpiod_get_array_value);
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
@@ -3737,17 +3723,16 @@ static int gpio_set_open_drain_value_commit(struct gpio_desc *desc, bool value)
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
@@ -3760,15 +3745,15 @@ static int gpio_set_open_source_value_commit(struct gpio_desc *desc, bool value)
 
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
@@ -3863,31 +3848,30 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
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
@@ -3926,10 +3910,10 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
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
@@ -5109,18 +5093,16 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
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
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 4e2e98f61f5a..90ad9b7fdfdd 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -228,27 +228,6 @@ struct gpio_desc {
 
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


