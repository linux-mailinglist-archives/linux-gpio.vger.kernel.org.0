Return-Path: <linux-gpio+bounces-21188-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A72AD36BF
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78698178DD7
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 12:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4410E293B4C;
	Tue, 10 Jun 2025 12:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oy02trTv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6676229551E
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 12:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558892; cv=none; b=kkbNJ+kzs0BkNmCWt2KaZnS80NzpdwUb2VTiamR2KFWyEEV3uLMaUFNLumujJsmn4AdFxS6Uq4VNYy+Wv5D5sIcWwoVk6qcVsNBDF90XJ9J+NeCEMMx8cNPo6eYYe9wY0h4Y6Me5atGjr119UtgzBhtM18iq7AknAJUemx+gEmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558892; c=relaxed/simple;
	bh=91zdGtZGSwm+V7XcYpUxnUCcVZfxjYiWQLUmPmH0e70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MwEFVpoVcQ4ukLO5QQDjn9rkc7xnbtdvWatG/AyzAGXtKI80BS+f4kWgqVPMUBbrx5TTB7vmH6ok/TkdECZVrmuiFEcnKCXRqJw6tx/6SBjFU6zqbH/p7UXvHGJLu5KTcPwtNjkSWNnaROrGCDl1foRKGGrtiQDobULqYjCxqZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oy02trTv; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4fea34e07so3097753f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 05:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558889; x=1750163689; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5K5VoQ4rT1KjfvQ3yVVHAxkopbf0b6YZVw/HgaVIZ/c=;
        b=oy02trTvXy3ytT2WI1ce3YCE6/cMYIzIG8s0V71wgXco3bElkIuyYEubpDH47RYDxQ
         xmse1JOv6X01WyoG/vo1mRuprgj+v6/mZgJfobW/2vq7eg7wy0/+24M6JxrKDpe9gAS7
         oR9rzCbnPSKb/E7LJPTK+npea090tyu23v+u0zHLkH/N8JzydyVHmcY8kaKYaIz/gBTB
         Xt4YwFHamBMnX2yu6Zwk+ZUJxkDf8auhsF/6fmbXT+NBYcVZegTOLsI20Tl3cB8COiab
         yOA6akm2juhEG5IYwmifN+oumjgY5U2aTPPqvcDopF9H/Gi9wXWEMurSyYxUqL0JXOxx
         2CZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558889; x=1750163689;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5K5VoQ4rT1KjfvQ3yVVHAxkopbf0b6YZVw/HgaVIZ/c=;
        b=JsIwSBZKDxX6/v7g+Mva6E/F69ojeF62p64+yzs712w1ZGrhDKvz5wHxoEnj6zu0Tp
         W+AV6BzQQ5fit/cGs30i+7ARa6DcZbFUr1wkm+vPVClNkOkQaidY+eKGM555l6X7V2XG
         dB/r+rWgnBSgCen7w0b4dZ6sxzfjPviVmr9ly1R1HhbUu91anpb3J+HfAm3EvqGJ8EFh
         XpICpHl6ClRmwDh9bnTB9r0Smb/rtbPtP+pUht9KJe3m3mY8jJxUOYfkoINygU5iBSLJ
         D0zu02ISUZ1TZFPwdFvo4gfdKAks5M33UlwN8Mh0BEp3HlaaZpLWmE8Fv9T0VV0lZGO5
         fAcw==
X-Forwarded-Encrypted: i=1; AJvYcCWRpD03qj5LoAwJuJb6aRhz7xvvb5a1+XjscXJiB9iE56LCV8M41UCH9UKPQRbJwoTIK05jy2IJ3trp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb0ea73n0zsH73HVKazAAUzkyaQg5fe9EmYkkvsjyAG+cAow5/
	VjertkdcNARXo5nlTV7/tarr/BT6qOFWXMxRA7431QPDpWcRd44zyHztcnvuemy7k3g=
X-Gm-Gg: ASbGncvWQiI6QY9KjUM4bE+exyuD7WPd1n67DZBPRZwzbGhi7ZMvfX/J/csBTdq57pI
	PycNHIGleqC8kk0Jkqhs6izA40tAKTwYRjFktFBjOihh0mniczET2HFZPyYT82gAmE/Td/nOt8j
	5Fiq+LKT91sn7z1hiUPS13xDLhlxT49RoT9Ri4OpQkTSQ+AqvHyBu2iagIWzdFR2Do1yn5xG4JM
	wPgirCsIotvI9yXWkMShwCKGvZ0J0aDcHWfIclUk9SpVxmS9pjLeqUw9V8Rx+SQU4WjlICXsiu2
	uAUyb1AeaM+ZSfl9+oeX5UCxD4Zkcfpzw5ttZeiR2yQ/IFa7RrhCZ32bZPKEPY/p
X-Google-Smtp-Source: AGHT+IHj5nTgxjR6r4POgz89vPuHOzYTX2eFQrmUxlCH9Py1gxug17nEhIRugT0Pklk/NzpmDFUMZQ==
X-Received: by 2002:a05:6000:2410:b0:3a4:eeb6:3b6b with SMTP id ffacd0b85a97d-3a531cadaabmr14290302f8f.43.1749558888662;
        Tue, 10 Jun 2025 05:34:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f0cbsm12070564f8f.81.2025.06.10.05.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:34:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:34:46 +0200
Subject: [PATCH] drm/bridge: ti-sn65dsi86: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-gpu-v1-1-ac0a21e74b71@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGUmSGgC/x3MQQqAIBBA0avErBuwKQm6SrQQnXQ2KloRRHdPW
 r7F/w9ULsIVlu6BwpdUSbFh6DuwwUTPKK4ZSJFWmgh9lmSDZKx8YLmaTzSanJ5Ga2YiaGUuvMv
 9X9ftfT9l3fFPZQAAAA==
X-Change-ID: 20250522-gpiochip-set-rv-gpu-a52d543ca722
To: Douglas Anderson <dianders@chromium.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2655;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FH3MtQcLLAHOq/C1/tH77XX/4cwaEP8Ca7M9Ub+35z8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCZnFm7Nx6SgfA68TKm7MTHyVJwoF1f8QagOc
 v4yBF0aF4mJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmZwAKCRARpy6gFHHX
 ciwLD/9dvLIfLE83Ab+HXpJ7hTs+SAfUmi5ERohBreEDtPXTeoKyO4BVs0JT9EECOcUs+pwwfCd
 iLcAb4271rbljwRcFE2MU7++EcqYRgdcKWgwdQFfib723SU/2zmHB0TXTXgryVV0SB2YmOkfuo2
 14nd8npBReXPqJhdYXqGE+xV3xhANc8OP3LQEKBrv5KmwbEI4l5w0J16mgApoN2LepXJgI92AH7
 1NWMqPhiYRfNHh1GZKE5RNR6IXvG5DSkk4Mi91ArTlJVj2I8tr12Ll+XaZG6Hfqpqpcz4LOazZM
 FyflXBOZTHeMSAKPVvLfpDyyIYL4dwX9qvERcM95IH69Za5WAN+BcrH5ExNi3Au02HZEh35FgSQ
 gLEwJF9u1zg0wa0UC/3K1tvlo6VZsbIhIs7gPt1wrFYm32O9GosM4OXq1XfJZnm0MgCZjF75hhl
 x7UxdLe6G/+yFQYXhjkaZvXova6P5PmzTMsEisO70Y2F2tgSeg6/iuBxJpgLs/Zyh7PtS8DNAfe
 G2SIR/gD0K6xA//M1c2rWTB8tCbUlQMtRvqXhWAkQO8TTeK7JQwJvJk/LTFwwXCj7eqgL5sCTBH
 GhkjwgTfCKqyjv529CcKIaT7jHEM0mvUG+5ZFWoMuHqPcgDg6xklCwychNy5vz0TsVB5cKMHCz6
 BuRansLmDk0Uv0w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones.
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 60224f476e1d048c693ab36a0a79b6897c6101a8..3814253f36755ca749426993fcc964fa253cb5f2 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1707,24 +1707,20 @@ static int ti_sn_bridge_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(val & BIT(SN_GPIO_INPUT_SHIFT + offset));
 }
 
-static void ti_sn_bridge_gpio_set(struct gpio_chip *chip, unsigned int offset,
-				  int val)
+static int ti_sn_bridge_gpio_set(struct gpio_chip *chip, unsigned int offset,
+				 int val)
 {
 	struct ti_sn65dsi86 *pdata = gpiochip_get_data(chip);
-	int ret;
 
 	if (!test_bit(offset, pdata->gchip_output)) {
 		dev_err(pdata->dev, "Ignoring GPIO set while input\n");
-		return;
+		return -EPERM;
 	}
 
 	val &= 1;
-	ret = regmap_update_bits(pdata->regmap, SN_GPIO_IO_REG,
-				 BIT(SN_GPIO_OUTPUT_SHIFT + offset),
-				 val << (SN_GPIO_OUTPUT_SHIFT + offset));
-	if (ret)
-		dev_warn(pdata->dev,
-			 "Failed to set bridge GPIO %u: %d\n", offset, ret);
+	return regmap_update_bits(pdata->regmap, SN_GPIO_IO_REG,
+				  BIT(SN_GPIO_OUTPUT_SHIFT + offset),
+				  val << (SN_GPIO_OUTPUT_SHIFT + offset));
 }
 
 static int ti_sn_bridge_gpio_direction_input(struct gpio_chip *chip,
@@ -1828,7 +1824,7 @@ static int ti_sn_gpio_probe(struct auxiliary_device *adev,
 	pdata->gchip.direction_input = ti_sn_bridge_gpio_direction_input;
 	pdata->gchip.direction_output = ti_sn_bridge_gpio_direction_output;
 	pdata->gchip.get = ti_sn_bridge_gpio_get;
-	pdata->gchip.set = ti_sn_bridge_gpio_set;
+	pdata->gchip.set_rv = ti_sn_bridge_gpio_set;
 	pdata->gchip.can_sleep = true;
 	pdata->gchip.names = ti_sn_bridge_gpio_names;
 	pdata->gchip.ngpio = SN_NUM_GPIOS;

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250522-gpiochip-set-rv-gpu-a52d543ca722

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


