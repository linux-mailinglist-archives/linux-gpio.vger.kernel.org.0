Return-Path: <linux-gpio+bounces-19170-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E2AA98048
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 09:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59192194031D
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 07:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E901F03D6;
	Wed, 23 Apr 2025 07:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jxNoPTEn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22037267716
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 07:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392524; cv=none; b=WoyN8wUP7nDBNnJwTs3cwBzH3fSnce4RCD1NF2vPMcL/ttCe2w5TSACtX7XGXIUvMMIEwDyatfYDWVgD268PmXS9CUQcTRAoX/UdrLV+YHE/Fn4B/U8m07mXx1RfJEXis2z9p4Crowmav3ej9qLgY4LfMOjy12GUMlTznCMWv5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392524; c=relaxed/simple;
	bh=580JJg8Ww3ZiyIW4O3yV2fBLgEg8aiONXpvmsEP9WsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DjyjorKydCjUy7tBGFPHk5srrYWfmqmwgQ8CbAGx1sPe8bql1ov06kiyDYAY8pwguQwhUvtbjOPm4RSPXam3KbWJRKCZa89hwqa6cFHHsO6ia7qslWCsXLRlUDevlA1iX7m+k8UeQwqoCLeMHtYSKlfsOCxqf/v1nKeYfMh7uvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jxNoPTEn; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso28371605e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 00:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392520; x=1745997320; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2qxZ5SNufiuhH2/QCBic5ml0Ty+5BazjFOvOXbBOTw=;
        b=jxNoPTEnq/+0Tcaixz3OevV5NG8vqTM9uQvGcOsjPSrn2mrGiOo/D+JGRWVdRjP/Mm
         KENxEqxLdWgJ6aYajFmmljwqpp6LK7NndDyKwvAjmqviJ7BiwpOXmP8L3b80VKWlXfgK
         gGhcDL0IsHnLn7gSZzCPAs1T5FE4s/Ke6GMH1ATbXV+mxxaNtEvMMoWNo3fT28+J07K0
         Iuv1rGIzDPu7Mlb574+KAMhD5kOmxfmldnf6MoUjhYhWJkPb4mn+B8Ju7xBGuRuyvwdJ
         5uWGPj7+wruYp8WDR4Vjjyv9VxguYtxOrhjwmR38PZKdJX1UAS/mdwvqfKd3bAtb1rQS
         6yBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392520; x=1745997320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2qxZ5SNufiuhH2/QCBic5ml0Ty+5BazjFOvOXbBOTw=;
        b=T2jjYMfdUN/hFX6etN513XdVKUi59naMl2jZ9+Ne6vv+HMyhIxILyXCcrGSh2kmeGV
         6gS9fPM1bArOqHMXdej1tUt7qqW7Yd5IRPvtEgGJtBNJ7WbPWd/9rHgO+C+V2mUoCy0D
         6pcJWex9HGAfvnYIiODWSNjdXVIrtx1wcJ9UNqFeqlHD75j8CEuFqmo4rieiehzapa62
         NZg8JDeAJPMdg/5GQG1sM0KS72wg8L+wKfWGmv1khb29bO/13qmxdbczpAVzaM/O4TPY
         iQ6wYGlx0hjlfyMhngKK8n16EXcBnwM6oH8Hw5dCNoEDLvYZoggCraESbQym4KrhyKfI
         dGfA==
X-Gm-Message-State: AOJu0YxFw24/JJOownCIDv3vk81sI3BFRjQXBz9is5ytLQQkEeUPzS1d
	vr8qOGal3t4dPactd0+NpzjmtCl4E5MJiPzWlSrVcYgF2F6hGWS8gVWiRck2Lj0=
X-Gm-Gg: ASbGncvX/5Hvvs7gZ+LNAlq9GA4ycURDr01n/+hWghoMipzIElnh5hPm+gFv8WtBezf
	J/FHuV2G2t1B4O+Pzaqs8rM9nfQ2bQ4Tv75GnoX1Li+0qO2tn/JiOjZoVccZ/Fv3ir3Q4bt/hEN
	MmRb7DSW7eOYwRaD6BcBQdG8/9PcmNg0X8VEbX2n103n5rb2glTv+UN3fV1FlxDNaZxqS8iMOD1
	hXqkzFJbAhLB9hnIe/UpLRIp0fnM1VnkDGQOLiB+nlqM9KmIcjuz/ucGCpXGqQPo+vehoBsejS1
	2zLC3q8UfxgLMjylTvmbeKDkuo/bWM4gyw==
X-Google-Smtp-Source: AGHT+IGX9aP5FGs6mIYBjE2Fy/Cf3MYPL+aEO76HfSyqqWsd5X9AWMYdMfxaiJI4eGNh/jiqHeIceA==
X-Received: by 2002:a05:600c:4fcf:b0:440:6a37:be0d with SMTP id 5b1f17b1804b1-4406abb245cmr171540525e9.15.1745392520323;
        Wed, 23 Apr 2025 00:15:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:06 +0200
Subject: [PATCH 04/12] gpio: imx-scu: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-4-b22245cde81a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1536;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FRmNocCMgDCqyKK3swLP6cODkyyIC7OT79L9GAY0bjI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOB/Ov6sr/uWpQe44AZ9kTd5SkCbX39gaQdU
 ccSZyRED5+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTgQAKCRARpy6gFHHX
 cggXEADC9I9dAp8L1/RZQY0dK85ZOpEVf6XAJMrSnBsXrkLU6zw7OZw5gZkWmuoJf4VcHq/ObGx
 OOhgSlr0WVXDo6p+71iJY1PXUy7IXdkfl3o8/f7H3TRHoczV9Tlc72JuZl/EJopVg3cpI5xRoPS
 zq7H8TZvPbwH49XwIanfFJCXAORxh8P8YSWVm1rn/oqrMUM35wIXkPe5Mvqq8DWJYWbmHgh5z3L
 /tq3HhHxfZGOGDZRbGsT1shgiAcVugWAKTafplG8JXQ93NdJjlrlM4Lno+p0DWjUd9JLjleYD+r
 ZochpLmjlXyaxqH1xATLYR4ZZDAMuji1wbopYnOvFT7HxoAqnRxFkPTSvkBS39wNw8TwsG5XuOO
 5TlTkSEfB4W3GyMmWqhv4AvCnIyll2p7V0/2Vkq8OfR2fHJEpKwZfwsWdfBeCFK6BsLwiTZge23
 bDWGLZfvXivk+h26DY325XhI+4ZtK/PJaabjA/YAF40tVztEJgXYxNx/7SGj6vFpKTj9MS1hlFz
 NkdXl9BY3YDy32+JDNv7DYgBWB0L7/hVA1cEX9nz8gQDN3Nq0+toSuigcaC02VYkZgp/cCKC4ZH
 bgMWCHgNflrBiDi5V/EsYMZBTaQQiiaoYLijx72aN++D6tnudp9Y0o/dqxjScLYfu8xNbjfcupu
 LRcbpKCJb1Q4l3g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-imx-scu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-imx-scu.c b/drivers/gpio/gpio-imx-scu.c
index cf98b948f804..1693dbf1b777 100644
--- a/drivers/gpio/gpio-imx-scu.c
+++ b/drivers/gpio/gpio-imx-scu.c
@@ -52,7 +52,8 @@ static int imx_scu_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return level;
 }
 
-static void imx_scu_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int imx_scu_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct scu_gpio_priv *priv = gpiochip_get_data(chip);
 	int err;
@@ -65,6 +66,8 @@ static void imx_scu_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
 	if (err)
 		dev_err(priv->dev, "SCU set (%d) failed: %d\n",
 				scu_rsrc_arr[offset], err);
+
+	return err;
 }
 
 static int imx_scu_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
@@ -99,7 +102,7 @@ static int imx_scu_gpio_probe(struct platform_device *pdev)
 	gc->ngpio = ARRAY_SIZE(scu_rsrc_arr);
 	gc->label = dev_name(dev);
 	gc->get = imx_scu_gpio_get;
-	gc->set = imx_scu_gpio_set;
+	gc->set_rv = imx_scu_gpio_set;
 	gc->get_direction = imx_scu_gpio_get_direction;
 
 	platform_set_drvdata(pdev, priv);

-- 
2.45.2


