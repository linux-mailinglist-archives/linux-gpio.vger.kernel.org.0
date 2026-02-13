Return-Path: <linux-gpio+bounces-31666-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNyNLnDwjmk5GAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31666-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 10:35:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC981348A2
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 10:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C03E31925E8
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 09:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207CB34B43D;
	Fri, 13 Feb 2026 09:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJWbFHe2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40622DC774;
	Fri, 13 Feb 2026 09:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770975089; cv=none; b=l1RAaV4S0W+TznhdEBX1B29gF1z8jaeIP0o/MF/Po0utOnK3ItmDMijhJnRkiUP7bPZbkK0bNCzLD3q4OB+QaLGZLWso2l8gGzjtIi/vzZtpRzKv9lreS6G8aH8PmI+JF+YkIeomUr9X58kAVGCKovSFuJfofLLjsRIy7SKi6RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770975089; c=relaxed/simple;
	bh=xrZENLz4dIxYm05qchHPEj52css9L6e1PnU4QEDqYIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VSSXOPlv6rIBp+6nOllXcRYvihwt/9UGn0QlMRZ95V/QgP7H/g5aiH0+3HsieVNSLELdsdAbYNbNEGA6PLK0H58Jlmjn9+p9/0Y8OCV4kAgLPbggGAFy1fQpV3VgkbdjYcPkzFmc+zUuQOUo1TvZqVPJBD09muWxc1czvjL0svw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJWbFHe2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E72D9C16AAE;
	Fri, 13 Feb 2026 09:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770975089;
	bh=xrZENLz4dIxYm05qchHPEj52css9L6e1PnU4QEDqYIU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aJWbFHe2FPlh42eq2d9VlEXZdCY7m/tPUp+h2ZXwIYI0Q+AqUtFPHvqPK8kmMFfIj
	 lO4KSqV5jsKckjUBAmgARyDyCUYVKVxIl8TyW51Mj534xXxcCKXmeePzKEfIrxOeYU
	 DgEjaxvh2UnNExClCG7SCdDs0j4wlfE5DDjS4UcCLFrUAukQov1p4KrUyNPgUDdrdB
	 OU8O6qLovciHPfjPbnq9p6lueXQkkOgSGlpfPJOhL5ZfqC/cvhoEw8GQBEkf1Sxidd
	 N2wmadxzbSB4CkF90JFwp3T1TGd7Fde3f+OaSfTEWJYE+vIGHRpH46L4AqjXI09KW4
	 U3svKoSA3vWLw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/11] gpio: Remove gpio_chip_guard by using revocable
Date: Fri, 13 Feb 2026 09:29:56 +0000
Message-ID: <20260213092958.864411-10-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0.310.g728cabbaf7-goog
In-Reply-To: <20260213092958.864411-1-tzungbi@kernel.org>
References: <20260213092958.864411-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-31666-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5BC981348A2
X-Rspamd-Action: no action

Struct gpio_device now provides a revocable provider to the underlying
struct gpio_chip.  Leverage revocable for accessing the struct
gpio_chip instead of using gpio_chip_guard.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v3:
- Change revocable API usages accordingly.

v2: https://lore.kernel.org/all/20260203061059.975605-10-tzungbi@kernel.org
- Separate from v1 for including gpio_chip_guard only.

v1: https://lore.kernel.org/all/20260116081036.352286-23-tzungbi@kernel.org

 drivers/gpio/gpiolib-cdev.c  |   9 +-
 drivers/gpio/gpiolib-sysfs.c |  30 +++----
 drivers/gpio/gpiolib.c       | 163 ++++++++++++++++-------------------
 drivers/gpio/gpiolib.h       |  21 -----
 4 files changed, 89 insertions(+), 134 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index b491e2737ef2..2a61c4aa3e18 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2205,10 +2205,9 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	u32 debounce_period_us;
 	unsigned long dflags;
 	const char *label;
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return;
+	revocable_try_access_or_return_void(desc->gdev->chip_rp, gc);
 
 	memset(info, 0, sizeof(*info));
 	info->offset = gpiod_hwgpio(desc);
@@ -2241,10 +2240,10 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
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
index 3fdcfa0c7d42..9bacd89cba93 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -215,10 +215,9 @@ static int gpio_sysfs_request_irq(struct gpiod_data *data, unsigned char flags)
 	struct gpio_desc *desc = data->desc;
 	unsigned long irq_flags;
 	int ret;
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(desc->gdev->chip_rp, gc);
 
 	data->irq = gpiod_to_irq(desc);
 	if (data->irq < 0)
@@ -244,7 +243,7 @@ static int gpio_sysfs_request_irq(struct gpiod_data *data, unsigned char flags)
 	 * Remove this redundant call (along with the corresponding unlock)
 	 * when those drivers have been fixed.
 	 */
-	ret = gpiochip_lock_as_irq(guard.gc, gpiod_hwgpio(desc));
+	ret = gpiochip_lock_as_irq(gc, gpiod_hwgpio(desc));
 	if (ret < 0)
 		goto err_clr_bits;
 
@@ -258,7 +257,7 @@ static int gpio_sysfs_request_irq(struct gpiod_data *data, unsigned char flags)
 	return 0;
 
 err_unlock:
-	gpiochip_unlock_as_irq(guard.gc, gpiod_hwgpio(desc));
+	gpiochip_unlock_as_irq(gc, gpiod_hwgpio(desc));
 err_clr_bits:
 	clear_bit(GPIOD_FLAG_EDGE_RISING, &desc->flags);
 	clear_bit(GPIOD_FLAG_EDGE_FALLING, &desc->flags);
@@ -273,14 +272,13 @@ static int gpio_sysfs_request_irq(struct gpiod_data *data, unsigned char flags)
 static void gpio_sysfs_free_irq(struct gpiod_data *data)
 {
 	struct gpio_desc *desc = data->desc;
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return;
+	revocable_try_access_or_return_void(desc->gdev->chip_rp, gc);
 
 	data->irq_flags = 0;
 	free_irq(data->irq, data);
-	gpiochip_unlock_as_irq(guard.gc, gpiod_hwgpio(desc));
+	gpiochip_unlock_as_irq(gc, gpiod_hwgpio(desc));
 	clear_bit(GPIOD_FLAG_EDGE_RISING, &desc->flags);
 	clear_bit(GPIOD_FLAG_EDGE_FALLING, &desc->flags);
 }
@@ -473,13 +471,12 @@ static DEVICE_ATTR_RO(ngpio);
 static int export_gpio_desc(struct gpio_desc *desc)
 {
 	int offset, ret;
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(desc->gdev->chip_rp, gc);
 
 	offset = gpiod_hwgpio(desc);
-	if (!gpiochip_line_is_valid(guard.gc, offset)) {
+	if (!gpiochip_line_is_valid(gc, offset)) {
 		pr_debug_ratelimited("%s: GPIO %d masked\n", __func__,
 				     gpiod_hwgpio(desc));
 		return -EINVAL;
@@ -732,6 +729,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	struct gpio_device *gdev;
 	struct attribute **attrs;
 	int status;
+	struct gpio_chip *gc;
 
 	/* can't export until sysfs is available ... */
 	if (!class_is_registered(&gpio_class)) {
@@ -744,9 +742,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 		return -EINVAL;
 	}
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(desc->gdev->chip_rp, gc);
 
 	if (test_and_set_bit(GPIOD_FLAG_EXPORT, &desc->flags))
 		return -EPERM;
@@ -769,7 +765,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 
 	desc_data->desc = desc;
 	mutex_init(&desc_data->mutex);
-	if (guard.gc->direction_input && guard.gc->direction_output)
+	if (gc->direction_input && gc->direction_output)
 		desc_data->direction_can_change = direction_may_change;
 	else
 		desc_data->direction_can_change = false;
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7ef4dc4e6e9e..34f2665a9311 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -449,14 +449,13 @@ int gpiod_get_direction(struct gpio_desc *desc)
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
+	revocable_try_access_or_return(desc->gdev->chip_rp, gc);
 
 	offset = gpiod_hwgpio(desc);
 	flags = READ_ONCE(desc->flags);
@@ -469,7 +468,7 @@ int gpiod_get_direction(struct gpio_desc *desc)
 	    test_bit(GPIOD_FLAG_IS_OUT, &flags))
 		return 0;
 
-	ret = gpiochip_get_direction(guard.gc, offset);
+	ret = gpiochip_get_direction(gc, offset);
 	if (ret < 0)
 		return ret;
 
@@ -2475,31 +2474,30 @@ int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 {
 	unsigned int offset;
 	int ret;
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(desc->gdev->chip_rp, gc);
 
 	if (test_and_set_bit(GPIOD_FLAG_REQUESTED, &desc->flags))
 		return -EBUSY;
 
 	offset = gpiod_hwgpio(desc);
-	if (!gpiochip_line_is_valid(guard.gc, offset))
+	if (!gpiochip_line_is_valid(gc, offset))
 		return -EINVAL;
 
 	/* NOTE:  gpio_request() can be called in early boot,
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
@@ -2536,16 +2534,17 @@ int gpiod_request(struct gpio_desc *desc, const char *label)
 void gpiod_free_commit(struct gpio_desc *desc)
 {
 	unsigned long flags;
+	struct gpio_chip *gc;
 
 	might_sleep();
 
-	CLASS(gpio_chip_guard, guard)(desc);
+	revocable_try_access_or_return_void(desc->gdev->chip_rp, gc);
 
 	flags = READ_ONCE(desc->flags);
 
-	if (guard.gc && test_bit(GPIOD_FLAG_REQUESTED, &flags)) {
-		if (guard.gc->free)
-			guard.gc->free(guard.gc, gpiod_hwgpio(desc));
+	if (test_bit(GPIOD_FLAG_REQUESTED, &flags)) {
+		if (gc->free)
+			gc->free(gc, gpiod_hwgpio(desc));
 
 		clear_bit(GPIOD_FLAG_ACTIVE_LOW, &flags);
 		clear_bit(GPIOD_FLAG_REQUESTED, &flags);
@@ -2697,15 +2696,14 @@ EXPORT_SYMBOL_GPL(gpiochip_free_own_desc);
 int gpio_do_set_config(struct gpio_desc *desc, unsigned long config)
 {
 	int ret;
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(desc->gdev->chip_rp, gc);
 
-	if (!guard.gc->set_config)
+	if (!gc->set_config)
 		return -ENOTSUPP;
 
-	ret = guard.gc->set_config(guard.gc, gpiod_hwgpio(desc), config);
+	ret = gc->set_config(gc, gpiod_hwgpio(desc), config);
 	if (ret > 0)
 		ret = -EBADE;
 
@@ -2874,17 +2872,16 @@ EXPORT_SYMBOL_GPL(gpiod_direction_input);
 int gpiod_direction_input_nonotify(struct gpio_desc *desc)
 {
 	int ret = 0, dir;
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(desc->gdev->chip_rp, gc);
 
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
@@ -2897,11 +2894,10 @@ int gpiod_direction_input_nonotify(struct gpio_desc *desc)
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
 
@@ -2941,31 +2937,28 @@ static int gpiochip_set(struct gpio_chip *gc, unsigned int offset, int value)
 static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 {
 	int val = !!value, ret = 0, dir;
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(desc->gdev->chip_rp, gc);
 
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
 
@@ -2980,7 +2973,7 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 		 * If we can't actively set the direction, we are some
 		 * output-only chip, so just drive the output as desired.
 		 */
-		ret = gpiochip_set(guard.gc, gpiod_hwgpio(desc), val);
+		ret = gpiochip_set(gc, gpiod_hwgpio(desc), val);
 		if (ret)
 			return ret;
 	}
@@ -3118,20 +3111,18 @@ int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value)
 int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags)
 {
 	int ret;
+	struct gpio_chip *gc;
 
 	VALIDATE_DESC(desc);
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(desc->gdev->chip_rp, gc);
 
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
 
@@ -3151,20 +3142,18 @@ EXPORT_SYMBOL_GPL(gpiod_enable_hw_timestamp_ns);
 int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags)
 {
 	int ret;
+	struct gpio_chip *gc;
 
 	VALIDATE_DESC(desc);
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(desc->gdev->chip_rp, gc);
 
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
 
@@ -3424,31 +3413,29 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 		unsigned long *mask, *bits;
 		int first, j;
 
-		CLASS(gpio_chip_guard, guard)(desc_array[i]);
-		if (!guard.gc)
-			return -ENODEV;
+		revocable_try_access_or_return(desc_array[i]->gdev->chip_rp, gc);
 
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
@@ -3463,9 +3450,9 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
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
@@ -3614,15 +3601,14 @@ EXPORT_SYMBOL_GPL(gpiod_get_array_value);
 static int gpio_set_open_drain_value_commit(struct gpio_desc *desc, bool value)
 {
 	int ret = 0, offset = gpiod_hwgpio(desc);
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(desc->gdev->chip_rp, gc);
 
 	if (value) {
-		ret = gpiochip_direction_input(guard.gc, offset);
+		ret = gpiochip_direction_input(gc, offset);
 	} else {
-		ret = gpiochip_direction_output(guard.gc, offset, 0);
+		ret = gpiochip_direction_output(gc, offset, 0);
 		if (!ret)
 			set_bit(GPIOD_FLAG_IS_OUT, &desc->flags);
 	}
@@ -3643,17 +3629,16 @@ static int gpio_set_open_drain_value_commit(struct gpio_desc *desc, bool value)
 static int gpio_set_open_source_value_commit(struct gpio_desc *desc, bool value)
 {
 	int ret = 0, offset = gpiod_hwgpio(desc);
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(desc->gdev->chip_rp, gc);
 
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
@@ -3666,15 +3651,15 @@ static int gpio_set_open_source_value_commit(struct gpio_desc *desc, bool value)
 
 static int gpiod_set_raw_value_commit(struct gpio_desc *desc, bool value)
 {
+	struct gpio_chip *gc;
+
 	if (unlikely(!test_bit(GPIOD_FLAG_IS_OUT, &desc->flags)))
 		return -EPERM;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(desc->gdev->chip_rp, gc);
 
 	trace_gpio_value(desc_to_gpio(desc), 0, value);
-	return gpiochip_set(guard.gc, gpiod_hwgpio(desc), value);
+	return gpiochip_set(gc, gpiod_hwgpio(desc), value);
 }
 
 /*
@@ -3769,31 +3754,29 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 		unsigned long *mask, *bits;
 		int count = 0;
 
-		CLASS(gpio_chip_guard, guard)(desc_array[i]);
-		if (!guard.gc)
-			return -ENODEV;
+		revocable_try_access_or_return(desc_array[i]->gdev->chip_rp, gc);
 
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
@@ -3832,10 +3815,10 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
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
@@ -5051,18 +5034,16 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 	struct gpio_desc *local_desc;
 	int hwnum;
 	int ret;
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(desc->gdev->chip_rp, gc);
 
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
index 56643f40e87e..a254a57f37f5 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -224,27 +224,6 @@ struct gpio_desc {
 
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
2.53.0.310.g728cabbaf7-goog


