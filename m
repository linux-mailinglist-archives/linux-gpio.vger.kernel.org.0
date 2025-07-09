Return-Path: <linux-gpio+bounces-22950-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEB1AFE02F
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 08:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E3F51BC7C91
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 06:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E27272E7C;
	Wed,  9 Jul 2025 06:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zpNDYgJW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A535B2701D1
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 06:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752043344; cv=none; b=BNMaUlpMTnWHDZSRfmuF9ncTjTVfILXAouJKAWzPvuvaCozZC1r1sKQKyn8l3Zr+eCWjtfnF+xzlhAZp9mahvW26I1bHDEI0zxeF4KdZfFKu3yZafJgNIaa4pGknCzlVDddF3XBKW7zMkzKM+nK5XYt1kwZrr7+uwid2FshzCLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752043344; c=relaxed/simple;
	bh=zE0f2A0whucaSvwxcjHfWPmAnumPjjedM3PiavVbdo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=amjsaQST5Bfhw4JzYM/ENW7EtQJheGWLbXufr/OGqdNZ8rSauC+tK5oE2cCntmFjYQpQfUjY8xNdD2AOJOGurGEmdYQw/LsyqsF5JrjtMbKbqY7FJ/hAdhotgsg42jGOfBMB+Igzhuce2aGLYPQk1jkH8zP9t8zSyKm0mWAj1Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zpNDYgJW; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so37207515e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Jul 2025 23:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043341; x=1752648141; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MPajqmnoVcOjf6GJbUpVo6oCGjF8nwoS+qUy5dwCIhQ=;
        b=zpNDYgJWVpxUd52++wRb096zfpkncL71urs1FHgdKkI4eS/+k7pcRTwhekA6mFbO3O
         3EEikL/Dz+tTgz+tNOMiXtqpt6X/scmAybGOBFhMW7cKm8u+2eEl7LHT+GgiOg2RpmZa
         mtC0xYN3JPzaRIbwMNXX2eKwY8ZUZhOLut5ya6gXiqDUwM8Mt2lJFqgOI/D35ab3VyfG
         j0He/6DkhmQ6/ZMXYauFkcUxzXatfSCq+2OmwioSbBbcHylHzLp2YAQzLp9skZxdPcgO
         nQJaYpirfQ6xUM5DTSLqjgNl+K0mVNnQgtWDhWtRloJlsCAxP3rI5Cd2CkYEW3E+YoPR
         K4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043341; x=1752648141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPajqmnoVcOjf6GJbUpVo6oCGjF8nwoS+qUy5dwCIhQ=;
        b=ZIF9FgkCHcse3To/BisI7TmPqdehKSWrTUxmOSSPLmSE/idGto/Lnn3j/F7/7ACciP
         VkhUkymgkbhXdA+ZXsbywjeJaMlXUp8hmUxysQgQAifJuxfyUK9iXrBKVWxjv6K+/Wnq
         X+sOySeKUZLipEGqAHrvEzTjLwua3xnsBxrNoWG5gidiFSlEMWifc51euLftEHqDVrRQ
         1eb3odpB/V6G2NpIixAVc2MF/3Dg2RgzpOaMSfpj2fSejLjs4arPYuzhXAP/D1ym/6EG
         L3vriZdEhZYeYBIrOuXPzlOYoMTiIgvGoVkTErlTW6S/d2h3bPVIWRQFhdSc/+b++An2
         B/+g==
X-Gm-Message-State: AOJu0Yw5yvPICoUmzrUnj6noYVOH4oQGmYAKGRVuoExdVpXWcEM0TKiY
	wGYcMs2WIqCH5PsaIc2ipOuvURSbaWW2gEwcqd2C7O/1qE9p4ID+UDG0rsJEDn1OFzo=
X-Gm-Gg: ASbGncsIl4JacETMKcSRKXx0sr7GcT6n1RjKrUWZlukZkUuYEKzL2VimDFxBb6PzT/L
	eEwTH3xkw6h0UPl/+QHIL3Po+PxoDkkQH03hX4whQdnOZKg5ktZrkcvOrav14QJznzD/355eiON
	vqVQmudvZwiFbczqJIsA+V4haML+/m5x+dT/6Ks9gYxWIZMQto/IRvqAJ4RRifAUeksCr4P+zuG
	qq1CVxvr1cdkvLtZUQEgKJnhkOUcvGGxyWs+BFbG/cfOlqPtJ/RuL38evnSY20Bg2R2EAZBjBxG
	u4qmbRfZuYkzYCKhv1fw7wTlHFPXOTe2zEPZzwCKcxjDIKlfNVXbo4k0
X-Google-Smtp-Source: AGHT+IGMHhoztNYKIZ5oHKCKAHb3C+v1doyNHaPZOSvkM7RRVSuWIdbNbZkjhphe7LL0RVfSh//MsA==
X-Received: by 2002:a05:6000:2906:b0:3a6:cfca:efee with SMTP id ffacd0b85a97d-3b5e44e9d0dmr818341f8f.17.1752043340903;
        Tue, 08 Jul 2025 23:42:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:43 +0200
Subject: [PATCH 06/19] gpio: wm831x: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-6-b8950f69618d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1936;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ZvYcaTtEfjxQ69P8FnA0QAOdbNIxX/hy83mA73NmJoY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9BQ4M2+iQs3KKvACwXJ3ypQyhfL+QAdze1C
 OUY6jjRdlqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PQQAKCRARpy6gFHHX
 ctrtEACDMUdvvc4i3fLYnwLbi9aSVX8DAfUufWN3epdDbOyN3oJBjVCOFFmYAuUfLpbpxZnBmgH
 OzJRRerQHoPAIEuZgohfWhTndH/+jyGBldsQCOvVHpYSFIG9g367VsnuNaumo1h6lyqRkpq8K1G
 TgGYPYZbb6N8u8pgTFG+kXDg7GejCYx4N4cUDRSLENYQOy/MUykMbCZEpHWq5xczZQklKbz5c2L
 1XBpYDbqHhAUBv694Hlq2F1Zaky+1d7+cc/9rYCiDUrV/02v08stEA35DtLzpTF94v+2IqsRKKo
 vhgdwycPLz5j1CabjFpVFoNgearY05QBAeqFXQGKPfMOEwazIM+8cdrTrb7YE3XBCV3lMIdnMhi
 T88CHyHnIRkjDINYqdxa6eJkejvmr83WHJZZYzuAMJbShclP2oSwVmg8tpCT2DK6DLiZEq5dfTm
 RQBGiCXbIcPkrP3HvRL1Rwo8W8CAZ6AXbs1pSR9Ha4yhqQETfBIauKv0OkPuS2ZNlw0LkEzQpkv
 y7l1ug0x2lBGfCnFlMg29c0OqlKBNpuIOWWAdBfBPk55WirlxQlMtibE2q7ROqOjHaObYBwvVvb
 40gdgZi7r994zj/UXGV8XbLhkalavuRfwoWEU+PJcNQD4lxCQJsusBPDSdFUJPWw9Jd5TJALc7o
 PRcAM5yVfcH0hsw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-wm831x.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-wm831x.c b/drivers/gpio/gpio-wm831x.c
index 61bb83a1e8ae4de29c57066944ce25beacdb454c..ab58aa7c0b9965ff13ea82efa22dbf6fa5d06c92 100644
--- a/drivers/gpio/gpio-wm831x.c
+++ b/drivers/gpio/gpio-wm831x.c
@@ -58,13 +58,14 @@ static int wm831x_gpio_get(struct gpio_chip *chip, unsigned offset)
 		return 0;
 }
 
-static void wm831x_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int wm831x_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct wm831x_gpio *wm831x_gpio = gpiochip_get_data(chip);
 	struct wm831x *wm831x = wm831x_gpio->wm831x;
 
-	wm831x_set_bits(wm831x, WM831X_GPIO_LEVEL, 1 << offset,
-			value << offset);
+	return wm831x_set_bits(wm831x, WM831X_GPIO_LEVEL, 1 << offset,
+			       value << offset);
 }
 
 static int wm831x_gpio_direction_out(struct gpio_chip *chip,
@@ -85,9 +86,7 @@ static int wm831x_gpio_direction_out(struct gpio_chip *chip,
 		return ret;
 
 	/* Can only set GPIO state once it's in output mode */
-	wm831x_gpio_set(chip, offset, value);
-
-	return 0;
+	return wm831x_gpio_set(chip, offset, value);
 }
 
 static int wm831x_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
@@ -254,7 +253,7 @@ static const struct gpio_chip template_chip = {
 	.direction_input	= wm831x_gpio_direction_in,
 	.get			= wm831x_gpio_get,
 	.direction_output	= wm831x_gpio_direction_out,
-	.set			= wm831x_gpio_set,
+	.set_rv			= wm831x_gpio_set,
 	.to_irq			= wm831x_gpio_to_irq,
 	.set_config		= wm831x_set_config,
 	.dbg_show		= wm831x_gpio_dbg_show,

-- 
2.48.1


