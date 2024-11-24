Return-Path: <linux-gpio+bounces-13238-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFF79D6F77
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Nov 2024 14:10:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 012F5B2BAAF
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Nov 2024 13:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0948198A29;
	Sun, 24 Nov 2024 12:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFmeaxfo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF4E16EBE8;
	Sun, 24 Nov 2024 12:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732452561; cv=none; b=ib4rqKVILf/RQemAvEvPcDWbcsiTwVPd0Z2uUjtWO+FAcZIBH1rrzsElejKlmTF+zY74cEQcC7nmNZrfy+OThMW8hUJPdWuRGQw0+PZHQFLR5Tgw5sHkHqFQUEkDa7RZaXlnyF6cUiueBI5Xaa7NTZxZQNEcZnH5lAPOKqoOd4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732452561; c=relaxed/simple;
	bh=eTeBQf1Wo6ia4RtNUcO2BnjPEZ1uNdYxUUEKDWbt6r8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OO07UidrNSWENnrnPnsi/5ns1dWBBN4EG7sREi7D7LjtGko90cm13kTgr+WOG8Md6oAXskoZ+t2HXXI+49QN6uuvfP5AD/heFZ5L3e6feY5bUTxzLve6wPFAXKF16Y/ZFujN55g/MeZFk12pOkNuHHlfDgsKtwwXwz02Ut/hkps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFmeaxfo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79818C4CECC;
	Sun, 24 Nov 2024 12:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452561;
	bh=eTeBQf1Wo6ia4RtNUcO2BnjPEZ1uNdYxUUEKDWbt6r8=;
	h=From:To:Cc:Subject:Date:From;
	b=ZFmeaxfoJtuNx3EzMxdVJsucX9qgYnNu8h/ZcTT60PtOL6FynvjL27O6NCZlftVHX
	 S1ldDkgIEh+EDz+U6I0EUwrnpseNSUHDvmPKPqdqxgTzMRQtaHmRwg9O8d3GVTeaKM
	 rJbYoCoCDwllRI6O7vt0G5lNheTGaLRGkqeJmD9JOEVeguPM9Vj5+TVZTlDgwer99/
	 /2mbRBAm5crMrTVU67Bj8tkCh3do6JQB00JcjlsigiESlFy4ASibOG5A2pJmGmSeNA
	 +Xx8A57O86PU4otPIzCJ5LGgxzzU2g1+k6UT54CdhigWZG2OJmQpreCa4hxjkNugFk
	 5Hw9M+Gb0nmOg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 01/23] gpio: free irqs that are still requested when the chip is being removed
Date: Sun, 24 Nov 2024 07:48:12 -0500
Message-ID: <20241124124919.3338752-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

[ Upstream commit ec8b6f55b98146c41dcf15e8189eb43291e35e89 ]

If we remove a GPIO chip that is also an interrupt controller with users
not having freed some interrupts, we'll end up leaking resources as
indicated by the following warning:

  remove_proc_entry: removing non-empty directory 'irq/30', leaking at least 'gpio'

As there's no way of notifying interrupt users about the irqchip going
away and the interrupt subsystem is not plugged into the driver model and
so not all cases can be handled by devlinks, we need to make sure to free
all interrupts before the complete the removal of the provider.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Tested-by: Herve Codina <herve.codina@bootlin.com>
Link: https://lore.kernel.org/r/20240919135104.3583-1-brgl@bgdev.pl
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpiolib.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 2b02655abb56e..44372f8647d51 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -14,6 +14,7 @@
 #include <linux/idr.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/irqdesc.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/lockdep.h>
@@ -713,6 +714,45 @@ bool gpiochip_line_is_valid(const struct gpio_chip *gc,
 }
 EXPORT_SYMBOL_GPL(gpiochip_line_is_valid);
 
+static void gpiod_free_irqs(struct gpio_desc *desc)
+{
+	int irq = gpiod_to_irq(desc);
+	struct irq_desc *irqd = irq_to_desc(irq);
+	void *cookie;
+
+	for (;;) {
+		/*
+		 * Make sure the action doesn't go away while we're
+		 * dereferencing it. Retrieve and store the cookie value.
+		 * If the irq is freed after we release the lock, that's
+		 * alright - the underlying maple tree lookup will return NULL
+		 * and nothing will happen in free_irq().
+		 */
+		scoped_guard(mutex, &irqd->request_mutex) {
+			if (!irq_desc_has_action(irqd))
+				return;
+
+			cookie = irqd->action->dev_id;
+		}
+
+		free_irq(irq, cookie);
+	}
+}
+
+/*
+ * The chip is going away but there may be users who had requested interrupts
+ * on its GPIO lines who have no idea about its removal and have no way of
+ * being notified about it. We need to free any interrupts still in use here or
+ * we'll leak memory and resources (like procfs files).
+ */
+static void gpiochip_free_remaining_irqs(struct gpio_chip *gc)
+{
+	struct gpio_desc *desc;
+
+	for_each_gpio_desc_with_flag(gc, desc, FLAG_USED_AS_IRQ)
+		gpiod_free_irqs(desc);
+}
+
 static void gpiodev_release(struct device *dev)
 {
 	struct gpio_device *gdev = to_gpio_device(dev);
@@ -1125,6 +1165,7 @@ void gpiochip_remove(struct gpio_chip *gc)
 	/* FIXME: should the legacy sysfs handling be moved to gpio_device? */
 	gpiochip_sysfs_unregister(gdev);
 	gpiochip_free_hogs(gc);
+	gpiochip_free_remaining_irqs(gc);
 
 	scoped_guard(mutex, &gpio_devices_lock)
 		list_del_rcu(&gdev->list);
-- 
2.43.0


