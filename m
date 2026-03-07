Return-Path: <linux-gpio+bounces-32711-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DkMFsaWq2l6egEAu9opvQ
	(envelope-from <linux-gpio+bounces-32711-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 04:08:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC01229C02
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 04:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 95BA93025E29
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2026 03:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89022F7478;
	Sat,  7 Mar 2026 03:08:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC0824E4A8;
	Sat,  7 Mar 2026 03:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772852884; cv=none; b=ZpsQyrycYbHdvlY/Tb59vZSvBlAKKrkZaJzi/QCBrD/3PgUOTnfv+nY1b9csLYD1Wm771B4b3+wa70JIg5om7bPb+N/PUQz+Wh9OPVsfsZK3Nb5vjlY3KfNo6y37ERYDURx5uQZKIta36/2h4gOaLMh+13Fs03HQbUYjJsDpP1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772852884; c=relaxed/simple;
	bh=CJcKGBki7v36X72qsmzgsFmDkpf9cdrWvVWNI9hOGkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B6ZoMt6uhFdyciDk9QQq/TBARC4DQiNnpMonH5VhOAne5avENBZ0DmcmZDbIRP0lRq4pJja0SoZeBtYLHKEdhS8qYj6e/iMXQQMqywp8HYDcXVrJfTH/xDpKlZF/QEb6kuofMFWBBvt/FcXgYBs1fm/RA5QvM4m1Pb+FCeIxaac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org; spf=none smtp.mailfrom=vimux.org; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=vimux.org
X-QQ-mid: zesmtpgz7t1772852869tde12627c
X-QQ-Originating-IP: K3y6NlAAX55aLXXdCQvpWK4HRQlH8EWmBbEWpffKHQE=
Received: from localhost.localdomain ( [219.147.0.78])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 07 Mar 2026 11:07:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5577751314337241107
EX-QQ-RecipientCnt: 8
From: Jialu Xu <xujialu@vimux.org>
To: xujialu@vimux.org
Cc: brgl@kernel.org,
	kees@kernel.org,
	krzk@kernel.org,
	linusw@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v4 3/3] gpio: remove of_get_named_gpio() and <linux/of_gpio.h>
Date: Sat,  7 Mar 2026 11:06:26 +0800
Message-ID: <02ABDA1F9E3FAF1F+20260307030623.3495092-6-xujialu@vimux.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <7131965EF4C8E8BD+20260307030255.3490715-1-xujialu@vimux.org>
References: <7131965EF4C8E8BD+20260307030255.3490715-1-xujialu@vimux.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:vimux.org:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MwMlq8Z8kZpVTCIHbWcfMlvotyLT/hh+3jPk11GCIHzEHdg2WVm5YTvw
	055uFB46P88CD7lYkb2ovDOoy9kkiHOTQkmeCXRCWvAQnPMvUyNMcwyxTt0xZNb/BxlfyAl
	+4XaVAV6wPCYEfj/d2cTkVRwtHdeKYzToQKa/rEy56JdXki6XuBLRM3BpgS6W2PSEvTyz9E
	wZ6OzoLrBvGCSaxbA0hcEeslEEklQ9y50V42EBRyr8XXGpUa5oI2de0Cs2KZZmZQgJ62Akq
	aYxoBbtFSy5Y8Zfr2Iim4rpC0DHLXnNmlTYDyQlFjIW9kFloI9gvEeXHOjKZrme9c/Sodvz
	fyfsbV5tvf4hD/15kG6zw9trUMAaf3K3PiBOmuaDLedqHWOESdzQw5Z0zFFgVZ4NMDxcIJh
	DA3KK+N4abXQcx7OlX1has8WP9YkN/y1aROnM1tdSLM2yoS7Gtc4kPuXs0AUPW3fdXjJGPW
	ueKRDRWcuFzDPIbaLBD81X5kmIz/2FkkojuHJjqs1PLTGURI9PHtBGtWFC/1l0PsG7JrMPc
	6xTA0HPTTyPwvTV7rr2OCueRRQA681Gx/CHrVzVWUUon0Fc+9o0cJNI4KpN8gIiv11uJQqE
	jkuoK52NQAeHZeTPxhYS/LWhxkpfLZRdmeiDKg5aQUiUwAxCyS7GEKbhVHrBOeuOJ0hTpJW
	yXv9X1S8Yo6115lWY1h+FQg9w0HN8iNnrlLgSw/3Omg4O5tn0VE2nD6ZOi6VFqYBEXAXvFQ
	poT+upUrHghxLr3TsacVgCzCxhBtyYLE7m4atLHT6Pa758ce8o/CSog9kTZc4/fGsrzf7Ez
	SUx8tbeMc1qnwNhZqESdwMaXXwHUyevoaMJqYH8lgnMopuzA1g1AfprN9ku2Z63SpUYy8U1
	yJFFSecT0GVFkuIukHGZIUFMGpiPe3bew+nFFfm/vsIwODB5rhlZ/JFMm+LVE3NL6W2Si6H
	FvYXSZOsqHiO0VrRkqpLW2IPlFHbXjUDUtRpvS8L4KZLvFEMJc9VCzSxS9bl5N47iKnrN9E
	0se61RJdG2VhXtfhTwTSVcWyCsHYI62+O0qAgChw==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 5AC01229C02
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32711-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[vimux.org: no valid DMARC record];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[xujialu@vimux.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.376];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vimux.org:mid,vimux.org:email,mvista.com:email]
X-Rspamd-Action: no action

All in-tree consumers have been converted to the descriptor-based API.
Remove the deprecated of_get_named_gpio() helper, delete the
<linux/of_gpio.h> header, and drop the corresponding entry from
MAINTAINERS.

Also remove the completed TODO item for this cleanup.

Signed-off-by: Jialu Xu <xujialu@vimux.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 MAINTAINERS               |  1 -
 drivers/gpio/TODO         | 28 ----------------------------
 drivers/gpio/gpiolib-of.c | 27 ---------------------------
 include/linux/of_gpio.h   | 38 --------------------------------------
 4 files changed, 94 deletions(-)
 delete mode 100644 include/linux/of_gpio.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 61bf550fd37c2..8152fa2158295 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10958,7 +10958,6 @@ F:	drivers/gpio/
 F:	include/dt-bindings/gpio/
 F:	include/linux/gpio.h
 F:	include/linux/gpio/
-F:	include/linux/of_gpio.h
 K:	(devm_)?gpio_(request|free|direction|get|set)
 K:	GPIOD_FLAGS_BIT_NONEXCLUSIVE
 K:	devm_gpiod_unhinge
diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
index 5acaeab029ec6..7ce80fde1f17e 100644
--- a/drivers/gpio/TODO
+++ b/drivers/gpio/TODO
@@ -58,34 +58,6 @@ Work items:
 
 -------------------------------------------------------------------------------
 
-Get rid of <linux/of_gpio.h>
-
-This header and helpers appeared at one point when there was no proper
-driver infrastructure for doing simpler MMIO GPIO devices and there was
-no core support for parsing device tree GPIOs from the core library with
-the [devm_]gpiod_get() calls we have today that will implicitly go into
-the device tree back-end. It is legacy and should not be used in new code.
-
-Work items:
-
-- Change all consumer drivers that #include <linux/of_gpio.h> to
-  #include <linux/gpio/consumer.h> and stop doing custom parsing of the
-  GPIO lines from the device tree. This can be tricky and often involves
-  changing board files, etc.
-
-- Pull semantics for legacy device tree (OF) GPIO lookups into
-  gpiolib-of.c: in some cases subsystems are doing custom flags and
-  lookups for polarity inversion, open drain and what not. As we now
-  handle this with generic OF bindings, pull all legacy handling into
-  gpiolib so the library API becomes narrow and deep and handle all
-  legacy bindings internally. (See e.g. commits 6953c57ab172,
-  6a537d48461d etc)
-
-- Delete <linux/of_gpio.h> when all the above is complete and everything
-  uses <linux/gpio/consumer.h> or <linux/gpio/driver.h> instead.
-
--------------------------------------------------------------------------------
-
 Collect drivers
 
 Collect GPIO drivers from arch/* and other places that should be placed
diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 3bdd9af674474..c512d735e85ff 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -14,7 +14,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_gpio.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/slab.h>
 #include <linux/string.h>
@@ -446,32 +445,6 @@ static struct gpio_desc *of_get_named_gpiod_flags(const struct device_node *np,
 	return desc;
 }
 
-/**
- * of_get_named_gpio() - Get a GPIO number to use with GPIO API
- * @np:		device node to get GPIO from
- * @propname:	Name of property containing gpio specifier(s)
- * @index:	index of the GPIO
- *
- * **DEPRECATED** This function is deprecated and must not be used in new code.
- *
- * Returns:
- * GPIO number to use with Linux generic GPIO API, or one of the errno
- * value on the error condition.
- */
-int of_get_named_gpio(const struct device_node *np, const char *propname,
-		      int index)
-{
-	struct gpio_desc *desc;
-
-	desc = of_get_named_gpiod_flags(np, propname, index, NULL);
-
-	if (IS_ERR(desc))
-		return PTR_ERR(desc);
-	else
-		return desc_to_gpio(desc);
-}
-EXPORT_SYMBOL_GPL(of_get_named_gpio);
-
 /* Converts gpio_lookup_flags into bitmask of GPIO_* values */
 static unsigned long of_convert_gpio_flags(enum of_gpio_flags flags)
 {
diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
deleted file mode 100644
index d0f66a5e1b2a7..0000000000000
--- a/include/linux/of_gpio.h
+++ /dev/null
@@ -1,38 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * OF helpers for the GPIO API
- *
- * Copyright (c) 2007-2008  MontaVista Software, Inc.
- *
- * Author: Anton Vorontsov <avorontsov@ru.mvista.com>
- */
-
-#ifndef __LINUX_OF_GPIO_H
-#define __LINUX_OF_GPIO_H
-
-#include <linux/compiler.h>
-#include <linux/gpio/driver.h>
-#include <linux/gpio.h>		/* FIXME: Shouldn't be here */
-#include <linux/of.h>
-
-struct device_node;
-
-#ifdef CONFIG_OF_GPIO
-
-extern int of_get_named_gpio(const struct device_node *np,
-			     const char *list_name, int index);
-
-#else /* CONFIG_OF_GPIO */
-
-#include <linux/errno.h>
-
-/* Drivers may not strictly depend on the GPIO support, so let them link. */
-static inline int of_get_named_gpio(const struct device_node *np,
-                                   const char *propname, int index)
-{
-	return -ENOSYS;
-}
-
-#endif /* CONFIG_OF_GPIO */
-
-#endif /* __LINUX_OF_GPIO_H */
-- 
2.47.3


