Return-Path: <linux-gpio+bounces-31373-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6G24Dy6SgWl/HAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31373-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 07:14:06 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB57D517A
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 07:14:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CDB0309E169
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 06:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41EE336C59B;
	Tue,  3 Feb 2026 06:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXVydcL6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CDE36BCD4;
	Tue,  3 Feb 2026 06:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770099119; cv=none; b=uyzFholYAUQTaEa2xRgjzQPh7A1B6HZeohCdBfND70ot7jMrTT/ToxM5CzQTaXZNs/GnkUvX24Fa9rhrP0ZFnHoT4l9wW/UO8+5XIvTzIG1coM6ceiiTHomloHFHyk4B9a2a/JrrChWsl5l0XfN02N9TiYaiyY9nkP15FtSbD4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770099119; c=relaxed/simple;
	bh=EJ+TDb9a/0MDYPCDTU4S8VEwVGR8TQu0WaVai1yH6Jw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B6Trc5da2dA4/uO0fyBOyqkD5MPfJ9AksG0jPt2bbR3s9GMfUs1UBiFzztdHUZIomuMWr4iaq9i0GqvXHO2Zy5yOg5sdbowNUQfqye9lmYNz5Z9a3WYHQBIbhwVbXVfVfE5tKGQVpy/DIl6hkEv8Ivi1LQ1hcQP03t2GukioqPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXVydcL6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73176C116D0;
	Tue,  3 Feb 2026 06:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770099118;
	bh=EJ+TDb9a/0MDYPCDTU4S8VEwVGR8TQu0WaVai1yH6Jw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RXVydcL6Q96CW6A0FJPpzoI09yjEL9SRxE+UflwoDbGIfAsPFGQj0cOcKukEmd2L4
	 k/sbHXMc22D2Ym03lE5h//Q76BgZEFToypgKdWrk2QKSAyyajJvqWN+Qb+eZGpQJCF
	 rl93X5DttqxTc9gdc4mfXBMCE9EaEAcIiiuECX34Dx5DidMJRLIPjrdsu6WFFNCpIb
	 TLHK1bv/w8pJ8/SEaVdSSlabnniAsMuR4LBAHmXsVAHeGxwq2DjlCTkcArCjbBjvJU
	 mtuMApDBLAyHDywZPaiJQzrTi2BddLj2Cs7gaQYXv79mxrIBkbL/j8x4lugIZU4Fhi
	 G3/CYgeS4+0Og==
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
Subject: [PATCH v2 03/11] gpio: sysfs: Remove redundant check for struct gpio_chip
Date: Tue,  3 Feb 2026 06:10:50 +0000
Message-ID: <20260203061059.975605-4-tzungbi@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-31373-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ABB57D517A
X-Rspamd-Action: no action

gpiochip_sysfs_unregister() is only called by gpiochip_remove() where
the struct gpio_chip is ensured.

Remove the redundant check.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v2:
- No changes.

v1: https://lore.kernel.org/all/20260116081036.352286-9-tzungbi@kernel.org

 drivers/gpio/gpiolib-sysfs.c | 9 +--------
 drivers/gpio/gpiolib-sysfs.h | 6 ++++--
 drivers/gpio/gpiolib.c       | 2 +-
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index cd553acf3055..8e6b09d8b559 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -1048,11 +1048,10 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
 	return 0;
 }
 
-void gpiochip_sysfs_unregister(struct gpio_device *gdev)
+void gpiochip_sysfs_unregister(struct gpio_device *gdev, struct gpio_chip *chip)
 {
 	struct gpiodev_data *data;
 	struct gpio_desc *desc;
-	struct gpio_chip *chip;
 
 	scoped_guard(mutex, &sysfs_lock) {
 		data = gdev_get_data(gdev);
@@ -1066,12 +1065,6 @@ void gpiochip_sysfs_unregister(struct gpio_device *gdev)
 		kfree(data);
 	}
 
-	guard(srcu)(&gdev->srcu);
-
-	chip = srcu_dereference(gdev->chip, &gdev->srcu);
-	if (!chip)
-		return;
-
 	/* unregister gpiod class devices owned by sysfs */
 	for_each_gpio_desc_with_flag(chip, desc, GPIOD_FLAG_SYSFS) {
 		gpiod_unexport(desc);
diff --git a/drivers/gpio/gpiolib-sysfs.h b/drivers/gpio/gpiolib-sysfs.h
index b794b396d6a5..93debe8e118c 100644
--- a/drivers/gpio/gpiolib-sysfs.h
+++ b/drivers/gpio/gpiolib-sysfs.h
@@ -8,7 +8,8 @@ struct gpio_device;
 #ifdef CONFIG_GPIO_SYSFS
 
 int gpiochip_sysfs_register(struct gpio_device *gdev);
-void gpiochip_sysfs_unregister(struct gpio_device *gdev);
+void gpiochip_sysfs_unregister(struct gpio_device *gdev,
+			       struct gpio_chip *chip);
 
 #else
 
@@ -17,7 +18,8 @@ static inline int gpiochip_sysfs_register(struct gpio_device *gdev)
 	return 0;
 }
 
-static inline void gpiochip_sysfs_unregister(struct gpio_device *gdev)
+static inline void gpiochip_sysfs_unregister(struct gpio_device *gdev,
+					     struct gpio_chip *chip)
 {
 }
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a6dd07be126c..3137e6f1108a 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1281,7 +1281,7 @@ void gpiochip_remove(struct gpio_chip *gc)
 	struct gpio_device *gdev = gc->gpiodev;
 
 	/* FIXME: should the legacy sysfs handling be moved to gpio_device? */
-	gpiochip_sysfs_unregister(gdev);
+	gpiochip_sysfs_unregister(gdev, gc);
 	gpiochip_free_hogs(gc);
 	gpiochip_free_remaining_irqs(gc);
 
-- 
2.53.0.rc2.204.g2597b5adb4-goog


