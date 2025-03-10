Return-Path: <linux-gpio+bounces-17368-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C178FA594D7
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 13:42:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 965BA3AD33C
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 12:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3F022B8D1;
	Mon, 10 Mar 2025 12:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OanqF+Ot"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C04B22B598
	for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 12:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610441; cv=none; b=e5Gng8+3TWaQJ0c7VZhVKlQENS8FuP79aC2NhxSU4enXjdfRyrTTB+K0uRh5C64EMe2NBA86CaAf/pZ8hKYi1UkIHOHiYzLmfkAZMR/8/DUgfcpcT+hYDGSkRhzC/poDaX2RC+aFRL/3nKLAbcOYC3q1sUs3MZ5jZeHKMSIV5As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610441; c=relaxed/simple;
	bh=an+fP7Mru70xaNnEI2kekcGYASlHb28T6SJ68s0UULo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Szz5z6Wu0eUqhWEO2zIXYDvTGe7MqNvgj/BZElQBoywtMTyP9Tu8Om88w5CB5begqv0giPBUtrtOsEqQkXsGPPMQzuQeywRkn1yX7HLUMApaF+/xMOZqZlRJIPcN3UgTnG8qzbyP6u0n8MadOl652ivGLEsnMY28tyboqWKItRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OanqF+Ot; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43bcc85ba13so33632195e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 05:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741610438; x=1742215238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H67PL+TODiTrJrMnnAUO7rPrwzkz/ZoBAK5iB5c1v5k=;
        b=OanqF+OtENgaf1jl3SG2jvtuUCiGriEFjCVrUY8clEltBfRN4Ox7lsMjq6ZL+aZaxO
         Iy6eBbsyp4b64kE9qnR02MEkjySsaQArX+pZo4kgHkM//HiJ4LRkoBmJoEso96xOnk/Y
         rfmyx2r7SPui7yWHeay1bOhLCmyWtmMxOT9xp53zE4Apq0xEcQ2pFLNtLZANz8t5Hzgp
         B0V6GwjDzcuy+L9mf8yHVNgj1S5Jk3IuCWpGtgmLOHIoJ/JA2E8WOBpfHQ6DDb+Sjq5L
         fyKvGuo3iiII94/fhRsMpE77J+V0+Q9zdLkk8nlzDEUsHcUUg7XKIUUGqSjqqj9mTxb9
         ZUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610438; x=1742215238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H67PL+TODiTrJrMnnAUO7rPrwzkz/ZoBAK5iB5c1v5k=;
        b=K53rGfAcT8RtodGkzNNzQTSN0zgai/2nqnD3GzI3KOfpDaIJ7oxmxIjbsP5GLun6IZ
         /f1a7IhGUV0gnRUnrG8fIYE4DbywTWj8fn73XVB2uLPogPGUVlS/IUNLQmQXYNafkQLx
         eQn4hnNXjHTMU0LdS8MKGSKWWWX+F2Rv6DJCsRMkN5nH5xMTUpMVt1wYq5xYOJPD63Qt
         /sTcj5WVp2CDojxTj1z6thbLcQ8ru8oSuSHMfPODTD6oPAD3PD+cCfs5Tqtf6dHEPgmC
         8QqsXFUBv42Xkc4JA1XUF7HHcmKfbLf8n1vsO2/Q5gnnnrj+CSVvgq3jwd0F/sORK1PX
         C+Cw==
X-Gm-Message-State: AOJu0YwRx7g/yRs5yXb++0Cm6K6m97P+Xy7YBS/R7jb0W1jnXSLyMh7A
	4CJshOza913Ra8jTbzUFFT95cDcovMhYJJq0c1s1Ocy5/6UxdjunKs4xHsBm6Ug=
X-Gm-Gg: ASbGncuSwaztp6pCtD5UB3NZrZat+D8pT3gVAGw02/ghq8z+Nma+P+ocCyK4+aiK6yH
	uGX7ROrXWOGk9jz3/9TwIJgHkjOnFNNg3sDih47xOu3DAy2B32qRtjoDpQPj+5xCPhtRytDUSIY
	rwrNPhDTygbTqWW8s6gj870gUT6sOAwakq1whjAaHD/qXsSQqODsQFF0xJapEgNwH0Hpx7FJ3HO
	08prZDDKPGfbZdrIcTY3x3AbDmoGxlSP648CbDuns0WGKmiC5lZ4iRSeeeEBraBxE2Hi3kM2MPS
	yCo6CbdCssKaqHKRLX2EvicemnJKHdnI7haRag==
X-Google-Smtp-Source: AGHT+IHjIzliJ6rTfZiH4n3UkxkJcqMKZdYBYvY8eKvqKod7sCTO2s6497FITea5bFS321oo9wuZSg==
X-Received: by 2002:a5d:64e4:0:b0:391:4889:5045 with SMTP id ffacd0b85a97d-391488951femr2560499f8f.36.1741610437863;
        Mon, 10 Mar 2025 05:40:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdc5sm14535865f8f.25.2025.03.10.05.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:40:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 13:40:25 +0100
Subject: [PATCH 11/15] gpio: cros-ec: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-gpiochip-set-conversion-v1-11-03798bb833eb@linaro.org>
References: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
In-Reply-To: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
To: Ray Jui <rjui@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, Michael Buesch <m@bues.ch>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Support Opensource <support.opensource@diasemi.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, chrome-platform@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1839;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=mf+lhnl77k+//huQWe9emQFE2kvk1m73N1tBKnwoBnM=;
 b=kA0DAAoBEacuoBRx13IByyZiAGfO3behiP1ij9aD+aqKdAjP5QW4rawFipO8AKhppE44TNXtk
 okCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJnzt23AAoJEBGnLqAUcddyefEP+wXt
 sBVW2A1B7Mj2T4DFX6dl0Eey5mAcH8eeTbNYT/BFiOBPA7rn380y39f4nROcug0PbNb1Tsszqbm
 CzR1zvo4pNa1rtNPEDur8VWqvb15eC0e0tX830mj8j3cF0nLZkSjrHnfyeTVgE86gexHDTpndq8
 blZv/Q5Y9z/vnMEYxK2tAUD2qR34yFwgo6a03/euLYr57quf8CQGpmgRMtVrj0t4+LqdDBIqQZL
 9hoRXz1ajW5/kOtbtrpxSBRuigKDy2c7UU3fKe4+gIGr3oueFFSWcRJFPnhx5TNGuWnX976oRu6
 PrcdKh2LVdOwuMa3FJf06h+364irmp3peYYP7vHZvppY+N4usY31p0eQEfPwPic3aBTnEZwNQfc
 lbimXOOagyNMBhEhTZ/lJznxlmZSWAJ6mm+Bm6FYY1FoqCXRqbEmpxDoJNGKVSEmhi+ZgbOJ55i
 oje3S2uWnGtavaul/BqekSB18sOV8y6jhF5lJn2qnLcgXqjsdmXnxNHhBWe3O2Bqstz6M3iUr+D
 UqWAAefc0ZUVWhUsWDyHF3a7UjNksNOIoVsmUTvRglhox2voc4BKqJ1ZO0afbsGdZ5zu+82XTe1
 LSVUnTXIhh5BMOkU0eMA8Aa/z6WXjuvTDkAxPmsPE079y23XF44sKmMN0LBiZeCbB3PPOHqroIE
 WAAk6
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-cros-ec.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-cros-ec.c b/drivers/gpio/gpio-cros-ec.c
index 0c09bb54dc0c..53cd5ff6247b 100644
--- a/drivers/gpio/gpio-cros-ec.c
+++ b/drivers/gpio/gpio-cros-ec.c
@@ -24,24 +24,21 @@
 static const char cros_ec_gpio_prefix[] = "EC:";
 
 /* Setting gpios is only supported when the system is unlocked */
-static void cros_ec_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+static int cros_ec_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	const char *name = gc->names[gpio] + strlen(cros_ec_gpio_prefix);
 	struct cros_ec_device *cros_ec = gpiochip_get_data(gc);
 	struct ec_params_gpio_set params = {
 		.val = val,
 	};
-	int ret;
 	ssize_t copied;
 
 	copied = strscpy(params.name, name, sizeof(params.name));
 	if (copied < 0)
-		return;
+		return copied;
 
-	ret = cros_ec_cmd(cros_ec, 0, EC_CMD_GPIO_SET, &params,
-			  sizeof(params), NULL, 0);
-	if (ret < 0)
-		dev_err(gc->parent, "error setting gpio%d (%s) on EC: %d\n", gpio, name, ret);
+	return cros_ec_cmd(cros_ec, 0, EC_CMD_GPIO_SET, &params,
+			   sizeof(params), NULL, 0);
 }
 
 static int cros_ec_gpio_get(struct gpio_chip *gc, unsigned int gpio)
@@ -191,7 +188,7 @@ static int cros_ec_gpio_probe(struct platform_device *pdev)
 	gc->can_sleep = true;
 	gc->label = dev_name(dev);
 	gc->base = -1;
-	gc->set = cros_ec_gpio_set;
+	gc->set_rv = cros_ec_gpio_set;
 	gc->get = cros_ec_gpio_get;
 	gc->get_direction = cros_ec_gpio_get_direction;
 

-- 
2.45.2


