Return-Path: <linux-gpio+bounces-27906-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B76BC25C91
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 16:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E91844F55FE
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 15:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A2381D88D7;
	Fri, 31 Oct 2025 15:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="K0qESczX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61411DC198
	for <linux-gpio@vger.kernel.org>; Fri, 31 Oct 2025 15:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761923197; cv=none; b=UgeERic1NIOCZ0Ywml+kV9FXB9GaEITOClVjMzQUCuxSbQBWLwltghfPORQ9bHH/NGQLSy7HctbmIZoBUNrJjbeW/POyD5sp7OoV5f1zB5M1U/ETVpvSrcaxrTdzX0GNwZkFbx3yxho4Mh3FJCw6kYRKlfcWTQxhpzekLLICox4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761923197; c=relaxed/simple;
	bh=xyzfl4C3ygHBnCoU4AGi8cbblst62cDCaAHkvc/NX4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QI+wqqkSU2ulRo8C9cTeSxYEeZ36oiUPSHU1deXg/LqM2+yTmMTfDaEVX7DeqLicDQjNhHQDjDzAoXtjPVwfZN0tdBHSqs93fts0pN0CU7S2U/6Sw/ulCpVXWpNcx6urJLFH3d/NyjdpdU5JqLkV4Wb71dQTAVvak5EKMClqdQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=K0qESczX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4770c2cd96fso16656925e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 31 Oct 2025 08:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761923194; x=1762527994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vjEbL0bNohIYE2ZQO0FpwBW3VCE74PSDjugxRYid1kM=;
        b=K0qESczXzoJvJlJAAibo/PvYz6rqsfkeNmjbl4qlRPaJP7UJOzYCcbUDWpRAzaswa6
         VkQ68mZqvowdGPouzyXe39r0qYAIYBvu7ONEBsuEmCjidGqUzGFzwpiMs4QyuAKtVvZA
         oV3RwIIkx/jzBAcyqZ9RPIzydiJjAy9MnsFiLT19vuvcd7aIARTVU6n6uJdI/2LrlgoE
         StnMyCo5tyNx9w9aMHJhDy23PyMtH+yPCZKhwMDCd4rcmd4WafgUIug3KkIsVPuPniEX
         qrscacvHXhmZ/GoUNAbMPGmMQwei6wWUrW/vIzPo3hi+6b6ryhjoyHtbeKKQu2Hf16bp
         6b6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761923194; x=1762527994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjEbL0bNohIYE2ZQO0FpwBW3VCE74PSDjugxRYid1kM=;
        b=aiM/HAvC7wDDuJgPHB+aVZ0ch0LOCcee0ZPmQ7CRwByuL4Ekcq8ZG6W1cYu5rBCRbT
         jb9aljYu/hawbbrRsqcjNlC8POWJewk+vIMwQXS0N+s4S+TI2sAyF5Qa2Z/AGfkMLH5w
         klj61Qv93Ttg+MUpoABAPROK/2xwME6Z5iesoy9aZ5vLEkhEf/btgvGbhzSw03ijfvJf
         j3qiSrDDUkod5tKaje1TwdxWfwIjYlkduSrG1FdtIXHbUv29Kd/yhh9cHwJh/T3XM3Vi
         kYDcHBIBdbVYqqKs/LqBVU0AJvROq8uFE34l1eiTCgysJG3AFmh/dV7o/xeFU/3uedbB
         WbKg==
X-Gm-Message-State: AOJu0Yxb/dLZ3URMl8urlpEDTV5PeeWHqKphsCDpy21I4OGaFXVBTZkd
	aAgCcHKNjxqwv5QTjwhjlP3sae0TvrSlZN24lucqoWTmqS+FR32Y6F6CZn5J+NXvnuo=
X-Gm-Gg: ASbGncu0LKqz5EItuGkdDSLHi5ZsnyhCoLPn2x9CPiVmnu0eg6fh5gjnF6h7Gelmpl4
	810Pb8SF3CKAKMlexgoXZRTVYoDzq5wlx+pQIqOBq3yIzBNaahB+VtldsA7W3IdvSkCjCH5OFke
	XLCEZbDYndhpWU25FPbSQPTIANRW7Qg5nADHPiFnHIS8Og+NMdvefLqramBD2E6vGSPPVv0gvD4
	X0tMKP/ydMdfw364dBWhX0lKbSmdAcR9cjWyBkLfoaXtI9yE8CEaqUzueOlFJ4N4ht1POE5lF0e
	WtPEezR6y2sQVSvmGKxtQUi2LDrc9lH+LuvWPnrP6/U7+XCj0EJKuAwsYy7ZqeYQzMd5Wlqg67E
	DDBcZKO7Du6K/LkX5tsSqwKYU2Bkj1qF7DNk5tv5DLm+4Vs5TreteFOLOgZ1mbsmqCRePHINnwK
	xzzUub
X-Google-Smtp-Source: AGHT+IEvPszlrCmD+0AHLDtDLtdRKT+3Y/m1QcskyCCaRvaRtbit5XIg+aCi6RUsOUdQ+xiibEYYhQ==
X-Received: by 2002:a05:600c:3b1f:b0:45b:47e1:ef6d with SMTP id 5b1f17b1804b1-477308aec7bmr41241675e9.36.1761923193361;
        Fri, 31 Oct 2025 08:06:33 -0700 (PDT)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:68f9:7cde:26e2:9b52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c10ff1besm4051411f8f.9.2025.10.31.08.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 08:06:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpiolib: fix invalid pointer access in debugfs
Date: Fri, 31 Oct 2025 16:06:31 +0100
Message-ID: <20251031150631.33592-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

If the memory allocation in gpiolib_seq_start() fails, the s->private
field remains uninitialized and is later dereferenced without checking
in gpiolib_seq_stop(). Initialize s->private to NULL before calling
kzalloc() and check it before dereferencing it.

Fixes: e348544f7994 ("gpio: protect the list of GPIO devices with SRCU")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
This was brought to my attention by a person under sanctions. This is a
simplified version of their initial patch.

 drivers/gpio/gpiolib.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a81981336b36..fdb6a002dbda 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5303,6 +5303,8 @@ static void *gpiolib_seq_start(struct seq_file *s, loff_t *pos)
 	struct gpio_device *gdev;
 	loff_t index = *pos;
 
+	s->private = NULL;
+
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return NULL;
@@ -5338,6 +5340,9 @@ static void gpiolib_seq_stop(struct seq_file *s, void *v)
 {
 	struct gpiolib_seq_priv *priv = s->private;
 
+	if (!priv)
+		return;
+
 	srcu_read_unlock(&gpio_devices_srcu, priv->idx);
 	kfree(priv);
 }
-- 
2.48.1


