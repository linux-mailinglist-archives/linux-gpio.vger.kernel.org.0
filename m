Return-Path: <linux-gpio+bounces-33963-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAVzIH5vvml1PQMAu9opvQ
	(envelope-from <linux-gpio+bounces-33963-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 11:14:22 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D312E2E4AA7
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 11:14:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EFD33033A9C
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 10:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364CA30BB9B;
	Sat, 21 Mar 2026 10:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mDddJuj5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E54D31197C
	for <linux-gpio@vger.kernel.org>; Sat, 21 Mar 2026 10:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774088010; cv=none; b=KycM6Fk2O7j0H0KcxN+GymxnzSTBGIxSITMGQ+WhyspXRs7mre1Hj4Tks8rr1P99Pzfl7QWhySbxt2KiktQiCR7CuhXc2LqiK/Ik1pdXdph2cp2yyK7NguYO2w7rOyCb0dsCbk3WGaLxHbhhGt+0KnmsOCirgACU070Kgo+/qs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774088010; c=relaxed/simple;
	bh=blBgOkHUL9k48ZZpbciZVcEdUpyrvvGFO5J2mFS0q94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VkcIHigIqle0DJCksQGni68rMWolSFKeSxD6vDKb2XOaIpTeyfaa6mRTKdNRYRb9UstLbnU+Ua6Vi8EK3/5UDBo82zGrm/Uf5/o5O9a1KeZvp7+NfuyY/7+zuEnUgyPRDhUkIbJGOjqYIXdMFnIIPFPvSC/YbvhEv4j6N7PgtXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mDddJuj5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so13175655e9.3
        for <linux-gpio@vger.kernel.org>; Sat, 21 Mar 2026 03:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774088006; x=1774692806; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z23TFsp1titUKTemBieWM6vBHqTe1wrTtIq9tf05puI=;
        b=mDddJuj5Rqjnk+4PiSRcwtD93OY7+LFUy9+kkV6Y6Lny6MzUS6F1JEVuUrHsXIPm+S
         Xx85M4iacozyYagQz7j3SQDrTYm0a43AUc1Qs4flkHIhaJv5VLXJi6ciSdfdjrHcTKeK
         Akixu0BPS5NEAnP2bfHk3ctVPR8xT2RiLPIz7pDAbadNmRsX4JwE0hXENbc9gf21lE1N
         2mmTKzyOFpGAv0w2DI1UGW3vJ+b8i6PgX0V5TMz+KvaHNGqdwARBv87PUHeB098EGOfu
         4ajv/y5Ff0KdKhoMc1WXr6YzB0mvpdmIQaPnwlCL4nus2hbSokSGHc+Jzluk29A7ZCgi
         J2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774088006; x=1774692806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z23TFsp1titUKTemBieWM6vBHqTe1wrTtIq9tf05puI=;
        b=f7BcjL7BlP8dilMK1evWje2LV2cPsP8a18T8qJBvl6b43wKD6n0U2lKRPZtpKmtIC0
         M2vDbvrW8UBaCgYw5CRhBQKsxUTQ7ePFPmeou3wzI52yljBJ38VxLpDYf5LNZZ5PnRQ/
         L0/QIMUbBMZ9sXX9iSW2FTrD6MoJuaYtwC0JKBNaAS1abgNHxOSxGuxsq0OofM7CFDAZ
         z2sH5vMz919cckmvSoHJPFf6uPv9EU8W0GtlBo6o0xRPIG28V46PYRvAxVfQoJzhoQ82
         n/Jwi4QwXh8ejsEbcH2P0vxofPBCwzg8b/ULtYmWiANi00uIMAGiPif9tIZoCj7htcKQ
         FMXA==
X-Forwarded-Encrypted: i=1; AJvYcCVb1s7uhy8L3bhfAiDZaJxVPbQxI4Pnpgw9cYit1hmaxR8vOH/lJfhpAtftepccI50drm0i46LP3rRW@vger.kernel.org
X-Gm-Message-State: AOJu0YzB1DdumednLauuHwn2Gq/1zZDXxBUIC0FLNwvT6mO/WuB4xCt7
	ba+dyLy15eRWQcHNfpBsX1iWvAygBi9C60dKgnpjXRniBlziiq3AFTRaoha2N4EiwSU=
X-Gm-Gg: ATEYQzydMmYnbduZ365L131XC8LjiDHhSgvziWlWNKnyblorCuGy9LyU4bennjTLKdJ
	LsqG89TE0P/C1/55RWqhOIr8OfhdZ9nn/z7oAhQmZ6bsgsDGuDW3wmeoSfdi9IN/u/yFIRqH1Wf
	B30xteX2DcfQF+WlztVxT2/wk6qwqxrT+im/II0LSJ2vniZisduh+l+Vab7Mqvon5aYsGCgF3hr
	CGO1hw/kq5MrYSRWpKGlxwlXpDNPmGy1jzwVCUNt+pyVMnskoJWJlRGQzhiDXsovof8851HTIlO
	hKZ8sOJhWkYVEO3AnuwVPVCaADMBANtkaw7CTy6kqT0oZ4GFRUDpjz8dk94mLbzzq/AspEjDOeb
	ivPlzkNBbaSne+DWp7C0Yac20LPgWl7mVkfLp0b1S2PDeqQiopzsfCRY0uPl3cCG25YOss80xNi
	8VLbapbmHcGcu/zXRFNdUP/jaYkRAd
X-Received: by 2002:a05:600c:4fc9:b0:485:2ce2:4c8a with SMTP id 5b1f17b1804b1-486fede737dmr87229225e9.1.1774088005338;
        Sat, 21 Mar 2026 03:13:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48705135631sm31669695e9.15.2026.03.21.03.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 03:13:24 -0700 (PDT)
Date: Sat, 21 Mar 2026 13:13:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v5 1/7] pinctrl: introduce pinctrl_gpio_get_config()
Message-ID: <f7a41ed017fba4a0986ffe72e06933cc1bba2406.1774087290.git.dan.carpenter@linaro.org>
References: <cover.1774087290.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774087290.git.dan.carpenter@linaro.org>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33963-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D312E2E4AA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: AKASHI Takahiro <takahiro.akashi@linaro.org>

This is a counterpart of pinctrl_gpio_set_config(), which will be used
to implement the ->get() interface in a GPIO driver for SCMI.

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
v5: No change
v4: Fix kernel-doc (Andy).  Add r-b tags
v3: Forward port

 drivers/pinctrl/core.c           | 31 +++++++++++++++++++++++++++++++
 include/linux/pinctrl/consumer.h |  9 +++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 2edc9bdad183..c471f3fbd035 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -30,6 +30,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/devinfo.h>
 #include <linux/pinctrl/machine.h>
+#include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinctrl.h>
 
 #include "core.h"
@@ -938,6 +939,36 @@ int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_set_config);
 
+/**
+ * pinctrl_gpio_get_config() - Get the config for a given GPIO pin
+ * @gc: GPIO chip structure from the GPIO subsystem
+ * @offset: hardware offset of the GPIO relative to the controller
+ * @config: the configuration to query.  On success it holds the result
+ * Return: 0 on success, negative errno otherwise
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


