Return-Path: <linux-gpio+bounces-16270-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D55D3A3D5C6
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 11:01:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BDC219C0852
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 10:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38861F6664;
	Thu, 20 Feb 2025 09:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="boAPdFx5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50F01F4E41
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 09:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740045452; cv=none; b=q8WF2E7CNOtHf9ALVpmm0EfynXin41r4Mhp7YTwKjKFmgvsfwf28L341do9b6+4FzZq2jDCe4MAK4Cnp2XcpksxGcxUgL3hGrOZ12LLKlMDHTuGuX1zBX9jE1lyLRHc4P9vZScQg45Hqcou1uCuYPq8nhSxey/hU8ZRFw6MacWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740045452; c=relaxed/simple;
	bh=n+TH3QwIs/9uPj1mmf+rdGvSnjCoYaYnZgclWP17JjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pD0oJ4dgG3KMmK947TMoIR1XaMpNDmF6Xe9tdZ9c7+E9unH/gQzJrfaDWldsNXO7jXnIFZ0LakaiSh7amW1GfM86cKqatWb9GxjBrUSyjXhsb8sxxwAnm7BWYfHU6r3JIt8nbpBy+xrjLV5d89dY8IjBPt8jP88zpAe7tGD4fHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=boAPdFx5; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38f2f748128so353937f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 01:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740045449; x=1740650249; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y8LEMZmaY/K0DBylYOJocGAOmkHBXVSwsNvkehZ97EY=;
        b=boAPdFx5FiQ/CeolI9NaZVB2l+eOi+rXhnIUwkDQB3B3LPwYXDwOpFQ7A1ewX5N99M
         t9dorhYdxhxgESEIjkTwr/+1pU0NIFIP08CW26ISdyMjTceebPgRJID5PJW2Yge6iHPe
         tvm295RVtHY197O+790OO+nOaOPeq3KiCRtUli45pUc1smA4IIZl4NBhkmjshV43r+vc
         MONOWDuoL0tSqcJ/5kBbeK1GHv36likb55aY3BDohpn5YKP2bwUrMGvn8Xo4dCLJmqvE
         sfXU1Y3kGXdCHSkf+kDQg8Nmgr7km9RW/Sgsj1fjJj7J5peM+uWyIVz9/kSrvnQHwxEy
         iu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740045449; x=1740650249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8LEMZmaY/K0DBylYOJocGAOmkHBXVSwsNvkehZ97EY=;
        b=XUNoReQciWygfAv6ncsUPSxbwPzT+exjdQ4NijjXCISmZT/CKLasMnIAszEGbp5//+
         ah4frng8Zo9k1Vwip+FmLLMvyna9kHyXJuipwsIIXIlm+0Hp3Ox7ZJUBUDuLaPftJ/SL
         YMLuLKRULNJUJYX8PsPqBRfmDE8FgFbPToZI1/FNRJkrLqM4iUi/t1ITBH7H+NzA9Ye7
         B3YQH4i6c4NLq5cTkHZt9EQW4OT6I1Iw2y2KDzAsIafA4HcJDbE9jLY2ukKFa3RUIp/o
         TOzaeTY/fO/vXpQWs//ImOvlce8yyBynUxkbY737xkXSHpkZj6emcCy0ZZbN7kKiO9nj
         2P0Q==
X-Gm-Message-State: AOJu0YxEFMYN8XEv2lTXZG4Sj3K7GINv8uPrj0y6TI8WIexUsDONQpTY
	ETrJtVr6KnSgMgl0BMb4XlYkNM6rYXmVE7x6sY6HtQe0nMMnikx+Ehe4LRyTOHE=
X-Gm-Gg: ASbGncuv3CHZolhLa5ctDfm4zUu4VNnsOoWNjTbRVhPeesDVvef3czE+nBLo+3koWTc
	gWfPT+2eRyrqklEb68WmesdbmDWdCIHaWnCMXj1AsdoySQZb4RS3Beo5ar/pzwmHZPPiiPea5b9
	LYipSgJnwDV7/XVNBTH1Sbg6+8t3cSIW3oEDvbu2ha6VzFNexat9NZJ8UWgCvGThsnAuNurgx61
	6FiON7zE2GQww8jf1OXU734RQvkF/gzw4HoooNRQFz+6H5FnrZg2h3KxiBlSpHNlpaoMAxDoEka
	os9zv7Y=
X-Google-Smtp-Source: AGHT+IF1/LvA44pROgzHToT0t6L3xZPubpp60IAA/AjC9drm7MYOoChVBC/SyvcP70lIVZCQLh9C7g==
X-Received: by 2002:a5d:64ed:0:b0:38f:2a84:7542 with SMTP id ffacd0b85a97d-38f33f5234emr19078647f8f.28.1740045448918;
        Thu, 20 Feb 2025 01:57:28 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:e2e4:418d:7462:9cf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d65dfsm20509174f8f.64.2025.02.20.01.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 01:57:28 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Feb 2025 10:57:11 +0100
Subject: [PATCH v2 14/15] gpio: davinci: use value returning setters
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-gpio-set-retval-v2-14-bc4cfd38dae3@linaro.org>
References: <20250220-gpio-set-retval-v2-0-bc4cfd38dae3@linaro.org>
In-Reply-To: <20250220-gpio-set-retval-v2-0-bc4cfd38dae3@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Michael Walle <mwalle@kernel.org>, 
 Bamvor Jian Zhang <bamv2005@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Keerthy <j-keerthy@ti.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=P7oRD3XbMGXwz0WyRLRGqXdeOYh1TFkveSpKDzByQn0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBntvx5OEt1zYeiNgNWPNOyoX25Kx6V0aJbfCm0G
 GbhS8zbr8yJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ7b8eQAKCRARpy6gFHHX
 cvIbEACq8bSoC8gkgeXxg0dW/ASqLdn/spq/rhUMVbwUrcsdzH5nk8F2NEwYv6LmgMgMEIM8DOd
 4wWz8kx/y4mHMLaZKGaHsns6oqD1j+BTOZlPpGkaLXImu1q8BMoLM0micdESHDOPCV8aQgTstTa
 HcQhGXJwooDXTPwgJI5hFxwzZYuTR/qCbYgFbOpiWn+pVkafXXZfADijv20ftPmEe/lFnU9wuE6
 ozgSzqTC2FvWnSnXuPCfNwEr+Z7DWgPMR3hVE7eaVe3ebdcaA2KedRlhZrxN2NdTrMFwTwUHYp7
 EXwH2nEvKdiOiu9T1yDL111Q3qaPueWLGGGCnI5yUu5ljU+InNHselUBSS7vTHTrIzhClJJW8zA
 Dwln0+jWJH1ixy06por4FLKSEJcyH5TTe2y2JZcY+IaUL93Eok+bEZ059Q3/K7Qv+fAOu/fWTzG
 +ODYTzaFGqjel+TnWuP/c+vDYI7v4pWEQgM7f0TLDL5Q+B7HfFxvP4lyFKwryn+3IeFnK1VqucU
 Oequ52gXiNvr5EyU6DCEdsVBEvQomfYpyM1XUyDsYibQTSMZRmRaMx6YD+T69fx2+iilFoSyWjL
 r2SCxAhZZE2qGsDNzLdJfLU/cNYlD6C2CSwNb+9Hhb27K6784sRnLFHtpdDFG+MYVD1t84VD0AL
 6zIhUgL656jrm/A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has additional variants of the set(_multiple)
driver callbacks that return an integer to indicate success or failure.
Convert the driver to using them.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-davinci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 8c033e8cf3c9..63fc7888c1d4 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -139,7 +139,7 @@ static int davinci_gpio_get(struct gpio_chip *chip, unsigned offset)
 /*
  * Assuming the pin is muxed as a gpio output, set its output value.
  */
-static void
+static int
 davinci_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
 	struct davinci_gpio_controller *d = gpiochip_get_data(chip);
@@ -150,6 +150,8 @@ davinci_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 	writel_relaxed(__gpio_mask(offset),
 		       value ? &g->set_data : &g->clr_data);
+
+	return 0;
 }
 
 static int davinci_gpio_probe(struct platform_device *pdev)
@@ -209,7 +211,7 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	chips->chip.direction_input = davinci_direction_in;
 	chips->chip.get = davinci_gpio_get;
 	chips->chip.direction_output = davinci_direction_out;
-	chips->chip.set = davinci_gpio_set;
+	chips->chip.set_rv = davinci_gpio_set;
 
 	chips->chip.ngpio = ngpio;
 	chips->chip.base = -1;

-- 
2.45.2


