Return-Path: <linux-gpio+bounces-16552-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB2FA43E71
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 12:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 382A41895F73
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 11:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D77A2686B7;
	Tue, 25 Feb 2025 11:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f4e6axpg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF1D267F5F
	for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 11:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740484594; cv=none; b=TouDkw1H+X6/vZ16a09EFh7ofNuuwz5AHMj6gMMUS7M6bG9xn5Fp60XsQ1gWT805pHRtRieF7GP7MYu+fUdJsw6kh1x4EMi3C8r6KhWWYXRnj+n7RQ5/cUSL4wkqv5H+uQ3Xj7gCUYuIs1gAqPuJSske3jZ+4ktG2PKB4tkwA1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740484594; c=relaxed/simple;
	bh=YGO460ES0PrvtUVk1u55ClcB0fzrhT+lCjeLiVsXEQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FG7s7mDpSbhTAI+wSDfxSunHGin1VIVwQbSi1H8afKCApGga4wkv+2SYTplWoBXEoNzHBDkOIqtnXLRk5qSqmCs/8bhl91TiATESiQjUq4LivFKysdHBwbEeoOcI7kLUUEdiclOEa5o14VAjd/MTiCYJZKNCq+t9ubd0U5cMvRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=f4e6axpg; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4397dff185fso47988835e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 03:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740484589; x=1741089389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gbyzciQhn2JO10NIz132GUVY7KJkuW4I/yRQ2WvjRfY=;
        b=f4e6axpgyyc1ihcz97Cu+t1QIeJP89fNksN/ISLQSWR3Enj6BXHeEVvF22PjPaQ3bW
         jz0Wvyv4mmh7wA4d0P/Lk0ha2eqypnSW7lr4EYyNKtd5Ol3VWvAPCslE8jqLZBnO9Krw
         WghoPPBtFCY8KnJkwY0F/bB9HMoXFHkjhKje6cuaw1B1VUX7BChoQhoPO3Lsn3MLKPCR
         9a48hIR80VDnqZ+M+HOD21PORDZnHCSJbch8+676YUqkGvFgplQ8+gOgrAGPL+ZsUITF
         pxSjoEZLLeM/sz255gcm/QRk4Ho/cHgs2TxABr4RRG+zxKKiUuu2g+jP+42bH78BmAip
         F39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740484589; x=1741089389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbyzciQhn2JO10NIz132GUVY7KJkuW4I/yRQ2WvjRfY=;
        b=HjWimh1Px3YW9x6wfOo/+CD+pEfEyAQAeTkW0tEv1WWDlZGt3chhJ3BA/0LDFNtsIh
         8qmVmzkv0akPrqUUgJWIDnjpjFQ3KZ6NtZi6+wws7ur+FyiZ+2eL8h6trWpXUf7TLdKx
         xgXLN5JfSLn3iNI97vMxsRAlMiLswD4d+r/j5FFiAhsRVrkfe9pEo2eWQ4PQIM0THSO5
         zCTFTmey8goUCs8Pi0s67IJBy0Ak5ZEg//vkXdP6WgoDBHaV0OADDKqcnQwN6n2HZek2
         zYyQIa3leQL5Im6GK2CdT6cVTlndi5xrGkSFT7bFYK9UkM4ZwOuQm7sCVrHNiqc3b1a9
         qHPw==
X-Gm-Message-State: AOJu0Yxmlhu5gl7VBNyvpjoQMHuKggYX7Z8575U9MRwV94CthS4M4ia8
	qL11j72Hz42a0Eq9O4++CzW3PS67IkQHsNUj2iaJfG1VFChfKm05+u6MhTLsFHlQ2hARWIvO5kz
	PTyU=
X-Gm-Gg: ASbGncvDszC/8I3T/twdiWOs4wyPgAX9n4G/SN4U10qVvjqGd5z12bMe3am0fXBjR0p
	r3ZUEBcWApGCFJjdUnquTqQCo0khO9JcnIczO392kDpVJP2QWJuRR7CQEA1TwT37mhnlm+/iP3B
	8QcMedJDRmYJPPat0PeltZcSi46e9IYSwmppBKg9OATSZGnjYEzd8eaG8lco8jTFaVmoyzsg1Yg
	CpdQmaQ0oL2x74FoHKFhFVwfCnuwhyRbgkRos0mR+1WvJ6ghOkT7wQB+613Bvxmo/ESehq8BkGX
	HLtSgM2YLAEz9cTgD8s=
X-Google-Smtp-Source: AGHT+IHIzmnFe0wL3bd+qPFKv1f1nRGmaxVMrfrzshY6OWhKyRxO+hXZl+5icJa2+TqYCYcjMQncEQ==
X-Received: by 2002:a05:600c:3b1e:b0:439:6ab6:5d45 with SMTP id 5b1f17b1804b1-439ae221161mr132196715e9.28.1740484589543;
        Tue, 25 Feb 2025 03:56:29 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:15ae:2cfe:447a:4a32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd883521sm2058054f8f.56.2025.02.25.03.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 03:56:28 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 25 Feb 2025 12:56:24 +0100
Subject: [PATCH 2/3] gpiolib: use a more explicit retval logic in
 gpiochip_get_direction()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-retval-fixes-v1-2-078c4c98517a@linaro.org>
References: <20250225-retval-fixes-v1-0-078c4c98517a@linaro.org>
In-Reply-To: <20250225-retval-fixes-v1-0-078c4c98517a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=NnHAWuzH40cQuDNG1I+t5WrVKSbiDQg/68nmaoJKiis=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnva/qIPZJ84lRhkSMi0g4Z1k1dJJa5Jn9etdFV
 Uf6uxDR3yGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ72v6gAKCRARpy6gFHHX
 ckpdD/4pwb5HoTcNJ2VQB2wPyjduGOYeH1LSwH17WtzrY7fh+XppIilM6adtRhSwEVv1eOl9fs5
 +JcSMJYgFuHXoodypkmoXEeIyDuU6PgRpLLPe7lg6tZsy1+Rpv4YGIb8koBfORqXbi2wxf/FaaL
 3K3m4B88NcOEogs1yuCyHtUHpGAC97+vHqqI7sab+P4jSyMLUf9xNyHVUQ3QBoJeQeWQp5X+l/s
 qYp74TtILFgmwLeQzF4Sofoy30uzOkrA+nET+ecHYmqPVDvPou/eDw2fJZOmtsiRdTCVj6z1FoS
 m1QvjZQC1+DhZae11jdybkzzcg/KsxbWAPPidT6jOiJ1UiaPVEr9q0H7hnZHaULe5iMqhSDSU7P
 gKIKfCyN5RD+qlh6ai0FAeCc7yLFTf4L0X5uDrbvAGnLsdjWYZDmJTHqyURngSm1HU/7u/1OG10
 COz6DcqxuSBvrUkQfpb1vbCeofUqSZqT7jAQ6gWIP3Iv1iEZAGktNgOj8+dEycftiM87dD2hnBX
 x1j6jOFsBzQGvMmMliB4hrUvQ3wmxKoLUUlj+kO5hXivSisviKbv02M7hzhow2WQPlo8pDKMJ0U
 STSkMsRstM+xEZajyuKVDMOwKqnSZINZcQ/ljmcS4uwxlDp4LoWj/kOhC5/nTCS5QFOb2vLL5/D
 B44aGoQdL2xto/Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We have existing macros for direction settings so we don't need to rely
on the magic value of 1 in the retval check. Use readable logic that
explicitly says we expect INPUT, OUTPUT or a negative errno and nothing
else in gpiochip_get_direction().

Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::get_direction()")
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Closes: https://lore.kernel.org/all/Z7yfTggRrk3K6srs@black.fi.intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 31d400b10167..d076b2ec633f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -352,7 +352,8 @@ static int gpiochip_get_direction(struct gpio_chip *gc, unsigned int offset)
 		return -EOPNOTSUPP;
 
 	ret = gc->get_direction(gc, offset);
-	if (ret > 1)
+	if (!(ret == GPIO_LINE_DIRECTION_OUT ||
+	      ret == GPIO_LINE_DIRECTION_IN || ret < 0))
 		ret = -EBADE;
 
 	return ret;

-- 
2.45.2


