Return-Path: <linux-gpio+bounces-38270-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id spO4CHyfKWpMawMAu9opvQ
	(envelope-from <linux-gpio+bounces-38270-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 19:31:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A7C66BF61
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 19:31:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=baodeep.com header.s=dkim header.b="APp/KXbx";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38270-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38270-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=baodeep.com (policy=reject);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1A7F306CC53
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 15:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B17352003;
	Wed, 10 Jun 2026 15:34:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.adeep.su (mx.adeep.su [185.250.0.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3C41E492D;
	Wed, 10 Jun 2026 15:34:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781105675; cv=none; b=f2F1qvLTait98+YKEdi0a2bHo4qJd8x/jbY5wvFib4ElNxM3s+zduahrScSh0OPtNAGBYQnp/jcIUNfudwy+NoFd3zNm1LZpIUcut/twMlz1XQWtbnoTypXCebIyDTvzNeCmFIUSSSjxi04B96rqxCLckvb0GJq6zKOe79hNs5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781105675; c=relaxed/simple;
	bh=t8LdKvffY2epB2JbAKUwgSez0YnENCMnhSrQNDxcT3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MJQYojqqUM/NT4pPExvxmSt2uHSjOcO8Jm/TczqGe0Ju9FWGeWsbMYs+XmVU+ckgPqjv8yClMqZ8NXMkp2dZQQQxVEXIJIIQR/kMbYdXRVnrlSKTFCdx5vN35R73eKOUbwFFwzavKJAxQm3593FWTVVXrILA9Rh/6NXxhbCSDaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=baodeep.com; spf=pass smtp.mailfrom=baodeep.com; dkim=fail (2048-bit key) header.d=baodeep.com header.i=@baodeep.com header.b=APp/KXbx reason="signature verification failed"; arc=none smtp.client-ip=185.250.0.168
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92D32176952;
	Wed, 10 Jun 2026 18:34:18 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baodeep.com; s=dkim;
	t=1781105666; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=VatMx23/jiRolWzpy3xL4eHF6LEnNvpULEcVoqeKexA=;
	b=APp/KXbxes7KSD2ls5DY6R6GoEcNeyotzIWyDSnRKcSUNe9dB9CfA5vRStTBHoxz57bLzT
	t4708Af7Un5Q1Ou09+MTZ8rEDFN4dCBCdseAAQ2CndghT0YrwOAhH5xDDXG8wXhBv8Dhex
	YTMMX3ouPpNsNuJD0gncAjDpxLtLtpoD6CZgVncVCWSyE+Z73qbylmtaIF4YiWS19gAdr6
	MOdcrS8rKyUOUHwsGPnMCBP94rOPsBnEkKZE+72wFfH58jQKsNcNiQVrKVKMtPaHRw5D1r
	OYqNiUbE/AmnqEuV/YVAoAC3AbMtfs/38vXLYnyAG9qq0AfVumSs3MtE8VV0tg==
From: Viacheslav Bocharov <v@baodeep.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] gpio: shared-proxy: always serialize with a sleeping mutex
Date: Wed, 10 Jun 2026 18:32:10 +0300
Message-ID: <20260610153329.937833-2-v@baodeep.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610153329.937833-1-v@baodeep.com>
References: <20260610153329.937833-1-v@baodeep.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.54 / 15.00];
	DMARC_POLICY_REJECT(2.00)[baodeep.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[baodeep.com:s=dkim];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38270-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:diederik@cknow-tech.com,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[v@baodeep.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	GREYLIST(0.00)[pass,body];
	DKIM_TRACE(0.00)[baodeep.com:-];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[v@baodeep.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,baylibre.com,googlemail.com,samsung.com,arm.com,cknow-tech.com,vger.kernel.org,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,baodeep.com:email,baodeep.com:mid,baodeep.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,samsung.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82A7C66BF61

The shared GPIO descriptor used either a mutex or a spinlock, chosen at
runtime from the underlying chip's can_sleep:

	shared_desc->can_sleep = gpiod_cansleep(shared_desc->desc);
	... if (can_sleep) mutex_lock(); else spin_lock_irqsave();

can_sleep describes only the value path (->get/->set). Under the same
lock, however, the proxy may call gpiod_set_config() and
gpiod_direction_*(), which can reach pinctrl paths that take a mutex
(e.g. gpiod_set_config() -> gpiochip_generic_config() ->
pinctrl_gpio_set_config()), independent of can_sleep. On a controller
with non-sleeping MMIO value ops the descriptor lock was a spinlock, so
the sleeping pinctrl call ran from atomic context. Reproduced on an
Amlogic A113X board with the workaround from commit 28f240683871
("pinctrl: meson: mark the GPIO controller as sleeping") reverted; the
original Khadas VIM3 report hit the same path:

	BUG: sleeping function called from invalid context
	  __mutex_lock
	  pinctrl_get_device_gpio_range
	  pinctrl_gpio_set_config
	  gpiochip_generic_config
	  gpiod_set_config
	  gpio_shared_proxy_set_config   <- voting spinlock held
	  ...
	  mmc_pwrseq_simple_probe

The spinlock existed to take the value vote from atomic context, but the
vote and the (possibly sleeping) control operations share the same state
and lock, so this scheme cannot serialize config under a mutex and still
offer atomic value access. Always serialize the shared descriptor with a
mutex instead and mark the proxy a sleeping gpiochip, driving the
underlying GPIO through the cansleep value accessors: those are valid
for both sleeping and non-sleeping chips, so value access keeps working
on fast controllers, at the cost of no longer being atomic.

This is observable: consumers gating on gpiod_cansleep() take their
sleeping branch on a proxied GPIO (mmc-pwrseq-emmc skips its
emergency-restart reset handler; its normal reset is unaffected), and
consumers that reject sleeping GPIOs (pwm-gpio, ps2-gpio, ...) would
fail to probe. Such atomic users do not share a pin through the proxy,
whose purpose is voting on shared reset/enable lines. The same narrowing
already applies on Amlogic since that workaround, and rockchip
addressed the identical splat per-driver in commit 7ca497be0016 ("gpio:
rockchip: Stop calling pinctrl for set_direction"); fixing the proxy
addresses the locking error once, for every controller.

The lock type was added by commit a060b8c511ab ("gpiolib: implement
low-level, shared GPIO support"); the sleeping call under it arrived with
the proxy driver.

Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/00107523-7737-4b92-a785-14ce4e93b8cb@samsung.com/
Signed-off-by: Viacheslav Bocharov <v@baodeep.com>
---

 drivers/gpio/gpio-shared-proxy.c | 43 +++++++-------------------------
 drivers/gpio/gpiolib-shared.c    |  9 ++-----
 drivers/gpio/gpiolib-shared.h    | 31 +++++++++--------------
 3 files changed, 23 insertions(+), 60 deletions(-)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index 6941e4be6cf1..856e5b9d6163 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -109,7 +109,7 @@ static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
 
 	if (proxy->voted_high) {
 		ret = gpio_shared_proxy_set_unlocked(proxy,
-			shared_desc->can_sleep ? gpiod_set_value_cansleep : gpiod_set_value, 0);
+			gpiod_set_value_cansleep, 0);
 		if (ret)
 			dev_err(proxy->dev,
 				"Failed to unset the shared GPIO value on release: %d\n", ret);
@@ -222,13 +222,6 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
 	return gpio_shared_proxy_set_unlocked(proxy, gpiod_direction_output, value);
 }
 
-static int gpio_shared_proxy_get(struct gpio_chip *gc, unsigned int offset)
-{
-	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
-
-	return gpiod_get_value(proxy->shared_desc->desc);
-}
-
 static int gpio_shared_proxy_get_cansleep(struct gpio_chip *gc,
 					  unsigned int offset)
 {
@@ -237,29 +230,15 @@ static int gpio_shared_proxy_get_cansleep(struct gpio_chip *gc,
 	return gpiod_get_value_cansleep(proxy->shared_desc->desc);
 }
 
-static int gpio_shared_proxy_do_set(struct gpio_shared_proxy_data *proxy,
-				    int (*set_func)(struct gpio_desc *desc, int value),
-				    int value)
-{
-	guard(gpio_shared_desc_lock)(proxy->shared_desc);
-
-	return gpio_shared_proxy_set_unlocked(proxy, set_func, value);
-}
-
-static int gpio_shared_proxy_set(struct gpio_chip *gc, unsigned int offset,
-				 int value)
-{
-	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
-
-	return gpio_shared_proxy_do_set(proxy, gpiod_set_value, value);
-}
-
 static int gpio_shared_proxy_set_cansleep(struct gpio_chip *gc,
 					  unsigned int offset, int value)
 {
 	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
 
-	return gpio_shared_proxy_do_set(proxy, gpiod_set_value_cansleep, value);
+	guard(gpio_shared_desc_lock)(proxy->shared_desc);
+
+	return gpio_shared_proxy_set_unlocked(proxy, gpiod_set_value_cansleep,
+					      value);
 }
 
 static int gpio_shared_proxy_get_direction(struct gpio_chip *gc,
@@ -302,20 +281,16 @@ static int gpio_shared_proxy_probe(struct auxiliary_device *adev,
 	gc->label = dev_name(dev);
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
-	gc->can_sleep = shared_desc->can_sleep;
+	/* Always a sleeping gpiochip: see the lock comment in gpiolib-shared.h. */
+	gc->can_sleep = true;
 
 	gc->request = gpio_shared_proxy_request;
 	gc->free = gpio_shared_proxy_free;
 	gc->set_config = gpio_shared_proxy_set_config;
 	gc->direction_input = gpio_shared_proxy_direction_input;
 	gc->direction_output = gpio_shared_proxy_direction_output;
-	if (gc->can_sleep) {
-		gc->set = gpio_shared_proxy_set_cansleep;
-		gc->get = gpio_shared_proxy_get_cansleep;
-	} else {
-		gc->set = gpio_shared_proxy_set;
-		gc->get = gpio_shared_proxy_get;
-	}
+	gc->set = gpio_shared_proxy_set_cansleep;
+	gc->get = gpio_shared_proxy_get_cansleep;
 	gc->get_direction = gpio_shared_proxy_get_direction;
 	gc->to_irq = gpio_shared_proxy_to_irq;
 
diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index de72776fb154..495bd3d0ddf0 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -627,8 +627,7 @@ static void gpio_shared_release(struct kref *kref)
 
 	shared_desc = entry->shared_desc;
 	gpio_device_put(shared_desc->desc->gdev);
-	if (shared_desc->can_sleep)
-		mutex_destroy(&shared_desc->mutex);
+	mutex_destroy(&shared_desc->mutex);
 	kfree(shared_desc);
 	entry->shared_desc = NULL;
 }
@@ -659,11 +658,7 @@ gpiod_shared_desc_create(struct gpio_shared_entry *entry)
 	}
 
 	shared_desc->desc = &gdev->descs[entry->offset];
-	shared_desc->can_sleep = gpiod_cansleep(shared_desc->desc);
-	if (shared_desc->can_sleep)
-		mutex_init(&shared_desc->mutex);
-	else
-		spin_lock_init(&shared_desc->spinlock);
+	mutex_init(&shared_desc->mutex);
 
 	return shared_desc;
 }
diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
index 15e72a8dcdb1..5c725118b1af 100644
--- a/drivers/gpio/gpiolib-shared.h
+++ b/drivers/gpio/gpiolib-shared.h
@@ -6,7 +6,6 @@
 #include <linux/cleanup.h>
 #include <linux/lockdep.h>
 #include <linux/mutex.h>
-#include <linux/spinlock.h>
 
 struct gpio_device;
 struct gpio_desc;
@@ -42,35 +41,29 @@ static inline int gpio_shared_add_proxy_lookup(struct device *consumer,
 
 struct gpio_shared_desc {
 	struct gpio_desc *desc;
-	bool can_sleep;
 	unsigned long cfg;
 	unsigned int usecnt;
 	unsigned int highcnt;
-	union {
-		struct mutex mutex;
-		spinlock_t spinlock;
-	};
+	struct mutex mutex; /* serializes all proxy operations on this descriptor */
 };
 
 struct gpio_shared_desc *devm_gpiod_shared_get(struct device *dev);
 
+/*
+ * Under this lock the proxy may call gpiod_set_config()/gpiod_direction_*(),
+ * which can reach pinctrl paths that take a mutex (e.g. gpiod_set_config() ->
+ * gpiochip_generic_config() -> pinctrl_gpio_set_config()), independent of the
+ * underlying chip's can_sleep. A spinlock would run that sleeping call from
+ * atomic context, so the descriptor lock must be a mutex and the proxy
+ * gpiochip is therefore sleeping (can_sleep=true).
+ */
 DEFINE_LOCK_GUARD_1(gpio_shared_desc_lock, struct gpio_shared_desc,
-	if (_T->lock->can_sleep)
-		mutex_lock(&_T->lock->mutex);
-	else
-		spin_lock_irqsave(&_T->lock->spinlock, _T->flags),
-	if (_T->lock->can_sleep)
-		mutex_unlock(&_T->lock->mutex);
-	else
-		spin_unlock_irqrestore(&_T->lock->spinlock, _T->flags),
-	unsigned long flags)
+	mutex_lock(&_T->lock->mutex),
+	mutex_unlock(&_T->lock->mutex))
 
 static inline void gpio_shared_lockdep_assert(struct gpio_shared_desc *shared_desc)
 {
-	if (shared_desc->can_sleep)
-		lockdep_assert_held(&shared_desc->mutex);
-	else
-		lockdep_assert_held(&shared_desc->spinlock);
+	lockdep_assert_held(&shared_desc->mutex);
 }
 
 #endif /* __LINUX_GPIO_SHARED_H */
-- 
2.54.0


