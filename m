Return-Path: <linux-gpio+bounces-39177-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R0pGGWWbQ2rbdAoAu9opvQ
	(envelope-from <linux-gpio+bounces-39177-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 12:33:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D53C26E2E74
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 12:33:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=baodeep.com header.s=dkim header.b="O/XDL6fV";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39177-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39177-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=baodeep.com (policy=reject);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 058E930841E1
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 10:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4123D3EFFD5;
	Tue, 30 Jun 2026 10:16:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.adeep.su (mx.adeep.su [185.250.0.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6133EDE7A;
	Tue, 30 Jun 2026 10:16:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814601; cv=none; b=tXTMihYXZKSpVHLiMTclXSeKz0WnjizJCXofwBnKd9iDxEyKHfutZcUwG2CdlFfedfGgUZwr1HHaUnRRL/E8daoraAlUfDMFNaKSNdXUsuH5V/S/G6rGbCJQqyLlkkz8RJ35/rRAA/SkTXQQxGqDRDM1ntfMlWp3iSvrGLAW3WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814601; c=relaxed/simple;
	bh=pBOJio9WtHhOmUuRHQde4xlKQnLraBu/CWqWd9vVE4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NuQz+MO/FW4bDTd4Dd+h6Ka0mBeA6SWmlcYn2p828G3h1mPj51OThZiJDM5Duvl9FKzXteeZpUzO2vX9M/ahCkSVVnjtgZ0E68+r54LN38Nk6uuTsbVBCepH+fWHKMnQsgEHmxSLTPfNHZXW3r+xj7ttFhbpu5kw16/y5Fi9Bts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=baodeep.com; spf=pass smtp.mailfrom=baodeep.com; dkim=fail (2048-bit key) header.d=baodeep.com header.i=@baodeep.com header.b=O/XDL6fV reason="signature verification failed"; arc=none smtp.client-ip=185.250.0.168
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 782D51CD206;
	Tue, 30 Jun 2026 13:16:25 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baodeep.com; s=dkim;
	t=1782814593; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=khGGMlvJa0XqxiIoIeClDY9ikTOF28YO+A+DjPlXZUo=;
	b=O/XDL6fVJOP5qRiFNFWxy2PJE4HzPlL3Xx0mNmcA8s2Y3ot5cd/l9IO9gUDpc2gVtnJ3QF
	SH9JcV3DTCEvUCVYxM+4SVaUjIqzO4EF51C80YOsVg7RSpUw5qVCauDBmlF62dLxZfFuZV
	orSKOkvfScLTZuaQXkJwtaQxKQIp6z8f90DyYPM3Jd8RPn0hI/k+WZWvHuMBAleT576PuW
	mLJuucGGsYhDAHxQOfCnxz5Pxv3ud09SSkogEPmtOFQc6x3ec8CAUgqBNexvJPjPOMIt7J
	AZA3vTqlxrYGalt+PapcpodKpIeK7MTaaEDB/pG0C7rmBx41tMq9LJ95wxYR1g==
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
Subject: [PATCH v3 1/2] gpio: shared-proxy: always serialize with a sleeping mutex
Date: Tue, 30 Jun 2026 13:15:44 +0300
Message-ID: <20260630101545.800625-2-v@baodeep.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630101545.800625-1-v@baodeep.com>
References: <20260630101545.800625-1-v@baodeep.com>
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
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[baodeep.com:s=dkim];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:diederik@cknow-tech.com,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,baylibre.com,googlemail.com,samsung.com,arm.com,cknow-tech.com,vger.kernel.org,lists.infradead.org];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[v@baodeep.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_FROM(0.00)[bounces-39177-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,baodeep.com:email,baodeep.com:mid,baodeep.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,samsung.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[v@baodeep.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[baodeep.com:-]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D53C26E2E74

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

With every vote edge now driven through the cansleep value setter,
gpio_shared_proxy_set_unlocked() no longer needs a per-call setter: drop
its set_func callback and call gpiod_set_value_cansleep() directly. The
shared direction_output path reaches it only once the line is already an
output, so driving the value there is equivalent to re-issuing
gpiod_direction_output(), without the redundant per-edge re-assertion of
drive config and bias.

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
v2 -> v3: drop the set_func callback from gpio_shared_proxy_set_unlocked()
          and call gpiod_set_value_cansleep() directly; the shared
          direction_output path drives the already-output line via the
          value setter instead of re-issuing gpiod_direction_output().
v1 -> v2: open-code the descriptor mutex; drop the gpio_shared_desc_lock
          guard and the gpio_shared_lockdep_assert() helper, use
          guard(mutex) and lockdep_assert_held() directly; move the
          mutex rationale from the header to the can_sleep assignment in
          probe.

v1: https://lore.kernel.org/linux-gpio/20260610153329.937833-2-v@baodeep.com/
v2: https://lore.kernel.org/linux-gpio/20260625115718.1678991-2-v@baodeep.com/

 drivers/gpio/gpio-shared-proxy.c | 76 ++++++++++++--------------------
 drivers/gpio/gpiolib-shared.c    |  9 +---
 drivers/gpio/gpiolib-shared.h    | 28 +-----------
 3 files changed, 32 insertions(+), 81 deletions(-)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index 6941e4be6cf1..10ca2ef77ef3 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -9,8 +9,10 @@
 #include <linux/err.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
+#include <linux/lockdep.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/string_choices.h>
 #include <linux/types.h>
 
@@ -24,15 +26,13 @@ struct gpio_shared_proxy_data {
 };
 
 static int
-gpio_shared_proxy_set_unlocked(struct gpio_shared_proxy_data *proxy,
-			       int (*set_func)(struct gpio_desc *desc, int value),
-			       int value)
+gpio_shared_proxy_set_unlocked(struct gpio_shared_proxy_data *proxy, int value)
 {
 	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
 	struct gpio_desc *desc = shared_desc->desc;
 	int ret = 0;
 
-	gpio_shared_lockdep_assert(shared_desc);
+	lockdep_assert_held(&shared_desc->mutex);
 
 	if (value) {
 	       /* User wants to set value to high. */
@@ -46,7 +46,7 @@ gpio_shared_proxy_set_unlocked(struct gpio_shared_proxy_data *proxy,
 			 * Current value is low, need to actually set value
 			 * to high.
 			 */
-			ret = set_func(desc, 1);
+			ret = gpiod_set_value_cansleep(desc, 1);
 			if (ret)
 				goto out;
 		}
@@ -65,7 +65,7 @@ gpio_shared_proxy_set_unlocked(struct gpio_shared_proxy_data *proxy,
 	/* We previously voted for high. */
 	if (shared_desc->highcnt == 1) {
 		/* This is the last remaining vote for high, set value  to low. */
-		ret = set_func(desc, 0);
+		ret = gpiod_set_value_cansleep(desc, 0);
 		if (ret)
 			goto out;
 	}
@@ -89,7 +89,7 @@ static int gpio_shared_proxy_request(struct gpio_chip *gc, unsigned int offset)
 	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
 	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
 
-	guard(gpio_shared_desc_lock)(shared_desc);
+	guard(mutex)(&shared_desc->mutex);
 
 	proxy->shared_desc->usecnt++;
 
@@ -105,11 +105,10 @@ static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
 	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
 	int ret;
 
-	guard(gpio_shared_desc_lock)(shared_desc);
+	guard(mutex)(&shared_desc->mutex);
 
 	if (proxy->voted_high) {
-		ret = gpio_shared_proxy_set_unlocked(proxy,
-			shared_desc->can_sleep ? gpiod_set_value_cansleep : gpiod_set_value, 0);
+		ret = gpio_shared_proxy_set_unlocked(proxy, 0);
 		if (ret)
 			dev_err(proxy->dev,
 				"Failed to unset the shared GPIO value on release: %d\n", ret);
@@ -129,7 +128,7 @@ static int gpio_shared_proxy_set_config(struct gpio_chip *gc,
 	struct gpio_desc *desc = shared_desc->desc;
 	int ret;
 
-	guard(gpio_shared_desc_lock)(shared_desc);
+	guard(mutex)(&shared_desc->mutex);
 
 	if (shared_desc->usecnt > 1) {
 		if (shared_desc->cfg != cfg) {
@@ -157,7 +156,7 @@ static int gpio_shared_proxy_direction_input(struct gpio_chip *gc,
 	struct gpio_desc *desc = shared_desc->desc;
 	int dir;
 
-	guard(gpio_shared_desc_lock)(shared_desc);
+	guard(mutex)(&shared_desc->mutex);
 
 	if (shared_desc->usecnt == 1) {
 		dev_dbg(proxy->dev,
@@ -187,7 +186,7 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
 	struct gpio_desc *desc = shared_desc->desc;
 	int ret, dir;
 
-	guard(gpio_shared_desc_lock)(shared_desc);
+	guard(mutex)(&shared_desc->mutex);
 
 	if (shared_desc->usecnt == 1) {
 		dev_dbg(proxy->dev,
@@ -219,14 +218,7 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
 		return -EPERM;
 	}
 
-	return gpio_shared_proxy_set_unlocked(proxy, gpiod_direction_output, value);
-}
-
-static int gpio_shared_proxy_get(struct gpio_chip *gc, unsigned int offset)
-{
-	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
-
-	return gpiod_get_value(proxy->shared_desc->desc);
+	return gpio_shared_proxy_set_unlocked(proxy, value);
 }
 
 static int gpio_shared_proxy_get_cansleep(struct gpio_chip *gc,
@@ -237,29 +229,14 @@ static int gpio_shared_proxy_get_cansleep(struct gpio_chip *gc,
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
+	guard(mutex)(&proxy->shared_desc->mutex);
+
+	return gpio_shared_proxy_set_unlocked(proxy, value);
 }
 
 static int gpio_shared_proxy_get_direction(struct gpio_chip *gc,
@@ -302,20 +279,25 @@ static int gpio_shared_proxy_probe(struct auxiliary_device *adev,
 	gc->label = dev_name(dev);
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
-	gc->can_sleep = shared_desc->can_sleep;
+	/*
+	 * Under the descriptor mutex the proxy may call
+	 * gpiod_set_config()/gpiod_direction_*(), which can reach pinctrl
+	 * paths that take a mutex (e.g. gpiod_set_config() ->
+	 * gpiochip_generic_config() -> pinctrl_gpio_set_config()), independent
+	 * of the underlying chip's can_sleep. So the descriptor lock must be a
+	 * mutex and the proxy gpiochip is therefore always sleeping; drive the
+	 * underlying GPIO through the cansleep value accessors, which are valid
+	 * for both sleeping and non-sleeping chips.
+	 */
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
index 15e72a8dcdb1..bbdc0ab7b647 100644
--- a/drivers/gpio/gpiolib-shared.h
+++ b/drivers/gpio/gpiolib-shared.h
@@ -3,10 +3,7 @@
 #ifndef __LINUX_GPIO_SHARED_H
 #define __LINUX_GPIO_SHARED_H
 
-#include <linux/cleanup.h>
-#include <linux/lockdep.h>
 #include <linux/mutex.h>
-#include <linux/spinlock.h>
 
 struct gpio_device;
 struct gpio_desc;
@@ -42,35 +39,12 @@ static inline int gpio_shared_add_proxy_lookup(struct device *consumer,
 
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
 
-DEFINE_LOCK_GUARD_1(gpio_shared_desc_lock, struct gpio_shared_desc,
-	if (_T->lock->can_sleep)
-		mutex_lock(&_T->lock->mutex);
-	else
-		spin_lock_irqsave(&_T->lock->spinlock, _T->flags),
-	if (_T->lock->can_sleep)
-		mutex_unlock(&_T->lock->mutex);
-	else
-		spin_unlock_irqrestore(&_T->lock->spinlock, _T->flags),
-	unsigned long flags)
-
-static inline void gpio_shared_lockdep_assert(struct gpio_shared_desc *shared_desc)
-{
-	if (shared_desc->can_sleep)
-		lockdep_assert_held(&shared_desc->mutex);
-	else
-		lockdep_assert_held(&shared_desc->spinlock);
-}
-
 #endif /* __LINUX_GPIO_SHARED_H */
-- 
2.54.0


