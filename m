Return-Path: <linux-gpio+bounces-34048-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIgZFqaOwWlxTwQAu9opvQ
	(envelope-from <linux-gpio+bounces-34048-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 20:04:06 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5EA2FBCF9
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 20:04:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57097305B5DE
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 19:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBDDF311C15;
	Mon, 23 Mar 2026 19:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pQvrTfQo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD4D3033C6
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 19:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292478; cv=none; b=Ckq1nJUvJFshXqnLMmw26q9OpPsML93kAmpBxr8D12+2c3RuAP3tW+12+COzImceK78cnbZopDZU43yAAqvQoGRTSUqvNUmpL9WNe2ru5ZzMzLzxJPHU5xtc6BXnnB06S4ormWfYBMOgDqgXkbk3GEW70DsdbnABecD9Wr3Tgcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292478; c=relaxed/simple;
	bh=6Ah0GZtHWlJhWUz0Crf58vbcXv+9COZbbw5o4RQlGLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LgpvuvJatqhsQtOh4xIRZD0srJh8pnTCZr91QaxHUHnYX4PJRafKk2m29k8Ijszp9nh5QSu4g4zVBVXgivMSstkz0vKBpIufvePe+kEsbF7o/5b0ysDiBHD/G33LF1cWx/CSdwiCizaoLraaFWIzPT/SuJgHdHyaPg9GPatw7Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pQvrTfQo; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so29898965e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 12:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774292474; x=1774897274; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dY0rDhZYHoT7nVKeHkYiyNCYW9aaueyrXJ7hodb5Gwo=;
        b=pQvrTfQoDiEqCCfLKfBdnARANq+47Xlx4PQ+DdIvXgz6/nugbiYqaJyuMuoEWN49bo
         g1IH21IsjBUrLmE3FoyC1XX/MUMGYZFkKUpkrWLEdBnh+KsAnVHx8gClFxok8B0qAtwh
         KxrTim92YmrzL21jlC/JXyfTw4cMGa4gBETQROt05pmkUOPKFo0Pc30yREiSVHTgOXPR
         lgtgbxgfcLp7rs+Z9Famwo3HWEkJBIGyK33oYQcSZgb85Zpjg1/Qt4QeJ9Yo3Nbsxjaz
         9sMYs1m+KCqHwWnZccoJQQaXHsLc+jqncMJsiqt85+daZR6RI9XdLgkyNKUZzhOttjzn
         rMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774292474; x=1774897274;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dY0rDhZYHoT7nVKeHkYiyNCYW9aaueyrXJ7hodb5Gwo=;
        b=duFluMWO6rejvh/7aEGDuy/PIpZfXBbDNWKcta0oP+d15u2OnG0wOP3DqwQ5cGLzdQ
         6xTY/AhWcPZcBqJdDBnElz+jeBH/jdZg3CrhJA9h4z6b94oAWgH5uavcA1pgr593uRof
         0x68uBVc0LF58kNEL9x4f/ygTx7/dWrsdzYaFlCkPcwaM9zgIZcP9dISE7HwPfhOMjjN
         p/NcxJXBhpqynbmLMzM+bkj74ZbDHt8k0Lkdc9Qs994QN8ewYbYw/14VNGJvgpmge2x0
         /6NAm7hEaNDKRxUy+KabmTvV/XgQG5+hOMG1WFm6zBRvgK19xIbkn8uDFfuJmWDkqYwz
         8aHw==
X-Forwarded-Encrypted: i=1; AJvYcCW9ubuMOho5BGVAJxZswUQYCNaFXGdWZdmQUE6egRv4Gl/np01x8wxXqeMGfA8+Rg8yRj8owfySvBik@vger.kernel.org
X-Gm-Message-State: AOJu0YzbZ2jvXCv5Y81OO8Di4r6ZQLazIeX0dN2IXIsqno6pIM5Txlpl
	INkHAfOGhw1b0+BrUB3G0t46uK3XCVC4mJ6hVSau6yBsSXtPr6/9X0CGuDgYU8PGQS0=
X-Gm-Gg: ATEYQzzZz0CFb/9WOeTzDiMzDGqkQBlVZLqFXZhKVgHyZkRtEsA80lasSoD+3P96gOP
	Ta0yalE82q59BWQzlIpZmfE8E7A1jLMKEb10YyDGdG7lchm26clEN0gTwoA+/qckvUZhUkNyiBS
	cgm/3dNc1CB1K+DNKG62EY8AbeYGTY1jvoITYG2PM9JxY/csTewekyt0iUnhO2gWkS/LmZgaVFh
	3Xg5fN8CREKxWkRkLYd74VqmpjjEtfuqPLwtSvT+7bMi1EperRKkrkb5wJU72uM8KA5x0Gb56Or
	8UvchYLQeyd+LOdB8a+UQWi6tIviCsKnaWIau9Pn9aP1H9sMJoGO9MIV8qYTvANOXz2XXOz9hxw
	W7LN+UKQunDMVX7AocTQEt+Ao5vEcj93WTSUvsYb19DQJOdmLxH/L0Z2mrjykk1HtdsT1k5pLXi
	G0yvsRmW9ejik2Ho7Yw045CexPSODMOR2AjgaupJE=
X-Received: by 2002:a05:600c:3554:b0:486:fc4a:2951 with SMTP id 5b1f17b1804b1-486ff01d7f3mr173323405e9.28.1774292473972;
        Mon, 23 Mar 2026 12:01:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f83c84fsm999765e9.10.2026.03.23.12.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:01:13 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:01:10 +0300
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
Subject: [PATCH v6 1/7] pinctrl: introduce pinctrl_gpio_get_config()
Message-ID: <b39885d11c6833e3524a19350f8e69cc43a9e975.1774283146.git.dan.carpenter@linaro.org>
References: <cover.1774283146.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774283146.git.dan.carpenter@linaro.org>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34048-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: DE5EA2FBCF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: AKASHI Takahiro <takahiro.akashi@linaro.org>

This is a counterpart of pinctrl_gpio_set_config(), which will be used
to implement the ->get() interface in a GPIO driver for SCMI.

This also requires that we create a stub so pin_config_get_for_pin()
can build when CONFIG_PINCONF is disabled.

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
v6: Fix build breakage with !CONFIG_PINCONF
v5: No change
v4: Fix kernel-doc (Andy).  Add r-b tags
v3: Forward port

 drivers/pinctrl/core.c           | 31 +++++++++++++++++++++++++++++++
 drivers/pinctrl/pinconf.h        |  6 ++++++
 include/linux/pinctrl/consumer.h |  9 +++++++++
 3 files changed, 46 insertions(+)

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
diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
index 2880adef476e..659a781e2091 100644
--- a/drivers/pinctrl/pinconf.h
+++ b/drivers/pinctrl/pinconf.h
@@ -74,6 +74,12 @@ static inline int pinconf_set_config(struct pinctrl_dev *pctldev, unsigned int p
 	return -ENOTSUPP;
 }
 
+static inline int pin_config_get_for_pin(struct pinctrl_dev *pctldev, unsigned int pin,
+			   unsigned long *config)
+{
+	return -ENOTSUPP;
+}
+
 #endif
 
 #if defined(CONFIG_PINCONF) && defined(CONFIG_DEBUG_FS)
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
2.53.0


