Return-Path: <linux-gpio+bounces-19171-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4626AA9804A
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 09:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 323BC440641
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 07:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B58268FDE;
	Wed, 23 Apr 2025 07:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="J/Jj7Abg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D34F267F4B
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 07:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392525; cv=none; b=s+v5yikAY1hLadrivDR9b9Gx2vS0usAc/3Cwtwm+rdeRPzYesqUaR6GcDX4KniGH/ugKvuV1+XAML7YI93m9hJZsZeXEMH9tjKXPFUiZ3Jg2+gsZdwtLVK1ii+R4B/CX0rKtKqiIy8wlblXFcmAc72eciWh8ElZLEEWWneQixxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392525; c=relaxed/simple;
	bh=XZ6xojvd/sruxF+mCw9vlXl0QAMDn2VLNkwr1xB5uWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kwprv1MSVzi4edvnleRmulNTBToa+WHHIzj2TfLa2ZvrIKchEc5nfrQj9fipBdq69aobUDeSvlHMOxVAJVoChVZLKsNfzPCPEZ8uqE2TxCiyTIgcZ0myoVdQIqkOsbXJPp23bJaKeebxNfu0kboqxYqLrxxYgxgcjM1D4AakjWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=J/Jj7Abg; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3913b539aabso3661117f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 00:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392522; x=1745997322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EFMUXD1U+4Z14AqM+HV1w8wuHug1ZmPE1i35Sl+Hm6o=;
        b=J/Jj7Abg283jnLsj+yavSCkfxvRD7ExsmlBGM917xPKsfa3IUukPWVTPEAv5iH3w0/
         jR76KJQ37gw1TDGy4yGwLswamvRQtmG/p1S+0JeqiL1hLcr1J+8PsipSYO7UlXmWdiKF
         gr4ktZQIzp30FxFJ/XqEiPjPY+J7+CTLoAQ+bUedEcLUDeer+TssqfToxyQfa/VykZwz
         4JiEssWMnDUGKymvQnCznbF36mtPzG+Uh8h5OHmevUkS95HN4LFPMOKgRCJ/loBLp96/
         nVuI+VBlIHHutN71Zn2wKGveJVcyVWUqGzH2TloWK76Euz/JYmPuE9iQ7wRAG1ext+r6
         QuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392522; x=1745997322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFMUXD1U+4Z14AqM+HV1w8wuHug1ZmPE1i35Sl+Hm6o=;
        b=jkiSedx48dpaUKNUuHJjgHB3rgoLw2bICWEJBupL4+p0IdhOerOI8TNUFBB6a1lppc
         TvpFRQuIk/Y4K3Vau8cKIi+X8MvU2sHQbRYnFtzASV/wHobqfmDMcEc2WexDF06YC9Ux
         LMjz9uFnWS1MynuaeESbnnN661SoB6E+zjypzJaD1ULqmOYGwcYNVye5V8/E2CQj4sJz
         I+DcFuy/ye0ikINVtzIbN/Kqfso51Uob/c2bUE8bmlAJ6I/kuFMu6ledAKSQRyENr7sM
         rdqCY33V83k3rNJR5YTWsurDkcrEJmkXAp15uhyLp35xaHAaKif1yoQ80ZUs20fTW0tY
         OZ5Q==
X-Gm-Message-State: AOJu0Yz1Lkd7z9HhYietMbEl+uTPZKBZNKcL4dcXMyyM2+LvMJSYw717
	1m/hG39oGr4+2hTFeSdDZakXSBW+2458M392D/tmYa10k0S3tR45bV71jp4t5E2wbnl2FTGbTIs
	DB2Q=
X-Gm-Gg: ASbGnctPKa47l+anESSmCpmUoA7ToFOe6kgEofcBZRhWQUMcVrcX1HfttVc7f3jIz6f
	ZgCtmD3ajGDdpeTPY6onrxRIyTNI2drcFbHVKMLPq+Y+7ZhVLSZqeKNI82dMh0vuUsy1cu0eKzL
	QWfBI+3mKkmVBbjpsLkg0T1JKGGNxRwt6kdjWP+cfHRDnhWmYKj0KPZrg+C3VpA8tsjnIj9X5CH
	f4PiiROl7EEMIZ3pEY3kF1sINKq3jdZK+NXw3UuZP8NJpR7Sio5sAoj/U7PkmF1wTLgwFgyaUIc
	ODoyknFC8WDxpow9rrhxDXojEXPg25pTkg==
X-Google-Smtp-Source: AGHT+IHvsBcpeDWfBI/J2ZFwFCxrj5c1G/ZijldBOLJ+QHGBhSPa+tWadnMgTQM8cXeS6fsrFI6NKQ==
X-Received: by 2002:adf:f94a:0:b0:39f:6e9:8701 with SMTP id ffacd0b85a97d-39f06e9871dmr8041245f8f.7.1745392521822;
        Wed, 23 Apr 2025 00:15:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:07 +0200
Subject: [PATCH 05/12] gpio: it87: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-5-b22245cde81a@linaro.org>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1685;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=yQXPOqcv3YdoDMJN26EWQWwmF6WtRyLx2iAMkZ4jR2Q=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOB/2C4C8bp0IytZf1fZVlthvBDEJeTwZpbU
 1xYV3YMLBeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTgQAKCRARpy6gFHHX
 cvFCEACywxkvcnWQIWdFASec3Bgy1BDbBkOwECogN+Tf0BW6jjjtMhLaYlakK70ThJwbwhpvbUk
 uTcNGfW73G5dusyRfhVo8jV864P9WLKJRvPWN4fY6POTOmkYS8HuSB8y2ySIFdhkY11wIAMaWEr
 V5GFNUiFTHl5LpHdBfU/iA8u0VAq4PkvdFd2P6sC8l6QPnQK2yRAjaXgtw7l0oDscOTrwr8nkZb
 zpD3HIqIbp+4DW5XLnmZPFlpv+5GOiIJzKjY4VP38iPJltW3gFZthDg730+RrKm2dYY9dT8XMKX
 t6veqXdJwNvyWBDvwMj6jlzOMSHcoKL9EI/GN2LQnHD8K14P95f4wN6nJdjzkhIp8kY8NMvAG0M
 vGDY2MmLZFfx/viAY9H/jX5kELjO4upTXGb0HMpsMNlvPiLh9Obee+3BMN1we/axJVmGCCa5qgp
 BJTAqJAQWupVylYmsGyeIrDN6oVny1bg9T9J3BXIRKbRFeGY4wLeYXvTICsl3XDDyMyupOjltOI
 Rt9Z/iBdMS3P0O7JYIvMdF7U1hKFuabfVoQymeyQEgm5dc4F6zOt2WPSJHbUub145QgCVOorCXL
 K5zAKoQuqxCtTJYGPyTlNwNei70stMpgj1yXWSLNJ7/RNuvDZy0IHUkeqD2TGsRE6ZRsTp5vgV/
 xluig4eEUuGwCzw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-it87.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-it87.c b/drivers/gpio/gpio-it87.c
index f332341fd4c8..d8184b527bac 100644
--- a/drivers/gpio/gpio-it87.c
+++ b/drivers/gpio/gpio-it87.c
@@ -213,8 +213,7 @@ static int it87_gpio_direction_in(struct gpio_chip *chip, unsigned gpio_num)
 	return rc;
 }
 
-static void it87_gpio_set(struct gpio_chip *chip,
-			  unsigned gpio_num, int val)
+static int it87_gpio_set(struct gpio_chip *chip, unsigned int gpio_num, int val)
 {
 	u8 mask, curr_vals;
 	u16 reg;
@@ -228,6 +227,8 @@ static void it87_gpio_set(struct gpio_chip *chip,
 		outb(curr_vals | mask, reg);
 	else
 		outb(curr_vals & ~mask, reg);
+
+	return 0;
 }
 
 static int it87_gpio_direction_out(struct gpio_chip *chip,
@@ -249,7 +250,9 @@ static int it87_gpio_direction_out(struct gpio_chip *chip,
 	/* set the output enable bit */
 	superio_set_mask(mask, group + it87_gpio->output_base);
 
-	it87_gpio_set(chip, gpio_num, val);
+	rc = it87_gpio_set(chip, gpio_num, val);
+	if (rc)
+		goto exit;
 
 	superio_exit();
 
@@ -264,7 +267,7 @@ static const struct gpio_chip it87_template_chip = {
 	.request		= it87_gpio_request,
 	.get			= it87_gpio_get,
 	.direction_input	= it87_gpio_direction_in,
-	.set			= it87_gpio_set,
+	.set_rv			= it87_gpio_set,
 	.direction_output	= it87_gpio_direction_out,
 	.base			= -1
 };

-- 
2.45.2


