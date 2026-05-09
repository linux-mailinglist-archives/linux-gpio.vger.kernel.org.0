Return-Path: <linux-gpio+bounces-36484-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAM8EpD6/mkN0wAAu9opvQ
	(envelope-from <linux-gpio+bounces-36484-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 09 May 2026 11:12:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB28D4FEF1E
	for <lists+linux-gpio@lfdr.de>; Sat, 09 May 2026 11:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D8AD301B701
	for <lists+linux-gpio@lfdr.de>; Sat,  9 May 2026 09:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA7239935B;
	Sat,  9 May 2026 09:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOFZrX51"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261513939A2
	for <linux-gpio@vger.kernel.org>; Sat,  9 May 2026 09:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778317941; cv=none; b=nIWUSeC7Mpb5F3AZL87dky7N/Xvq3S5IsbgvCeoC2OawXiylDVh48KmoXoU/pwzeaJmJxR0tosfph6rMyVQuKv6yLVVJ++kKqEDxOphAjl7okYkin8Vjcxc9Y5U5Sdee0jObqaBy2A3sfP+THZ3L0FeeJYuflDQj5DECiW7WRH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778317941; c=relaxed/simple;
	bh=kT9wOZIR2Wfh0ZigYUA9rtm7wCF4sP8fJbMh8roHmiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d8bMuJgjYfULrrdBxZhl+gPO5qTcB8iazZoGHPMb/roXZTjg5VGd+MXXtJBUB9aLBIRwLlESSQuxWBoqaWBzH1ehG4CjxWvDoACBt9Yudepeky1P9/RukGFNePWUmLS1JVExaBg7GvUM9DnvVrJbx+ILpx9UtjIGJsjaTSuxgXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOFZrX51; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67e9b3037dcso3257231a12.0
        for <linux-gpio@vger.kernel.org>; Sat, 09 May 2026 02:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778317938; x=1778922738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4imfVsi2VomO9FzKGpPU5riMSUcvWN6BNCMHeP3TKZM=;
        b=XOFZrX51tARqx+WMuQE+aP+J9SRmLZoSnkM+ra9RUPA8JJBDhw9zHobJBaGSPaXbdU
         0zb4UMYDmxdsvV06uFigXEuYTG/uJClDhtWIQeHQUo25z/2HCb3kW2eGdOVOP9WsRilE
         kIuuz+bxHOii6/H02br6k3MERjB72jP8xbQ3d8VlFLBdA8LTs2tgDheekEU/r4KJPAOf
         S8t82uTq0/KC2JCPOZWFaIs/JRPq4lYNU7+q/QLYA0Iau7Ah7jGwIIk3EH1cNumTLUlK
         wpZiAMocKgMOXyHZcfbYFRmDGVtcylEQ/K7Id9GmeO3Dmc0Q6pjmswQmROw2l+rsNJ5F
         Gx/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778317938; x=1778922738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4imfVsi2VomO9FzKGpPU5riMSUcvWN6BNCMHeP3TKZM=;
        b=I9aorufbvnFWpkt1X0d2JhwQf3EkG+/5qwKSmNkLVgvOxDUiJwYUsbuHGFdcHeQWfH
         ZRT7/NNVlm8XUm7fc92h4aphNhLvHjxy7rBRMKiTOdeEj48zYQFDovmpIEB0Jo+lc2bS
         fXOnmpIhBVWl8Xs+5rSPZyl1CY6Wgyx4Q9DEg94H7MWx6M+PKbuQRjndgu1ydR1O8Rq0
         wVgL5APk0RRWRAnyI/YE7AXaKuTOTDuo2OPyYGXfJM+CzmP46R81dcQVmhCmZfyu4IMR
         KheehhbEGIUEVsX3JZyCHgDHmTAl4YVxkryDvTOxKekhpDcKaMAtwZwY47eRrWo+Ineq
         HMuw==
X-Forwarded-Encrypted: i=1; AFNElJ+X4Vdo1jn1M+QP6M+NM2lHu+Y7w4V/3DTOWoVtO/YtbJx+rmXqSSFYbxbTHYPkRodBLsaH7FzBV/+/@vger.kernel.org
X-Gm-Message-State: AOJu0YwbrhQOs7bYmAq9F3CVpFIlbPs6RTOLCGFAHt3MDLSPfF5/Hd9b
	vw1NzsQzDgP+nwkumX5LeX05bm2G6i/WPcBFQ71CjLbKTBed05iXZ+YARaa+fw==
X-Gm-Gg: Acq92OGBrrzoRY4TsOuBAK+XNUtbZDYklkVOi8VbslOepYJAPiYJ8InykHnOW9ZPded
	rWEIjNdilelEo8G/OObs326zg9JKYU1pIJ2VulF0ZjHSe0X4dtw1wC/LfdMagFrfOGiNafcywSg
	1JVO0dz+Kx5XKjYxCcObGWEkrRQM+mPsKiuyfSwIMxyR5dgM3tPI3+Y9uaDM0QERgCZqjqlkvJ6
	yU06JIPmxISd3CWp1nkp2asrsBlokPwGpRr5wj5/zcVjlGdWBxICZl0eTF2xytlWMZOGhreffaZ
	VcRfdDvMCox3O7kjAltqc7IcVoi9AqluIIZ4G1X/TGhnG0hFKY8yRXF9JTbya3NjWmYQ/RTu479
	BXIksbXPJ1/yHLD6F7L+0L4ahd9UFGtW/XX56nwutjqe/VDW4PTmbR4uA4v1SbbXQZLJ2PZAo2o
	7YJ8biLoax84/LmyhS82ahuFIIoH63CZ40LiU=
X-Received: by 2002:a17:907:988:b0:bbe:37ee:8a2b with SMTP id a640c23a62f3a-bcaac454c4dmr348565366b.33.1778317938239;
        Sat, 09 May 2026 02:12:18 -0700 (PDT)
Received: from C-PF5D4647.localdomain ([147.161.248.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac3f66cadsm203819866b.42.2026.05.09.02.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 02:12:17 -0700 (PDT)
From: Jie Li <lj29312931@gmail.com>
X-Google-Original-From: Jie Li <jie.i.li@nokia.com>
To: wsa@kernel.org,
	linusw@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jie Li <jie.i.li@nokia.com>
Subject: [PATCH v4 1/2] gpiolib: add gpiod_is_single_ended() helper
Date: Sat,  9 May 2026 11:12:07 +0200
Message-ID: <20260509091208.18346-2-jie.i.li@nokia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260509091208.18346-1-jie.i.li@nokia.com>
References: <afiNrr4Llm0LWw-5@ninjato>
 <20260509091208.18346-1-jie.i.li@nokia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BB28D4FEF1E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-36484-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lj29312931@gmail.com,linux-gpio@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nokia.com:email,nokia.com:mid]
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


