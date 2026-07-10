Return-Path: <linux-gpio+bounces-39862-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Wz0AD7piUWqhDgMAu9opvQ
	(envelope-from <linux-gpio+bounces-39862-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 23:23:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B8D73EC9C
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 23:23:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ObhtfZcz;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39862-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39862-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBD2C3064E33
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 21:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC283B6348;
	Fri, 10 Jul 2026 21:19:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2003B4EAA;
	Fri, 10 Jul 2026 21:19:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718352; cv=none; b=th3y5KvPa+d6rJyCGZ5QG0fkOmIIjFHu3awcbzgSbKnBGVzpZ2m0eIDSzLvR+kfBf7ISuYBTVjCdKz8p1g7N+NvFdzOj3bWsqjeMfAGgNv3s4UdhNzQ0WSnQuoNvwIazmLspHkdSL0uQaS2yV0gww4TxwYqHk5HSWQ1QIz9GEIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718352; c=relaxed/simple;
	bh=9t2rX193IBbII/SkD1sZ6b1S6Kg5U6adn3TSbDt1o7o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S5vtrW372scmJl2Ih8qMXksPXVFCicKpL7YyHV3JDDIL6Ppf6odKRXT9/iZYBbwqeWqhzadnlJ1XuC+mtjXACUz0JMSbsXWt/JeJf4otPwQxbMO8a9V6wfcKPzFX5F2NNtwrgz6GzY1QgW1cScFlWIQKu+6H4wah71dZ5RUrr/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObhtfZcz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 985741F000E9;
	Fri, 10 Jul 2026 21:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783718351;
	bh=m5zCJ35nUw+Ql++3UWFF1hzVFzNhspySX+1bZiFa+dY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ObhtfZczMIqCiXI1u6WScaZcB7ywyXfILXUucikWo1uU0jIvHpbgDEfWUiE9YSK4u
	 hGrMxq5NYybGhaUet239t7i+Es3h1bIHOTzyUu9WDdQFzVxuNcmUH7ve6LbWMkE2FP
	 ZMwYyLud22CSnD+Bfg93ZtuVE65MJ/6z+0wG+l80Bpa44jGBYUeANUel3Ac0XjvGAw
	 +iLdLbTwkuut1DYAp9qCLjTbYntAomrhHXHO4syecua4jhSHE1CSZOowHubJzAHhBD
	 3aHmBG+oAba4QOVRFIlGuQO9iSGHc7hq8oUQvCuLxqn8lZEJxV+Z6BRrtnk3yOOEl8
	 anxIZsmEY6qBw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-gpio@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 2/6] [v6] Input: gpio-keys: make legacy gpiolib optional
Date: Fri, 10 Jul 2026 23:18:50 +0200
Message-Id: <20260710211854.1371746-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260710211854.1371746-1-arnd@kernel.org>
References: <20260710211854.1371746-1-arnd@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39862-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:glaubitz@physik.fu-berlin.de,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:dmitry.torokhov@gmail.com,m:lee@kernel.org,m:pavel@kernel.org,m:linux-sh@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arndb.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1B8D73EC9C

From: Arnd Bergmann <arnd@arndb.de>

Most users of gpio-keys and gpio-keys-polled use modern gpiolib
interfaces, but there are still number of ancient sh, arm32 and x86
machines that have never been converted.

Add an #ifdef block for the parts of the driver that are only used on
those legacy machines.

The two Rohm PMIC drivers use a gpio-keys device without an actual GPIO,
passing an IRQ number instead. In order to keep this working both with
and with CONFIG_GPIOLIB_LEGACY, change the gpio-keys driver to ignore
the gpio number if an IRQ is passed.

Link: https://lore.kernel.org/all/b3c94552-c104-42e3-be15-7e8362e8039e@gmail.com/
Link: https://lore.kernel.org/all/afJXG4_rtaj3l2Dk@google.com/
Link: https://lore.kernel.org/all/ajQ-CtU131FAJ9ES@google.com/
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> # for input
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v3..v5: resend
    v2: skip the fake GPIO number passing from mfd

This patch now has a small conflict with the rework of the rohm drivers
to use software nodes. That patch is the one we want, and then
the drivers/mfd changes here can get dropped, but the two need to
get merged in the correct order.
---
 drivers/input/keyboard/gpio_keys.c        | 9 +++++----
 drivers/input/keyboard/gpio_keys_polled.c | 4 +++-
 drivers/mfd/rohm-bd71828.c                | 1 -
 drivers/mfd/rohm-bd718x7.c                | 1 -
 include/linux/gpio_keys.h                 | 2 ++
 5 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index e19617485679..e988657f97cb 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -23,8 +23,8 @@
 #include <linux/input.h>
 #include <linux/gpio_keys.h>
 #include <linux/workqueue.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
+#include <linux/gpio/legacy.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/spinlock.h>
@@ -528,7 +528,8 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 			 */
 			bdata->gpiod = NULL;
 		}
-	} else if (gpio_is_valid(button->gpio)) {
+#ifdef CONFIG_GPIOLIB_LEGACY
+	} else if (!button->irq && gpio_is_valid(button->gpio)) {
 		/*
 		 * Legacy GPIO number, so request the GPIO here and
 		 * convert it to descriptor.
@@ -546,6 +547,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 
 		if (button->active_low ^ gpiod_is_active_low(bdata->gpiod))
 			gpiod_toggle_active_low(bdata->gpiod);
+#endif
 	}
 
 	if (bdata->gpiod) {
@@ -583,8 +585,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 			if (irq < 0) {
 				error = irq;
 				dev_err_probe(dev, error,
-					      "Unable to get irq number for GPIO %d\n",
-					      button->gpio);
+					      "Unable to get irq number for GPIO\n");
 				return error;
 			}
 			bdata->irq = irq;
diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
index e6707d72210e..4e7a366ff05b 100644
--- a/drivers/input/keyboard/gpio_keys_polled.c
+++ b/drivers/input/keyboard/gpio_keys_polled.c
@@ -18,8 +18,8 @@
 #include <linux/input.h>
 #include <linux/ioport.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
+#include <linux/gpio/legacy.h>
 #include <linux/gpio_keys.h>
 #include <linux/property.h>
 
@@ -301,6 +301,7 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 				return dev_err_probe(dev, PTR_ERR(bdata->gpiod),
 						     "failed to get gpio\n");
 			}
+#ifdef CONFIG_GPIOLIB_LEGACY
 		} else if (gpio_is_valid(button->gpio)) {
 			/*
 			 * Legacy GPIO number so request the GPIO here and
@@ -323,6 +324,7 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 
 			if (button->active_low ^ gpiod_is_active_low(bdata->gpiod))
 				gpiod_toggle_active_low(bdata->gpiod);
+#endif
 		}
 
 		bdata->last_state = -1;
diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
index a79f354bf5cb..df6dad762ec9 100644
--- a/drivers/mfd/rohm-bd71828.c
+++ b/drivers/mfd/rohm-bd71828.c
@@ -39,7 +39,6 @@
 
 static struct gpio_keys_button button = {
 	.code = KEY_POWER,
-	.gpio = -1,
 	.type = EV_KEY,
 	.wakeup = 1,
 };
diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
index ff714fd4f54d..dd774aa8828b 100644
--- a/drivers/mfd/rohm-bd718x7.c
+++ b/drivers/mfd/rohm-bd718x7.c
@@ -20,7 +20,6 @@
 
 static struct gpio_keys_button button = {
 	.code = KEY_POWER,
-	.gpio = -1,
 	.type = EV_KEY,
 };
 
diff --git a/include/linux/gpio_keys.h b/include/linux/gpio_keys.h
index 80fa930b04c6..e8d6dc290efb 100644
--- a/include/linux/gpio_keys.h
+++ b/include/linux/gpio_keys.h
@@ -25,7 +25,9 @@ struct device;
  */
 struct gpio_keys_button {
 	unsigned int code;
+#ifdef CONFIG_GPIOLIB_LEGACY
 	int gpio;
+#endif
 	int active_low;
 	const char *desc;
 	unsigned int type;
-- 
2.39.5


