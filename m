Return-Path: <linux-gpio+bounces-22948-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B65DAAFE02E
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 08:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D819E164E4C
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 06:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49FA270559;
	Wed,  9 Jul 2025 06:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HJTcarm8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F28226B951
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 06:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752043342; cv=none; b=fr7y+416Zm1aCwUvUEsmysKJX6UvH5snoX5l9i9ThgcUOY7Llj3/RnSpsGBxHcQIEuBvVKhSslMOIP5Z8Ki64AjLZ0hi+J8l1oRnhC5frg3lT+C7/SRyuhRoMGXdVTw8Tyx47xDXisnhPpFrOwXxQh0q66vhfFjz1TfyOAIWIM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752043342; c=relaxed/simple;
	bh=M7IPbjAnZMn3M8GlMJp/gsgqNDS75YPISNCmCvtuHTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=prgwI9UZZtLuAMqljMz5a7y5PLl8suT9KRo8/Z1cAPmKy64dI3nfAv5ZrO4ntUqPOfur1wbWcuJF89qB3VILjGAiBi7vbNUs/D5AP03U10MDGBVq4kOPy/SQ72IFtvFEWaDZN28u5zWBisSjXHRp2RGOKpkh4TM2jiwCN4n+M6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HJTcarm8; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451d7b50815so43085435e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Jul 2025 23:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043338; x=1752648138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1ym2OeCkr8pQMFEPmypEnTbrpUrxWB31rOAPrAMJlc=;
        b=HJTcarm8AtYHp1Dqfw3kzNggMmQO1kd0nVIrbW+qU1HtmyGlRZineIs+qDoM6xbJwn
         J7B0pqiCE7tk+np1MVtIPK1V77eTwooiq4Y4fb+1NNmzYCsVMuz1V1kcFKKOABDsH/X7
         ME/YsAyW8GLpTMFIEYhQgHqkJKA78+f3M5P7hJR3nH7hUpb/0hjIltZuz06R2eYmewLN
         /Pd8P0q4OiuNWyCF6VgK0uZ1rW8I8T5QqgUtmvqSI5t+m0Qkl3OMertrFCEgVr8pEmv6
         hdhl5WGemiesdAPQ/NDstJP+xWjgC5eciB6yf0IxJ5taTQ4jbRJVvovvQKssbdpypB20
         YmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043338; x=1752648138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1ym2OeCkr8pQMFEPmypEnTbrpUrxWB31rOAPrAMJlc=;
        b=F6KFW+Pg2nfLbntfyD0KAjpG4im2vlRCEBzOZMyONXjGirXjg+qSxOreBBjVudSo0C
         vSxAODv/GcGSbwU+T1JtGuqwpFzxuPKUgXDEfIhj+NYwKu+DbBwQD1cnvCQEBmiInXWK
         FNPRwpMJKIIBPyIXH/OILGR4R9anvDci8OrzK21bUcwusDAz5VDKfso0bUrdo+G5zSmZ
         UmhFhRCrymwp49t63rc4GKLwZgTSYnXoJ89mTbXNKoUL7rcCQ1/VehUSa97gJGHKF9YG
         +NNexnMsXo2/HV3n8GCHQL1VsloVWUw+PNEVAmlHz5CuQwfAzJ0jqI8ldaIRYnl3gXa6
         ZFQw==
X-Gm-Message-State: AOJu0YzA73vePh9VHvnJDpC8KF205n4YOeiPna57C4+gsGO/2g9CNvcx
	zTFuNeoVIsJQWoZRDOPLXVjdhMyJMuuaLZ0yx6Fx1ssfEexYB3AogFQ5WnFdNfHrpWg=
X-Gm-Gg: ASbGncvBplLXuFSSJ0Y1fZeXWue2DI5JWYMpWujVcpIZPSEgYSn/Xrv69Myf0lr5IOp
	wjCfVRnOabWif26bKf+Vjb+AZmAJiaeGatzRxh+1j0YJC3y6cTp+RZXBJlmpQLPb/BqsG4Wp6Dr
	MsjOJCoD/waaOVNhqJWfEe48o4dnAUAkhTIzO7/nt4w7VRUNT+h4CrZQyZ9ZKkAB+jfiVMgaIyP
	jzo+ejo9KzihJNKJzIQTQYKGI/LJcyWHOokTaP/ZufcF6PDchKwbr1P129B6MquNg3KZv5+umd2
	+p1eM87WiyjiFXOfPPB1pevWiP58jtOWDA4Wve01mqB6bauwn+Z5K8Xi
X-Google-Smtp-Source: AGHT+IHt07U2Xz5v4O7qgram4qRcjgWp95gR5cZRQzOYCsYLjawbfcTIUzAXt4+yL+o1s0TkUQdcFw==
X-Received: by 2002:a05:600c:4ed1:b0:453:6f1:bdba with SMTP id 5b1f17b1804b1-454d539ae58mr9109895e9.20.1752043338455;
        Tue, 08 Jul 2025 23:42:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:41 +0200
Subject: [PATCH 04/19] gpio: wcove: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-4-b8950f69618d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1685;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=6ucBCkbJOLiqAuQZJ3VCIGGEW17v/EwaGRwLA4V5JMc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9B4JpB8pMhhn437+VIuAIY7CmIdj+JcRuuS
 uEiRvWCjliJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PQQAKCRARpy6gFHHX
 clKCD/sFvTus/eAyxHUgCoS8y5p5otcRR1TJO2ueDJB/HW509aW5EA3hYGf14ndSWvI8dyK8Bha
 LvxsZmja7p7CTftWZyOhwdh9DdfqybtduYek+u9alFU2KiAfoguXtBH8jJvxKgYeG215RM1gTDP
 D47AjFtax80JZO5IvqckTna5ubszZ8gh4KneKJe40f1a37qJqN2zfuAHEkMvJcsbzE+LC9M/jVR
 UazsfGlUfV149xpyJfSv8JVeKYWvYFv++KPOtliy+QGblL8kMZ9Y/Uq9ZhjKV9XPBX/acRpEikx
 ZChaM0rwqaq5w9HiJH3Bj5eTPKRmta9ah/lUaoHC9te3vQJla6TzwucauwnSHXUf0bDGFUJRgVF
 jDUQZovcen3+TLGWm+r8AN/gJkSn3voDUC14TvsAXmxfm5G9y3Mc4QMYq6iqKxM9AyekJy/AIC+
 NWurj/6eFbE9IuOKu4Q30ttt50IBFq60Zu6F/NesPnWxcfdb9kLYHAqKVeodbjJlwidNRmLSj2+
 TtxbZXiXYM3H0UTtPIFInQlvkCKLE16LreegEMd5JkhMf5AnncXk9drs2qV0TloOPQ2nm2/sbkt
 e2iDD1eOjQLLv7faZ9s6+qcSJCFem7eChdjIS1GMo52btA0JFET2dKC/z2tNonEnNwx6vkppbWO
 m6plrux4/on+Mcg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-wcove.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index 1ec24f6f9300f33f5b3f0f8deb539e08392b8188..c50b74ced6364e3c3cfbe9ed385d21c80a2bb2e7 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -200,18 +200,18 @@ static int wcove_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	return val & 0x1;
 }
 
-static void wcove_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
+static int wcove_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 {
 	struct wcove_gpio *wg = gpiochip_get_data(chip);
 	int reg = to_reg(gpio, CTRL_OUT);
 
 	if (reg < 0)
-		return;
+		return 0;
 
 	if (value)
-		regmap_set_bits(wg->regmap, reg, 1);
-	else
-		regmap_clear_bits(wg->regmap, reg, 1);
+		return regmap_set_bits(wg->regmap, reg, 1);
+
+	return regmap_clear_bits(wg->regmap, reg, 1);
 }
 
 static int wcove_gpio_set_config(struct gpio_chip *chip, unsigned int gpio,
@@ -442,7 +442,7 @@ static int wcove_gpio_probe(struct platform_device *pdev)
 	wg->chip.direction_output = wcove_gpio_dir_out;
 	wg->chip.get_direction = wcove_gpio_get_direction;
 	wg->chip.get = wcove_gpio_get;
-	wg->chip.set = wcove_gpio_set;
+	wg->chip.set_rv = wcove_gpio_set;
 	wg->chip.set_config = wcove_gpio_set_config;
 	wg->chip.base = -1;
 	wg->chip.ngpio = WCOVE_VGPIO_NUM;

-- 
2.48.1


