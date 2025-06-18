Return-Path: <linux-gpio+bounces-21771-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF91ADED56
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 15:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9B693BDCE8
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 13:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6FB13AA3C;
	Wed, 18 Jun 2025 13:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Xy1FqeVM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F74913633F
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 13:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251736; cv=none; b=uEuR/R1m5OEj6lXk6TTPTsf4HeQdkZ/rJJ40qkZHbDDxxW2QXr5TYrxZKZX4Sh9d3dcIcJlJ1LUkoSFGbAjwfTQWDV3TVppFQROMqITosI+kC0VJN2OkvJnuGRL+2Zmqv+HQ9tRQRkKwWtORUO6M+ITg13qExiia3xkBu1cj1AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251736; c=relaxed/simple;
	bh=Jk/M9Ui9Na7HQdPubi3ge6XRBpngPka54+GQv2eF2lI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=csJD3YLMw9OxHGwCnCVrNKB0FjTfyyR3ofYUFJqRWlelOIf7rcYqar0GrpXY5hW435YbvW5D684SkEB2pwFiPngB3UYMSoAdb1oQZKoy9MtSEcZ5u9b/hBoh8ZEvWIWaHHl74fUb/0NNROyd1lJnZXmP0n9jrZLS5IiLrfa1Dcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Xy1FqeVM; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4532ff4331cso20448755e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 06:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750251733; x=1750856533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BC9XWgzAC/JlTRKNPdZO9jx2GxWoXU1rrNVMsqMkcWo=;
        b=Xy1FqeVMynbAj6lTD0V94632qF411dqCC+FcInIN5kwWrKbByf4i7YAR4gUlPb1C01
         xB884+nD1pQZpFknBo22QDJwQrYdLnsSTao/xq+zmvwDR/Qp6+ODXSDrJhTs9EiFcuEj
         YePETz3qOJfc4LCSxuelyVqGPuCxmrZJH279Eri0lwsZtsjy8qgJ+m7Hc1rc/meDJCli
         XK7uSPMfynH7Ew7LkVAgIAt+KUGIVmDRGGi1IGOD2Xv757EJepjGLMisY298Um2EnoYR
         fHRX1lzlfSaQG+UKLhOiZvxZSVoYGPKvfy8RIYGbycXEi82cp5fT3Ujq3OkhkxwmcXp6
         oeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251733; x=1750856533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BC9XWgzAC/JlTRKNPdZO9jx2GxWoXU1rrNVMsqMkcWo=;
        b=u+wPtTmJZNw1a8FwaiOyi4jepn/ZCaf7TWoZXDxWVP3/9pwSIGjFLY/Z8QPr9h+wv6
         /PS6BcwmyFnVx7eZBjtH2HL3b1yeR8aXxk5ve7gHUqiOGEE0k16MP19AKhG+Xao373ty
         XLSClnj5f0NYyH3bS65kwIGetyTRI9HIZ4vDWZGIdkKxnEm+sjTCtIwBMS7uEaW5z56E
         xBTCcIu43nA3WyC6fks3io2GYOksCpRNvZXxvuVwbirLnD+HdogG8IxgFwNNxTo5bjnN
         RAlzf16LDK+UMUbQYWlUsmXfq960ycmWs8ZJTRfQvWx4qfaiS0MN/PeYqI/qNOyY5T2I
         0nMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkxjXpBhvSbHEZl7xZhPJoEUVJngNw4rxChz4gf9fiEc5YlIwpmlV7JzdDfXOe8EDt/oWiqOHli6lY@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz7YTt3tEdppkwKhNnIBhdXfy9eClOG0yhtY/ngu9cjWdv/6lB
	RJ7DGxNj2199rDUyNf3lMNSd4eHy2ngB3wr22J/O1MlXEV2jWLJDOuS81XBnltPOkGY=
X-Gm-Gg: ASbGnctfKvOZmVNPBMTsSJMLNLlz0b18+u0KMEIw2K3h41VGMY1LP9VZ7ZiHBSVI/m1
	EXRzryKPLh1sIYeDGVqM66bEf+QgQwpqXQiZ7FiPlB11UPYzQNvbsdYzvn2OwqAJd/2KWY94XvY
	6OGIiBi/Yk5t25oLY2SGbGw1BAeB3lGCSCDl/6U4YIwVGNOApdsQF6r6Hng0fBefciFhzc7vR3t
	PosjRAp+YcTfyVaYe5Ssh+rPX94iU3Wlr4O16/EtCvRsdl0YYI+BRlYqmTRPXNxF+Gyd28wIxIR
	Dfe00zOgXwm/M9FV4ebRbzwf7o1nVj/sNG+G06CwGwqnifZ796aZXko=
X-Google-Smtp-Source: AGHT+IFPB/K5zMDdgTuf11jgW7Xuj1ey8iMDW/GtnPNE3ho2jl8/wpkbPxKo18+NNwMCFsAycHFtzA==
X-Received: by 2002:a05:600c:82c3:b0:450:cd50:3c66 with SMTP id 5b1f17b1804b1-4533caf10cbmr156437325e9.29.1750251732641;
        Wed, 18 Jun 2025 06:02:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ad8:9ec2:efc8:7797])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08c99sm17043595f8f.63.2025.06.18.06.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 06:02:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:02:06 +0200
Subject: [PATCH 1/2] gpio: npcm-sgpio: don't use legacy GPIO chip setters
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-gpio-mmio-fix-setter-v1-1-2578ffb77019@linaro.org>
References: <20250618-gpio-mmio-fix-setter-v1-0-2578ffb77019@linaro.org>
In-Reply-To: <20250618-gpio-mmio-fix-setter-v1-0-2578ffb77019@linaro.org>
To: Klara Modin <klarasmodin@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=XVDbA11npYNtBXGkYX9hOCC8ch1woMEIFMQDtO/pLz4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUrjSWuqLhdeCPxybR2GyyQn3qsd1Xky54Sg3z
 b8E7NmrwBKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFK40gAKCRARpy6gFHHX
 cm/ZD/0cqhzi23U4gdbUZtBgvJ/CRlUwNoOc4V0ubJHdndzS/w89zQrncvgpk7mcGwGnCaTcwmd
 R2DXEkPD2sLvmdDzx4B/WpHgjXOryHh2E8F1N+C/e/nhkrowGI2vqj/OJe6bSnORTxifDPgvvJR
 6/jXZ4WK6Ni+zAOm/uSQSxXV9th62JDBrSNYbJbI/b9NzEzgc0rKZreIILL/sMovgEaOF+gkBwk
 Sdq9qaDbJh59X34cBgPbizJHzvUaJ8GZd+DeQB1zeC0fSvQDVfCh0tDRmK0a/6RWA8HAPaOoNEJ
 Vh+yDX/+Oir85g5+wsOcyGts8KN9nkZ6s7bm5IPkLhxfaKCpm07K8F9RQLobPQ2wIv9iW6xuOmW
 Qg+fi+2MKg2Ogyk2uEzFVe+8hhzkYw+paLUUQOFxQNewHTBFqyzPm/mjzA2kv3aSIZeWCZUjBhn
 BrLkIU4dt1mUfW1/47syKwqQWFfbZ3VekZtcD82JHQ+kcylf1I+5aWQCRLxQAh0WtJmDoDGD5h7
 jeltFvU0UqI7qqXQiMVSkPm3NBPBAYDq5Xbz96+NvVoyb+jooFmkDrpDgyz+JHJSkY/sj8fIXPQ
 RpWtJgyuJUTcxBnHc0oDwVDZ2UDd5Hur0AAP3PqDRKlvOMkzT6usmt67x+4iiNi/KCEWrYDom19
 iSzovEPne3nd3Nw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We've converted this driver to using the new GPIO line value setters but
missed the instance where the legacy callback is accessed directly using
the function pointer. This will lead to a NULL-pointer dereference as
this pointer is no longer populated. Fix it.

Fixes: 0e1a8930c941 ("gpio: npcm-sgpio: use new GPIO line value setter callbacks")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-npcm-sgpio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-npcm-sgpio.c b/drivers/gpio/gpio-npcm-sgpio.c
index b3953d1ae8af45f4bce9b799434547cd8770d9df..25b203a89e380366e6a1dcd51775f6b1997a1d30 100644
--- a/drivers/gpio/gpio-npcm-sgpio.c
+++ b/drivers/gpio/gpio-npcm-sgpio.c
@@ -211,9 +211,7 @@ static int npcm_sgpio_dir_in(struct gpio_chip *gc, unsigned int offset)
 
 static int npcm_sgpio_dir_out(struct gpio_chip *gc, unsigned int offset, int val)
 {
-	gc->set(gc, offset, val);
-
-	return 0;
+	return gc->set_rv(gc, offset, val);
 }
 
 static int npcm_sgpio_get_direction(struct gpio_chip *gc, unsigned int offset)

-- 
2.48.1


