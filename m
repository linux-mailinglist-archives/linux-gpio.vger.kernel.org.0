Return-Path: <linux-gpio+bounces-19167-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0E3A9803D
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 09:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 552223B64F1
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 07:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4EA2676E1;
	Wed, 23 Apr 2025 07:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="E0NYy58u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C8D21764B
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 07:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392521; cv=none; b=AykcLoRpC2BY7op/rjDkoAkociM//LzhNfZ82PbVcBZjItvzeRYbBjQq+lSmRpvrlVjI4ORubGq7YAjXnZ4Uftb0zXtFhJ9QArSspNgVY8FkwHIxxsOXlisznZUkmZhUNPsMYD4qEUaHnX03nduDmyzC1XO+lVEFmkEJajQFwVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392521; c=relaxed/simple;
	bh=GkZqNijLEREjgRCyxLO9ZWn6Syhz3Qs1P6LxUc7FAUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QdBId31elchpRkT9Dh67vtOZc9IEMomJFh89sLHwY1zRrPkUwT/XW+X08c3U8iCmMR4HqwRNd5YP9HcB3aooCu81WN168BYjj8e3J/Img1IJ/eHDiMyLm1eGgPwwpt1zHlSvey7aVryEdAkitltC7wh4LoszNpByyuHLu0TDR9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=E0NYy58u; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3913d129c1aso441342f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 00:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392517; x=1745997317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0bNDTv+LkOZiuFXKOWgCql95LZI/mk8z3mrtaxkHEY=;
        b=E0NYy58uyqW2qnwuHJX8ueh9k4zi6r5APAOFYbb1ktr8haA+TVZ9Oe6s9rG25LU61d
         VU+unr6xNI5BV5X6A64MrUlUVsRDinzVTjuqG6TuKC8nmSswGYTaXz7orcd685weWogr
         8Ep1vRgjC6/X7z8v8DXTD97Fk0Lty3suTGxS8i0DoYge41GyYjeNYmorV6qXP18AMuP0
         Pvv5UJmWKwzL6NQrAkSBtzosZsWNyWbgp+LU3OoBXDmUkyj3Iusp2ZzSi+TrYpCVp89m
         3lQHNcSJdm4mcMlHbF4n3zA99udypIC7Ss5pJmd8bLovLf1qm24hkF3Lg0qwqxRDv9yP
         zJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392517; x=1745997317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0bNDTv+LkOZiuFXKOWgCql95LZI/mk8z3mrtaxkHEY=;
        b=omTxjXC763Y+oCWc4zBcDybUFqCxGyAXU7Rh3MlsVPLbg2LC82k6KZA+iLu7M58LfN
         VDuuNaQCSFlbJ7CwasUariBG9V2VCgz6by6CYwfrlHISGFqZBBb5LIaoeqCZZPvzWQ1y
         1As3DveccpbSmqrvk/2Xh57TETqk9u24QToHxQflQqcDB80IHKr3YTBl9OsXDiHYv3nb
         7OQotfEdNZRjeMzxOr2kYDtj7s+lgZJRpko0Jv65ppvgX5hd5hKWss6ZbAJfjzG8+vpy
         X3GGeJxALqqyoy2IB1ClQp0gNcVXc+zq29TLagnetfuaBeVH1yRxqGbXTglIyq1nBH/z
         jjyw==
X-Gm-Message-State: AOJu0Yz3R7G4qnQMOXcFoPwHOg8oglS25uLtDw8CXTgTfyojtW/E5Ful
	4gxEVqpV5k7isu0UZowKAIm5WYB8C50owGEeqe+9ygNJZxoAwsX2jGo0yzX0lQ4=
X-Gm-Gg: ASbGncvK+0UCkbTDWG+rAs/6zSc94UDrPhwIr12AMlHO7Yt/itxM8KG/b8DpMiG9YWc
	LoG2PVYBntB96jFklgn6B6E5ZSJu5kMzCojtJ8uuCTPeriLkW7bm/c+RA+qTvk1Pu5HPCdlgs6J
	ijfWdJb4jt+3U6jTAw+ay8eXklAJ7Y3KV8joTZtjt89OLKIke5iezJGSTf9TtElIH043equNlFh
	c4aydB/7dXGWqxhgKta1FPrsfkAABvAeBXFuHiG89Z+LJLFzVneYaLrPTc+zApcOnqWQQvm3GNb
	B7ayLm5n60VOI8gNTBo1qK0aVQc9YOmXzQ==
X-Google-Smtp-Source: AGHT+IH9m7S47Z/jCJ7Q3TFpGFMrRhaPorWIcAZkoI6/0ohfBThJXsrLnX1OsA7yjjcCF0WIrr4Zhg==
X-Received: by 2002:a05:6000:1a8e:b0:39f:d0a:5b23 with SMTP id ffacd0b85a97d-3a067243e1emr1216191f8f.17.1745392517460;
        Wed, 23 Apr 2025 00:15:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:03 +0200
Subject: [PATCH 01/12] gpio: imx-scu: don't check the GPIO range
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-1-b22245cde81a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sDwXikOtbtT66flaRPMOQLEk1wgtXlmWPUc5xrs2aGM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOAJtVfy51LcVaIdW/Da1I0wLQ4NQEa0Ef9t
 G5TUun9q2KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTgAAKCRARpy6gFHHX
 cle/EACTYLfKBloBbJL+EzHJRUixJm8o1vusIAehFajv6F5jqFGdV1ieqz/FHdEKoul2HSfpboN
 B/VwA/JclRFH+9K71ISjvlxdHUOXVWAeC79M8RCXb2sjR1SL484Vi7SATqK1heYF6HyqgLi5DU9
 x5I+yC8SJhMmPkzCqsxF+6jMOZJamDy7JMJpu+6scjGlhAJRpx+mtulebQRcP1MzXS1vxOzfwQh
 3HSHO5/1pxJBi8sKMdmSJC0CWJkNWvPbFdcU9QHZTd4QgQjKnmLXo+vSp1zDwt8ZKveMOMkEfuw
 tXCYwfV6yDWn6AzenUdyisI7KrqI7jPLO573nh25LJpw/XODieasvx10z4wEKC4Kxru84R27Rko
 4cxtTyxZ2PaXsKERURrnq573AU1Utt1jpkAazgPp7UCOqwJ4hKBWEz21qTP1Mz+EqupY8X/pgC/
 4vGCUNQ3VMb9eo4dDzS9X0LPH8yzcpC9or77pBIvatjwyn86D/o3wFctdvh+vFuZVDMyA3/MSPH
 /0vY5IpKOzCtFt4Ba2qHVQ4SnprInqtEYD0kNt3RnB12yFauaAuFcMXTTGlAyheOUDHN68AAIn8
 tSoCKbhVVSrrbS2ctGybfv148pl38wC/byXGntzu5EwOvAca2IlqfIyzzJoMBEBZYlA0yeDQhpi
 DDM1nncdH9HwCPw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Core GPIO code already does this for drivers, no need to duplicate the
check.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-imx-scu.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpio/gpio-imx-scu.c b/drivers/gpio/gpio-imx-scu.c
index 13baf465aedf..403d03f18122 100644
--- a/drivers/gpio/gpio-imx-scu.c
+++ b/drivers/gpio/gpio-imx-scu.c
@@ -37,9 +37,6 @@ static int imx_scu_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	int level;
 	int err;
 
-	if (offset >= chip->ngpio)
-		return -EINVAL;
-
 	mutex_lock(&priv->lock);
 
 	/* to read PIN state via scu api */
@@ -60,9 +57,6 @@ static void imx_scu_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
 	struct scu_gpio_priv *priv = gpiochip_get_data(chip);
 	int err;
 
-	if (offset >= chip->ngpio)
-		return;
-
 	mutex_lock(&priv->lock);
 
 	/* to set PIN output level via scu api */
@@ -77,9 +71,6 @@ static void imx_scu_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
 
 static int imx_scu_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
-	if (offset >= chip->ngpio)
-		return -EINVAL;
-
 	return GPIO_LINE_DIRECTION_OUT;
 }
 

-- 
2.45.2


