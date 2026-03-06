Return-Path: <linux-gpio+bounces-32626-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFrFFIRRqmlNPQEAu9opvQ
	(envelope-from <linux-gpio+bounces-32626-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 05:01:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CFF21B598
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 05:01:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0DCB0302B18F
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 04:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC67F36C0B6;
	Fri,  6 Mar 2026 04:01:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E0136A03F;
	Fri,  6 Mar 2026 04:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772769662; cv=none; b=jHFIT56q3GBcISJNuurv9E2bxYmJky14bNVbRIBIt2iu1UimeqAueSHosoyDRLB+Q2wso8a7R9LuoPWkx7H4Ha4WThs649FiEwQrXROJDrL94WmcD4cd112cFL2YQzhKYxpT4u90ZdLDYeDR9bt5HWkuzkVq1fGzLqWANcnfgYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772769662; c=relaxed/simple;
	bh=CJcKGBki7v36X72qsmzgsFmDkpf9cdrWvVWNI9hOGkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VluxsILZp9nsWTbpaoVtvDJqUBT1Xv4C+GMWxrafKbDNH133fRNbnSusYjIeqNbjAhNjbWrYsvL79g2lThS9oFRpz28UzuPlGts/7xWT0qJ/mysl8UtWMNDJ4hUOKjLTYMhGZrlrhe5aZrT97FOa7zwE9muniUUyYETuBTfS6Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org; spf=none smtp.mailfrom=vimux.org; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=vimux.org
X-QQ-mid: esmtpsz19t1772769634t18b456ed
X-QQ-Originating-IP: BNKoUk/EEm2ysShfV34K1wbEp9Va9qA1DojK65Fhm/I=
Received: from localhost.localdomain ( [119.167.27.18])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Mar 2026 12:00:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7250432472425711869
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
Subject: [PATCH v3 3/3] gpio: remove of_get_named_gpio() and <linux/of_gpio.h>
Date: Fri,  6 Mar 2026 11:59:13 +0800
Message-ID: <554DC15F66B052BB+20260306035909.2447844-7-xujialu@vimux.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <D5F95320CE72E20A+20260306035539.2443355-2-xujialu@vimux.org>
References: <D5F95320CE72E20A+20260306035539.2443355-2-xujialu@vimux.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:vimux.org:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Nxo56qkCB4EiaeIznA6Y2Y6th2NxT1tsNFQjMt2a7YTK9P5yndahLDZl
	5SP0Z/qrVx+pwUk2ofkH7hnjAP/z0G1+i67T9Zd0KONbI0ZLnS82p8afRnop/rdx1LjqZ2/
	BW4kiIH1are7rBy6ci+8d6WmFo6uMN40Ggj4HmjVBg14xI+U6iP0D6XwLVfqNDK2fA8Ay8p
	7ZITh9pnLlwdtV5cHOeTqKePe/WAe4xn68eCF+ui2ybja+2dq/ccgqXwiq7PHM43MKt6cuI
	EHhwmtIVTFEVCfo92EOsZOgu0xMnG6vDk0hP7F/FiMk4tdFhZWZvW2tJhqeI2xlB1D/PEE3
	nkflU3BIk1Q6xx1TqXcvv+rIl6WRCSvGHvV4HK/UClAyCKLkWK+WWmn7F0T6M8hSKA00uwU
	YLOcjUTgRImeYQ9SZQK4LyyrKNz41wMoiDnbZg04Q24pOKt8OGKATRXkLKZTQKvxx5r+wAl
	T3oQbsqIxHT+KrPSzD1prACYIRWrCz/+teP2FiBEhTsVjKxmyEp/lsg8r2T25W3+kf88u/E
	LM07dsQ6Ixco0g3B6fRFJQqtCeR5dxT5/Adw3cPT/vsMDJQxMS2rutfV0R0kFi3ZCRcs7/f
	4s9dpcM/6Q7d1LoObSUm26LpSISaLmf1u6gAONh8VWIuTwxQAnuzN2tZ5ijeALvY7wk+T7S
	hwuY4D5pn5mfIoUP75tznxt+r/Y5mvzvlP9aJLw3Sp1y2OExvs0JjwyWPX6k+8LMkwzjrco
	n8QdpOUSBlGHrpKfy5pVzy8//WHT1IXue1eY+E8DASirSmlP+1mhRNo2neprIWZXLu5Yl+Z
	Eh0XxhC9QVz/6s2ISFDMlVm8TesZlgJ+mndBSePTf7xjeriwkyISeMI0xDsP2uEXYgBMCsb
	pFwe71mGfh7oqy6XjmVMO79UzG04JacpB19SLyj6gsM+At3d3QZ95doin2l6Y+lx5zJrEIi
	5CGWniue+Y4thErmu6sCMNpMrHcSSAtRFZinjaOYrEfxKWRj3xQQ7oS6RSi84VZGaU7Vy1Q
	tavcDv63g2kJI2sA6WmqXsLRanxdImCMVdAlwTPg==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: E5CFF21B598
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.991];
	DMARC_NA(0.00)[vimux.org: no valid DMARC record];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xujialu@vimux.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-32626-lists,linux-gpio=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
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


