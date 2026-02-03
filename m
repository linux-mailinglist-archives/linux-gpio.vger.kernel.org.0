Return-Path: <linux-gpio+bounces-31380-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKflLAGSgWl/HAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31380-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 07:13:21 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DC1D5146
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 07:13:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ABCFC301B498
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 06:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB8F36D50C;
	Tue,  3 Feb 2026 06:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sPqWCkra"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E62E36D4EB;
	Tue,  3 Feb 2026 06:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770099138; cv=none; b=efqP0aBCDG3F017JOGe19NdGJsfZHfz9IMmmXpjXwa+7qlDTDH83U3QdLHpvsZ33LzzNw0IqKqBCqjcJu+aO1ZaE2pbURarGZIOE0e7oAEZse7kXrVrJSIPcdxX4L5+3TUI5fB9Ac+LomtGD/iPDe+HhOvOtDHmLMg+6K6gmMXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770099138; c=relaxed/simple;
	bh=j5Gnn7+c1X37ns/z5KIpWlTK7fXC/RscFmd1ERfs39k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rPN4EoXtK+izRcItvSlk/AmllQDdv7lhuaVd6UR0BCR9142NgygnKSu4UVGEmjOBjCpPLdMt4uJXLuLNoQkHOPyblNSLPVdH0SKpcCRn/RESCfFkPGfy9x4kstAYpXIJJgOBeJP4I1pJTuLwbvH8wIlT4MhOUKnNnqLoiYvry2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sPqWCkra; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB094C19425;
	Tue,  3 Feb 2026 06:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770099138;
	bh=j5Gnn7+c1X37ns/z5KIpWlTK7fXC/RscFmd1ERfs39k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sPqWCkrapoxbenRDSg4g+fy0bZBBYESjoEJYMxUv7+RCvN5mpy3JCEJvXC+yc7FPg
	 lk41fZhQ+Cd4Y/dxBZ5uEZjIw+bobBRiiwIIimdSZS/eTTtNLh4vWS5LKG2EnjL2Ov
	 pQDCZ57zweLXHXX+sIlQxROsiJGOZTTUY4BpbYFabySLfx/D/lTH/txXf2tQ/KLyui
	 yc47thwTv9Lq9ZnyMm2Lce1qoAyr9cAsX9+haBZDKvgOVIFfCHEKnMNo7ReYsGMsdm
	 jA1o91XeeEVI/UFZQkHrX+vp9fPxiQ+/aADGUV+dli6zfmgAE4wMiuQNEUzAPpg9sn
	 MTjsGrdW7/9wA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linusw@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Johan Hovold <johan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	Dan Williams <dan.j.williams@intel.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 10/11] gpio: Leverage revocable for accessing struct gpio_chip
Date: Tue,  3 Feb 2026 06:10:57 +0000
Message-ID: <20260203061059.975605-11-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
In-Reply-To: <20260203061059.975605-1-tzungbi@kernel.org>
References: <20260203061059.975605-1-tzungbi@kernel.org>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-31380-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 58DC1D5146
X-Rspamd-Action: no action

Struct gpio_device now provides a revocable provider to the underlying
struct gpio_chip.  Leverage revocable for accessing the struct
gpio_chip.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v2:
- Separate from v1(a) for excluding gpio_chip_guard and combine v1(b).

v1(a):
- https://lore.kernel.org/all/20260116081036.352286-23-tzungbi@kernel.org
v1(b):
- https://lore.kernel.org/all/20260116081036.352286-19-tzungbi@kernel.org

 drivers/gpio/gpiolib.c | 52 +++++++++++++++---------------------------
 1 file changed, 18 insertions(+), 34 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e62b00191d59..347ff456858f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -338,7 +338,10 @@ EXPORT_SYMBOL(gpio_device_get_label);
  */
 struct gpio_chip *gpio_device_get_chip(struct gpio_device *gdev)
 {
-	return rcu_dereference_check(gdev->chip, 1);
+	struct gpio_chip *gc;
+
+	REVOCABLE_TRY_ACCESS_WITH(gdev->chip_rp, gc);
+	return gc;
 }
 EXPORT_SYMBOL_GPL(gpio_device_get_chip);
 
@@ -558,9 +561,7 @@ static struct gpio_desc *gpio_name_to_desc(const char * const name)
 
 	list_for_each_entry_srcu(gdev, &gpio_devices, list,
 				 srcu_read_lock_held(&gpio_devices_srcu)) {
-		guard(srcu)(&gdev->srcu);
-
-		gc = srcu_dereference(gdev->chip, &gdev->srcu);
+		REVOCABLE_TRY_ACCESS_WITH(gdev->chip_rp, gc);
 		if (!gc)
 			continue;
 
@@ -972,9 +973,7 @@ static void gpiochip_setup_devs(void)
 
 	list_for_each_entry_srcu(gdev, &gpio_devices, list,
 				 srcu_read_lock_held(&gpio_devices_srcu)) {
-		guard(srcu)(&gdev->srcu);
-
-		gc = srcu_dereference(gdev->chip, &gdev->srcu);
+		REVOCABLE_TRY_ACCESS_WITH(gdev->chip_rp, gc);
 		if (!gc) {
 			dev_err(&gdev->dev, "Underlying GPIO chip is gone\n");
 			continue;
@@ -1379,11 +1378,11 @@ struct gpio_device *gpio_device_find(const void *data,
 		if (!device_is_registered(&gdev->dev))
 			continue;
 
-		guard(srcu)(&gdev->srcu);
-
-		gc = srcu_dereference(gdev->chip, &gdev->srcu);
+		REVOCABLE_TRY_ACCESS_WITH(gdev->chip_rp, gc);
+		if (!gc)
+			continue;
 
-		if (gc && match(gc, data))
+		if (match(gc, data))
 			return gpio_device_get(gdev);
 	}
 
@@ -3325,16 +3324,10 @@ static int gpio_chip_get_value(struct gpio_chip *gc, const struct gpio_desc *des
 
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
+	REVOCABLE_TRY_ACCESS_WITH(desc->gdev->chip_rp, gc);
 	if (!gc)
 		return -ENODEV;
 
@@ -3375,9 +3368,10 @@ static int gpio_chip_get_multiple(struct gpio_chip *gc,
 /* The 'other' chip must be protected with its GPIO device's SRCU. */
 static bool gpio_device_chip_cmp(struct gpio_device *gdev, struct gpio_chip *gc)
 {
-	guard(srcu)(&gdev->srcu);
+	struct gpio_chip *chip;
 
-	return gc == srcu_dereference(gdev->chip, &gdev->srcu);
+	REVOCABLE_TRY_ACCESS_WITH(gdev->chip_rp, chip);
+	return chip ? chip == gc : false;
 }
 
 int gpiod_get_array_value_complex(bool raw, bool can_sleep,
@@ -3400,9 +3394,7 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 		if (!can_sleep)
 			WARN_ON(array_info->gdev->can_sleep);
 
-		guard(srcu)(&array_info->gdev->srcu);
-		gc = srcu_dereference(array_info->gdev->chip,
-				      &array_info->gdev->srcu);
+		REVOCABLE_TRY_ACCESS_WITH(array_info->gdev->chip_rp, gc);
 		if (!gc)
 			return -ENODEV;
 
@@ -3749,9 +3741,7 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 				return -EPERM;
 		}
 
-		guard(srcu)(&array_info->gdev->srcu);
-		gc = srcu_dereference(array_info->gdev->chip,
-				      &array_info->gdev->srcu);
+		REVOCABLE_TRY_ACCESS_WITH(array_info->gdev->chip_rp, gc);
 		if (!gc)
 			return -ENODEV;
 
@@ -4049,7 +4039,6 @@ EXPORT_SYMBOL_GPL(gpiod_is_shared);
  */
 int gpiod_to_irq(const struct gpio_desc *desc)
 {
-	struct gpio_device *gdev;
 	struct gpio_chip *gc;
 	int offset;
 	int ret;
@@ -4058,10 +4047,7 @@ int gpiod_to_irq(const struct gpio_desc *desc)
 	if (ret <= 0)
 		return -EINVAL;
 
-	gdev = desc->gdev;
-	/* FIXME Cannot use gpio_chip_guard due to const desc. */
-	guard(srcu)(&gdev->srcu);
-	gc = srcu_dereference(gdev->chip, &gdev->srcu);
+	REVOCABLE_TRY_ACCESS_WITH(desc->gdev->chip_rp, gc);
 	if (!gc)
 		return -ENODEV;
 
@@ -5440,9 +5426,7 @@ static int gpiolib_seq_show(struct seq_file *s, void *v)
 	if (priv->newline)
 		seq_putc(s, '\n');
 
-	guard(srcu)(&gdev->srcu);
-
-	gc = srcu_dereference(gdev->chip, &gdev->srcu);
+	REVOCABLE_TRY_ACCESS_WITH(gdev->chip_rp, gc);
 	if (!gc) {
 		seq_printf(s, "%s: (dangling chip)\n", dev_name(&gdev->dev));
 		return 0;
-- 
2.53.0.rc2.204.g2597b5adb4-goog


