Return-Path: <linux-gpio+bounces-22951-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8CEAFE03E
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 08:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C6145637BF
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 06:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C57E26CE2A;
	Wed,  9 Jul 2025 06:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="R9XeHbak"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C1D271459
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 06:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752043345; cv=none; b=G91ddYgJh6Vw2yCYMo5KcX4vmC49iIMONxc5K1ImqAN5KP2Cxa8i70VTZBudOxSmc2LXitn+PxHT6zyzBLjnpwYur4X2uWxRcK0P2VG9ktQhOzpxAFs/PMsiufUsV452pTLyD+OnLS0nPHyuJkqWChgun/vHIuSfk7piichDeG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752043345; c=relaxed/simple;
	bh=E2ou0tt0FlTgSkebByIdcUe8m0yiHpp5tFL43+CWdc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dh1LZa8w2+Fhtn7TvXy4iRIyvugArnhy6bB8Dsmf7FrnTlQHi3/IrzT84HspFOyeAHg1//CIGEAYkqr6l2mXCdaCw1Fn2lE1OThFt3wRvP55Uoo2lPBJAbI8/kgPIO1Arl5+Hnif6uuaqLzNiVppctoue1JMCBt//z8XBI/pzuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=R9XeHbak; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so419892f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Jul 2025 23:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043342; x=1752648142; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0DQKfX3KmMx6Z8o+4jun5jM2c76vGf0tu/GbGgn4f0=;
        b=R9XeHbakFMyg0I2dG4uyJYA/6VVw6IDqs5hNROoQSVGYI18h8dso2fVtaJMEsWjSr6
         5d9HTXw6AqeSpfZGV3vMJvAKT5yGFfUP3Xq9h2xhjf+uTAiwCySU2s5FFh8I3uGW6k94
         ExRik8sj7Iv5dCWM7GPFElXrEjC7VMkeBCkWp9VQsVn9AvH5+ZT/xVC5hjTq42mDrZvw
         dD1oY0YZHyUVU5A8um0uw06yZMiO6hxWdo8+SYChx4UZ3LPTr3m6KIuf9UPTOgQ3Z42N
         bBLs6qWdnXOWDdboXJWOi26IL/UVALq0x3e5mATJo/gyhxUzKuHxzYTeCa8nUSG4Rwfx
         DdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043342; x=1752648142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0DQKfX3KmMx6Z8o+4jun5jM2c76vGf0tu/GbGgn4f0=;
        b=rcoRVVeh8qifWpwvnyp3xt4c4Dh351C3QmFcJ9P2axdz7tHHUygTnEfgBWBVlXMtsX
         eqSD/+yt0D6m5F0fB+TXJ+1F65eVbK2YpEu+swQQ5p1QmgcBU7czHP9CbNt0nNflIUJ5
         2NGnrhH6gxRhRd60MhnaMj/sGaY8zLbhMyOVQ0LeXCfDttNnsvQusKzREcQubty5TU3H
         bgIAOlLDSBAHUb8DgzjbInkCjwceo1rUiZw8UTpIbldUpGa92U3QFVq1Xj/ziys4KkUA
         /SRauAUzlrMYyMVmJDSkYCT/tTyaXnKb/5Z67vw0u3a29sikYozi4DwWVBKjAalypw05
         Pzkw==
X-Gm-Message-State: AOJu0Yw+/c8Fg1gGEks8GEa5IidVuEb/xvS4jmYICBp/ebzcvGuTB/st
	kMkUFEKltwfGihHTQNTe7LnHyZcRS2JQTYqlgmF785BWKJl9u/oBiiUmtDHNshapOfY=
X-Gm-Gg: ASbGnctQQyKLHGfSnJ8TkH++SwEV96NlMpNTaRf1BezA39lTDBIsbxnDTYkHtPn2C0E
	EyfKwwfFCgx5U64S39C28q3kIao+0iDPrD92Z9BmGSGbsOLcfO9T4XUHi5tedB6JZtAhJsX3Wtn
	XMLSsFWeA3MOzwOJCeKgPC8GSLkm7HQEkxw2DGiHVIY5Au3f7a9FD4QtVYTNHY4mvepGvwc4gwA
	OLbQ0dKDZT1KHI3z3d/5XdrA/ab226B57srmRPX8sOnXkByw+3jsqyW8RCkxpx2Fyf9wFe1XmBw
	ejEYRBdPfQyKEy+NcOt8HK+uK3P6VwLs6i0yjIaK8j6OSo+45cAKFw2cB6+QVgCEljU=
X-Google-Smtp-Source: AGHT+IHYErGEszY0O6HURIFQJLFoxs1voB7vKtnglYD6IdLnU52B9nAfq1W2zadmnVEssWOvYkTf3A==
X-Received: by 2002:a05:6000:4a18:b0:3a4:e231:8632 with SMTP id ffacd0b85a97d-3b5e4461fcemr804748f8f.12.1752043342036;
        Tue, 08 Jul 2025 23:42:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:44 +0200
Subject: [PATCH 07/19] gpio: wm8350: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-7-b8950f69618d@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1996;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=WGAWbXvlPeScqv4ww3b0QbsLDz6kCz/hkdXurfcwXnY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9CP34zqJv31E9aqr/Vmid76S9bwLxrD2Azq
 LTyPQxvLniJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PQgAKCRARpy6gFHHX
 clEKD/9v23e0N93FtyWOphQC+FFZGhZUu3VHAVPF9sr7xyGS9MF4tUnGR/uCMLqThCKaKT7Bwuc
 Yc8QqMMO/8qJ5YIJBhaZcqgGAgfWDeoYOlkK+kPpePHasXGKtxSQNkoemOo5FiReuqpalr1JK0F
 S9uYPJA7mndabfvpoJgMwk48oWU3SjNu19yf8id3hov9p0HM1rBmZxtEDTwDW8iE9RDaq9hgpHE
 ArsaCOEK+Pewgaa2+RnDO+wnpHLE4H0pAV8DeCizW+EtobCTYsVdJMlY0d2vU1cFT1HDRYE9g1b
 fxnDA94xVLjpe56aCUNBeg3Hd0aMuatx9Kcm10av8ARa+DrVIpfghiova+frhJX1sXn8YSD3yB7
 4b6k2jqIcFLYhotf6V9dNOqkM49iAONu6cF4QLxhBKCxs7V70UXsFQ6w2WlQgNIeVosD5k2UhMc
 R1hYlykS72yDsH8Qmevr49Kt2vFb/x/D5q4eRfdssfFuq1FjsSZUK+W/6LmzxeHpjD1MP8zBDEc
 +xPXvvaxX2bSKQohqTR1klXgn6WUtCJ54FP65oGS7XCpFDu+y77gAbrQ1wwFb2XkybPf5iynWKl
 SAGU7YHBQfAp1puxth87820lWtEGWPiJ0S1u3mPEObpA3T9mjJWcvtA2/4YveRttCfy0nkHvIqc
 fB9WtVhigp6gIuQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-wm8350.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-wm8350.c b/drivers/gpio/gpio-wm8350.c
index 2421cf606ed6fded2231b76a2cda2839ed824d64..9a7677f841fc62383267e5e4d95843e2115c83d6 100644
--- a/drivers/gpio/gpio-wm8350.c
+++ b/drivers/gpio/gpio-wm8350.c
@@ -48,15 +48,16 @@ static int wm8350_gpio_get(struct gpio_chip *chip, unsigned offset)
 		return 0;
 }
 
-static void wm8350_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int wm8350_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct wm8350_gpio_data *wm8350_gpio = gpiochip_get_data(chip);
 	struct wm8350 *wm8350 = wm8350_gpio->wm8350;
 
 	if (value)
-		wm8350_set_bits(wm8350, WM8350_GPIO_LEVEL, 1 << offset);
-	else
-		wm8350_clear_bits(wm8350, WM8350_GPIO_LEVEL, 1 << offset);
+		return wm8350_set_bits(wm8350, WM8350_GPIO_LEVEL, 1 << offset);
+
+	return wm8350_clear_bits(wm8350, WM8350_GPIO_LEVEL, 1 << offset);
 }
 
 static int wm8350_gpio_direction_out(struct gpio_chip *chip,
@@ -72,9 +73,7 @@ static int wm8350_gpio_direction_out(struct gpio_chip *chip,
 		return ret;
 
 	/* Don't have an atomic direction/value setup */
-	wm8350_gpio_set(chip, offset, value);
-
-	return 0;
+	return wm8350_gpio_set(chip, offset, value);
 }
 
 static int wm8350_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
@@ -94,7 +93,7 @@ static const struct gpio_chip template_chip = {
 	.direction_input	= wm8350_gpio_direction_in,
 	.get			= wm8350_gpio_get,
 	.direction_output	= wm8350_gpio_direction_out,
-	.set			= wm8350_gpio_set,
+	.set_rv			= wm8350_gpio_set,
 	.to_irq			= wm8350_gpio_to_irq,
 	.can_sleep		= true,
 };

-- 
2.48.1


