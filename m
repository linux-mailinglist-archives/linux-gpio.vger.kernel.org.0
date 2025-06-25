Return-Path: <linux-gpio+bounces-22124-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C8FAE79A7
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 10:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 463861BC4112
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 08:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551F920DD42;
	Wed, 25 Jun 2025 08:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cXR0yF29"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7066F20299E
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 08:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750839147; cv=none; b=fvd3PYC+lPN5uPCBQMVeSBe7QWXC/u6Tp8+2+vpsXA3Om967RO4AFawdT+JPvgqK3/0IF0UWibOURk8RwyJbjmcs+WTu7MfVRHX9cHH83vkEjsbLVpHMBXMUtE5VwE1ccv900miepcaWixcm7VKTh4XRIoyjrz5r0Hg8NE9NSCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750839147; c=relaxed/simple;
	bh=3Q6PvI9WLyYhMaGfJjkTb+FYVTdE2N8kvgVnMIWR/m4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qa5Yq99gPxoAQAWMVJ0lJguQS/AvXF7LgzYgO4sXu9lzqlel9V+xwIxpveeu0dLYCgFC7pOKFpDI0E9/jjZpWioJFAe2N7+ctlJwUMLof1M2JYgk20KqVTFhLmMIpmHbBJ315rMKp7UayxzVyt0fD6OxTwmOWgQJxc/4wQkTHRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cXR0yF29; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a582e09144so3833177f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 01:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750839144; x=1751443944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hUoo6FJst5NdWLmIH4CqS4bd0d0TxJYeNn2FpbLv3cA=;
        b=cXR0yF29cy9rc745is0Jex+On7JBZM3pRf0qPdHnTuk+RDuDQvHO1MsYqv9XPVZEXn
         Kam0McmGfvHbTqFtOHXQ0Wb6jPwBcOBc4OguhmaNHjYcXvAHm5wQ6pzND8GHgM80QLli
         ve7YQeoMFaRq0SI7/3ewE0ReTlVUh5fhQlnTqsyRliU79oLVZi7vT9V4zyZbnXsva9nr
         02OpCK0hvH3x3VOO8QmtaeGiSiR0sPJueGzoV41pRin9TVzPXfvxnc93RH89iEd+N34H
         h1FcFF7VAYT59MsrLEYo7AAzGI0fvxUGPsH74bzwjBEtWIFxzIiw1jkTVQYvpHUOzRej
         yA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750839144; x=1751443944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUoo6FJst5NdWLmIH4CqS4bd0d0TxJYeNn2FpbLv3cA=;
        b=X8S3+6baAEvtAf1w6OUqeGYZI+TNQQ/9px4/pb+65rfOd4wWA5zg9T6MawJyfU7EMJ
         2gX41JZpcnQ79s8PkgbhwtJZcpiutKTRdhok94f/xN3m1w/82Ju2eYuHW7vjoJNFDUUT
         6noLM97BrjqOcSQc+1IQeltUjqZsFoGlIKjrliafx/dTdXFTamLvQ2xElv91X5RdjmPE
         J0+lFSOzl+IuZ4LmnpvY4WjwolpwHAuXcbfqor1iJixSQ0hPep9tUbfAxoOGilEYJw4u
         rrwavQNU4RjzlV7xVHr7gNZDYjCdxy0t3eb9SXfMUfgrgbgzeb2NQT5XJN2TjtUBBzSs
         iORQ==
X-Gm-Message-State: AOJu0Yw1ZCtm7YFJgUUSPgComh3EXU4r43J9QObYOdLwbOXtaZp7a4f8
	YHaN+QpMPqtb54C7onQtUdEoBeB8lESHLyhHswxqRrWf18q6VsxaEgzLMPvAndfR5TQ=
X-Gm-Gg: ASbGncurLMdwVF5QWJpFCPd8ndJKAKJEwnlvqJxwR3LXZH11tC7JODbCRTPSIBB6v5+
	RykQjLhMPs7oP8Rwp8NkyRxzxhXxXy1YV7YWf7DovR8qS2fEugrpKaPpy8AkighZeKvU9cNn8+T
	L5sqAZ7UNs/du6S+4zB+rhTXZrDG7NfRLCAwuCQC4VC2riU5+0ggRvxi6MUH1ojQ4Kf7aNJck1x
	8dYo7F4kLAxOr7LBj6z4dZ/okGElrXJcu8x7BkqORUrMpqG9xt6U7XqzrNiz2M4HJ7nFVG96guq
	E4szNx6oPnAkdWJMKDkj2kwcl1MWp+QdWD9QqD3a4bHne94y8Vpykhpzq5/9kHU=
X-Google-Smtp-Source: AGHT+IHoTnmbQpVOqUBn04Pr6So0n0WsB+ZlquCI3rmaIUNAwfhUugZ1XzHHxQ5IwkSpcBcGAAFTAg==
X-Received: by 2002:a05:6000:41f2:b0:3a4:ddd6:427f with SMTP id ffacd0b85a97d-3a6ed66a4c1mr1590058f8f.35.1750839143559;
        Wed, 25 Jun 2025 01:12:23 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c05csm12228065e9.5.2025.06.25.01.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 01:12:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: pisosr: remove unneeded direction_output() callback
Date: Wed, 25 Jun 2025 10:12:22 +0200
Message-ID: <20250625081222.12744-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

GPIO core can handle input-only chips that don't implement the
direction_output() callback at all. There's no need for the driver to
provide a dummy implementation so drop it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-pisosr.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
index e3013e778e15..a69b74866a13 100644
--- a/drivers/gpio/gpio-pisosr.c
+++ b/drivers/gpio/gpio-pisosr.c
@@ -67,13 +67,6 @@ static int pisosr_gpio_direction_input(struct gpio_chip *chip,
 	return 0;
 }
 
-static int pisosr_gpio_direction_output(struct gpio_chip *chip,
-					unsigned offset, int value)
-{
-	/* This device is input only */
-	return -EINVAL;
-}
-
 static int pisosr_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	struct pisosr_gpio *gpio = gpiochip_get_data(chip);
@@ -108,7 +101,6 @@ static const struct gpio_chip template_chip = {
 	.owner			= THIS_MODULE,
 	.get_direction		= pisosr_gpio_get_direction,
 	.direction_input	= pisosr_gpio_direction_input,
-	.direction_output	= pisosr_gpio_direction_output,
 	.get			= pisosr_gpio_get,
 	.get_multiple		= pisosr_gpio_get_multiple,
 	.base			= -1,
-- 
2.48.1


