Return-Path: <linux-gpio+bounces-21852-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA70ADFFE0
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 10:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C420419E25EF
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 08:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA1427E05C;
	Thu, 19 Jun 2025 08:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wdFpXUgp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DAD27A477
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 08:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322021; cv=none; b=GEViF9Utuq7al/mDka8hHpXdU1DNIpZu80ErneqGX858RnifI+UKXC2ZzJEVILzE/agM4wYoiwK6O9nZg2Laja1hJ7Ul1u8YRA6V5yTZavC1kcz6d8SWSsBxZFNtxoZFqc12Zh2Py5XXV+/WtJ5qiMVPvOQC2NpsMl+w4jmZ2dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322021; c=relaxed/simple;
	bh=3QvoiOFdKV8vnY8Kgna8S7pQjfH/iy2iYWkuJQ55SWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hq6gjTuXzWVuNkKUzwjXcX831sjHxJkZg2IXsKazBXGmeV8W1M8gdlUzqOfs+73R3/6A/Z7Dsjpv9scilIhfHH85yEVIvFHmEPeNTfJ7jhusOcZ+WdCIEIlxRbjYSajwcOLjSy2linIicGm2cXiFYaBU6zARRqFNqFtDKkg4TqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wdFpXUgp; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a528243636so317751f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 01:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322018; x=1750926818; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXdEOuSE84y7KQ8YXqskQa8fEM4BBQcsKhAUrS+jouY=;
        b=wdFpXUgpmNk7rnGQ+a8x1fbWI0fc24PbUdmm4ygy9MQykqzIM9RKy9vpyHyRmBwJJ1
         UMIbuPw3dIJM+DK1+CIX0F5np2yhnqohzC0qhihph8m26sMNxt135w3kgBC5LeWmnWgd
         KzTtIBTMPPSm/5jfbjwXrwQOny5XY4DiXJ081vPh0iuRdvbCRcG/dVnVMP3arL1Oei3h
         Ke4apxlS1sRlX/88qGNaKKGTwFPIrL9yZiA79NjiV6gen/g83IJsq7inDzO3zOFPCVir
         BemrcribVaODDc7/VEbDwN85oW7Bk6FmR/nCVZ2d2NsHhiArlPj+HjMqPnnaqmNEyoml
         m5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322018; x=1750926818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kXdEOuSE84y7KQ8YXqskQa8fEM4BBQcsKhAUrS+jouY=;
        b=jm322/EeIkDXrCwck6IzeCriYRIEBKZaxTGO9CEQlyVETw3sS+CVu0+Hb7VXK/C4I7
         qmenYBjIbVkpzWNpHPklshZChol257XpwjQYYzmzgO3dZs/jvVAjLZ0bkAdtygGtDrQe
         NYXk7OzIYWlCf8bbbidXovkIl0FS88pWZivgxLW9JM3pnd4O4RH6fdWKy8CrwjuPiM5Y
         l2w3ZYcKttx7XIv8TijLrWOuhs3p+xEbgL14AuOHuFYrO7UluL3/Yn6IXmw+m58FwYiE
         E8zZKK242g2PWrt0mAGrYw9AFPehDHykAg+TvM+2KVP1HU+MzZrYIJpfDQoUOAl5hldh
         cR3w==
X-Gm-Message-State: AOJu0YxpbKXGNTbeeqW7InXo5UaDz6nzTMdCNSbJq7Xn3cAQ+Q+OD5Ig
	1kv4GApfIwB4lFr5fXKUzCpKacUOCN7xxIX9ifCE7kwNFedw8I2+/BvlkgH/9ilM5a8=
X-Gm-Gg: ASbGncv8TOjcj9P1dkGLzKUUd7Rus8UzwT6qWLxG30IA+cT/0+7v146TwkeCJnc48qW
	2b5I1knkGa53xdJSX6RLyWS6WWRizYpviNxbtSiUfgXOYKGqgBgvrVrB0SenzlvG2dpULQ8827X
	tL9ofSr4lpLXGK6p0JPmmYgQBlLaiuGQZYzHU7d9jVUushpvqb6IFiTJ6rcNQta3k/27B1QvSHm
	/5CPdeswDkCp8nhM1jHrTiSslZjVN06pN1EX7DgBlDoy7qL0z6mA/qowebq3ZLW8UPaYMC4kZ1a
	4TK5cE+orR7EheIm568MXiNOrSXAh3FxFCOL8RI9Cuwjokee51ePeiRZ
X-Google-Smtp-Source: AGHT+IGYf6Ur9Ugv00BgKRd4oArCMUnqUFrWbDyyGQdN0NxdK6b+fGQpGmKSwn4EbOC14dV/Zz+MRA==
X-Received: by 2002:a05:6000:1a8e:b0:3a5:2208:41d9 with SMTP id ffacd0b85a97d-3a572e92134mr16408329f8f.40.1750322018388;
        Thu, 19 Jun 2025 01:33:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm18828151f8f.28.2025.06.19.01.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:33:24 +0200
Subject: [PATCH v2 11/12] gpio: rtd: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-gpio-v2-11-74abf689fbd8@linaro.org>
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU8tThgGdaruvFHruvGZ1lAgXO57/m24G9JZAH
 AZ0dHw+AMOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPLUwAKCRARpy6gFHHX
 cpX2D/4iJISKxtRrP48ODihJoiJODatcQMlQc7qJrlQLGfyqLACXHtKsWH3vo4ZYvHikNgYvQRJ
 D1nzxPRafhpjXoUNaE0TMiVgAlNKv9WTqPh8/ca2vopFGeG+12V4TJ0RolHwfeWF6rZlSlfU+CA
 FvT4uglIG4oz3YIndaFMKuiPqMomFTuZ0sz6nNr9S9WlWUhgXsNm9AKG8xL4IzkXqjtKBFiNu2+
 U3K7koUtZzrvTm8aKdtBVpr+Kh5fAyEqbjIUM8KOkoac5CfacDs5anNnBu9PKyrknB5dvjkw/Tj
 DfA5KyxsLMcEl5iT4UW5xS8NRuwrd2cXoVpY7NjLMeHOMKy8KE7LFp9uDxJUsiHuG2ANr+pNF+/
 Sp+rl+r5szqRedXKpvRobS9q+e3EP0vNDU/VDu1pZo/JXnoMuNM2qpx/nQVRU8Tsq8QcjUYl9ce
 lwj3Snv0N3vLx6DIj714XhH6wwZEaVKQhBofRj9acJG5pOKa6jB2WPRGvW125y1ztYvTMDeRfEv
 j2H2jU4CXmygo6ctNjELJGSJVJumx4KCPWqkrZtPbkWlOwMeO2fo29J+FLWIGoFhTsm+O8rMI3D
 Cl8TjTeMgJ2IZopO+r8CVVGpRCUAOrCeGhm4n04NxnSzuAKKqpB8gVhYIq4eL8fynV+EFkj49TV
 WjjMy+HzldWpe2w==
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


