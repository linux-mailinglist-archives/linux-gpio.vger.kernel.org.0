Return-Path: <linux-gpio+bounces-21700-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6AAADCB78
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 14:27:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EBDE1650CA
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 12:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108F52EAD1C;
	Tue, 17 Jun 2025 12:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2XKrKV12"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D3F2EA474
	for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 12:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163096; cv=none; b=JWhqZeChZMZXlYfwhmmEvOz6HOTyZ7lvEyPgfe/AEB0ykkKng0Nui6LjK2Qf+5vV6Um9j4Rt3OFBOb63tAhfBnI9PNbwgMBbWv05lEAmsLcfgX35XgKtkOBsenXQ1CU0RG2O8kd1WZTTcD3rVl2FwJC+yq9ZRIZmXEYgicOZm+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163096; c=relaxed/simple;
	bh=3QvoiOFdKV8vnY8Kgna8S7pQjfH/iy2iYWkuJQ55SWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bQIBp2TG7Yk86Uy6pMTjONwtMEd+8t3akLkDa0qqj98kVvWsTWwMQ/XHcKJCLqsru+qyCc7hV0UvUWLe7Pd2Qs+YoRvOK89S08gpnmZj57j0o2boo7XIA2DhkcxOcQVrcrkdQt/8fWCXTzyyspx603EnuZM6r0Ph6UCHYASrcTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2XKrKV12; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso3814215f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 05:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750163093; x=1750767893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXdEOuSE84y7KQ8YXqskQa8fEM4BBQcsKhAUrS+jouY=;
        b=2XKrKV12QgkkKnozExFqvj91aJ89+ulCoVpmkf96jwsBpMAJH5UGgjCjND4mEWGabM
         Fnhy7Bub7X2cih6njlasAhvWvwuvHfsPDNZGVL/hgBdcogGW+rghb5JpWkM9dy9qtpnv
         nHvERnG1j+W+hplPHg4fZezNNOvYOsi8YACRcbGQBCo7NX7/CZ82t1OlP5wnVWf7SSkK
         eLuNCpHntEez3D8H9IxlefrVZpjKuQPLR4H6jbJDsWKui+XDnQpVPjY5CDYPgIy12sjF
         u2Hut3XMA1wY2lE/u9vn/2EyaCmWQh9FAOfEyrDzHKQRIp3f0cfuLnNdeWuL51aXBush
         ROEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163093; x=1750767893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kXdEOuSE84y7KQ8YXqskQa8fEM4BBQcsKhAUrS+jouY=;
        b=sTlQFfcN1K/RODXSOTPStQ5iLYgvLjrVoqHTaBHTeQOk2lIANZvRmcUSYpmePov5ks
         96gXtM+Yc+2oX2xmQ8CsCovmlwwdcJ/LDnD7P7Ijch0ZlCF/LprfZjCRWvGb1ubdUub2
         ZxvMHSlGh0tI4IvWXlnbAg68MbUVyE7l/oD5px9wCneC7Q++kvw4+Ou2dzpxlGuxoHWR
         SlnAtBLpaxetOBGvzshneo4QYNVDkcGob0JXiK8XtpMxdGWxxKRnc4z4qulL4fhJYqf5
         e2t6Z91XBdscYzjZAOFXD0/QYC/gSbcDWfBikjVPMdEjP5Lm1k3IB6KQ+5b4gnwZiCUA
         0Jiw==
X-Gm-Message-State: AOJu0YzOYC4EvWG/PFrEwp76euhkntUUKIvkEekhEadbabfbTN/xU0Wa
	ynSmTjl0kELQyhOyAmLjrmw85BKCxqh4MR6lGi5OO7PTdDJVAmFUw3AJtYgQ1s+RAjE=
X-Gm-Gg: ASbGncsuCTrTW+yBR+t51T0lZKFa7x+uk6T96T9CcreJ7wGy8Yp1ir5ioekQF0BxGhH
	MePshW9uR8RdcG2z83lhms/PI3keqXJkxUrVCC429mq8KoviYBsDOEpHv6huDUi4Sy9VuIIzz1p
	oUpt96r/rgX8P0iiPsimF8y6mJm+UmEy2wABRf5zvc8LWejJ8GGeSwn5/Ydv9I5BMgYlM+PnzCo
	3ifQlShKv1zo/2tM2DACSF1RKnIewKT9SJL7OVXKrNNKXBZwdxPu0yiDVOeFOASANLvTtLFMj1N
	rVznyMAemDtIYlMLKHM5GYAX94u2NkBtwvTyRryYAw3CoDD9DiAEV3/C
X-Google-Smtp-Source: AGHT+IH8xpEepUrAKy/suev+AiSpI+HMEadcjXJn3KnGCfb1V3r97zqr4NOUkjvPw/0XSg0h1ArV8A==
X-Received: by 2002:a05:6000:1886:b0:3a4:d6ed:8df8 with SMTP id ffacd0b85a97d-3a5723af293mr10690095f8f.39.1750163093381;
        Tue, 17 Jun 2025 05:24:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm173816135e9.1.2025.06.17.05.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:24:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 14:24:33 +0200
Subject: [PATCH 11/12] gpio: rtd: use new GPIO line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-gpiochip-set-rv-gpio-v1-11-903703881fa2@linaro.org>
References: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
In-Reply-To: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1662;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=v7M2Umlyn2cPSJSz3+M1vQ3MpPcGxR4ur24zUL3eZaA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUV6Ix+OY9qYUNs57XxRLpSefNPZMcuXRvrrwq
 in5+MyXCnGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFFeiAAKCRARpy6gFHHX
 cgUcD/9a/NMO23UBM1PKONinHkaDzFJv6rspeSt3zyUyirrJTSC+YG9L7KQAy6EP8I14UVcZKtA
 lNgBgl7hfpD+zkk1mp4AwrMXPBeVx8WSSjf0FmO+MrjsITnI4Z0fbz5o0jDFE+lDn7xD2cL2auU
 947xCBF9+Ttxmotpuw9ArSMMBdVwMeIEhjD535k2QDvlUfURzxixpuWKVDuW/kJtMFSOIjhirXR
 NyY5cM5Y6hZc1PlNZvVmKEVRYX2iblKuwvO6aTogzr+j8DsAv9hWmlSFzuRR9P+0aO2XmvgGXg8
 1n6R5ZC1zPol+Zn7IZ7P9bmtLwmCbhtwH52ceHQw7VwuxKj6XyyYS5Islx9pCInqsAyOKDDHc5w
 sBCDnSCr9KRnoYUgVU0FtZUccsCkeSs7u2WVJt4OXTN/vaW6+jyp25w9AcT5j70W4I/sXnJyA4C
 RqboO/HC6SFaenrazVmKfvN+w+LsKTyh2ubg6Q33Cvl8SUHSuJhXPmmYEVJtMBoh9sAgCbbhtZD
 VBokjCltqacYpkmvjoqoa4oGIWdwNjsmEjshSlpcJbQEjPOwSC8OT+L5DEF3DPTETFARiOApkFE
 DZl/rN6G8ha/5RdhURKiwc3HANM9XFITHEtdw4xybhabqYeL+fl5ZjADtbwN8Rh9jmgSrioWfJq
 BY0Nu9ZHfizUkJA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-rtd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-rtd.c b/drivers/gpio/gpio-rtd.c
index bf7f008f58d703347cba14f35c19f5798ee3a949..25bbd749b019bf8a272c173a3e7373a442f72350 100644
--- a/drivers/gpio/gpio-rtd.c
+++ b/drivers/gpio/gpio-rtd.c
@@ -275,7 +275,7 @@ static int rtd_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 	}
 }
 
-static void rtd_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int rtd_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct rtd_gpio *data = gpiochip_get_data(chip);
 	u32 mask = BIT(offset % 32);
@@ -292,6 +292,8 @@ static void rtd_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 	else
 		val &= ~mask;
 	writel_relaxed(val, data->base + dato_reg_offset);
+
+	return 0;
 }
 
 static int rtd_gpio_get(struct gpio_chip *chip, unsigned int offset)
@@ -563,7 +565,7 @@ static int rtd_gpio_probe(struct platform_device *pdev)
 	data->gpio_chip.get_direction = rtd_gpio_get_direction;
 	data->gpio_chip.direction_input = rtd_gpio_direction_input;
 	data->gpio_chip.direction_output = rtd_gpio_direction_output;
-	data->gpio_chip.set = rtd_gpio_set;
+	data->gpio_chip.set_rv = rtd_gpio_set;
 	data->gpio_chip.get = rtd_gpio_get;
 	data->gpio_chip.set_config = rtd_gpio_set_config;
 	data->gpio_chip.parent = dev;

-- 
2.48.1


