Return-Path: <linux-gpio+bounces-31577-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8I3BAQL6i2njeAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31577-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 04:39:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BE0121077
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 04:39:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E3AD3098F89
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 03:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E2D34EEFB;
	Wed, 11 Feb 2026 03:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PxPDrieO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F1C34B190
	for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 03:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770780787; cv=none; b=YwSydMW4os/rLb3DkB/9r2yms1xcf3SauI1s2TlbWy1G9z7D+1sLP+Jh8IYJVdDvJzTFXjoJCEGsAbbwcRXdnU9E0TauPpDBugiuIgzR/t3hI8y0Y0Y87j/d0dmJbBMwK30U74F2egSXYmOWQVIJQjaJRaYdnkv0Xv4ZFMmotrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770780787; c=relaxed/simple;
	bh=3xxyAdFQ4zfemGIKkRYTysU+0s05CvAtJ9iA4ZUnhvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ecZB8epy4wyysg5s95/GYKPKb3FEweMHy5nFxbIPqqJ7sTBLbej8HKSec9+sMNqZ+u4RqLyG4SendyC18ulkz6GFtriYBX5yikkcJ/rmV5F91kuRj85F9ya8pVuPm5kasvsNwo8HD4T6cTkvD4AEPnbqfVzET4vsBvNu5Ja2RR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PxPDrieO; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d18dd2adf7so3793011a34.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 19:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770780785; x=1771385585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lqL9RDMHFR3WoHQnRB4Y8oAV8tGCe4j0xxAYm/MQPvM=;
        b=PxPDrieOvaGPN7tUwX9VBpfMIMSmqqLGzYpi5XPnEcKkauc6ZOJAJZe5N98w0puL8Y
         FIMrOl/NOWlxm6ZJzE0fNqxhvYEloUfe57/r4ZdqZPNTNJhcoyxOYJ1miQM2+uEHicmJ
         A/FR+dv8AfKNuk0bazz4DOmlEDKa9bAG3BHjlZpGRLYsF9BqY6H8xShnAjE3jDMXgI7R
         fBqpAqpACDwrmaGvSUidI8BqycJRfAyOc+skXlcU2NjUB8pgnX6e91VWzmLIwQwZTbt/
         REIcyMT+RZpvLYgf61dHqXtKhSa8de95/TxX7b7yboRDrVx/Xq4KwROzrjc3Uv1bWBy7
         2z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770780785; x=1771385585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqL9RDMHFR3WoHQnRB4Y8oAV8tGCe4j0xxAYm/MQPvM=;
        b=StpdQ5cDCEqNyO79li+EdvSWZyDCFlUlcRL5ZCEEXUVLM4CjZnB8nCM5v8zr73r6ns
         euF1TqYSBXit8ESC0RHBGIugTxyuHZIsvWvI6rryQC9AM3RQP6rvZ+RvIlTYtH7YoskO
         jRPlbXjx/K87JRB4ByGlFd9p6ct92dsLFvgw2LZd+9QMt9jA25c2zMp8LoJ22ZHDhqyo
         6WfqK/1l8PNEmnyq6J12orlsVSFFBJg+TYDJWN3CfrIrx/foCwMoN6cUdO1fxYHwr758
         2KJbqf2jYmHQkHFZW+6Cqcfgap7YvZj+fvGkuTLCJQ8pF0H1wOaA0tb3ODd0nvvEYjU2
         0qTg==
X-Forwarded-Encrypted: i=1; AJvYcCXal3Ksjy58Hj03OP3uppZ9ayDmqHRJEbSsuZZNzeyEMSgNdvmnWjQsdEg6U9vHqiIqw+MYm4K4kvXp@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2PAGAQKbVsOGBnwLKRTiv58FOIDiEBFU+aSSF45XH96Tktrql
	mbcEw+pD8VYtaTEwuRGOFqvvJS4FH1tc8d6/TFfGAIikUISN3+bXzwDk
X-Gm-Gg: AZuq6aLUxDhAFyTtMOmIzezkRluXqqgA2PtBvKTb+rP1GzieDD53NwmOZCqMR2lndYT
	4yXgP8cD9WPrJZsJupPyiDEhcwMW+m6Nd7hwZSXLlTkkPpuo2N5Yf7JnsCpIQ/a5PFGordRqN2W
	7ZoT9E7ugv7aKN0tIyMdSyMkN+VYEeaWl4mtlYpZdOl+YAFC+F1CUFYhLM6L83ZkBAJtZtsDQY/
	2WtJZE9T2Gs2HEqc+Ss8FnZbR2eZictUFbH37TIZxgesfv85+x3NFbr8hKanvyMIa5IOkEZQGqM
	gL2PxGO65nZ2ku9A/IHU8fpY2rakGNbkkKrvJ+h7DwscCjBEeWkS9Gd0qF26/vIHr0RIj6C5gar
	U/9NXOzEEKltjlmQ47T45wADkiJ7JZfPq6i4aC3VXLdlJaaumQoXwrVMqXnXPl9fHnqK9Ifp916
	9Lyx1zRWxYsexk4RTRfZOzj9XRbCwbqSiDgay7qmTs5eTFjq6q2ZiIK8565NrU8tZ5a2tZmSnaV
	zIWtkZG8rL3eFlE/BSva+DCgNPGc36DNwO6nuW/88M7P1e+cjNRYvTEN/kPFa0=
X-Received: by 2002:a05:6830:4494:b0:7d1:586a:32a2 with SMTP id 46e09a7af769-7d4a73cc7c1mr381970a34.0.1770780785557;
        Tue, 10 Feb 2026 19:33:05 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-26.hlrn.qwest.net. [71.218.105.26])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4a75309a6sm438236a34.3.2026.02.10.19.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 19:33:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: linux-sunxi@lists.linux.dev,
	linux-gpio@vger.kernel.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] pinctrl: sunxi: add GPIO get_direction callback
Date: Tue, 10 Feb 2026 20:32:48 -0700
Message-ID: <20260211033249.2770281-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31577-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,sholland.org,lists.infradead.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jameshilliard1@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 80BE0121077
X-Rspamd-Action: no action

Implement sunxi_pinctrl_gpio_get_direction() and wire it into
the sunxi gpio_chip setup.

The new callback reads the pin mux register and compares the mux
value against the pin descriptor gpio_in and gpio_out functions
to report GPIO_LINE_DIRECTION_IN or GPIO_LINE_DIRECTION_OUT.
If the pin is muxed to irq, report it as input.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 0fb057a07dcc..424f23be27b2 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -995,6 +995,37 @@ static int sunxi_pinctrl_gpio_direction_output(struct gpio_chip *chip,
 					    chip->base + offset, false);
 }
 
+static int sunxi_pinctrl_gpio_get_direction(struct gpio_chip *chip,
+					    unsigned int offset)
+{
+	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
+	struct sunxi_desc_function *in, *out, *irq;
+	u32 reg, shift, mask, val;
+	u16 pin = chip->base + offset;
+
+	in = sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "gpio_in");
+	out = sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "gpio_out");
+	if (!in || !out)
+		return -EINVAL;
+
+	irq = sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "irq");
+
+	sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
+	val = (readl(pctl->membase + reg) & mask) >> shift;
+
+	if (val == in->muxval)
+		return GPIO_LINE_DIRECTION_IN;
+
+	if (val == out->muxval)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	/* IRQ function is effectively input. */
+	if (irq && val == irq->muxval)
+		return GPIO_LINE_DIRECTION_IN;
+
+	return -EINVAL;
+}
+
 static int sunxi_pinctrl_gpio_of_xlate(struct gpio_chip *gc,
 				const struct of_phandle_args *gpiospec,
 				u32 *flags)
@@ -1603,6 +1634,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	pctl->chip->set_config = gpiochip_generic_config;
 	pctl->chip->direction_input = sunxi_pinctrl_gpio_direction_input;
 	pctl->chip->direction_output = sunxi_pinctrl_gpio_direction_output;
+	pctl->chip->get_direction = sunxi_pinctrl_gpio_get_direction;
 	pctl->chip->get = sunxi_pinctrl_gpio_get;
 	pctl->chip->set = sunxi_pinctrl_gpio_set;
 	pctl->chip->of_xlate = sunxi_pinctrl_gpio_of_xlate;
-- 
2.43.0


