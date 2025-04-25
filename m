Return-Path: <linux-gpio+bounces-19306-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 420CEA9C2F8
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 11:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9524B1B6444B
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 09:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF63241CB0;
	Fri, 25 Apr 2025 09:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dX7yLZpx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7851E24166C
	for <linux-gpio@vger.kernel.org>; Fri, 25 Apr 2025 09:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745572126; cv=none; b=B0xQUWWSiPJSquIdiwDzck7xMhuKoWCTFdB+a6RvncbUaikdrsgqHjhMl8njIsmrEp/X7UyJtil4w3qMN51kf/Q3JM56VPUggecvq00ITtE4LOhFlHjdSq0bTeGj1sT5HajZlaWIBZwxRwQDzyzLt7c9w07eSWBpwj3DMgPCu+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745572126; c=relaxed/simple;
	bh=pTrO24s8MBFrLrxR0rAOPN04paVQyMBRmX9Uiybwymg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iBoFxwLmDgNFNOH8Y54XQXxT99ZLoxP9yPc3Wz7H2f3LySQR+y0IAcz9dxi8emQYUPW+cbmqAYElDNRY3jc/0OlRRMtK08Cd5u3N8vwIwInNGYy+/M4zjlIC/aU6aHCQPiw3O+Zi2lqK5fNRn5N3B/cJDoRat0VLWDFIQIHqNME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dX7yLZpx; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso2081720f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Apr 2025 02:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745572123; x=1746176923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlGoB/HUZg4yDoY5L3zieLRRojeVT0zMfmIc8y47oNU=;
        b=dX7yLZpx/Ke+a1SCtrfOm/tvDE03LnSYSxKZG+qjihgkIVvBoDtzkwlYgsVDY5ysgv
         mqVrKoTJCGfXBCPUI/kewTHpXWgyFnWPxPWXiOL0SQuGeXufJiAMXEhmVzMwTJ5othoj
         YR7nd1LC8Cr97hSvLIfIy0JI6HZ4R4JBIa0/mxl8E0Uox/1a7vCvAVUQErSagrFxWbOG
         e+oNV5KbdCw7FkMLcptjWNjumWbTMLUYKnaqqQvi6ylbEtW/QhZMQxmnQTqGvPgJoHZI
         oZPjctg47ljpj6qkqlumHx52qcNstSy6L9SmU3HI756f/z62y+YTHjOqBNXACVUP4ZRM
         hIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572123; x=1746176923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlGoB/HUZg4yDoY5L3zieLRRojeVT0zMfmIc8y47oNU=;
        b=nbUWgpoi8S9sVBauobR213EvqME9J2HmMGUOyhm83PyNxZXdhpUR994fEMyneXN3jI
         wZvJZ8elqtUkGHWHK+T+i+EimPx++w70j//nc43ETcQd2qP+FmNikgVV7If+E8IW+436
         XhzcYismkeXEqLo/mHEoeEAcWszIH0tzGxRTUKGdsdbFxQ2J2kFpE934qM6gJtQ0la6M
         A2SCFdegO3zF0hK67rtjmvf30ardc7DjN+ejjTkNRruw5LmX5Juw16p40Oz5mo2x7u6g
         qbATHqQPDu14UxmaV1KQW/OMlEEd+cdIR6jjTxIxC31j2GQth0HhCtcKaYVjIUOMlNCX
         xg0A==
X-Forwarded-Encrypted: i=1; AJvYcCWLZD6pS91Pn1fx4W56PaKmp+IFiDt2GxuXcyOE4ALqqe5YN4MdNoaLv/7Dp0yOvMDMM2iK3BV9dEt2@vger.kernel.org
X-Gm-Message-State: AOJu0YwgSfQT9T7SvelZno9TnIRObH1mMm0WUoAVGf8TZx6PiBJfpt24
	TOFkJe+4gf1k7Iaw5ldL+oQhnclsQiHfZIH3EaOyhmMRpOp+yp7uDByqsXYLN8E=
X-Gm-Gg: ASbGncvNOmgPvTlKLC14PAILFM3Gj0c+QsClso50aMXuwTc0QytsRoAVWUXjEqICN2t
	d7QrsSadLH09M1mPmRb6NUyvvwsoBl8Bv7BNQmNiTBgwTljZ1U9wr0La6y3bBsJ4ceRgopVLvhT
	0AOaEe50DTNZZKYAhFSqnVEImcFQcJNHcBN5Sf2lxPvJzVqnoH0J1k9qHEjmoxgfJc7ZaQZi2NU
	X1Z4qzbxNTfX3abqNoi9dHluFxy165oqLgKMoxc/ZGxDfB4To4jkVrfEbEzqiAMt59aynHM9H30
	EDgcY/fDDZf7VRHN8FXhEzuWhp+PiZexZA==
X-Google-Smtp-Source: AGHT+IG+vaC7MmgQ1lY8Xs/s97F/M6Om983foVEu9vVfhXq+DCq1sUbfXts/z/dMaAJgf6ogHaPHXQ==
X-Received: by 2002:a05:6000:4285:b0:38d:e0a9:7e5e with SMTP id ffacd0b85a97d-3a06d641ee8mr5322988f8f.6.1745572122724;
        Fri, 25 Apr 2025 02:08:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5c9cdsm1688909f8f.87.2025.04.25.02.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:08:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Apr 2025 11:08:31 +0200
Subject: [PATCH 3/3] pinctrl: bcm2835: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-3-6b8883d79b66@linaro.org>
References: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-0-6b8883d79b66@linaro.org>
In-Reply-To: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-0-6b8883d79b66@linaro.org>
To: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=aKxxveH0C+uR174fNORC/elug/yziUniASTqQNWz9nc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC1EPXzEnCILbRcigkhvMXKkn4wcX8TtqvQacB
 KB7TBd1QxiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtRDwAKCRARpy6gFHHX
 cmUiD/9yZv6dvT2Wc+LvJ58hLcbjZISnPBDhqi6UcP6kX2qjRFckiM8hGhHOQymPP4CMm0Io3FB
 3vhD5qFTWMyUqVB20hNF8fzxFSAF7z1w2CZ78upNY4Ty8iYKY6iXlZkTb4/I2vkUQElKJc/FKuz
 ll539+UounWRewqOlHwUdLlhdIg/p3K6dVzXwe7zVGhLh4xnvbHm8w0mOjziSgYepKhgDfG2h/e
 kECtA453bSJM8Krn7c8+9i/W7S50XLMt+8Q/uK5eerfg2Ix595UQNVT8wwygug0q0ex9i2nJPxS
 kLljtjYkeCbEzhpHvXPszQKP8S3ACP7Upcx60XQ32TFPKnlOnt34eNH5XnLRbhgMA44mfrVToIF
 b4bfmC1mhk9vjJmDe95jXH94+nOr5C/u8C17k5eoxpGwd/dzJISDfRBBfNPJou45LONB2eNPoBw
 07rSsnepk1PHd2FzBRPi2yebyN6YD7VmyRqSU6uDB/GyaCM+V/6Fdkj+6YzN5qezh314hAUT3Hg
 Ua7v8riePOMzxWiQIJGaMQmNjAC6gHILJn+73Fe4sEXX756CFMp9EyAIYp5KffDuBwm2uP9ktkg
 xTJ9J0vBSw5fxWyfFhVBhP2ijqhpM/l94+zEJuw11XNTxhheJTSyayQWYB0i8TW7Dd34VOtqoFE
 HAHE0Qmyq/keRLw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index eaeec096bc9a..826827800474 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -356,11 +356,14 @@ static int bcm2835_gpio_get_direction(struct gpio_chip *chip, unsigned int offse
 	return GPIO_LINE_DIRECTION_IN;
 }
 
-static void bcm2835_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int bcm2835_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct bcm2835_pinctrl *pc = gpiochip_get_data(chip);
 
 	bcm2835_gpio_set_bit(pc, value ? GPSET0 : GPCLR0, offset);
+
+	return 0;
 }
 
 static int bcm2835_gpio_direction_output(struct gpio_chip *chip,
@@ -394,7 +397,7 @@ static const struct gpio_chip bcm2835_gpio_chip = {
 	.direction_output = bcm2835_gpio_direction_output,
 	.get_direction = bcm2835_gpio_get_direction,
 	.get = bcm2835_gpio_get,
-	.set = bcm2835_gpio_set,
+	.set_rv = bcm2835_gpio_set,
 	.set_config = gpiochip_generic_config,
 	.base = -1,
 	.ngpio = BCM2835_NUM_GPIOS,
@@ -411,7 +414,7 @@ static const struct gpio_chip bcm2711_gpio_chip = {
 	.direction_output = bcm2835_gpio_direction_output,
 	.get_direction = bcm2835_gpio_get_direction,
 	.get = bcm2835_gpio_get,
-	.set = bcm2835_gpio_set,
+	.set_rv = bcm2835_gpio_set,
 	.set_config = gpiochip_generic_config,
 	.base = -1,
 	.ngpio = BCM2711_NUM_GPIOS,

-- 
2.45.2


