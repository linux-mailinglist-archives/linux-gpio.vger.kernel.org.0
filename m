Return-Path: <linux-gpio+bounces-18419-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9125FA7F5D2
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73DEB189AB3F
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D79261393;
	Tue,  8 Apr 2025 07:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qo/a5V76"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E1E263C80
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096687; cv=none; b=LcAoctrghqsxxTyXvzarkEu9s/9DTCZ6LiVYdYv0iI27yp1p+LAxQxChmkd4L6EI7ZLOFDY0FdSdwi+Jkgn5Ecf2KmaAOEjiRV9nIQEYYzBpAR9/4BtlnTCXH3jjaJxELaWKHdebdLeSk05AlFoGHpWNIOGvbhtIM7tIdxWtEdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096687; c=relaxed/simple;
	bh=4OeEvNCO90SdfkhPZOcSBTLFif5IjDlQ6OH4KtQtVEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bZRG9kCCq7Aq1Sn2ol5kQ3ge8Zyr/JOFmODwxpytRQ7qagZRed7FzxwC5Tu5rzFY2UYrblN+lzOLHuPHWZEeJtWSZrXAr0cOOztF3XVD7WwRNZVstChRDG6AkCAOs04EUg6SYf2e8rei41TSEgeVR9CIE4YxFkYpKDQgdbHp30c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qo/a5V76; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3913958ebf2so4604003f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096684; x=1744701484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XD5pUwvjF21WHvNYwLGg3m0Hf3jMmd7qTIORgnVtv+o=;
        b=qo/a5V76n2xs0csvYpfsO4UoM42pDDWeoDiANNzRichyV3ra7kfrAAp+hSTeojQTrg
         Q0sQinyK0F4wdpkVHASBWRYc9URsshWf4GfRH8LWtaboUs2lhROL/KwpMB02njq1zQKA
         +9p1HRNGvRzK9R+CzZyb0OXs4b5S7s5JOI8aA2hxfrJX/B5GJHStuHD+rUgpJ5W4LUXA
         cBzYKTE57FTJp/rvq4lL74LHK95x6Q20S0O6LCszaqjfbVGK0j868uPQ6NHTSfOipbxW
         9xD9RU6cTKxjBMFXe0O53hF8+8R5+Jo+mwdKSbSfPwnoCpP/ByHevBHbuY072iqyWktp
         0AOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096684; x=1744701484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XD5pUwvjF21WHvNYwLGg3m0Hf3jMmd7qTIORgnVtv+o=;
        b=m3mxoZzK4FSxargL7U+E3z1W0w39wh0YdhkkMmBTHxqe+kpR2fDFL6ijoJRxV29nca
         5QFXIAqqdaVe48l9ABx9uJpLxqr43nUS0OYOqczj6hyiNqa4K6TGLJD8foDgajaJPZEB
         91QcvHeKPo0k3lyOTberKsXlijPUgKcBRxJ9ks8ntbzo9s5ysEospHDvb8Y5iZyhFxkJ
         L4pur8pzJhIHwCFE1lwB0T15LrfaONT0GlQyLy2oQ9Rw4+eskvvl+7+XpoIOCgGf/y+S
         JDt9M0mFkOkvS0HcsbW5oyVxpg9VRJi8f4DfuZukKQ509Wi9G3/AMKUsQGGeaG4od7Rf
         ozmA==
X-Forwarded-Encrypted: i=1; AJvYcCUw6xzpj1NL9xh9oLNs+ecdVU+4v7ci4QlXK2Fw8ghIOxfYoWoh3Zk3jqL8f2cDLVBaXyQy8HTi93c7@vger.kernel.org
X-Gm-Message-State: AOJu0YzkW+028hi51jjQL2djGtAmvCB0MHETB+xDCKx7wdIfiR9DzcTG
	/Exj4QbvyDTtkORBeQYuKfefR+j7Cs+8eXmpsgYPSGDst5sOWo2g7qLdSvODK38=
X-Gm-Gg: ASbGncskAoCFDS9U8abM+iM7fhbNoLMr+NLpmQ/pZpyR03EYK/pEKRAabj2b3zJbYSw
	TR0UJcluzdv40P7hu4TMOkshH62idcctWaj34VO7TkWJs5cLPIT7Bv2j/EgFAI1phetvsdciKLO
	S+SLpe3CKG75xGnHshMF51T7cOXDdJ5PvjSnrlbo5JX22Ad2DaVGp6oVeiwGwBaojiQWJPtliiC
	VunZKPEgUwWAVdH1GdULXflylRWxxR5jpEQYkx2AqWXHX1tijMiGHra2uHwH337iBCNFSQePQ8N
	7tgOBObbz8B4QGsPrkrOuG7FlXZKGhnBxMKrye5hBcxGOxRq
X-Google-Smtp-Source: AGHT+IFABP+0NyYfjrmBkKOY8Qu8GHG07RX08meqZeJWYd12gU6oEH77JekbQo0tofcJZaJ2znOR0A==
X-Received: by 2002:a5d:64cb:0:b0:38f:4d20:4a17 with SMTP id ffacd0b85a97d-39d6fc48b9fmr10149766f8f.13.1744096683833;
        Tue, 08 Apr 2025 00:18:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:18:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:45 +0200
Subject: [PATCH 08/10] pinctrl: sx150x: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-8-c9d521d7c8c7@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2534;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nW90rn+BHn4CcA4KM6329dEBeQrDE0H95eIQ6kXIjjg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2anp9vmc2BpNT/BOe9JwVC3uov6dAPDjgly
 g/s/D9FRDaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmgAKCRARpy6gFHHX
 cjUhEACQA8gdiny3H0cIs/eCXCdyJOM9rKhuf2+4gj2/MdJ4pjxMDZN3V2spjwTYGEBIvnaD2aw
 8YI4+5YrJ/gacqwT5jdjBrv5M86+lRF5x86+aNRAFzrvKT1fp2ZQOSVCdFg5c/pDmPEU8HMJu85
 eZM4/n8/sw0vlUHZ6wC5A3oX5Sbxxq0ODdGC1dCdre8Msr4AIZF9Rud/U0l/y22pDHy5AKDsEBJ
 45mZjH1OmDd53+rAicyRRakUYgVM4hjGDmZuiAYrNQATMYnENj+DH367L8luvpChW7o8fHoDRZ8
 SOKri5vWh0/qd01aZY1waCCyH/8jjdOf3v663xcAX+vBZg0z11mfZY544nqEXoIPun+NYhC9goA
 +elwZSvzY6TjL5X3SaNFiWSrcNSGObk3otEPfb1/Rys5r5iJNEucwjKiGjKDVc0/WJC9BLewaBE
 yHyUqES98sh2Ku2o6e40CjdKDsXHwa4Nu4U873+GjpDrypUhlpb83ax2OzzkXuHv4mvLvUQu9lx
 Op0AGrK6iBc7LT0wuW6I63145+LILkjBnDCErF8JdK9Kjq1HYTLQvslx8onmZ3l8ge9yrQfWCGV
 i29GbD3Msfrbsdl06ZuAND29xiKUyTaL39tudfMlz6CPR/ii5YZmxVuFSe0vVWBkc3Pxb7B/FM8
 aL2+h9Qb3cin5zQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-sx150x.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 98262b8ce43a..d3a12c1c0de2 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -432,24 +432,25 @@ static int sx150x_gpio_oscio_set(struct sx150x_pinctrl *pctl,
 			    (value ? 0x1f : 0x10));
 }
 
-static void sx150x_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			    int value)
+static int sx150x_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
 
 	if (sx150x_pin_is_oscio(pctl, offset))
-		sx150x_gpio_oscio_set(pctl, value);
-	else
-		__sx150x_gpio_set(pctl, offset, value);
+		return sx150x_gpio_oscio_set(pctl, value);
+
+	return __sx150x_gpio_set(pctl, offset, value);
 }
 
-static void sx150x_gpio_set_multiple(struct gpio_chip *chip,
-				     unsigned long *mask,
-				     unsigned long *bits)
+static int sx150x_gpio_set_multiple(struct gpio_chip *chip,
+				    unsigned long *mask,
+				    unsigned long *bits)
 {
 	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
 
-	regmap_write_bits(pctl->regmap, pctl->data->reg_data, *mask, *bits);
+	return regmap_write_bits(pctl->regmap, pctl->data->reg_data, *mask,
+				 *bits);
 }
 
 static int sx150x_gpio_direction_input(struct gpio_chip *chip,
@@ -1175,7 +1176,7 @@ static int sx150x_probe(struct i2c_client *client)
 	pctl->gpio.direction_input = sx150x_gpio_direction_input;
 	pctl->gpio.direction_output = sx150x_gpio_direction_output;
 	pctl->gpio.get = sx150x_gpio_get;
-	pctl->gpio.set = sx150x_gpio_set;
+	pctl->gpio.set_rv = sx150x_gpio_set;
 	pctl->gpio.set_config = gpiochip_generic_config;
 	pctl->gpio.parent = dev;
 	pctl->gpio.can_sleep = true;
@@ -1190,7 +1191,7 @@ static int sx150x_probe(struct i2c_client *client)
 	 * would require locking that is not in place at this time.
 	 */
 	if (pctl->data->model != SX150X_789)
-		pctl->gpio.set_multiple = sx150x_gpio_set_multiple;
+		pctl->gpio.set_multiple_rv = sx150x_gpio_set_multiple;
 
 	/* Add Interrupt support if an irq is specified */
 	if (client->irq > 0) {

-- 
2.45.2


