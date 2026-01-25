Return-Path: <linux-gpio+bounces-31044-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NNqLmR0dmmvQwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31044-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Jan 2026 20:52:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3498244B
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Jan 2026 20:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8270830053CB
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Jan 2026 19:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2CF2FE59B;
	Sun, 25 Jan 2026 19:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwGRjLrI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02E22FF150
	for <linux-gpio@vger.kernel.org>; Sun, 25 Jan 2026 19:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769370703; cv=none; b=KUVljzbJFr+43bAM2HOtUnSXUjLi1Uu5MsSeIb15T+Jj6a/LPzdV2JyisVD20DDhkcaTdVTDOqZpqyxXTzFqH/74/apt5WAXX68xHgsUyUuejbYyNR0svHWqqIgjgk8QnWSiOWPkvsGU/fGoEGvRrSVTVD88DsUlqvWW1owOcWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769370703; c=relaxed/simple;
	bh=tQ0GUXHlvLjzR+49qpOK5aB36nhWTrg04e7AKSsJQxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P3tcgjaV6XtXziVP3G5m7BpT29hnIBGiRqRXKo5JP6YYl5GTggaf9I88BeqGC30ZhuDFyC2uI85pcMG6MqaVdUz9/tVuR3kXW3UZUlBNFFrGZqw0KYrwh3ocgmfuyDS0rGb9dfvBpLpe1e6AYWTkb8o6E7vf32a7SBP7E4E83eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwGRjLrI; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b8860d6251bso330233966b.3
        for <linux-gpio@vger.kernel.org>; Sun, 25 Jan 2026 11:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769370700; x=1769975500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+7+mKj8XKCXDrFYnXFD6aPpUYuOrtmLT/xGxemFmLg=;
        b=kwGRjLrIhDKmLCesfcvfyV6Usw5qEMyHLBTuuN/ipdTDJfU3WAUL/hkytQdUS/Rxmq
         mKeyFMYH8javNmGUXkpTUqp+14X0cxKQUat6Tq2OIlCArrDi3nH+8pRUxiTthofc+QeP
         hbJelIfSlV/fWo1qCQKKECGu6eN5jWLDbb6NjzTX4ExfXkBqmeUb1RLG5rQ8KXYu1F5U
         xihPy+ZS3p45ddht7nx6VAt7rpN6pS3QAXCe7Cu6ntrpDVGLTSDA8MSFZXqDnvy5KrDT
         d8IWIac5Y7NuTh5RHdLf3bIVQZKzvb8NlJx2usYqPDVxmp92FxllE2J5KvLBiQoYDsZy
         StSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769370700; x=1769975500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E+7+mKj8XKCXDrFYnXFD6aPpUYuOrtmLT/xGxemFmLg=;
        b=Wql8IqimfYYuAdN+QYhBmqj5M3nlFCB9OU2MAr7QNIp44DWc+4FxWsUq84Gxfk27VC
         p12RarInLkD5wz3fS77m1i1yMSPTZRLvmrEY+PMu9gUS4YjZKOnZoW6UDll2ieNlTl1l
         4ZOyQrgpP9+90kgHzPZilNYIr4aK8pl6G+Z4rUmUxGvAW1u6Zs1BpZP7DM1/Zsg0kw17
         mW8oJ+fa/QJidfzW6HEpSfLBwFwB1hWx51QLiwPwpl/pZivSNj/26Upa0pDKopxe56Zh
         1vyoLGbAY777TcBiduBh6zkABuYL20oZzadMCEuiyEFg1AEtEvEZxQiYHv53Z7BA0Ch9
         i3Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXx9XhFzxUnWJB3yGjGOAWkIcie/0h4IA4vvISzrcdS5u8SxOUcTGn7WAP0H3SB4sDD+ACK3HOlZ1t/@vger.kernel.org
X-Gm-Message-State: AOJu0YyE74nAZxwZfQvROSH+sYi1xJsIYeBQCudFqbepD2kEEyNloM2B
	OiT1nHsCrZTsgdV4PI+Nsk4cebU4bFOCrJvpCiv+aF9hfJXVhbsnvDgB
X-Gm-Gg: AZuq6aKU2i0US4izoHA09AsuCDV2VVVTB2EuzCnKqCoaRmoWYD+9+EYbVp0sB1lG1f9
	CsB1RJO/Q/XgUwbcF1eOYfBzH9Tg7/Pd4h1my9PGVT8lEQdhYRxYgZEDnCutD4S54sSRLVACHi8
	e5sLKCfDWhvgOGc9ipj9o2YUp1RE8m/0U/Emn6UUSBIOT0CE/y5pdX4WyaeHlHgmOPr+Pyv9Bbd
	dJQFi1yH81GJSBS6ztz8MClFMg0uxMy/xS+VocSV30lPXTznXtmuWmn/TzXRm7xONwnpf/Js0J1
	pEel2oGmqtPygIRWdeuOTOaELyjvTC6A/aAM+dXvz9zvMUXf0h/kYvSPRyhfr93eJaua3sn0ssa
	/vY1AhpesKjagfnl5vp3iAqYCTYEriS7L4my2iKnVCdIT9HczZhjVN9P7cMISoOPiVjQl8ZNjEy
	voJ9uj6cORMBGvUAlGpyx6O1cg98COJQpJiQ==
X-Received: by 2002:a17:907:3f0f:b0:b88:4fc9:a196 with SMTP id a640c23a62f3a-b8d2e85e0ffmr170791566b.34.1769370699647;
        Sun, 25 Jan 2026 11:51:39 -0800 (PST)
Received: from C-PF5D4647.localdomain ([147.161.248.108])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b965df4sm4010232a12.31.2026.01.25.11.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 11:51:39 -0800 (PST)
From: Jie Li <lj29312931@gmail.com>
X-Google-Original-From: Jie Li <jie.i.li@nokia.com>
To: wsa@kernel.org,
	linus.walleij@linaro.org
Cc: linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jie Li <jie.i.li@nokia.com>
Subject: [PATCH v2 1/2] gpiolib: add gpiod_is_single_ended() helper
Date: Sun, 25 Jan 2026 20:51:22 +0100
Message-ID: <20260125195123.248798-2-jie.i.li@nokia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260125195123.248798-1-jie.i.li@nokia.com>
References: <CAD++jLmGMWjCD0gUcaJPuK0UzJa7nX1bdoVu-BA7aHAgcLTSpg@mail.gmail.com>
 <20260125195123.248798-1-jie.i.li@nokia.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-31044-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lj29312931@gmail.com,linux-gpio@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nokia.com:mid,nokia.com:email]
X-Rspamd-Queue-Id: DA3498244B
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
---
 drivers/gpio/gpiolib.c        | 22 ++++++++++++++++++++++
 include/linux/gpio/consumer.h |  5 +++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1578cf3a8c74..96c34bf65c7e 100644
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
+int gpiod_is_single_ended(struct gpio_desc *desc)
+{
+	if (!desc)
+		return 0;
+
+	if (test_bit(GPIOD_FLAG_OPEN_DRAIN, &desc->flags) ||
+		test_bit(GPIOD_FLAG_OPEN_SOURCE, &desc->flags))
+		return 1;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gpiod_is_single_ended);
+
 /*
  * Add a new chip to the global chips list, keeping the list of chips sorted
  * by range(means [base, base + ngpio - 1]) order.
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index cafeb7a40ad1..c5847c8f66fe 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -109,6 +109,7 @@ void devm_gpiod_unhinge(struct device *dev, struct gpio_desc *desc);
 void devm_gpiod_put_array(struct device *dev, struct gpio_descs *descs);
 
 int gpiod_get_direction(struct gpio_desc *desc);
+int gpiod_is_single_ended(struct gpio_desc *desc);
 int gpiod_direction_input(struct gpio_desc *desc);
 int gpiod_direction_output(struct gpio_desc *desc, int value);
 int gpiod_direction_output_raw(struct gpio_desc *desc, int value);
@@ -335,6 +336,10 @@ static inline int gpiod_get_direction(const struct gpio_desc *desc)
 	WARN_ON(desc);
 	return -ENOSYS;
 }
+static inline int gpiod_is_single_ended(struct gpio_desc *desc)
+{
+	return 0;
+}
 static inline int gpiod_direction_input(struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
-- 
2.43.0


