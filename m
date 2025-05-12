Return-Path: <linux-gpio+bounces-19962-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FB3AB3A66
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 16:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3360419E0CE9
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 14:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690AE21B9E4;
	Mon, 12 May 2025 14:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LhwmH9p0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D92D21ABD3;
	Mon, 12 May 2025 14:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747059792; cv=none; b=BRif4DMU2/AVKxf4B13fVZ3fQAHmq6gOzNP6dicdMz9vAMKWPWazglU5NHisoFfPgDFKKVQUmIgeW6IltCIZdprO8qUFWOsIEPVRouEADRc4LDuXHRpSNYmPy2yPC9w++NCdbUzV6u9xVKQ8DOudWpu1vj3HwV9zs3PNcIT3F/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747059792; c=relaxed/simple;
	bh=GDOnWKWk4FBHNilM4Gzr5vCP9ujAJPgfrka/zdbU3zI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nsbh3LAh4lIQDy9vfpJIpCVPp+7TfDdrzcj3fY7o+R3ctYcuuAeilPSpuVBBPSI5Ej92tN70cCNIFAK8cVU/FZDXQZ6h7B6ylbrbj+RN9vtrpqoIrcf8fwz5O2rX2SNTsDNPRBfSn1YT7IXtuXHyC5KwcFvm5SrM0v/hDZF3vbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LhwmH9p0; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5fbdf6973e7so5727144a12.2;
        Mon, 12 May 2025 07:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747059789; x=1747664589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/guz4pLuDNTxVy8lJnDBDsZGEukuirfrZgqdNdAPX1o=;
        b=LhwmH9p0MFwtdLXgmCR2cRP3Zy72xc5Nm9jcHhMCmoN2sg9lOcGlmD6hjxsgzcYk6M
         9Ec8bTgO7i4OFVn0TCQLv9ZKQ3DxHeUKWlOoTCO0GpxUgPCNGpI8Bludc100LK1oc+3I
         BYt56C4exXX8L0fyGUZXmec2EjqKhshEVy5XG34z5wzVg2FCcHWLDdDX6gTIA4uLhH4U
         HWai87jlNrI4MsJ6aOWNofW5gUYGTk0ArsI/seHwtoa9H8xtvRTvmLjMtO6B81t8xI71
         JDzXsytT8HSFoJZaNRCAYGoGTnif6bfbhAlAL7bE7JoTcFS9Czs4sH6/gUmJvQpk/LKL
         t3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747059789; x=1747664589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/guz4pLuDNTxVy8lJnDBDsZGEukuirfrZgqdNdAPX1o=;
        b=JisF0gI5+jBMCvWCS/f1bH+J5PF2XSp282Ts6oOBCIYYMKyFAuuXQ+ncyFqQ9fj9kR
         OXQV3PBARxkaSqUz9nOHQrgy1IWAmpkQJvBvn0oaqgbYlN0e+TfVLjJ/J0EfxYVnMn+B
         u12M6GyHeswBo4hKKF9qr5KQwKb/KQVisDc7dtLJt8J7P9ZmyjuQ5kSDftQ4pNPDUUfz
         VkOWhi4atCFfCfgdudLQ5hFVvUeqpGVn/8l3ONEXaW4TCeqZoP2/FoQBy7Qo2zNF8Tg+
         vroCKmXASSCClYdYZLJPu8fOjAxiZUGSGLp8t30HraW2DwkBWk8bmi0MiZSqAS/zPD/m
         1n9g==
X-Forwarded-Encrypted: i=1; AJvYcCVYpLEmoyuTPe+RfYKa08e1iNw+fNmzHubNYA+uLpFWzNvwhfM6L+3E6ePvoNvIXuts1lezIPnjFcJ9WXey@vger.kernel.org, AJvYcCVp+IvqSVKirnAF6P7nQyFLM1xAQhiB5ckXexHNk/49tn5dmjGDWdeWpj+Wap1qDnHEu7NZxz/U@vger.kernel.org, AJvYcCWiqqqVH0YKdcEfP7bUOgtYhNeb8+fBnmjYZuirLuE1VpRXsLQi53O9FEMYRMkFpraw6nIysbpdR7Ir@vger.kernel.org
X-Gm-Message-State: AOJu0YxO8l4XcTPJXdZj1AqDFI0TDqpuei/64uaX5EUKAABjTEIjTsr4
	mkFAhzqDUS3ry4onwwgKbZ/0FQsCSxsvEye/dZIDZYb7KaTGdZf+
X-Gm-Gg: ASbGnctKmD+O9L4QK5pUl8Ae2Lf+SLDc9Q4GBnBmhySCrtIA/ndKHELB25ANe3UQhjv
	mooXJwd0Ie/80qh+1lURSldOUK8n04jlWsWPjxzaSukAZ6H9lQ+J1ONfQfgc7Rd2ZBze9lmH4z1
	I7mi+9wXt4icHwNQ4nE8tDHWVkz+IrUES6RsggXC3q23APh6VGkNQhug3Yc2Xra+vgZ71T7JbWL
	wwSsSq7k+lgNq9ni9lupV9LkvoZb0WVFYFSpNmgt0RE8uy63otZhg3UecoS5Uls+7AsriPwwfIm
	7ZyA7KQEhtG7IKQBWGNMts10Fz6roDwyhw/EBQv943O9uBl9J3idRWuMkWelaqO7hg0TJozxKpc
	647f6
X-Google-Smtp-Source: AGHT+IH+FO5w31tHr6oUFBIoGn7EGEzlO+Kpe05iZvKG+L2hkO2L/WD3SeYo/NmL/boWglxIzee18Q==
X-Received: by 2002:a17:906:d201:b0:ad2:1d1c:1c8e with SMTP id a640c23a62f3a-ad21d1c1f24mr934769966b.49.1747059788576;
        Mon, 12 May 2025 07:23:08 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad2197be0c5sm619626866b.153.2025.05.12.07.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:23:08 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 12 May 2025 16:22:40 +0200
Subject: [PATCH 4/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_gpio_get()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-pinctrl-a37xx-fixes-v1-4-d470fb1116a5@gmail.com>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
In-Reply-To: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>, 
 stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
X-Mailer: b4 0.14.2

The regmap_read() function can fail, so propagate its error up to
the stack instead of silently ignoring that.

Cc: stable@vger.kernel.org
Fixes: 5715092a458c ("pinctrl: armada-37xx: Add gpio support")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 8d93d36af63ab9496376219454214c05db30971f..2e88a0399d1a205064b58890db6477e2202bf311 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -440,11 +440,14 @@ static int armada_37xx_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	struct armada_37xx_pinctrl *info = gpiochip_get_data(chip);
 	unsigned int reg = INPUT_VAL;
 	unsigned int val, mask;
+	int ret;
 
 	armada_37xx_update_reg(&reg, &offset);
 	mask = BIT(offset);
 
-	regmap_read(info->regmap, reg, &val);
+	ret = regmap_read(info->regmap, reg, &val);
+	if (ret)
+		return ret;
 
 	return (val & mask) != 0;
 }

-- 
2.49.0


