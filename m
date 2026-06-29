Return-Path: <linux-gpio+bounces-39137-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GWEnNCR+QmoK8gkAu9opvQ
	(envelope-from <linux-gpio+bounces-39137-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 16:16:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C406DBE0D
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 16:16:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="nVcV/4lE";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39137-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39137-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A93A5308F4A6
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 13:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E735342C8B;
	Mon, 29 Jun 2026 13:59:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEEF3375CB;
	Mon, 29 Jun 2026 13:59:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782741567; cv=none; b=rsBTK9WbBr1RDueKy2mglWDL0nB5PzlbNKOfzsIQbwo7CyNyqfUhUuKDoDFL3myPxgFRmQFE1V6zrX7zkOcDKHJimbw4s0twp/pHhfsOYGyegrmf1UK2RIbDfvrUv1DRPVczlihFML7VoLpWKuC8q5/sjJL2ed7qRewWPASl2lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782741567; c=relaxed/simple;
	bh=0YUP5HSsJgms6RhFgUKwnmGCSeiEWuYjGjkcx1UPVAk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QNLMFhBZQHjwk4ig6YReU2+osw3CGeYJJNJAWCAusQiJbRkvaahol1xOp8G/y/meB7qNpCXYyz8SOGn3TBMUTGGuG7QjdCzMPNoGmT+XA6ieZMbLt7/uzmGoQpxjnMUELZt6ks2dbKt+iGFUp+3nLqoujQcYSa/CAy5NVpwXbGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVcV/4lE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7251F000E9;
	Mon, 29 Jun 2026 13:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782741565;
	bh=Eq0NlXkjV03GwRAcmSojFAfHDnE7PE65aXZcNBP60RU=;
	h=From:To:Cc:Subject:Date;
	b=nVcV/4lE/+/zThby5E7p+CgsX8N5YIFl3t8FAo/ngKPcdYMJ7xveXMEe3+cOIzk7a
	 DqqzDz8NpKzQpQMa/wOH8bABrUJPbK3mKuPuoIULOGpLl+DUauNaJU9QnfFdcK/tSt
	 09a824uPHoizghh6nfGxssxORHSIgsMRmCCdW14u9i8gXa/FgMoqBFx34ckZ1mJqJN
	 5q88vgvuWpqo/5SY7v2DEnI44FSTzYQtbgKVKVNqhrD1jLIJvR8ILA2XzFEAwrPDJG
	 iH0ZSAOv0e6hJYPhXqrW7HIjshPw2GztB/ppvYSKE/SpaB05MXtelriIdVa77LmmMz
	 hGd2c/VKh0R9Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Marcel Holtmann <marcel@holtmann.org>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] [RFC] gpiolib: introduce gpio_name() helper
Date: Mon, 29 Jun 2026 15:56:29 +0200
Message-Id: <20260629135917.1308621-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39137-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:marcel@holtmann.org,m:myungjoo.ham@samsung.com,m:cw00.choi@samsung.com,m:geert+renesas@glider.be,m:andy@kernel.org,m:dmitry.torokhov@gmail.com,m:ulfh@kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-i2c@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-pm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:geert@glider.be,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[arnd@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,holtmann.org,samsung.com,glider.be,kernel.org,gmail.com,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4C406DBE0D

From: Arnd Bergmann <arnd@arndb.de>

Most remaining users of desc_to_gpio() only call it for printing debug
information.

Replace this with a new gpiod_name() helper that returns the
gpio_desc->name string after checking the gpio_desc pointer.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---

Not sure if this the way we want to take this, or if the gpio name is
an appropriate replacement in debug printk.

Since most of the callers of desc_to_gpio() and gpio_to_desc() are
otherwise in drivers that already depend on CONFIG_GPIOLIB_LEGACY and
include linux/gpio/legacy.h, only a handful of instances remain that
are otherwise in files that otherwise only use the descriptor interfaces:

arch/arm/mach-pxa/pxa27x.c:	reset_gpio = desc_to_gpio(gpiod);
arch/arm/plat-orion/gpio.c:	unsigned gpio = desc_to_gpio(desc);
drivers/gpio/gpio-nomadik.c:		mode = nmk_prcm_gpiocr_get_mode(pctldev, desc_to_gpio(desc));
drivers/gpio/gpiolib-acpi-core.c:			desc = gpio_to_desc(agpio->pin_table[pin_index]);
drivers/gpio/gpiolib-cdev.c:	hte_init_line_attr(hdesc, desc_to_gpio(line->desc), flags, NULL,
drivers/gpio/gpiolib-sysfs.c:	desc = gpio_to_desc(gpio);
drivers/gpio/gpiolib-sysfs.c:						   desc_to_gpio(desc));
drivers/gpio/gpiolib.c:	trace_gpio_direction(desc_to_gpio(desc), 1, ret);
drivers/input/misc/soc_button_array.c:	*gpio_ret = desc_to_gpio(desc);
drivers/pinctrl/core.c:			gdev = gpiod_to_gpio_device(gpio_to_desc(gpio_num));
drivers/platform/x86/x86-android-tablets/core.c: * 2. Calling desc_to_gpio() to get an old style GPIO number for gpio-keys
drivers/soc/fsl/qe/gpio.c:	gpio_num = desc_to_gpio(gpiod);
---
 drivers/bluetooth/hci_intel.c             |  4 ++--
 drivers/extcon/extcon-rtk-type-c.c        |  4 ++--
 drivers/gpio/gpio-aggregator.c            |  4 ++--
 drivers/gpio/gpiolib.c                    | 13 +++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.c |  6 +++---
 drivers/i2c/busses/i2c-gpio.c             |  4 ++--
 drivers/iio/accel/mma9551.c               |  4 ++--
 drivers/iio/humidity/dht11.c              |  2 +-
 drivers/input/touchscreen/edt-ft5x06.c    |  6 +++---
 drivers/input/touchscreen/hycon-hy46xx.c  |  5 ++---
 drivers/mmc/host/atmel-mci.c              |  8 ++++----
 drivers/power/supply/bq24257_charger.c    |  2 +-
 drivers/usb/gadget/udc/at91_udc.c         |  4 ++--
 include/linux/gpio/consumer.h             |  8 ++++++++
 14 files changed, 47 insertions(+), 27 deletions(-)

diff --git a/drivers/bluetooth/hci_intel.c b/drivers/bluetooth/hci_intel.c
index c31105b91e47..2e6ebc152bcb 100644
--- a/drivers/bluetooth/hci_intel.c
+++ b/drivers/bluetooth/hci_intel.c
@@ -1176,8 +1176,8 @@ static int intel_probe(struct platform_device *pdev)
 	list_add_tail(&idev->list, &intel_device_list);
 	mutex_unlock(&intel_device_list_lock);
 
-	dev_info(&pdev->dev, "registered, gpio(%d)/irq(%d).\n",
-		 desc_to_gpio(idev->reset), idev->irq);
+	dev_info(&pdev->dev, "registered, gpio(%s)/irq(%d).\n",
+		 gpiod_name(idev->reset), idev->irq);
 
 	return 0;
 }
diff --git a/drivers/extcon/extcon-rtk-type-c.c b/drivers/extcon/extcon-rtk-type-c.c
index 82b60b927e41..fb57e9d7ddb6 100644
--- a/drivers/extcon/extcon-rtk-type-c.c
+++ b/drivers/extcon/extcon-rtk-type-c.c
@@ -1356,8 +1356,8 @@ static int extcon_rtk_type_c_probe(struct platform_device *pdev)
 				(int)PTR_ERR(gpio));
 		} else {
 			type_c->rd_ctrl_gpio_desc = gpio;
-			dev_dbg(dev, "%s get rd-ctrl-gpios (id=%d) OK\n",
-				__func__, desc_to_gpio(gpio));
+			dev_dbg(dev, "%s get rd-ctrl-gpios (id=%s) OK\n",
+				__func__, gpiod_name(gpio));
 		}
 	}
 
diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index bc6699a821ee..27df680fbdbb 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -758,8 +758,8 @@ int gpiochip_fwd_desc_add(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
 
 	fwd->descs[offset] = desc;
 
-	dev_dbg(chip->parent, "%u => gpio %d irq %d\n", offset,
-		desc_to_gpio(desc), gpiod_to_irq(desc));
+	dev_dbg(chip->parent, "%u => gpio %s irq %d\n", offset,
+		gpiod_name(desc), gpiod_to_irq(desc));
 
 	return 0;
 }
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1f498d6c8c68..00de24db74a5 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4122,6 +4122,19 @@ int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name)
 }
 EXPORT_SYMBOL_GPL(gpiod_set_consumer_name);
 
+/**
+ * gpiod_name() - get a name to print for a gpio descriptor
+ * @desc: gpio or NULL pointer to query
+ *
+ * Returns:
+ * The desc->name field or a dummy string for unknown GPIOs.
+ */
+const char *gpiod_name(const struct gpio_desc *desc)
+{
+	return desc ? desc->name : "(no gpio)";
+}
+EXPORT_SYMBOL_GPL(gpiod_name);
+
 /**
  * gpiod_is_shared() - check if this GPIO can be shared by multiple consumers
  * @desc: GPIO to inspect
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index fffcd6154c71..5dce097d4045 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1448,9 +1448,9 @@ static void anx7625_init_gpio(struct anx7625_data *platform)
 
 	if (platform->pdata.gpio_p_on && platform->pdata.gpio_reset) {
 		platform->pdata.low_power_mode = 1;
-		DRM_DEV_DEBUG_DRIVER(dev, "low power mode, pon %d, reset %d.\n",
-				     desc_to_gpio(platform->pdata.gpio_p_on),
-				     desc_to_gpio(platform->pdata.gpio_reset));
+		DRM_DEV_DEBUG_DRIVER(dev, "low power mode, pon %s, reset %s.\n",
+				     gpiod_name(platform->pdata.gpio_p_on),
+				     gpiod_name(platform->pdata.gpio_reset));
 	} else {
 		platform->pdata.low_power_mode = 0;
 		DRM_DEV_DEBUG_DRIVER(dev, "not low power mode.\n");
diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index f4355b17bfbf..4c320a833d9e 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -440,8 +440,8 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 	 * get accessors to get the actual name of the GPIO line,
 	 * from the descriptor, then provide that instead.
 	 */
-	dev_info(dev, "using lines %u (SDA) and %u (SCL%s)\n",
-		 desc_to_gpio(priv->sda), desc_to_gpio(priv->scl),
+	dev_info(dev, "using lines %s (SDA) and %s (SCL%s)\n",
+		 gpiod_name(priv->sda), gpiod_name(priv->scl),
 		 pdata->scl_is_output_only
 		 ? ", no clock stretching" : "");
 
diff --git a/drivers/iio/accel/mma9551.c b/drivers/iio/accel/mma9551.c
index 020370b0ec07..b9d1fc3caf83 100644
--- a/drivers/iio/accel/mma9551.c
+++ b/drivers/iio/accel/mma9551.c
@@ -426,8 +426,8 @@ static int mma9551_gpio_probe(struct iio_dev *indio_dev)
 			return ret;
 		}
 
-		dev_dbg(dev, "gpio resource, no:%d irq:%d\n",
-			desc_to_gpio(gpio), data->irqs[i]);
+		dev_dbg(dev, "gpio resource, no:%s irq:%d\n",
+			gpiod_name(gpio), data->irqs[i]);
 	}
 
 	return 0;
diff --git a/drivers/iio/humidity/dht11.c b/drivers/iio/humidity/dht11.c
index 980cb946bbf7..ca6b8c53e462 100644
--- a/drivers/iio/humidity/dht11.c
+++ b/drivers/iio/humidity/dht11.c
@@ -305,7 +305,7 @@ static int dht11_probe(struct platform_device *pdev)
 
 	dht11->irq = gpiod_to_irq(dht11->gpiod);
 	if (dht11->irq < 0) {
-		dev_err(dev, "GPIO %d has no interrupt\n", desc_to_gpio(dht11->gpiod));
+		dev_err(dev, "GPIO %s has no interrupt\n", gpiod_name(dht11->gpiod));
 		return -EINVAL;
 	}
 
diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index d3b1177185a3..2d31c77614b0 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -1326,10 +1326,10 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client)
 	edt_ft5x06_ts_prepare_debugfs(tsdata);
 
 	dev_dbg(&client->dev,
-		"EDT FT5x06 initialized: IRQ %d, WAKE pin %d, Reset pin %d.\n",
+		"EDT FT5x06 initialized: IRQ %d, WAKE pin %s, Reset pin %s.\n",
 		client->irq,
-		tsdata->wake_gpio ? desc_to_gpio(tsdata->wake_gpio) : -1,
-		tsdata->reset_gpio ? desc_to_gpio(tsdata->reset_gpio) : -1);
+		gpiod_name(tsdata->wake_gpio),
+		gpiod_name(tsdata->reset_gpio));
 
 	return 0;
 }
diff --git a/drivers/input/touchscreen/hycon-hy46xx.c b/drivers/input/touchscreen/hycon-hy46xx.c
index 1513f20cbf51..797667c5dd99 100644
--- a/drivers/input/touchscreen/hycon-hy46xx.c
+++ b/drivers/input/touchscreen/hycon-hy46xx.c
@@ -528,9 +528,8 @@ static int hycon_hy46xx_probe(struct i2c_client *client)
 		return error;
 
 	dev_dbg(&client->dev,
-		"HYCON HY46XX initialized: IRQ %d, Reset pin %d.\n",
-		client->irq,
-		tsdata->reset_gpio ? desc_to_gpio(tsdata->reset_gpio) : -1);
+		"HYCON HY46XX initialized: IRQ %d, Reset pin %s.\n",
+		client->irq, gpiod_name(tsdata->reset_gpio));
 
 	return 0;
 }
diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
index 3b4928f5b9b2..b21820564315 100644
--- a/drivers/mmc/host/atmel-mci.c
+++ b/drivers/mmc/host/atmel-mci.c
@@ -2255,11 +2255,11 @@ static int atmci_init_slot(struct atmel_mci *host,
 	slot->sdio_irq = sdio_irq;
 
 	dev_dbg(&mmc->class_dev,
-	        "slot[%u]: bus_width=%u, detect_pin=%d, "
-		"detect_is_active_high=%s, wp_pin=%d\n",
-		id, slot_data->bus_width, desc_to_gpio(slot_data->detect_pin),
+	        "slot[%u]: bus_width=%u, detect_pin=%s, "
+		"detect_is_active_high=%s, wp_pin=%s\n",
+		id, slot_data->bus_width, gpiod_name(slot_data->detect_pin),
 		str_true_false(!gpiod_is_active_low(slot_data->detect_pin)),
-		desc_to_gpio(slot_data->wp_pin));
+		gpiod_name(slot_data->wp_pin));
 
 	mmc->ops = &atmci_ops;
 	mmc->f_min = DIV_ROUND_UP(host->bus_hz, 512);
diff --git a/drivers/power/supply/bq24257_charger.c b/drivers/power/supply/bq24257_charger.c
index 72f1bfea8d54..b756bab74eec 100644
--- a/drivers/power/supply/bq24257_charger.c
+++ b/drivers/power/supply/bq24257_charger.c
@@ -868,7 +868,7 @@ static void bq24257_pg_gpio_probe(struct bq24257_device *bq)
 	}
 
 	if (bq->pg)
-		dev_dbg(bq->dev, "probed PG pin = %d\n", desc_to_gpio(bq->pg));
+		dev_dbg(bq->dev, "probed PG pin = %s\n", gpiod_name(bq->pg));
 }
 
 static int bq24257_fw_probe(struct bq24257_device *bq)
diff --git a/drivers/usb/gadget/udc/at91_udc.c b/drivers/usb/gadget/udc/at91_udc.c
index 5aa360ba4f03..099313604387 100644
--- a/drivers/usb/gadget/udc/at91_udc.c
+++ b/drivers/usb/gadget/udc/at91_udc.c
@@ -1896,8 +1896,8 @@ static int at91udc_probe(struct platform_device *pdev)
 					gpiod_to_irq(udc->board.vbus_pin),
 					at91_vbus_irq, 0, driver_name, udc);
 			if (retval) {
-				DBG("request vbus irq %d failed\n",
-				    desc_to_gpio(udc->board.vbus_pin));
+				DBG("request vbus irq %s failed\n",
+				    gpiod_name(udc->board.vbus_pin));
 				goto err_unprepare_iclk;
 			}
 		}
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index fceeefd5f893..9c91fae62f8c 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -172,6 +172,8 @@ int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name);
 
 bool gpiod_is_shared(const struct gpio_desc *desc);
 
+const char *gpiod_name(const struct gpio_desc *desc);
+
 /* Convert between the old gpio_ and new gpiod_ interfaces */
 struct gpio_desc *gpio_to_desc(unsigned gpio);
 int desc_to_gpio(const struct gpio_desc *desc);
@@ -538,6 +540,12 @@ static inline bool gpiod_is_shared(const struct gpio_desc *desc)
 	return false;
 }
 
+static inline const char *gpiod_name(const struct gpio_desc *desc)
+{
+	WARN_ON(desc);
+	return "(no gpio)";
+}
+
 static inline struct gpio_desc *gpio_to_desc(unsigned gpio)
 {
 	return NULL;
-- 
2.39.5


