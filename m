Return-Path: <linux-gpio+bounces-29679-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE16CC76A1
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 12:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3215A304B941
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 11:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BEEB335565;
	Wed, 17 Dec 2025 11:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jsLi5lji"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E7B337B81
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 11:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765971911; cv=none; b=ePFax94O7vtul4lfIua4oarVkwKIGv3Gw/+z6XNgq36vGCX9dOXW4hkGSFBV6BjMbbUC8IkLTlr/Wfz+xF1ssvwoJf1Dhge96Mg9b9KVJzmeOekVj76r8Atlta7Da4b0mGeS2d+k/RK971NG1tNGUsv873q5wEYes7OhRjogWr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765971911; c=relaxed/simple;
	bh=5tv9WUe99CXC2tSs++XfOUMvucb7NjbIqfTNZKvmM6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U1+6d6BxQ8xDeKOdmDH4uP7S9RTHl1mlxVv2hSV+Tinhxt+b9oT6tZ2VCpFljfcZZSbTMv6XHH5unWtKLnyHtSSKrlLsMzVtNn9c6DJp0Qb/o8+49OPIwfHaNs+AFAmV35OjueforiV/8h2roFkKU5h2qZiwcVGdDjcx2wQ02T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jsLi5lji; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6492e7925d2so6719172a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 03:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765971907; x=1766576707; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HT2fiB1zZ1fnCbOkczNw72l9WJDph7v0MzbB4Cs0Gw0=;
        b=jsLi5lji5Uuh9w2Gob9z1/gZM7QHGlvCmCPUmcTW8F2JVJxqUOR/7vh976MVrQxmAF
         F+f071UvrJZ99Cq5sErNgwg0uFwzGCh5ER+1KLcZuiuymXG56RRaEbFZ0jAmkDiHL+jA
         GxdvorjdnqD+MlXwDaX9gOxBrpRdHjpcO2XhiDnbQcjpV+dB8izMlfxZhTAs05sOHHKC
         LJhLN8veuSjm9jo+8zfZvkA6b1R1pqvWsMUvgJEM/bWITjTcGxe0tmcIOKYLuHK3ZgAU
         FA7GGfcxmeKdyW4w19/OnJ5HcdKnu8D9S78it7fTq0pAaX0lIxNxoFE9EitHEq179ORR
         DUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765971907; x=1766576707;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HT2fiB1zZ1fnCbOkczNw72l9WJDph7v0MzbB4Cs0Gw0=;
        b=VNsSsNES3tmRRZ0RWCAW5sw20Rq+Z2kkuhJrPF6qymi0zAznFWibMBKVgO1xmT+WyI
         WVCN1VnZTxK13PguhEKvoH7iO2sLz4IB5uU45jWg3f3r38sIFHihnA0Z8FRetmwRsMn/
         BrahlO8UjS4QvYS8kqIiAuMkW0trvJKGhN8ZvgQ8d0DNU7zY7ofHlcgLXpXf2svk3eMh
         GPtFKPHStoZtsGTEySK09BKCi2wXnaj+8fHEn63XXFd/BzOHPWYCArn/aTJXQXkojQK/
         XXKhkv29DEmf2csS4zxDsEHwAuzaOeQ3npAhLpqQrkI/T5lqaSSNu/AKUxvzGJF1BVS4
         PJwA==
X-Forwarded-Encrypted: i=1; AJvYcCUugpK69ViqYLqRNSA0Ejb9cKnO7EW9ddnEtFgj+gt/7MPJnur++XiVQUj4HhPo3E7Rf5OD98qxx61J@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1nKV4M20Uzcqs1Nhr+rf9h35CHYZT82zNJbFfpDPzmKXlMdIA
	E4unVi0SfcBLnvM6e2xG6rbRV+phBmooi7fzEuX7J8jmH5DitIXK9cZFJVvwAsevDEM=
X-Gm-Gg: AY/fxX7JQqg0xiH/lyZb+ztb5yZPegFIqlEtdITTjNqXhz7Ax8j1i/gSPIyTAAxuNUr
	9qciuEcOBypUg3jMWqchJ5QRGLVIX9bBGeKjsFIT2Y//PUjGLMv2/027EG0mmQCDVUwQTBiCCyL
	9B5LsgJYdyF4ljZBj2yB/TB8PUfmd93UnE5Ca4VtLalf9ZwHBgfT8YH44boaxIUxpC25Ii1F085
	8qzo4Z4PdZcLEONpHly7164qLBUajGGKB3xMWeLXLk+yeI7LqB9uIQjQLv4SJz6gmql8OcrowqX
	4r3cZqN0KmpaBadNKKQhSjqwIc/7XfzvUe8MLxg4a2+eaQPfIUJgCrSkp7nY/M77YOGdx8ogYpZ
	hggVW8AhGMyKvMhaVl88nWBhp0y66cX7mhl/xXv6eM2B0iS+6PEtZBgsZc5+VK6jS/a8NKxcRl6
	/Hb05SN+kEeGD3hAEWmfLpXeZwZ/7vkrVK3vxjN4N3oYGavN0OI2kW6NkRLnczoJVqDZSq9s9tS
	fpqUA==
X-Google-Smtp-Source: AGHT+IGa+Nc70F615uOeMiZvdtNzdPPc44HI/zY2XG42QXwRt+kdadaYoi8+VmaX+1sMy6cm6ndZiA==
X-Received: by 2002:a05:6402:5243:b0:640:ef6e:e069 with SMTP id 4fb4d7f45d1cf-6499b118a26mr15688931a12.1.1765971907152;
        Wed, 17 Dec 2025 03:45:07 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f4f4aa2sm2181212a12.8.2025.12.17.03.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 03:45:06 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 17 Dec 2025 11:45:06 +0000
Subject: [PATCH] gpio: max77759: drop use of irqd_get_trigger_type
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251217-max77759-gpio-irq-trigger-v1-1-5738953c1172@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMGXQmkC/x3MPQqAMAxA4atIZgNtpVS9ijhYjTWDf6lIQby7x
 fEb3nsgkjBFaIsHhG6OvG8ZuixgXIYtEPKUDUYZq412uA7JOWcbDAfvyHLiJRwCCdakaj97rXx
 lIfeH0Mzpf3f9+37oAdetawAAAA==
X-Change-ID: 20251217-max77759-gpio-irq-trigger-8e08bfb10b35
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

irqd_get_trigger_type() is meant for cases where the driver needs to
know the configured IRQ trigger type and e.g. wants to change its
behaviour accordingly. Furthermore, platform support code, e.g. DT
handling, will configure the hardware based on that, and drivers don't
need to pass the trigger type into request_irq() and friends.

Drop the use from this driver, as it doesn't need to know the trigger
type.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/gpio/gpio-max77759.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-max77759.c b/drivers/gpio/gpio-max77759.c
index 5e48eb03e7b366465e24383a7d1152351906968a..3bf9f23d1532848d8706f7291f59b5c20e9715a4 100644
--- a/drivers/gpio/gpio-max77759.c
+++ b/drivers/gpio/gpio-max77759.c
@@ -435,8 +435,6 @@ static int max77759_gpio_probe(struct platform_device *pdev)
 	int irq;
 	struct gpio_irq_chip *girq;
 	int ret;
-	unsigned long irq_flags;
-	struct irq_data *irqd;
 
 	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
@@ -486,13 +484,9 @@ static int max77759_gpio_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret,
 				     "Failed to add GPIO chip\n");
 
-	irq_flags = IRQF_ONESHOT | IRQF_SHARED;
-	irqd = irq_get_irq_data(irq);
-	if (irqd)
-		irq_flags |= irqd_get_trigger_type(irqd);
-
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
-					max77759_gpio_irqhandler, irq_flags,
+					max77759_gpio_irqhandler,
+					IRQF_ONESHOT | IRQF_SHARED,
 					dev_name(&pdev->dev), chip);
 	if (ret < 0)
 		return dev_err_probe(&pdev->dev, ret,

---
base-commit: 12b95d29eb979e5c4f4f31bb05817bc935c52050
change-id: 20251217-max77759-gpio-irq-trigger-8e08bfb10b35

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


