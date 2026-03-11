Return-Path: <linux-gpio+bounces-33181-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qC9fN7/EsWniFAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33181-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:38:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBE32696EF
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:38:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99FAF3070AE2
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 19:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA3D2FE58F;
	Wed, 11 Mar 2026 19:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Acp+cQtW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C722FD66D
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 19:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257893; cv=none; b=mU5Ldxhqi2fp1OqBC1LERk2+umzRV38N2pVwk+WShBewJBWeA9fSmX4r0FPjGAyYp7ZdzAHs4uCr+Kye++44J1F2pB+L0XjsWCe+CH4snbnv/CtqePH57017zXfe1KZlnU+dpsyb1IEvSuyLirh1sZYxXGIG652tzI71mHJNMjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257893; c=relaxed/simple;
	bh=qub0cc9B89QJXNhuj7o8afjimwUoYhU3mwesp3uHexI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DqwA/Pvg/OlgFEc+bk0x9w5nbhSv0IFCYGkPPCfz7d/Ed1VKUoBA/RnYELiRyQiEhn5DRlNPqsCmhCIdDOCS5EZZmMelWx8y8vjXBBsnJfOVnkipSk9bPvFJEIKOpLVHOwrmSFdoWPrNxPrPdbkeB937lr/kOtrM2qcLQqE1toE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Acp+cQtW; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439b790af67so1149974f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 12:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773257891; x=1773862691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UVoIoUgEnohfcDrGeS0vAZ3ak+mSxJEtVllXouTurmg=;
        b=Acp+cQtWY0DIRn+cy1y3ejBUa1Ap7tCi7dC0zkGibobglFeT+dsUh+3OvstUoJR6tP
         tkBv7/j9EZDobUhgEpusPAss0XkNTCBCHfEh3fsaIbAZzgCz8TK9/lfQ4xOEy4NfZuVU
         jitzDSWmtemJ/5BVQtFpZH1ot3v1FjQBoN8OeFeJjDmZ8jbshbz6KYbL2d9tztB0q9IX
         sqf6Z7UcSqlA9R5I7jIXNDCf8l5Qc5/GNpK5wEtc/0uq3406OlntM9vfNb0aWd5hnL5j
         Vp71aamtGg5Gg7hk57psMksLkrt/xo2Zp6ykL6PblfHob37FyIf09jeXp5NNywf9YQQx
         KSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257891; x=1773862691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UVoIoUgEnohfcDrGeS0vAZ3ak+mSxJEtVllXouTurmg=;
        b=uyMfakvxUHAdSJOU70oJbSayI07A8Ufqj6kr3Eor2bo4Tyq6tRDj1Ggfem+A+dDQPO
         3xrd1DfcFhaXFrPcq6o1VPt/r4FrIyxe3Zbem5nJCGNEG4MO+EwsxGmUBAFmTk4Hpx5i
         D4qTUCtuK4kOZb/fr/YJxjBa8PxbaubOx/6xvcYSfAovs8QXp2D3+5DFglQ5NHA+2AFu
         ekHENlXM4Hfbbq80a7oHBmzMZILzPaGdFjdt5nVf2PwB9bLFeGSKunnhbXK3xxWYDp03
         XHp1MHcysEEVYHrUteh8W1S2kJIXASnPAD2lUaqdpiyLgPveHAvTZ5EUPyxPAulnDiyB
         Oknw==
X-Forwarded-Encrypted: i=1; AJvYcCWU9IKSizoJy6s9wAUV4v6Bm26W7IHNeSNU2eaR77Fkv9cOQHEf/6TqYVY47nQkVdGhnU2f8oHkJsix@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8b+Par3lfRGoYCQ5boZ+/U0DNk/ACGSx8p78BBq3z/D43CUHH
	BjkQsgnfGGptAOgyHiKdZ6OFcoSP3Ec8hOREqEPjBGOhx5vdbL5yYSpEx9GX7RItiKY=
X-Gm-Gg: ATEYQzwxX4H78FMTPEWEG+cMUsPKwFc79sfZ1XIn1znOqwPqi8UlzvPBBChAkSPtI8r
	AsNFThPLH7eDvVffR+XRJrqtfY91S2/47nKiDk03x5DiDqxF0MqslMzOfCZyoyYstcb1+Mqa5PA
	Nt09tRHiA4Tr98QeJoAoZtNIMfyRqJ1KJ37UrmXh880aiCu6GcbpmDswDYXhj44RIYjLEOAR018
	V16ZdP0maAHzwBKf+0bwcIC58z/RE105mN2818HHcr/tJAY8MkE4/DyBAkuo3UbGMcukiSVh5N6
	8PaJL1ssGznjXDshkBvaHqWmm0YUDev987nmE+1DpsMwt0zvyNjse1bxy7gNyAcxMe6eHvWxdeN
	R8iRDyUPkppylS8+2P6GkEh3idvZ0cRasCL6nLf+jpHWMsU0lCEpWi6FC6olNFzYUpW+TsFWtuL
	ZeovYYxmE68KfqcKRAWfWDQ+6DttPW
X-Received: by 2002:a05:6000:24c2:b0:439:bb46:7457 with SMTP id ffacd0b85a97d-439fe192ab8mr1738510f8f.16.1773257890603;
        Wed, 11 Mar 2026 12:38:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe219c41sm1408413f8f.29.2026.03.11.12.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:38:10 -0700 (PDT)
Date: Wed, 11 Mar 2026 22:38:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org
Subject: [PATCH v3 1/7] pinctrl: introduce pinctrl_gpio_get_config()
Message-ID: <350d922ad791ac72756caa91e1551e16d7f511eb.1773150895.git.dan.carpenter@linaro.org>
References: <cover.1773150895.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1773150895.git.dan.carpenter@linaro.org>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33181-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4CBE32696EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: AKASHI Takahiro <takahiro.akashi@linaro.org>

This is a counterpart of pinctrl_gpio_set_config(), which will be used
to implement the ->get() interface in a GPIO driver for SCMI.

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/core.c           | 30 ++++++++++++++++++++++++++++++
 include/linux/pinctrl/consumer.h |  9 +++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index b5e97689589f..732ca6785c67 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -30,6 +30,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/devinfo.h>
 #include <linux/pinctrl/machine.h>
+#include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinctrl.h>
 
 #include "core.h"
@@ -938,6 +939,35 @@ int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_set_config);
 
+/**
+ * pinctrl_gpio_get_config() - Get the config for a given GPIO pin
+ * @gc: GPIO chip structure from the GPIO subsystem
+ * @offset: hardware offset of the GPIO relative to the controller
+ * @config: the configuration to query.  On success it holds the result
+ */
+int pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset, unsigned long *config)
+{
+	struct pinctrl_gpio_range *range;
+	struct pinctrl_dev *pctldev;
+	int ret, pin;
+
+	ret = pinctrl_get_device_gpio_range(gc, offset, &pctldev, &range);
+	if (ret)
+		return ret;
+
+	mutex_lock(&pctldev->mutex);
+	pin = gpio_to_pin(range, gc, offset);
+	ret = pin_config_get_for_pin(pctldev, pin, config);
+	mutex_unlock(&pctldev->mutex);
+
+	if (ret)
+		return ret;
+
+	*config = pinconf_to_config_argument(*config);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pinctrl_gpio_get_config);
+
 static struct pinctrl_state *find_state(struct pinctrl *p,
 					const char *name)
 {
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 63ce16191eb9..11b8f0b8da0c 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -35,6 +35,8 @@ int pinctrl_gpio_direction_output(struct gpio_chip *gc,
 				  unsigned int offset);
 int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 				unsigned long config);
+int pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset,
+			    unsigned long *config);
 
 struct pinctrl * __must_check pinctrl_get(struct device *dev);
 void pinctrl_put(struct pinctrl *p);
@@ -101,6 +103,13 @@ pinctrl_gpio_direction_output(struct gpio_chip *gc, unsigned int offset)
 	return 0;
 }
 
+static inline int
+pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset,
+			unsigned long *config)
+{
+	return 0;
+}
+
 static inline int
 pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 			    unsigned long config)
-- 
2.51.0


