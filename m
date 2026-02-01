Return-Path: <linux-gpio+bounces-31340-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOq3DYw2f2nmlgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31340-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 01 Feb 2026 12:18:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E14A6C5B9E
	for <lists+linux-gpio@lfdr.de>; Sun, 01 Feb 2026 12:18:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A576330182B1
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Feb 2026 11:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1344432936D;
	Sun,  1 Feb 2026 11:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0Uz3/IY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B602F6582
	for <linux-gpio@vger.kernel.org>; Sun,  1 Feb 2026 11:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769944701; cv=none; b=F+6PNd7ddY3wdFF321yk4l2Bg6mGKplWYTEWtKs6rMTTRIPYvQSYFM8sEoyVh9botDkpHuIXfGTVUyqV11cUk898lAVUjMj2bokzDUzkVzjH+q430lg/mNiAuGwc+k+38BmgyjI0bD1T+dvbpd78XFgKszQ/2lbzHmuNygdE2zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769944701; c=relaxed/simple;
	bh=nRpH/iLtlWIM8KUrHyohq2XqCM2gV6aIOs+uJYs9+8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J2JF/1HcAioJSAKa78xMjvV0cP5IHFXlPCKGqzqXXosJwjPAzLwxxQvf3eXDZ/cbzJougL+4Zx5bcKi2zjS86lpI96PM8QrOKQdAfXxxMrw9dmVn6MeanYoqDy6LRRHyh6EIjqm4QafeHNlCJORxE9oQqcBAqnYTipvRuXXSBJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0Uz3/IY; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-658d4059b79so5002927a12.1
        for <linux-gpio@vger.kernel.org>; Sun, 01 Feb 2026 03:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769944698; x=1770549498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RzDUpXasUz2gSgQY0FnUVtM7tN13xUWfydJ/oE+LZw=;
        b=A0Uz3/IY2Nux+nmg/MuAPWM20U1jhVlUS3GUTiQIUdikLB7L3UmkE8Bfd0smX5x/Ky
         2wOCm7YZkjBhC/7N1vWOjG/aelNNfILoji9wKFr1kMalQvvmIKF+zHpLW2NSgJJD2Ulq
         AF1GKLWx8+IHcMNJ9jlih8IWwWzapcYBypIkspkmh0HpLcdfNSMv0XRlm6PrV7LLD06p
         Db00iVOTpzJI0dPM0b4SxGPGJpIlsG9PQ5GLpjeFWag4L/QEIpI6C1yljgRUoNKjW4ZU
         HHdAyX4I1cruEDuGMiemQfsWxrQf0267Yro0eaL4Jrn2mlegKISvlGrkQk0AWDyXbjH/
         cinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769944698; x=1770549498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/RzDUpXasUz2gSgQY0FnUVtM7tN13xUWfydJ/oE+LZw=;
        b=XQohWNd71RWf7ZB9piVZBhmPUhJXFKI3iF5tImx8ujWT3brzf5I7ErTTeInmykX0Qi
         720GEQtYQkJHfojcRfDspERY6eXLfjHiT07c7NNvsuQn2tttcK+LNQIbfgdtdWrS2aOt
         LT/sItFgfcVrh2LS/tKplQzcYu0JEyaFz7wli62wG+uzJScpu4UiwrSBk2/9Zh4LoBlR
         vLfqD5G3/QKAsCfcyaiCKOoNrUhJ3z83/XzGuI2H1cpvvCyBtn8D5JuKFTM1tLxq/90D
         QQYi7MFuN3SmvUYBoBHO002BZ+I2fnJytg+BnaSn+lm5uGll9IZbn4jZHEA2viKs06N5
         YIJA==
X-Forwarded-Encrypted: i=1; AJvYcCWjfMmMsrn9dyBxghAnKSuoSIQZnaqcVzOnnRfPIhYOrOtoktJonXNFWgMYF+TQC/mM0F4nl3Z9h9yi@vger.kernel.org
X-Gm-Message-State: AOJu0YyW9xWRzvv2yp+GVZ75uqmMeuRqXY4nPWfq0e0y0zTO3Vtl2aEz
	1TAzNOaXpOGPRmwDLWG3wKeseGFOvJu0+Cs12fK/oIHtq4iMSB00QJ+L
X-Gm-Gg: AZuq6aLh74L5K3P+x04pFtuB+mEYtYF0rXLo4dS3PFJ8kt7zFaHDTCeogl10wBBhsTV
	WHIzC2QLjmxGlhNXYCxXuz2AYsOgCUgG1lMfeEcYPxdapep6XqqWjMX+DYh3g3FtXDIZLMOE/Pi
	gwAPa9Y61jEYn4viLTJ+Wc+TvRMCLafNzqc0TI3JVa7XJINLpfuPeTULQSKmri+eWn+ALrctykC
	y03S+MKmTVxlpj2mnOiGXxyuxHxQyUgW/g/zevojOTKugfmQwMOy/zeVKjIVYPSMItkbAKa4Utg
	uR9jxWgygaGFvpYyir2LI5aZro+WpYbW0jeCRGJ5DhqpNQr2mcsOKumdpoKL73lp/TkadqBkWyK
	RmuLPHXMZUTxF/H1tqxaQBW/lUQDQqu0FEQ5wDp8+Zk2wOjP8ax1Wu5QXWz1GY5FeUT5MSryY+8
	5erc+faTR4KQSveO8Y863P0x8=
X-Received: by 2002:a17:906:c155:b0:b84:40d3:43e7 with SMTP id a640c23a62f3a-b8dff514fd6mr457167866b.6.1769944698320;
        Sun, 01 Feb 2026 03:18:18 -0800 (PST)
Received: from C-PF5D4647.localdomain ([147.161.249.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2ed6besm714713066b.60.2026.02.01.03.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 03:18:17 -0800 (PST)
From: Jie Li <lj29312931@gmail.com>
X-Google-Original-From: Jie Li <jie.i.li@nokia.com>
To: wsa@kernel.org,
	linusw@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jie Li <jie.i.li@nokia.com>
Subject: [PATCH v3 1/2] gpiolib: add gpiod_is_single_ended() helper
Date: Sun,  1 Feb 2026 12:18:11 +0100
Message-ID: <20260201111812.18945-2-jie.i.li@nokia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260201111812.18945-1-jie.i.li@nokia.com>
References: <CAD++jLnk_5KG_q1aCtpOrTCbhtK-FxXH6BhPFSwukyt2F4uxmQ@mail.gmail.com>
 <20260201111812.18945-1-jie.i.li@nokia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31340-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lj29312931@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: E14A6C5B9E
X-Rspamd-Action: no action

The direction of a single-ended (open-drain or open-source) GPIO line
cannot always be reliably determined by reading hardware registers.
In true open-drain implementations, the "high" state is achieved by
entering a high-impedance mode, which many hardware controllers report
as "input" even if the software intends to use it as an output.

This creates issues for consumer drivers (like I2C) that rely on
gpiod_get_direction() to decide if a line can be driven.

Introduce gpiod_is_single_ended() to allow consumers to check the
software configuration (GPIO_FLAG_OPEN_DRAIN/GPIO_FLAG_OPEN_SOURCE) of
a descriptor. This provides a robust way to identify lines that are
capable of being driven, regardless of their instantaneous hardware state.

Signed-off-by: Jie Li <jie.i.li@nokia.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/gpio/gpiolib.c        | 22 ++++++++++++++++++++++
 include/linux/gpio/consumer.h |  5 +++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1578cf3a8c74..08e6960053f8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -486,6 +486,28 @@ int gpiod_get_direction(struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_get_direction);
 
+/**
+ * gpiod_is_single_ended - check if the GPIO is configured as single-ended
+ * @desc: the GPIO descriptor to check
+ *
+ * Returns true if the GPIO is configured as either Open Drain or Open Source.
+ * In these modes, the direction of the line cannot always be reliably
+ * determined by reading hardware registers, as the "off" state (High-Z)
+ * is physically indistinguishable from an input state.
+ */
+bool gpiod_is_single_ended(struct gpio_desc *desc)
+{
+	if (!desc)
+		return false;
+
+	if (test_bit(GPIOD_FLAG_OPEN_DRAIN, &desc->flags) ||
+		test_bit(GPIOD_FLAG_OPEN_SOURCE, &desc->flags))
+		return true;
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(gpiod_is_single_ended);
+
 /*
  * Add a new chip to the global chips list, keeping the list of chips sorted
  * by range(means [base, base + ngpio - 1]) order.
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index cafeb7a40ad1..12ef6e07ee1a 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -109,6 +109,7 @@ void devm_gpiod_unhinge(struct device *dev, struct gpio_desc *desc);
 void devm_gpiod_put_array(struct device *dev, struct gpio_descs *descs);
 
 int gpiod_get_direction(struct gpio_desc *desc);
+bool gpiod_is_single_ended(struct gpio_desc *desc);
 int gpiod_direction_input(struct gpio_desc *desc);
 int gpiod_direction_output(struct gpio_desc *desc, int value);
 int gpiod_direction_output_raw(struct gpio_desc *desc, int value);
@@ -335,6 +336,10 @@ static inline int gpiod_get_direction(const struct gpio_desc *desc)
 	WARN_ON(desc);
 	return -ENOSYS;
 }
+static inline bool gpiod_is_single_ended(struct gpio_desc *desc)
+{
+	return false;
+}
 static inline int gpiod_direction_input(struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
-- 
2.43.0


