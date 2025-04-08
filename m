Return-Path: <linux-gpio+bounces-18416-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B47A7F5D3
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:19:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A91103B59A4
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B269A26280C;
	Tue,  8 Apr 2025 07:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JOB7cEOy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90572620D1
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096678; cv=none; b=W7qg49/47A4DKr3fW/El7G/usROz6MJD/mJHCV3dfTUUWvkOa3uMZKZlJC6OiAuCVwuMkv1H1vxPQnWmB67TVmsJx+0UGyB2QrttOwzuHsUTrhoDItBR/CLYpALfd0MAe9/Np+O/2cWPsjo8C3SsIg/4c9ijnn6caeWGzY5GAT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096678; c=relaxed/simple;
	bh=MyfYoAl7StVsO4BW3rx1l2AiXfWRq1lVePaWfhahBeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CWKA2HDzni5WtsIOMpoqeql5AMpS6aNGlNhfJGX4yNvZ7QDjNbkUi5lsQ01iDyj3/LNu8+Bi3V3RdqW4D/ivU2bkhRg+sf+djbdbBH/eoEecWoU7f8v0spuCe5PNsdGnPifkyCVn5UGk2iIWlaSHiTY7PxsENHYEAy/a62ItyOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JOB7cEOy; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39129fc51f8so4195759f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096675; x=1744701475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WVFJWADW/y0RMccjVQrvsZvTL6Kql3Z12L3/megvx2A=;
        b=JOB7cEOyJmtN5yX5YsH9OtLzPST66qUwqQ/+1oeJ8tddyJnSX8KUj45gR6UuERNBj1
         H9SBFzz7TfqC00EdMfEbTmmzNwCgJwIKM4tJp+JyZAuFemvaAqbjG5TfbEZLqKCCKzVx
         S+3m4pgl9Q9uuEHndfdXUZAjHTeDdcfKDy7xoOakjqdnS27hdJavgmH6NS9IHq5j8ZWP
         HJHtK5M+TbPMmFzEo1gDOKeBYzZhmqaPgI/O2O/BAAspf4uXVPn+e16P9xP9W3M788l6
         z8/h0z0OMBBXHdZUuRk3JaFFaLKvGEpdaOCymHJdYKINEHh3hb7ZLFXPcvFo+2kTNsQr
         UakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096675; x=1744701475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WVFJWADW/y0RMccjVQrvsZvTL6Kql3Z12L3/megvx2A=;
        b=dI2lsJR5pCv9Q2RoUBpL+2bQdJA6DKeYvzhc1GltKpYZXUwyheDhZe03LY1l9rR8uD
         EOQiIZBdoJllYZgZNgoYy+L4anLL4rQ0Y1MAV2JzvcV0ogqVCrB73fzCRmyy+EDdDNqN
         SeDYMh/uiTunT2kACrtOpP+5jmJ1gNG5eNR215Dzruat4bXQWh1wi4E4LT98OSqw5SlA
         mYNy+8BpighrxM6GEMN2MM/amGoBsoehC/QyED4yTzY+LNfffbg5jEJ1RiADse+yp7/3
         nJ7PlgOw/U1TZA3avS4qeU+4GnGhsCzZ5YML3sTOXY37/cSsvchE3rxgYvLxqHTXst3d
         mZsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8vLmkTcVS9tBw+TxK7xsFyqQeQ27DvDXso0LylX5b1WuXtONZaDfx+anz8rrV2uB0FNsVhe8qlwj3@vger.kernel.org
X-Gm-Message-State: AOJu0YxaW+FCcEPiCOXTe0DZ1QBfq9pP8/yzPWRTZYCTE89hLnr6Nqod
	dOy6d85d0Pvv2fudTIGvtFa2RKIg/aOIvxbxvwxeuukmhNqw7nrUDROhasH8COI=
X-Gm-Gg: ASbGncumNg/4A+bChhirZmA3uGQUk8t5XhaqPJ2ztntY85/K76QkWDbuv84EX6iBsHx
	e4ULhrZ82xXYvMQ7yVB2lP9RjlLVzYMBza9wkPomQUhETs/n+NJoROBUXms5N4kOtkwCvVtLtwJ
	2Xg8gjKYVKcSNSMWI3HF15TgNRPcLx/fB4BWB72oWfEK94/S3PDmHMkUrSf9u8T88EIsTe0Ozt3
	QinOZ3oLUSrppwAMtrOB/NXknEZpC2wwLs+feJ/kQJT/wdkXIGCpfOKM4vsxmbcIjm2LAu9ISW4
	Upmbj1qM1LKLi+KsIR6hQgsmF4qEXqW5JdEvow==
X-Google-Smtp-Source: AGHT+IGb12K5x3MyGax1/meWBHx/ceb2e/LqJgU9QQIZHIFbzKHDCky62yygJ2VTuSCj50YJyfE4bw==
X-Received: by 2002:a05:6000:4313:b0:38f:2413:2622 with SMTP id ffacd0b85a97d-39d0de679d1mr13305391f8f.47.1744096675082;
        Tue, 08 Apr 2025 00:17:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:17:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:42 +0200
Subject: [PATCH 05/10] pinctrl: meson: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-5-c9d521d7c8c7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=S3igGGikbfII9kNPL0KKjqnS8YUnpBiOi6WZKLdujUk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2a21smivbrNX7hovJ5AmOVQjkGrJhwqOgTw
 9GIegrUEM2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmgAKCRARpy6gFHHX
 ci67EADKEh90ymTKMGsCY74l9LHK8QIQ4v/81+Rc6Eqfw4wVjL+lPNaGTcSBP2utqyO2KrQMMFw
 Ud7MCMHcZm7kzMCKgZhr4Q5hxKegKb2tXZsgsyhV8YdIebBSZmZS3xjHm1FTslGntrxTtZfUcgD
 9Ncx7bkinKF9GE+JhCUYTwm5rX/ImXZPua18/+263zoA9IcowGvpu+sHiPYBinPQTG/NzQUeczO
 GStvT8lo/PvFW5C2evtDAAac3WkpMH72Zd++nH3ZSzFjmh6wa+JuZj4++IaVtdQvf34/rVmBvxm
 6lfHwsxcLCcvsiKLGQvJ0pyMUTgjTXWuCVx1yI4OFqh/vGStiEpFn/FM4m6cgY2+8721nFS0XSg
 skTUnIqE+icmuFIxh33ZNyBinNKoXfA262Dd1FT4UU/UGWwK/zVzRXebNxxuWVofBCrpGfvckJj
 5An31hmmubXfJwwqfo1WCobGVNTYhODCiiFTT1nEEdIOgEF1ogNVoLg7ND2vY3mbvxs/m59mrBt
 Ghvcu71zj2ubCbOCger+FJ91d0OXgTTDx3l6RxskE+/H9YiT3YVPYtaxsW15NZ/wrgk3dpqh3Pb
 pxgF2SOpd2n46VLipFyjCU5PmDaB9KG2fyxu5yKFQym8Uk1AbdlkcgldvEzqzVK06tjwV4yQehq
 CrMwCr4lgCvIlLQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 253a0cc57e39..e7485c82089c 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -580,9 +580,9 @@ static int meson_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
 					      gpio, value);
 }
 
-static void meson_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
+static int meson_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 {
-	meson_pinconf_set_drive(gpiochip_get_data(chip), gpio, value);
+	return meson_pinconf_set_drive(gpiochip_get_data(chip), gpio, value);
 }
 
 static int meson_gpio_get(struct gpio_chip *chip, unsigned gpio)
@@ -616,7 +616,7 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
 	pc->chip.direction_input = meson_gpio_direction_input;
 	pc->chip.direction_output = meson_gpio_direction_output;
 	pc->chip.get = meson_gpio_get;
-	pc->chip.set = meson_gpio_set;
+	pc->chip.set_rv = meson_gpio_set;
 	pc->chip.base = -1;
 	pc->chip.ngpio = pc->data->num_pins;
 	pc->chip.can_sleep = false;

-- 
2.45.2


