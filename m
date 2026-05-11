Return-Path: <linux-gpio+bounces-36532-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2K7uEbzAAWrKjQEAu9opvQ
	(envelope-from <linux-gpio+bounces-36532-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 13:42:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B081050CFB5
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 13:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 010EE3064121
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 11:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E33C3750AF;
	Mon, 11 May 2026 11:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWk8x7KV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF894372EFF
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 11:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499456; cv=none; b=syZh7SqfRjaW8c8p1a8Lk7Pe2hzLWIQTzFunjsZqucOweHt5SyvMnYyMkXyCdBVqh49ZLaJt+LbeYus+Pi0BGuwUVndBUd8eInjjIfgMdr0nFF88SKY5ByQ29gsIUnaWIV3wMXh4wnQ66cX3eTkfgwaH3N4KFEmDdM9YX61STtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499456; c=relaxed/simple;
	bh=kT9wOZIR2Wfh0ZigYUA9rtm7wCF4sP8fJbMh8roHmiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HpUZRgIExEEqLcx7z+FzM+qSuqYvYOxd9Kk+y/ZAUor6RkqT1eZvGuTcTTyY9IyyQkmrBeQ+T0GseqBVXvt7/ZDH76ZnnuEnyMU31iw45SiK2z6efpbnzkb+JdT7w5eauHfNOIHAuc8hKEBZ6ZmU7bY++gYWWRNofjMW0SSUTOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XWk8x7KV; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a74ac8b40aso3798858e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 04:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778499453; x=1779104253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4imfVsi2VomO9FzKGpPU5riMSUcvWN6BNCMHeP3TKZM=;
        b=XWk8x7KVwgyTZH4FvnHCRysoOgZQKhh3WuGRBclKTwHdSrTqnjT0Tx/GuZ8RvclYqz
         oAaxNDqiUdSumB+CFa3fTf6DGeV79uF78Vvs+wTaCs3XAhS6GeUIHTuUcgoYtGzxCe0A
         fxsHXOm5zkRoShoCCb5S+tdawfnKUKsIiS65QHi/gojrx687bQtsNsapvp3E3++94ELo
         7i3RiGYAJVzvCVOjXrORsgf/mP9qQ6lZWtwq2O5iF8mAagi8dad8xyD9BT9zJvia1t/7
         VlVFtdsFlP3poHCVES7rW0Fy+CRAJsHWvQThlY8BYFE8PdS99URQvbRf8biklbTaL3vT
         asNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778499453; x=1779104253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4imfVsi2VomO9FzKGpPU5riMSUcvWN6BNCMHeP3TKZM=;
        b=Mez9V8cFfN86NG3R1BjfX/67yvqc8P3nN/E7v4QeRLImElBwlteQYFHTsYL7VI86h9
         WtT1kaXdK1XxWj28baNd+bDcwq4TLWUv4DK0DvV8+KnHF2f1L+zw/qgO1lveQsVzH5/b
         FsvoXdSlHdZ8n3pwxdtvjrMrxDURZw74aVIF6Ww1LBmfIzcTIsqeS/IwZxnLldm8nfSI
         DOTdKKmJougvcTKaP3ZvYsuzW3HmzD0D1QSb7Zz9hT24uvKOMWYJZhnqr3TILP5CYkeC
         DeVoA/8SvgAX4oJFs/N15dON6YDHURIl3t4G376I9wS3UC+5ljKsId2/4nS06Av/GpEt
         nILA==
X-Forwarded-Encrypted: i=1; AFNElJ9TeyOHeDxQ0jcESAP4YaYzdglihFo8NoBobxu+17mtc1zjOplygifzUlZ7gAoIRr9peNTvA9gqmDWa@vger.kernel.org
X-Gm-Message-State: AOJu0YxTZmvRoBKE7ipqvhnQdjblezeL2XLGsmxS2CmSMTtNpYsxyciK
	IbQICE77fgKaeCOvjMfBO/xPKzavsd5CcdW4MvpebPPzJMTDkvPKgMTa
X-Gm-Gg: Acq92OFM2s1hTnyTpc0hq4lEuzU5mQhCJvn0rtts03x1NH9JQiS2GFn/MLbw2UFo3ZP
	7eRSz3pqY4SQItOKJMJJNscl3UA49Yk1U0uGkwJ/WRUlNCAOBJPWL+F+BcijWR40fnqmVO+CdXq
	CsdtU81ZCuGucdmcCzdnZ9Cinks3pVZpI3lf1PaXpoMCRQpCDOy5JS3C6eaIJUHWNw3Nz1WOpXr
	AaRmma9RIRIgazt9bxlALdUFjX+qEEC0z6gn4zzW4OPcJxTK0xjf9jOJ15UlTMI13j02pboRt9O
	XtvPN0R6F0FDZ3bDD9J4iw9F3eNa+5Fl7Lyk64xVnlg0gWMl62i7t048068GOackZvx4SFBpyAi
	T8nrp8JrMWisVbVhDdfV3mGbds+8QYCzFjUvG+GFxIZQkVetAPxV1uIDMIJ/BdM3eNXZuXzVGvI
	Ehg+CVBvNH/U5Wgxk5tqM/yiMgkxCt0svdTd9QldRjPxw2fQ==
X-Received: by 2002:a05:6512:15a7:b0:5a8:8b42:4ea0 with SMTP id 2adb3069b0e04-5a8b6e8f5b6mr2253554e87.18.1778499452463;
        Mon, 11 May 2026 04:37:32 -0700 (PDT)
Received: from C-PF5D4647.localdomain ([147.161.186.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956b1cfsm2593967e87.73.2026.05.11.04.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:37:31 -0700 (PDT)
From: Jie Li <lj29312931@gmail.com>
X-Google-Original-From: Jie Li <jie.i.li@nokia.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jie Li <jie.i.li@nokia.com>
Subject: [PATCH v5 1/2] gpiolib: add gpiod_is_single_ended() helper
Date: Mon, 11 May 2026 13:37:25 +0200
Message-ID: <20260511113726.49041-2-jie.i.li@nokia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511113726.49041-1-jie.i.li@nokia.com>
References: <CAMRc=MfMcEbQ3kkW3fMn-jzDoT2xdJWjp2xVBVsu7n683_5g9A@mail.gmail.com>
 <20260511113726.49041-1-jie.i.li@nokia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B081050CFB5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36532-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lj29312931@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nokia.com:email,nokia.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
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
index 1e6dce430dca..69743d6deeaf 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -491,6 +491,28 @@ int gpiod_get_direction(struct gpio_desc *desc)
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
index 3efb5cb1e1d1..8fb27f9aa67f 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -111,6 +111,7 @@ void devm_gpiod_unhinge(struct device *dev, struct gpio_desc *desc);
 void devm_gpiod_put_array(struct device *dev, struct gpio_descs *descs);
 
 int gpiod_get_direction(struct gpio_desc *desc);
+bool gpiod_is_single_ended(struct gpio_desc *desc);
 int gpiod_direction_input(struct gpio_desc *desc);
 int gpiod_direction_output(struct gpio_desc *desc, int value);
 int gpiod_direction_output_raw(struct gpio_desc *desc, int value);
@@ -337,6 +338,10 @@ static inline int gpiod_get_direction(const struct gpio_desc *desc)
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


