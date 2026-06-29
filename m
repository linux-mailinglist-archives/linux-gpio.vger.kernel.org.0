Return-Path: <linux-gpio+bounces-39120-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MUqZJa9wQmok7QkAu9opvQ
	(envelope-from <linux-gpio+bounces-39120-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 15:18:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E386DB081
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 15:18:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="LS/c9daU";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39120-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39120-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F42D3106FFB
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 13:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB30140B362;
	Mon, 29 Jun 2026 13:04:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A0240911B;
	Mon, 29 Jun 2026 13:04:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782738247; cv=none; b=tqClfEfdy/nnnAKA8UPXw64GagJ339FIQcqOdg5zvywx9vIsarRtGr0SsKIdJdwk6x15FQ0WzJhpSRGRsIZb/HQp6SYUwS8liLFKrVrWcjuDJQOeYIbH72BP1pkt1tSkjBqT5qYSwTi3+nHzM0XhzF4xwd9DzeqZSkjCVwb9YM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782738247; c=relaxed/simple;
	bh=PFriDrYeOyJDtou/y6i0P7cylBJFQZABLsv14zoI4UY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kbib5PtlTFJwTozD1+YKyqpluMlDZJkrrv8PzooQkosifDM68Y3sq0gkjHMCYlSYRaThc1xSywk47lQ9HygF7Vu6fCfTfiv0VlOJq9wJ7CAUoEdpgVn4B/BPqYWYtrC1ov1+HfckTH+nyXCbPO6V/49kAlJBOoxjja9bR+iS/FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LS/c9daU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 279E01F000E9;
	Mon, 29 Jun 2026 13:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782738246;
	bh=GmbBa7jjhWZYfbqz5RI0FkBj5BAeNVfqnCIFm5jnIAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LS/c9daUTeJ0EdHOb/bfDnnuRDNHQ/HdICYnus30/55xQJqEkjRx/2nMf2JxjLgaT
	 VSB8bsR2PyJdGkHsxUtOSq/PWg6EMnuki0yd0E1GiGJkWZCMr0ey2u5kv4hb/htKzm
	 OLzwQIxWVWicsD1VF2tt6lOzp1CWb5UAaOpFrINOng7K4rFqOybusgZUzj1f2h8op6
	 jpd7z3JhsNsXSAWVEKIWvub7RfHG+v6XPx212V8BMldIu+p6CfKwYQRsy/UCXvhG0g
	 y3fVCsjwf6/HUU2eZa434xoZBwygxByDfEty0jY6geZ1jNNak8E8dfJDiO1NpLhuLV
	 7HXwIyHMuGmvg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 5/6] [v5] leds: gpio: make legacy gpiolib interface optional
Date: Mon, 29 Jun 2026 15:03:28 +0200
Message-Id: <20260629130329.1291953-6-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260629130329.1291953-1-arnd@kernel.org>
References: <20260629130329.1291953-1-arnd@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39120-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:arnd@arndb.de,m:glaubitz@physik.fu-berlin.de,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linusw@kernel.org,m:brgl@kernel.org,m:dmitry.torokhov@gmail.com,m:lee@kernel.org,m:pavel@kernel.org,m:linux-sh@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:andriy.shevchenko@linux.intel.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
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
	FREEMAIL_CC(0.00)[arndb.de,physik.fu-berlin.de,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,gmail.com,vger.kernel.org,oss.qualcomm.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 03E386DB081

From: Arnd Bergmann <arnd@arndb.de>

There are still a handful of ancient mips/armv5/sh boards that use the
gpio_led:gpio member to pass an old-style gpio number, but all modern
users have been converted to gpio descriptors.

While the CONFIG_GPIOLIB_LEGACY option that guards devm_gpio_request_one()
and related helpers is currently turned on in all kernel builds,
the plan is to only enable it on the few platforms that actually
pass gpio numbers in any platform_data.

Split out the legacy portion of the platform_data handling into a custom
helper function that is guarded with in #ifdef block, to allow the
the leds-gpio driver to compile cleanly when CONFIG_GPIOLIB_LEGACY
gets turned off. Once the last user is converted, this function can
be removed.

Link: https://lore.kernel.org/all/e9252384-a55c-4a91-9c61-06e05a0b2ce4@app.fastmail.com/
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v5: no changes
v4: whitespace changes only
v3: simplify gpio_led_get_gpiod
v2: rework a little bit to keep the legacy code path more separate,
    extend changelog description
---
 drivers/leds/leds-gpio.c | 53 ++++++++++++++++++++++++++--------------
 include/linux/leds.h     |  2 ++
 2 files changed, 37 insertions(+), 18 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index a3428b22de3a..740772c2504a 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -9,8 +9,8 @@
 #include <linux/container_of.h>
 #include <linux/device.h>
 #include <linux/err.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
+#include <linux/gpio/legacy.h>
 #include <linux/leds.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -212,7 +212,6 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
 					    const struct gpio_led *template)
 {
 	struct gpio_desc *gpiod;
-	int ret;
 
 	/*
 	 * This means the LED does not come from the device tree
@@ -221,18 +220,30 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
 	 * the GPIO from there.
 	 */
 	gpiod = devm_gpiod_get_index_optional(dev, NULL, idx, GPIOD_OUT_LOW);
-	if (IS_ERR(gpiod))
-		return gpiod;
-	if (gpiod) {
+	if (!IS_ERR(gpiod))
 		gpiod_set_consumer_name(gpiod, template->name);
-		return gpiod;
-	}
 
-	/*
-	 * This is the legacy code path for platform code that
-	 * still uses GPIO numbers. Ultimately we would like to get
-	 * rid of this block completely.
-	 */
+	return gpiod;
+}
+
+#ifdef CONFIG_GPIOLIB_LEGACY
+/*
+ * This is the legacy code path for platform code that still uses
+ * GPIO numbers, mainly MIPS and SuperH board files.
+ * Ultimately we would like to get rid of this block completely.
+ *
+ * ppc44x-warp sets the template->gpiod directly instead of
+ * adding a lookup table or device properties. This is not
+ * much better.
+ */
+static struct gpio_desc *gpio_led_get_legacy_gpiod(struct device *dev, int idx,
+						   const struct gpio_led *template)
+{
+	struct gpio_desc *gpiod;
+	int ret;
+
+	if (template->gpiod)
+		return template->gpiod;
 
 	/* skip leds that aren't available */
 	if (!gpio_is_valid(template->gpio))
@@ -252,6 +263,13 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
 
 	return gpiod;
 }
+#else
+static struct gpio_desc *gpio_led_get_legacy_gpiod(struct device *dev, int idx,
+						   const struct gpio_led *template)
+{
+	return template->gpiod ?: ERR_PTR(-ENOENT);
+}
+#endif
 
 static int gpio_led_probe(struct platform_device *pdev)
 {
@@ -270,14 +288,13 @@ static int gpio_led_probe(struct platform_device *pdev)
 			const struct gpio_led *template = &pdata->leds[i];
 			struct gpio_led_data *led_dat = &priv->leds[i];
 
-			if (template->gpiod)
-				led_dat->gpiod = template->gpiod;
-			else
+			led_dat->gpiod = gpio_led_get_gpiod(dev, i, template);
+			if (!led_dat->gpiod)
 				led_dat->gpiod =
-					gpio_led_get_gpiod(dev, i, template);
+					 gpio_led_get_legacy_gpiod(dev, i, template);
 			if (IS_ERR(led_dat->gpiod)) {
-				dev_info(dev, "Skipping unavailable LED gpio %d (%s)\n",
-					 template->gpio, template->name);
+				dev_info(dev, "Skipping unavailable LED gpio %s\n",
+					 template->name);
 				continue;
 			}
 
diff --git a/include/linux/leds.h b/include/linux/leds.h
index b16b803cc1ac..e646bffcd8e7 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -676,8 +676,10 @@ typedef int (*gpio_blink_set_t)(struct gpio_desc *desc, int state,
 struct gpio_led {
 	const char *name;
 	const char *default_trigger;
+#ifdef CONFIG_GPIOLIB_LEGACY
 	unsigned 	gpio;
 	unsigned	active_low : 1;
+#endif
 	unsigned	retain_state_suspended : 1;
 	unsigned	panic_indicator : 1;
 	unsigned	default_state : 2;
-- 
2.39.5


