Return-Path: <linux-gpio+bounces-32475-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WChmANwSqGnUngAAu9opvQ
	(envelope-from <linux-gpio+bounces-32475-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 12:09:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8391FEB25
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 12:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 851153048EE5
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 11:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DF73A451A;
	Wed,  4 Mar 2026 11:08:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E37371D02;
	Wed,  4 Mar 2026 11:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772622505; cv=none; b=lYYDABJqGfBUNYKvFu7eJUP1/c6jbG4cf/LBt287iaD8Af2WLgt7RWcWbOr2AGLyrm1P1HHYXKd0tQBuW3iPYrbUCRpv6I7bZo5/wRPbNc2jTR04Z0kFkVQrP/9fQ9+tLbr9NHXE6R9Q+fB9eoMWb80XwtCK58HFTZqmik15QBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772622505; c=relaxed/simple;
	bh=iseBcK6oi8w4E2TuH96pD6Q25pl0Nd9KIY8N7UGdcVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CSnw5MzVaXWTqDQuXQRuLxSYV9Bi8bYcqOLqFXAqek9uNgEUERRjFc/9V549tMz5/QcPnZ8R8yE9B8CgPvAtUoWj8B/XSdBeL+4PpRNPeOs/TGWMOd9MP0835hNLCzdvluPfeCw2+W+ElBW1VVI2RDbntABtQcgE+22+tgIcMgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org; spf=none smtp.mailfrom=vimux.org; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=vimux.org
X-QQ-mid: zesmtpgz3t1772622482t95906d36
X-QQ-Originating-IP: jIy3y/yHtVNb4IMMHQIZvFAuNT4+D8KOJqo0pxQG86M=
Received: from localhost.localdomain ( [39.65.248.64])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Mar 2026 19:07:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2432150329914494363
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
Subject: [PATCH v2 3/3] gpio: remove of_get_named_gpio() and <linux/of_gpio.h>
Date: Wed,  4 Mar 2026 19:07:40 +0800
Message-ID: <DCCC09EC17B995A0+20260304110740.548318-3-xujialu@vimux.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304110740.548318-1-xujialu@vimux.org>
References: <1777BBA64A3D0F97+20260304105215.536399-1-xujialu@vimux.org>
 <20260304110740.548318-1-xujialu@vimux.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:vimux.org:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MPXRAaIeBXiQxZqOzkyjFSiD5LsouPOXnMp+ECMzpcCI+MH2U4R5Z1m1
	K7bVXxS8BSGdmK8llwTiMBlDf9jJXG/O5hsTBpfmV4dE+VdiNzApjOXzKCkhNjmzf8hVwmC
	NAOMveKFD7gWYpkvvkbumSTq4i2ofNWy8wxqCRPisTC0j1bhONxGLcCpgb7Zy6BwEK2oKsF
	vGSR8WE9iCWWU0HXbeP0Pt90VZSaT7n40hD4xD1KBPM6M8a3JFt6wQ6Rppbuqa3pdRYI575
	Rpon1JZITB7ziHfceMmPpjCUpeBcTvHZZu0A1nnmMj67WOOV0Lh6Ydb78oknrgQ0+EpHMJW
	f57spn9zaKfPFy49kb682p9ZnvivfMGph7UrXUtK5/ErELYzQ53fujddBah3IUIMv71wuKa
	vchXz4Z3K6OUdj8UIGzSnvZWLbo7sgAA1WkBgMtIJpbtgZ9LN5pq9Cj58eSgIcKyafXhwUu
	diiOB5mBiaF6cLxOSXQEZfzb59AhYQoacJvcAHlGm3bP0pK2xfbTPs8S7QgfT/13/zBOlkf
	H5P6JNGYBjvpyTkZIGSeqq8k8woYN3LKNwZc8sExJnVf7xJ2wO+15mungngr35jFbq046Yn
	sn3sTAa1JcVk7mLNR1eibViy1FzN8bs8oCpbr027tfqq9BCuQSWUULiMlJewAKOuH5HY6G5
	wOpAL4Re+w3zr4cggfdYJ+C4D1onG4WquUSSAlb+XnlMC+e3jNdZb6jxAtuTCPZx5ea0Ok1
	5do0mK5LAeWEl/mCjr7c2f+7M4k4iI+pwp0qbOVE1GU60n12elBVmayBh6g3XZe3Hr6SQjd
	XNS8/+QM7XO1AkJgdWrBFDLAeytcazOPPCexO1NIFDAuvx9r2tc5BPNSIzCHdy6bIyQMaL6
	3fY2v12ENE4ustpB8Azx/nqNqHugXjK5qOK0IIW1hZM9KbzTdEj3Schtu13O+KkxPMnlJf6
	0pDs9O83EX8b+VzvMuXtP/75bVos6ivuSyaAQy7PQ2plSkaZtECLzcdwlg+Jz6mr8Dj73ik
	Qohr4sdneCp1oRL475RCg+oFlHAHnXGev3mJbde79LCo7aJWmDkYjbn9arYU2vV/x21gbtZ
	Q==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 6F8391FEB25
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32475-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mvista.com:email,vimux.org:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

All in-tree consumers have been converted to the descriptor-based API.
Remove the deprecated of_get_named_gpio() helper and delete the
<linux/of_gpio.h> header.
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


