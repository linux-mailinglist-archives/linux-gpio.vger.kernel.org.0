Return-Path: <linux-gpio+bounces-21862-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A90AE0138
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 11:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B277F3B2426
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 09:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA18F280320;
	Thu, 19 Jun 2025 09:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="D/sljmd5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB28427FD64
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 09:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750323782; cv=none; b=JYMS+WQrDALH1iuX+WeKrekyzuO0fS2XXu6SunHeiaGTwBliGVMp4WMbQvJni9ejZeHXVuox+L+prrYC8uC73V37FvyKOIKM2lFX+GJk6RWdVMJSmohYbTEi5Exw3rw7jIuxiWJX6kAyP9h7e/fmbWzyCE1UGl2otqLL0Xz4tqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750323782; c=relaxed/simple;
	bh=RHhsm7qDV/S77GnvCkhXBQEgEK7PlbbKz4uXoVUAEnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZXVWnrbpIKF1Ru+PqowsooehwM8yGA82CyJuv3ssC4OgdkAPa/5q3diKm4pHXU6S9aAIN51bzHpPZcgdPEwcOGSAhI3VyJMVVtHl62f7HZ1c047ooqj7pXsYdgetu1nj043mFqugBOSjYHq/+NdCJRBWon8TGIJEEGaDJ6qAcmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=D/sljmd5; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a54700a463so294573f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 02:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750323779; x=1750928579; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/hW/L8M5a/DDRbhy1aA2Xk2zg+bIWaNZ2wLOptUOeRQ=;
        b=D/sljmd5cvn68XlrR04NmgT19TsbuH0Jp1m43pZ5N29XLGB6HZo52BnM4pkomYe1ho
         61DexNKVb9fxkH2tZdbohvn2mUvNPgSvvwvAZ5LJkHF/30DClD/DwH1pRafERRvNhBHX
         T/UJ6CMSC9fUKHbmipvQHNEhC/jREakx+5StqitT9wrrnOHcQBIrYKT5BRVvNJ+yUf+j
         vDCo+CD0dLT+WXNurpTpKut7I8OOls4+zFOrnEQyyHwT+VFVT7pbP1EfjSpu7RpRsljX
         mh1QxZOrutW2LJtHh3zW0jF5QlDeTfTsL7Su2VCuCZ5NgeN1DvItNhnk1Pm+07CcEYRD
         ZRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750323779; x=1750928579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hW/L8M5a/DDRbhy1aA2Xk2zg+bIWaNZ2wLOptUOeRQ=;
        b=InoKOmzgtvZEouhmUfOQjF91MsLUf4yxpiiPxnzRkfyhoEUHn1urz2TCztJQGuRTye
         7GvoMxvmGZRKK0an4okjhSwFW1adh6Z+WJ7D0iVzUjhQlBmV2J+KejsuSsSe3LTycv4j
         4w9sj6D3Nt2gKPHKixMAmQbkJBrpUuERLtaz58tsGwnwTfpjHaWMLuSViDYrTc7ruqQ5
         cVKz24B0Jo+ftkL+0/MkDJ0KFXT/7+BsXKdYS+EA4Vw+L3nenLQ8pwuu+xCuSqyX4MFg
         +JHKVp22va1qRtF2M819PYfeTKxHsBWT4OhggQnwDZ9ZwkJbRB5g92FnAJmuFm9eI9U0
         FwDw==
X-Forwarded-Encrypted: i=1; AJvYcCXV6sPSaEPau5Kqv8mql6MIIuOLhniCBxBqh0oc5B6+4RGAT9DykBbrFQYTVTaJByEM6n/g4SC172TQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/wzfV1FPTgNqusMgk3TYqr/C79Ug5Ee9vv8atT/cngzVJQnJx
	TckW2h1oBsKlONEinChCFVbaYBgcVLNdt6MajDRAqm7CkUYGpn0/y9IAtn4me8ZUCdw=
X-Gm-Gg: ASbGncsLSPbF2bp7pUmR2CJqzamhXzGt2pmgNkbO63/hz4bPiFQ8QB4LfyxaCw7Sk4O
	0ae9/r1PTIDVzmpVw/sUsAEJ2ilW4hPcmY22DgKqQjUNaKCQ11xE1uKqYz5nLQw26EcELMCZ4Om
	KpBM6EgFUq6UoYFe6VXfSY4hJCuJUMe9q484rHaKYQ08PNKIvXExgkqb4WsHPt6MYfQMBfoCCVv
	eKvPsikdayVw1X3nRuQRgMof1v4/YX8hu+KDvo72RidjHE61FjNnnq/kGfCZ/LOvHxjqxcfwBxS
	Khg22gl0SshbaNPk6AkyQRU2Hg7Vvai4TceRqC634s4+Ht8JPSE2KlKg6lF+EfhqZzw=
X-Google-Smtp-Source: AGHT+IEVovGyRuHtUimuo4236mDnH1SercDpE4v+HsXfDaDrjXnnjAwRmZXB1cHF6Q8aIYGsc7zGFA==
X-Received: by 2002:a05:6000:2511:b0:3a4:f7e7:3630 with SMTP id ffacd0b85a97d-3a6c96be03dmr2350646f8f.15.1750323779231;
        Thu, 19 Jun 2025 02:02:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b798d3sm18874645f8f.100.2025.06.19.02.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 02:02:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 11:02:41 +0200
Subject: [PATCH v2 2/2] USB: serial: cp210x: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-usb-serial-v2-2-8c43e4a4c810@linaro.org>
References: <20250619-gpiochip-set-rv-usb-serial-v2-0-8c43e4a4c810@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-usb-serial-v2-0-8c43e4a4c810@linaro.org>
To: Johan Hovold <johan@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2176;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=MuvtdQbJLcxQJZXLZZx6q5p9m1EdL4f/pCEbUZgm6os=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU9I/I9ng4/h8FujpF9nrsgWA6sjpbQdEtRsKN
 aSB/v8kFyyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPSPwAKCRARpy6gFHHX
 cl8XEADVeyfIFgSHdaEr/OyMQe8OUZF+dsbM7K0Jd29+NHwseuiXMzhYGaArbJA3wNhOZ3kERnm
 EaQM7JSoZo0ooAlr9QB9Ni8U1NQ0oDv5GRc0gUFeLEmVBQcY+0MWAVGjdSgozNqGQDW5N5Ow8K3
 PtNGDBaINPXNdf95/19TPVcIdjERGPtpGDB0NTDVnbifQi/WErdRqFchllmQ0TEBOl/IItpI/0n
 ixw+8IVK/afN33CSd+qIYYTvjovMkGdrohP3H3jkB4GkHK6bjo1+4gehmZv4OGVATcBK5uopAdT
 tuqj3D0J6R2ShviAHpUlCsuUeuvbL7vY4kb3Dx08P9KWcyyp05yeJqahuFKms/lnHdT/gB1SDlq
 qPTojaHqslGbaE3Mdp2LxqcsX5MJt68vvnvhXOJYNbF83q6DF/sFyVGGMYCOZfn7U7TpSRhQFZx
 SeaJrgOZ/9C3odT87QviC/7ovoS9cCNgvbUhavc1BFNc7pQd+We+rR4JgRYep92dTPBl82WlQUH
 C75vRsqF7hwnrIlOyZWifNmdsWmvKvgQHV/woLp4OfdnYe88Eq9W5x1wmyGO9YIwUY+W15bHMDr
 i03leCvaCoaDJQmtlJBModZPGscI3BijKP2Tth8nela02SIg4uSi3r0r9p/ymbeGfKCviTF9k+F
 liPWlHVDVoCLNwQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/usb/serial/cp210x.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index 9960ac2b10b719192dfbab0a6e81b2cf80f40d36..cfa1d68c7919b998b645143096696bdea9ee4423 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -1504,7 +1504,7 @@ static int cp210x_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	return !!(mask & BIT(gpio));
 }
 
-static void cp210x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
+static int cp210x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	struct usb_serial *serial = gpiochip_get_data(gc);
 	struct cp210x_serial_private *priv = usb_get_serial_data(serial);
@@ -1559,7 +1559,10 @@ static void cp210x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 	if (result < 0) {
 		dev_err(&serial->interface->dev, "failed to set GPIO value: %d\n",
 				result);
+		return result;
 	}
+
+	return 0;
 }
 
 static int cp210x_gpio_direction_get(struct gpio_chip *gc, unsigned int gpio)
@@ -1599,9 +1602,8 @@ static int cp210x_gpio_direction_output(struct gpio_chip *gc, unsigned int gpio,
 	struct cp210x_serial_private *priv = usb_get_serial_data(serial);
 
 	priv->gpio_input &= ~BIT(gpio);
-	cp210x_gpio_set(gc, gpio, value);
 
-	return 0;
+	return cp210x_gpio_set(gc, gpio, value);
 }
 
 static int cp210x_gpio_set_config(struct gpio_chip *gc, unsigned int gpio,
@@ -1960,7 +1962,7 @@ static int cp210x_gpio_init(struct usb_serial *serial)
 	priv->gc.direction_input = cp210x_gpio_direction_input;
 	priv->gc.direction_output = cp210x_gpio_direction_output;
 	priv->gc.get = cp210x_gpio_get;
-	priv->gc.set = cp210x_gpio_set;
+	priv->gc.set_rv = cp210x_gpio_set;
 	priv->gc.set_config = cp210x_gpio_set_config;
 	priv->gc.init_valid_mask = cp210x_gpio_init_valid_mask;
 	priv->gc.owner = THIS_MODULE;

-- 
2.48.1


