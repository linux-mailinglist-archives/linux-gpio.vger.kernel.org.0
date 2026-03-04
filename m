Return-Path: <linux-gpio+bounces-32444-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDc9B53yp2mtmwAAu9opvQ
	(envelope-from <linux-gpio+bounces-32444-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 09:51:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6671FCEE0
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 09:51:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 458723043530
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 08:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26BC3822BE;
	Wed,  4 Mar 2026 08:49:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7134F3932FF;
	Wed,  4 Mar 2026 08:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772614152; cv=none; b=X1Rr6IqYwdvZkUuLMJnnLoBGIKXo5cO83bo/G+kMeaGEtTH3rS/vySRn/P5aA9kKD4nSpnfDW2i29aTSaxsvRjUfEflnfI03u6xZvHNPVPj3OmCpDzZI+ckRtVNxZ+jeUl4b3d7L7U/DtIpRvwou2uqjdceezRtm7i39lJCEM8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772614152; c=relaxed/simple;
	bh=6v1p+7b+6BkrSFjV0I2Cqtd4z35GtCQpxTfB77HtQFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PiyobcJIayve4RNg85XkX/yzfd+1tdbANTeByV0daLWbOjnSNHf9L63C0MB4sIvGb5L6Pt7iqcGA6bX9g/jqE3Wr4Jl4Co1RJsFwiK5zSlLycQCkmXzXid+tnNWcokTb1A9gS86ssh6x2BGyKTXqFEssd3xl4iUALOTORhd6Vvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org; spf=none smtp.mailfrom=vimux.org; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=vimux.org
X-QQ-mid: esmtpgz14t1772614125t2bfa0f2e
X-QQ-Originating-IP: D4BgEeHgoRuCNoPDChBAMO7QLhZdagX3B2v823XZXTY=
Received: from localhost.localdomain ( [119.167.27.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Mar 2026 16:48:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11675765092982434808
EX-QQ-RecipientCnt: 8
From: Jialu Xu <xujialu@vimux.org>
To: linux-gpio@vger.kernel.org,
	netdev@vger.kernel.org
Cc: linusw@kernel.org,
	brgl@kernel.org,
	krzk@kernel.org,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	Jialu Xu <xujialu@vimux.org>
Subject: [PATCH 3/3] gpio: remove of_get_named_gpio() and <linux/of_gpio.h>
Date: Wed,  4 Mar 2026 16:47:04 +0800
Message-ID: <44DCF3FEA681AA9F+20260304084808.440955-4-xujialu@vimux.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304084808.440955-1-xujialu@vimux.org>
References: <20260304084808.440955-1-xujialu@vimux.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:vimux.org:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: M51yY3USHbjFG1ItX1khFPLtjMkR3ajvCwVEpXUeJTxsqVi/BeT5GgoY
	AjI1zG0TmUUA62/pjE3vrC1PZhBxIz9pt2BSR6ncuiE9GRQIWbOZTatd/pf+5EmJiiphkc8
	lLnYIpKD2kqz311n198Q3wZW9VIvClFXmdRDtHnQzYlEVCWA4mV9Mlu3hUkU+jEjuauu2W3
	XjmNDM8fqQn8VpeGAtEve9YRffYb9ooObDdsBBv8/uGCpE9qGH/dSbMdkvd2JHQUToV1ceI
	lOu4U2tZxMchr5MhwI6j6LHAta1BQQpqBFJjCJY2qHc2BbSg9dzThvx/+UnSFXZOjoBhWbN
	uwgY0Mdw3OqBd70EwXQYtNtbFktEweiUAON0yNAZebqEykmYBh6SHVFjPy3EBjWg6hAJE9p
	2rBa933/fRkG0Lih9LeoKx0w07VqRHlvdA0hZ/RTfliEgn9IbzxlZAbl2P9jt1ZWkyIc1MB
	M9b2HB5TFV8Tm7gJzNOWZFLUnATFYvbFY0tgA3Go8vvkMA+NADVGf8lV/977xiRyU/He5Dy
	wmMdMFV1K4c+8mkeGrckEH/YA2FoSPwPqyiFVWtHO0jlWfdwsHNzbPGuflQ3ZeANfoo2aof
	Y5uRtGpyPPApvATowDiwyajpSZ6w2pgje6rZNsslHHyHYbX4uRd/FZHy/zGrVfjrEHSpsSc
	J3H4EYeQm5AE/x/sMFk5PIGhu8W+93Mnv3L4t9PgQl1zFVrGEqq65lnns7K/PCJYmVDn3E+
	P68WJUq58Qt4kvPUJRWWU/oUMHRtAguNJ9OqDI1Qrqu1JdP4KvVAlHrb0kePDJON1e8Tv3W
	H2YtR3GuuQsRuezSp/7BVbw2XrFHUawaWYwK4Jibl47swf6hee31PVcSnd4lCVPIoNWoG6a
	zTd2wDyeV1pN//LRsHrmmZSRpWEqgogms2uQ2vcXchaWwrBIr82O+DjX6n4py5TluY8YeWn
	j1LObI8rZ5SCbIbHgtl5AJLOvOaVG5qygs4JvMEIeLmHaekVYIPwaENyGA1Po4NcHa2IE2S
	GuITc8CQ7NM5Ff/uj5hy2CAEiqJDT9unwdkZoMU6EbV3m1SuJ5jZJM4d0D0TSIkEk9oPEAw
	j16fYJbd3I8/QGYgzA8mRo=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 0E6671FCEE0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32444-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[vimux.org: no valid DMARC record];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[xujialu@vimux.org,linux-gpio@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vimux.org:mid,vimux.org:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

All in-tree consumers have been converted to the descriptor-based API.
Remove the deprecated of_get_named_gpio() helper and delete the
<linux/of_gpio.h> header.

Signed-off-by: Jialu Xu <xujialu@vimux.org>
---
 drivers/gpio/TODO         | 28 ----------------------------
 drivers/gpio/gpiolib-of.c | 27 ---------------------------
 include/linux/of_gpio.h   | 38 --------------------------------------
 3 files changed, 93 deletions(-)
 delete mode 100644 include/linux/of_gpio.h

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
index ef1ac68b94b78..f293fb677fbc4 100644
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


