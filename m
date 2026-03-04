Return-Path: <linux-gpio+bounces-32470-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IB1K2UPqGk8ngAAu9opvQ
	(envelope-from <linux-gpio+bounces-32470-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 11:54:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FC11FE96D
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 11:54:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D610330A02C4
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 10:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0FCE3A8726;
	Wed,  4 Mar 2026 10:53:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684283A873D;
	Wed,  4 Mar 2026 10:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772621592; cv=none; b=eqI14mYW17rs3dOvglwLb0tcsoRdeZeL/MzEyMVQkNCX3RlVp7mEIkNNIqfbo3KKWJaXwJiIV58jG0l7cM9tIndT+NQrKxjonCMpntQlkRGJr7T914G0/uF/aY8rxQbVoVybKXKRD6GcZgIoHIkyVvz3lOBLXtFsBTASTyEE4DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772621592; c=relaxed/simple;
	bh=seolZAi9wS9AkLegqxuIIYBfkjQgFK23TvsRT6jiP70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b00PyQHTKYo6H1TjO0oAi1IXjCvOjwdZrIM6l+84DKLgxdG57+e83jYQvLv/RD9iZpGepHVY+r2IOE2byO9SRNFg3Quyy46aX4XDIRFn+Z/KixltJB2guGxGDp6+J5e1OTRB/8fQykD4rAJ/XlfudRv6Q5Y/pO2Yr2iJK8VRFgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org; spf=none smtp.mailfrom=vimux.org; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=vimux.org
X-QQ-mid: esmtpgz13t1772621579t2dcbf07d
X-QQ-Originating-IP: 1bKHHpPITr/E07eNJX+HyNCDOkzeK3cYeCwu8yiSK4s=
Received: from localhost.localdomain ( [219.147.0.82])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Mar 2026 18:52:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 73543249924356061
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
Subject: [PATCH 3/3] gpio: remove of_get_named_gpio() and <linux/of_gpio.h>
Date: Wed,  4 Mar 2026 18:52:15 +0800
Message-ID: <DBC78F9A5471852F+20260304105215.536399-4-xujialu@vimux.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304105215.536399-1-xujialu@vimux.org>
References: <7187C401290C256B+20260304084808.440955-1-xujialu@vimux.org>
 <20260304105215.536399-1-xujialu@vimux.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:vimux.org:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: N5OohOZOOOruGsFhU/Ute3kVn3GNPmzuY4pkD53RhJBcjHjCLai8ByXt
	8KjpzEOlVmoROrNrn16p7yGCtPskgNjXJLP026f/ZVnQAi/JBTIijW2hHjbZupR2UlLa0K7
	qAuRxGoULubNcMMD24FYipGjjyFH21lh+dxgzAPg1Sg23vSCXT5JMGqxCcaalslDU4a8ape
	IEqOzhtg+Bg8l1rrjHgyHqcEoBIZuFeDQPuNyb15y3RKy/srnhbSv2f20ODG2YjjXWWNKA9
	TXtCi1it5imoTX4TFC4vBUvAH31EEB87nHmZC1Q8cmLE5rMweF9wG1nenM9aMXrEHE5oQJc
	Ll25Z49H07dL79c8zrYsRqzAE8OnOVXOpSYWvsMX0jz9FUMloM6f/d3zFNo1Kvdz6vm8SuL
	HTmmObcRkQfkvff/QDOxb3qo5xkaBnikOjQhkWHFfF6mbF8AosAqjXzUUXkUiFatJz2nEt8
	ZhZvfy6IXcZK2MDa3IT+z21jm8Tu0QMayBCgA/JaOfQzrfgtLtvwpEfI0i+VMbpsyxih/xX
	KlgIShMWte8LsM8wqbWqPBwzkiWOo1HzmT5c2Y81aM85K774LsyXHRK6rWo+opGFBS5EYhP
	Uq5CWY81kCVEEhp7PFmG7cAeM+ULfYuRjZ486chLJsr/aZn4ipShSCDoHyO1rDq5O7BChHZ
	nRdiWgvsW8mUVmkWimi0A5n1OjoHnPP0phW4UtYURnmjaxK36xN4p59wt9CiHAd9Y6XyyRn
	2AIjllAkhZEQmOzMElwE/TqLOn0DA+DjB29DqpxUanClKqyvozvowt18e6oR8lYfrdoeuFI
	BjS6ORk+Ab/XRwaYDltRKO/Tk1wmE7czn5W5g7xyvsCMjp1TlJaQwsJle0OIoJcjaVUKDUZ
	LAtU+/hbetx8ciZQkxu8b4V/1thWTuYzDewSSazF1dnlHNiY/C1mvbBbcoAJwxZy771bmEy
	BZglCLnn30pnUWy8wFq1usFl4I63pr/Gwq8jp0bieHuHPVD2bW4VsRDuWLW2M3eFOBDkvuK
	ZxgbZU4ueHEwvVJMIP6yx/tbabrTSX5BXU+8xEkIZHMRCUWJJoOXaQ7a4kN14=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 39FC11FE96D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32470-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[vimux.org: no valid DMARC record];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[xujialu@vimux.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mvista.com:email,vimux.org:mid,vimux.org:email]
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


