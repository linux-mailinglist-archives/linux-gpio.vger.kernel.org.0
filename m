Return-Path: <linux-gpio+bounces-10567-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D69598A129
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 13:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D85A4B276B7
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 11:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0D018E361;
	Mon, 30 Sep 2024 11:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mbndByvv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54A718E038
	for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 11:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697091; cv=none; b=O2WzsKL0c9Y1qf6wCZtThi5ASse1hWvGS2teq+EmAAp0SHXX73Peui54/i/capMZMCp/NHhbyR/eHCBSS/hcqAKn7+xzmWSc4UJBVynFN44qgELudlpEkKM4CkdHE1x4k1vrfeAsdJv5LMAqss2EDBUP6pAwKUuBjuYCINS83cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697091; c=relaxed/simple;
	bh=dQ/Vi4cHXl2yvWqLk+N4RzlEOGVtJ+RrNcB+AD6QQ8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bB6C2aFbTvuJ3syoqbJZvaI51y1FjYR5TOfm1A1FzW+lRVKI0Qv83ChYcBvt3GqSdw9NakN1+vbiMCU1h4Gr/3Ywav6x50w7m2Jdetu9J82mkuSxItQ7XeuDmBXEXqkR4T4Tq41AOJlhnUUsqo6KtAZrsHZgdc23HmSF8putlSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mbndByvv; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cba6cdf32so37636815e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 04:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727697087; x=1728301887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYoBCuP+mvVzk4humYn6KWXiRwGqVrTlm9KNEy+e/ao=;
        b=mbndByvv7oOnBpvzd2rNE8T9QdWMeTN0WJUVyRyQFKOItRmAox54YZUltHSm2KJtl5
         qdHXeDJ2jmY5vmgnPd/Y4G6Dn29FD5n1nJpXATXfb1/kkP8fAcwksKTISqZ8c399X4mc
         2xRYWb+my+aAZQ60MrfA9H8AT1csLEqr582krqiIFMXo/t4D1/uyeytOIkoRbamf6JLl
         Nkgcp9xG1V7LRR6Fo/rs7Ju7dVHCAJW8RjVEM/VUoW0JD58CaBrBQINJ/yOeIUVAvaT9
         nei/UJa1PVD17izI300KeMiPYP5qAwstb4ZEFqSN8EePenH68fKOtfJKugkSOYAR3uFR
         0fJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697087; x=1728301887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UYoBCuP+mvVzk4humYn6KWXiRwGqVrTlm9KNEy+e/ao=;
        b=sJV+DHaVts4CZXqqBOQtMnWzFs5M1kce0Qm8FQE3Mv7IQYPw9PeqAeBLkZK6Ua4ret
         TzfN5inexyD743Q6iMsWheQQb9zpzI+qVJLZhWPqG/O9dAbyuSDUAL3ktBKSmHGMr4sc
         /Q6HHcieY4/wJHIekQY3wYYR3POp46ykQtfhhwyjsCVedpThDZq1IOhl4nHTLm7pgCAe
         g2rszHXM0woDzmaKiUrGxkvurd8Et5dnf7JpfrHJgZ5PbCEBi8qEa9xhp3A9m4AFud4R
         MbiiI9OUj5J5yoc66HW6PTx6ZxXuIrAd+1KXrEK8CcUjPA6b479hCOb3qYi9p/gOfWty
         XVVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIbx2S1dO+qYoRMkGUe7ImUr/uz7qNTvayRNRv6Wd0DCohjdlQiWsm4lGxCnlzgaN5pzxM6AVTnDtd@vger.kernel.org
X-Gm-Message-State: AOJu0YxvfMtI4Lf31lKifnjsN6ZXDtyUl9ADgvMN8SRWVupLi1/YBjEp
	B0jlkC2TzVUk8PpZTpDI5YcZ6uoyFHFm6vg2EVRe+pr/7tqXq/fegp+gxKONfgc=
X-Google-Smtp-Source: AGHT+IEeabxpUXLLQRsKW/SYumVuBoRcy4rw+6U/N/ZkXarZiGAnx9sFHUz8XjmmFzkoSf9R/A95AQ==
X-Received: by 2002:a05:600c:693:b0:42c:b5f1:4508 with SMTP id 5b1f17b1804b1-42f5b906465mr69070565e9.23.1727697087155;
        Mon, 30 Sep 2024 04:51:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8791:e3e5:a9ca:31a6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a362bcsm148996985e9.36.2024.09.30.04.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 04:51:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Keerthy <j-keerthy@ti.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/2] gpio: davinci: use generic device properties
Date: Mon, 30 Sep 2024 13:51:16 +0200
Message-ID: <20240930115116.54626-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240930115116.54626-1-brgl@bgdev.pl>
References: <20240930115116.54626-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

OF-specific routines should not be used unless necessary. Generic device
properties are preferred so switch to using them in the driver code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-davinci.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index b54fef6b1e12..603893816b32 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -15,7 +15,6 @@
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
@@ -159,14 +158,13 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	unsigned int ngpio, nbank, nirq, gpio_unbanked;
 	struct davinci_gpio_controller *chips;
 	struct device *dev = &pdev->dev;
-	struct device_node *dn = dev_of_node(dev);
 
 	/*
 	 * The gpio banks conceptually expose a segmented bitmap,
 	 * and "ngpio" is one more than the largest zero-based
 	 * bit index that's valid.
 	 */
-	ret = of_property_read_u32(dn, "ti,ngpio", &ngpio);
+	ret = device_property_read_u32(dev, "ti,ngpio", &ngpio);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get the number of GPIOs\n");
 	if (ngpio == 0)
@@ -177,8 +175,8 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	 * interrupts is equal to number of gpios else all are banked so
 	 * number of interrupts is equal to number of banks(each with 16 gpios)
 	 */
-	ret = of_property_read_u32(dn, "ti,davinci-gpio-unbanked",
-				   &gpio_unbanked);
+	ret = device_property_read_u32(dev, "ti,davinci-gpio-unbanked",
+				       &gpio_unbanked);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get the unbanked GPIOs property\n");
 
-- 
2.43.0


