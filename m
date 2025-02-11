Return-Path: <linux-gpio+bounces-15719-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8449BA30B34
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:10:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA686188690B
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 12:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70DAF1FE472;
	Tue, 11 Feb 2025 12:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Rkr0OOAl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF631FCFC1
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275807; cv=none; b=Y2NR7vDE0pXV9IZH11rDE1wPOcjgzl3QVZgPwFqpSqj5LMXrNMcbvRU60sqlFjnldtSw0WWmuZGgBachuqilyscLRAjENZVR7wX7ruvSsr/s5x5+4xtjLK0jFN23B0bnDYc9JWWhQro6JtauSI8aHmIciz39SJTtMvqU4xzNQu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275807; c=relaxed/simple;
	bh=B8vjA07aGlepGS0i+Pd6WcAWx2f5Mn3tNczFpPj4Lw4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eeZmyfqbAKBu3pWm6b29fjJiRE2qsNT2c0VQNVcgA1vtZR+NnOogd9tMPsRks+lRzD03JTnJj4GEn0Q+QNVz2RXQ/vOyLEdXN4+hfojStZTxOFaf7A+6SIJGAIFuFi/CSOIScDaJD9/fZy3Jgx2bwaMXzFr2XN+S+ksh/4kIMD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Rkr0OOAl; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361815b96cso36585705e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739275804; x=1739880604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d+BbFMd7n+K+mqNfr4cyQYVRFXSPQTKkfNEUIIhkMJo=;
        b=Rkr0OOAlrX//Ewa3iGjLIrG0U+ckTg3SHYJhYv9l16dKIO0E2UoIRoFBBSQjPMiVJ5
         esWGLEhowL4igZr9n0UgxwLvfJ9G11iQHDuyQbzN3KAsc6+KTkIthRG0lc+nH8sI3YB1
         oC0gbqspQLn6ncCvMSj4jBybrwd8Lah3Mb4NQVglOq8nj7TqwIl7cbLs9E9h7cYiOEaE
         7XvS3+z5exDjsFX3HctwaymjB5WdmcraJ5DHE0CjmArTzs60y4+zqh9kNiBrfeGOdaHF
         MwBa/iHedpfCuHVXza+NdlV5wOK1wmtBK4K/DfXt+pzp4CQvyLKogOl2UvWHH2lSUvjW
         prNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275804; x=1739880604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+BbFMd7n+K+mqNfr4cyQYVRFXSPQTKkfNEUIIhkMJo=;
        b=AYxia2xMUHkMfTCarFttJTcArGf/Hu6OlfCw7oq+T6dSIODCBcuIejBciHVA4/o8wp
         As+SvJ4zI/RPFw96kDQg9gdc0Ensv3TIND9UTZ1txuNCtYNGKMTNqbs/XPuzgK5BP7xh
         xT9CTjZ5U/q2P1JtOTgdJh7Ws+V+KCej7AcJvibeFfjQcBsiQUMAkuq5Vp5uF9dJiXGp
         VY94XiRjz9mEjpAPOdy+SZxhRY2LsdwdCCUpyxChlqIfugpaLgPjNfnbKM266M9HGmMW
         h+fJKZhaPdDxM3KKUDmA/NM5bezWEt4BY6KvDf+mVfA0P0t1ZWI4zRFYJORdZm4nG6Yh
         yegA==
X-Gm-Message-State: AOJu0YxVTX8h6arRz5YtBNGK5xYjjyg4yZfYv7+YX5xQS4Cu/kvjGLLc
	J/HMzoSbqsZhwyPVmGkBpfkA/EFz/JTBko5VzRmqrNPYvPqflQ3YvrVOzb55ASXEizkHXdLgFDC
	4IrA=
X-Gm-Gg: ASbGnctdTWn0w/2F+vLa/KJlbVK0yp1D3qmh9uz6XvivSzpPu9otKan7BXkrrUFC2zt
	mJKT7mrwTpFT5mGa/TT30qtfSIpj8WY9wUt0NmQ7fT9HEpyOwbZIVKbakG4hCa+86QDNgd97azP
	Wq2OY/+duKsFWGRlU66T9iR9exIWyuwqOCiMc0ZJV+UdTmUbxglRxvX86ahFPt6hNsZs/5hKmon
	ldGbm3YXVBWsgpjygGfAgUui3PMeKBZL66K1hglql62YC0HcAnICJalKYTGEd1iQmY9HbxKBiFY
	hCsCMOE=
X-Google-Smtp-Source: AGHT+IEMOSwVAR4KDth9NgRCckPxsc14pAzy1Ly+pQWy5/SYHWyjS0Tny1smiur+oksg1bAgl4QksA==
X-Received: by 2002:a05:600c:4754:b0:434:9e46:5bc with SMTP id 5b1f17b1804b1-4392498ac55mr159173485e9.10.1739275803591;
        Tue, 11 Feb 2025 04:10:03 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd4342502sm9152327f8f.26.2025.02.11.04.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:10:03 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:09:36 +0100
Subject: [PATCH 02/14] gpiolib: wrap gpio_chip::set()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-gpio-set-retval-v1-2-52d3d613d7d3@linaro.org>
References: <20250211-gpio-set-retval-v1-0-52d3d613d7d3@linaro.org>
In-Reply-To: <20250211-gpio-set-retval-v1-0-52d3d613d7d3@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Michael Walle <mwalle@kernel.org>, 
 Bamvor Jian Zhang <bamv2005@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Keerthy <j-keerthy@ti.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2093;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=mUYillua396qTpKVAHzLY6KYpt0/yytGd3oRzjdo/zU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnqz4VVFl+RrrC3Le01DvDprJsAWF06daXfViIm
 8D6OIwU+HmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6s+FQAKCRARpy6gFHHX
 co2lD/9YmNWa2vCgSb+a5q1W7hneYy5sCN/lxxqxi9h6PHVGFNkgM+O01EX0x5ugFpujDda8g5B
 1MHXxUYpOlOxh/Fecy9M1audvEcJrtoJJJvzKngGAPV4abSAt7wTiExk73+bhFfFiwrE2tNZNsE
 FXI38XZU/VGuQqO/xWVmkPeO9LuUrgsil/Lt3HhpsYFsw56JeZfzzpm/OOvzBhzmP2SQihaoTvm
 bCRG5ObmxcLS1us6hmr2LDvwTciWp87gKfRT0MOmtSwn2purP54d/rghqEkTcaeu1QaOdAu89bP
 AL/FfbXZgdE5bEZdbL4JFSuD5NJcb14qBq2SJ/y004ZE01lP4tZ+yyQydkgYl2iuegCGGBQwqOw
 vrXlPqrHEoBWLFQOq6sNvHl464BcxGM+kRufiIfuzAB5niHC04Lk9kvzyltpl9G+GNh7zO6E2CX
 PFVbfoFPHfRPDXrdmwLjNly/7wdS6yLa2X41DLbdSExxPXWF//+TDOzqwaC2Fe3SwAWJdalo/fv
 dIZdw84jaweMHTbCqqgCHL6VfeYnQANCDgvzi3m7tpaySMgt/2BVZIw/YqbSADEkxa/vuWL8Os8
 EgkztChReNSK9YZ1co43MzazR22QSa5dlX5g2hwJ+YCbzUiXrbJ0GIyHhsC66Lw5F1WKwWh7Ez2
 tAu296INMZ+5VuA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We have three places where we dereference the gpio_chip::set() callback.
In order to make it easier to incorporate the upcoming new variant of
this callback (one returning an integer value), wrap it in a helper so
that the dereferencing only happens once.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f31c1ed905c0..7826bfb72104 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2747,6 +2747,17 @@ int gpiod_direction_input_nonotify(struct gpio_desc *desc)
 	return ret;
 }
 
+static int gpiochip_set(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	lockdep_assert_held(&gc->gpiodev->srcu);
+
+	if (WARN_ON(unlikely(!gc->set)))
+		return -EOPNOTSUPP;
+
+	gc->set(gc, offset, value);
+	return 0;
+}
+
 static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 {
 	int val = !!value, ret = 0;
@@ -2783,7 +2794,9 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 		 * If we can't actively set the direction, we are some
 		 * output-only chip, so just drive the output as desired.
 		 */
-		guard.gc->set(guard.gc, gpio_chip_hwgpio(desc), val);
+		ret = gpiochip_set(guard.gc, gpio_chip_hwgpio(desc), val);
+		if (ret)
+			return ret;
 	}
 
 	if (!ret)
@@ -3443,9 +3456,7 @@ static int gpiod_set_raw_value_commit(struct gpio_desc *desc, bool value)
 		return -ENODEV;
 
 	trace_gpio_value(desc_to_gpio(desc), 0, value);
-	guard.gc->set(guard.gc, gpio_chip_hwgpio(desc), value);
-
-	return 0;
+	return gpiochip_set(guard.gc, gpio_chip_hwgpio(desc), value);
 }
 
 /*
@@ -3468,7 +3479,7 @@ static void gpio_chip_set_multiple(struct gpio_chip *gc,
 
 		/* set outputs if the corresponding mask bit is set */
 		for_each_set_bit(i, mask, gc->ngpio)
-			gc->set(gc, i, test_bit(i, bits));
+			gpiochip_set(gc, i, test_bit(i, bits));
 	}
 }
 

-- 
2.45.2


