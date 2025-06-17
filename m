Return-Path: <linux-gpio+bounces-21697-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 930F1ADCB64
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 14:26:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF9101893DFE
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 12:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B032E92BC;
	Tue, 17 Jun 2025 12:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Lgskz1BK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362CF2DBF69
	for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 12:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163093; cv=none; b=iSigr41Gfxq3zaArhorR+cEiJh/WtEMNYOGEbm8J2T2XvFQsWVAYxIHsJiRdO8TDj37rh9UFpOg2i5Vu0hbrkveIGlCzviddcqUKT8OqZHKurcShoF9geEKNL6Sue9rUT1RvKAgRvgBmSbHX2v1Y83rAVG8FUu8LtYB1rf8Y+Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163093; c=relaxed/simple;
	bh=9Zaxzyv360mf7Zwzu4QdvYgk1SpKcZsIH3LbMJy1S68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d3iQF5pjFzDggyWGbbLR3U2zXYwVdFroE+fkCzWn4MRG5O/if/+r3UBa84fVMXROWfD/5fBaAVmE8NtK7nvoTCNR3hAQtln/+9VGzl9JZ4lGw3LOW+Pn2pdM+VADD/zdwBnCYjCLmyeKJbA8W6W94tnQqsualw8+ra/CSOxu1m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Lgskz1BK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450cea01b9cso26220735e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 05:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750163090; x=1750767890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AMHaAkSc/mi83kBCslhtD5+Hl3KktEIZpzS91Yh6h2M=;
        b=Lgskz1BKoW73PYbh135ygjCj0GIwLc5EonuJ/JdlUBLeGVZRo+cFHTckDkkg0S59qD
         G5PX5nCyFu16eCL8iaagBU1w78x1k66ujmLeuJkJmOSnBoiqrC4zEzz29sjDONAElo4U
         NxGz2yyzfGGEDuVKrlkCE+Y4vS3DvkOdhqG3cUlsqohl9nxsPU160YDQ9V2ukU/m+HnN
         hpLnjgKgfo3CnRVlNrT/zlZcQJEhf5pn4Rsc9v9okmFsbOVvcdxjtId4ShGKCCcvx2kO
         SU+MCmC4nEeLA7Xs+dWHhY3u89Yyx14utxtzVcoNlinBxJDi2HJ9pS9D42iz1M/zXHEK
         wGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163090; x=1750767890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMHaAkSc/mi83kBCslhtD5+Hl3KktEIZpzS91Yh6h2M=;
        b=Qrje4+Wuz2ZobPZ/giWWgit3d/O0OvNiNzRnM5oH0tWJBivfjCbiazss15PMQPXN/R
         kEqxzVgs0Eoehi/yXW9cDFJFwuZ65vp+7MXAm7PX+dIXdwlPq0iSUvTi9wfbfXqZjD5S
         PGLejZNFgKsb956hVJp/y3qWeOnOtCc1BExBqGpjPqX1QF0Bu8M8w1doaz3RudG5qBp8
         0jzmXfRCY6406Mh0RS95BeoNkALJwmeeGmFaxOlZ3RtA9jkfSgVpgKyaiWFan4REyWSe
         a2C2xbVydGjdJOPo2Jot+JfbvV+C5OAdmXORYBm8Mt0es0orUzh1RXPhCxmntVafFtCc
         +KWw==
X-Gm-Message-State: AOJu0YzUAacauhHs+u/+w7nmPO/nK4fDpxYe87z89J9KuwsvRl3Goyc7
	DYjaNiohoGa3B4Zmm89Qo9q1P8wMdxJW3uv+GVnYWFMAclZL8gvT1eAcQ7pvI+AXcuvKfpmBlXy
	cQkVB4QM=
X-Gm-Gg: ASbGnctMssYcakLIUNiZbRJpeXH2uCHw3UETICZdujvYIxTk7ZS8bo07rnlDJKLDYW5
	3kLf9ggW4KqcmHCNXjRciz7Vj0+8cATuz+WTCugQHQQtUPDejvinxvwnhhG3BBg/jmT4aJSXese
	e9/1gav0zVg89q8Hfij8xrdBQ6T5KpQbeF67Fa/70y7atdUIBn5ducXI/ErP2IwD2YAKs3ueFl/
	Wck/PtlwaPVY8w0MMPqP11gbqW2zBSagUA2LuzPR+fj9QOC959p0SOaoVhqHHVjHmJZC91lL9Ou
	zO4RFLPpNr8GwjHg+ATB3oVRRaZJdtWhUQBN931fU3vAgfLaVu75Hhvr
X-Google-Smtp-Source: AGHT+IFmKyHtiTnK3f0MnCL25OY403d6ySVCu8IrYmqOaI/BNa9QItLKGnF8DD4RrTrk/qX7jMZHBg==
X-Received: by 2002:a05:600c:6211:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-4533cab86f3mr122978975e9.18.1750163090447;
        Tue, 17 Jun 2025 05:24:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm173816135e9.1.2025.06.17.05.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:24:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 14:24:30 +0200
Subject: [PATCH 08/12] gpio: rdc321x: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-gpiochip-set-rv-gpio-v1-8-903703881fa2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/FTgaK1cWGc0DF5sQuXKwdEauaSqv0NFqrELnWAzquo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUV6HxI/Kng34JgzZDWKYQKf8SOY7GXUJq2cX/
 QrIk9Wh/OmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFFehwAKCRARpy6gFHHX
 ckXGD/4/iUM3v0T5QVM5vI2RC3Ut9NdycYDtiCIwbZFmIIZxah5HGVAYFj4hHNnnDmHgbOPKpbJ
 fvfFgQvz45DeYQkCt4pQiGZv0Qd/SqIgbJyYhc5qEtrMsyae4rhudlBYsW1omeeWw3WKZbpYJZa
 H+ZxUmGbPpRYWJ00ByGxGN7U0XwLEnGzdN9MFBTbMF1l2Skr6JR5xW7GSYEd8W0DUF+cKhHGlkG
 tTM+8sTClgTZKEhTwPU4xRm5iPN7WOjcMk5DmY0mG1UEXbySHcesZPEJNmM21B1+92IRk2JNe2H
 /VAEi7V/WkptmnNksEJ69Il01MaFBxMz4pxCQitD1TitfnJFmPkLjrzKbdrn3TyYmUv1CS7Pwb5
 53BODlK5dE7lx4Aa7oalaaEuB9jUi95cbAT1NggaAMPcYGEtV4/osEVsgvFJgHmjqaNyMdGR2iM
 u/8qM+PA9O3kTmWneQ3nO2PYpET16aDMNTOLjSCwKd2tTxzIdjoyuANw12R51w7RQtzXyGNmcKm
 JK0IqnHKNBngn1OgNpXIZg/JEi/UpIzFhPzRsekoD4UsX/FCcFFWQCHncvwQ2OxaBBGY6qcMZll
 HdBrKU+g5SxgCmCazOJbDue5kkTg2eLpczzEwQyUiVYZqmBmf669E2jH+28FaLh6L+A5WIdC8L6
 E+2w4xVaUPZMexQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-rdc321x.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-rdc321x.c b/drivers/gpio/gpio-rdc321x.c
index ec7fb9220a4747fad5dfdb88e25e68d2a104e37a..a75ed8021de57db122938e4736c3ac994bcdd2d1 100644
--- a/drivers/gpio/gpio-rdc321x.c
+++ b/drivers/gpio/gpio-rdc321x.c
@@ -64,8 +64,8 @@ static void rdc_gpio_set_value_impl(struct gpio_chip *chip,
 }
 
 /* set GPIO pin to value */
-static void rdc_gpio_set_value(struct gpio_chip *chip,
-				unsigned gpio, int value)
+static int rdc_gpio_set_value(struct gpio_chip *chip, unsigned int gpio,
+			      int value)
 {
 	struct rdc321x_gpio *gpch;
 
@@ -73,6 +73,8 @@ static void rdc_gpio_set_value(struct gpio_chip *chip,
 	spin_lock(&gpch->lock);
 	rdc_gpio_set_value_impl(chip, gpio, value);
 	spin_unlock(&gpch->lock);
+
+	return 0;
 }
 
 static int rdc_gpio_config(struct gpio_chip *chip,
@@ -157,7 +159,7 @@ static int rdc321x_gpio_probe(struct platform_device *pdev)
 	rdc321x_gpio_dev->chip.direction_input = rdc_gpio_direction_input;
 	rdc321x_gpio_dev->chip.direction_output = rdc_gpio_config;
 	rdc321x_gpio_dev->chip.get = rdc_gpio_get_value;
-	rdc321x_gpio_dev->chip.set = rdc_gpio_set_value;
+	rdc321x_gpio_dev->chip.set_rv = rdc_gpio_set_value;
 	rdc321x_gpio_dev->chip.base = 0;
 	rdc321x_gpio_dev->chip.ngpio = pdata->max_gpios;
 

-- 
2.48.1


