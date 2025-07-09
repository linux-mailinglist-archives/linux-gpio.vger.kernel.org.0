Return-Path: <linux-gpio+bounces-22954-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CBCAFE049
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 08:45:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43430188CE6A
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 06:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049B0278E63;
	Wed,  9 Jul 2025 06:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sLLQdMN+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D518275871
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 06:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752043349; cv=none; b=oJrFj+ceeml6H5VKX+cW0CZf24wkPi601IlE4Yg/fXvBnUafE6ivveafSCN+uE+I6UWJ/xHaqnJsyR8AiAmXlrdhA5cZqEQLKUJ2Ux5mBY39OtJfAZF9QPiMAuAFM1oz3R8zW+eder7FB1ctFCCouUN0fP38mVfQlHNfL8JCnB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752043349; c=relaxed/simple;
	bh=ad9DCTIDIG1HoGv3OWrphMCnqlXUD+s+6vvEtXdghAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LHPPVPoF7+COjPpXJs+OK91Guw8Wn7bKxl24DWJIG9Fz0Dqv9d6nZ1zKfaLdVPanl31kT2kq0lVzpc30ZC580Nm0tcfnke9VcZEqB5hHJIjHY0R/cKex1pryIZIqHAbFKuajGhln6cIwGAGJquXl2oymCOmpojm0VLL+IFsCjZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sLLQdMN+; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4538a2fc7ffso4257815e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Jul 2025 23:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043346; x=1752648146; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tt1tyd2V2XXog5654TpX5Ey9biqwEwVKUDOprHna+xg=;
        b=sLLQdMN+BincdpJz2yJ5h+Hw9xRqvW7c9k5xXaX6ZTzI/IGxna885dSenj+4YJIHvP
         SPiza2XxSApCl2sUmW+jb2g5wfAS2M7DxDyRx3t9NyPZXHxQu5JGxlJdX6Sq8dMJg1NG
         b7ZfzPOz1HspeRNpS97T1XqFQxBJGtOSwRoUOtkHDFVfwBGoVK05Lo4vgRoZFPjTueBW
         SRGC/JA9Q83YQLfcvtJNqCOYgh3Mi+80IZQbsloBgxjMK+7g8HhSg1n8PMHwMGQXir/s
         Ca8zz1FPJ67bXC/wLP46Jrpg6N235M7MP7l624VZ/8gylMZRtODgrWU2jQhb/FQX8IJn
         pyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043346; x=1752648146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tt1tyd2V2XXog5654TpX5Ey9biqwEwVKUDOprHna+xg=;
        b=hbe8ZAfBV3nfeI+Dl8Bqk7qKZyRgIbB7y58wo1Av6DQHpP1VyGNNOR+WM1oybTstQj
         UJ34e+RI4gqnJSkyaY52XB/RTHiXYVZoh+kZ45cUabJ4LXP4gi8n8orU1zylAB8yPql2
         8Az3tcwCJA9otgs83yS0lZdVAXsft9ElA7zLAug0M4IxHaOaPNV21cy/O5kaDsXd457K
         OqE2U523bbgHB/ROPRnqN+IDQDFVMqEnZkqElj0S87lZH7yT13fGuxAJk0PmmFJkgkwb
         YSf0aOWeRG7qKoNxAW++iCPix8cewxebB9PsHgR9raC+ikNrI2MFOrLooYSW08GPcALh
         RTXA==
X-Gm-Message-State: AOJu0YwrsN3/8DaHuL0hGN1b63iuWFdr6fq3dqpYcy/7JrKPqaSYrWki
	2ksyYJ/gw8Q3oIF9Eq3kfQi7+lICXDfpWgAPoa+xMzmYBHndP0Po2sodPHH4CBIOK/Y=
X-Gm-Gg: ASbGnctn90O/DNHeo9mR0QnILwHjUE0gr/5F2eYiGaO7CpMzwmNhVcPuanXAWAmuOqr
	UrAogo/GxT49QIIVGA965S/Mvbzgb57lLAX60bivFGkdXElNuxQhllsTbYDeYyhqwlB8c9Wl3Pr
	YLlypflFUYTB61NRZIotqHvCiyU6sNJlqO/OUXMshjvRzOuwm7UmRCHzkxF1jDsKMfYkISt8NIv
	+6on+5uTlVFlAE6exAFRXMX3FeS8Wm7dlo30f7d/Dhi/BaKxzHaISDY8qFz65rPISWHBpZLN7bx
	kOjIFB1ieFCS/hKXzFy+2tdXwjNqFRWTyfYy0EEli4e0QCXKnGecuFGj
X-Google-Smtp-Source: AGHT+IHva0WhsywPttvRU08VnkKxXmjFcSCyLgh8W6d6O8qcvJcHST/EmQCRDTaYU3n47c8S3YTiAA==
X-Received: by 2002:a05:6000:4609:b0:3a3:6478:e08 with SMTP id ffacd0b85a97d-3b5e4494f5bmr774417f8f.23.1752043346514;
        Tue, 08 Jul 2025 23:42:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:47 +0200
Subject: [PATCH 10/19] gpio: xilinx: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-10-b8950f69618d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1599;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=4caU/UjNpZ2IdQFhAW2jpXfCzjS+1Tfp2bEeZ8+cvyg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9CVnKQXMjtdHRDVguAejNFTXbTNXD8l/Kmb
 0yg+RrFm7GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PQgAKCRARpy6gFHHX
 cj5REACwOuns0WEq0gVfyFbzUJNtcYG3dTU1bFvtejpjQepJyTQ1QVwtA7TBbJfH+O+XnX66gtB
 1OfiIS2FNuQ4AHfxV7LboTF5hI8KSovydzIXZg5qSF9IVe7OpRxSPxNGAUCqD7lTfF33Cd90Q+c
 n0qSysZ2b87Crn+IKtlo4DpvhLae7AJvMItX+RB2jkn+G83L+aT7js214EuUz+C1tpIdj6n1ekb
 UNuybnnWCYASJ4Ow7ISTsfNiGGUDC4Yei49l3VVhUOBKtzyE5zMv2GxaS9l8FwpCxL4rHX7HzbL
 4t1ImuQA1UndA2UraMnoztrqLX0djej2yBwzwo3wTM53dwpWXsj7Y9JgOaBq8ylLmEVbtelV5pD
 riyAIpKwyvYawqYtwrQTOcNf0oRvRHMhCmMEW1QfqbAQcCEn7XXBF78kjj0nOKdYaijS8rXoAaY
 h2exh0E957oSjVG8N8BKMESWJI2IN7mdfWBf+8f0zr5kBc1xSVSpD8i4WevQZUI3E2/zfiOQ3f/
 I+cojRdDGefvTRIfXENlElRktzK9hA8a0pqrYUXXpGfZ84t5gVthoflduWApAuOF9Z+7RQtr3XJ
 Db3DQhlSzuuHlw5Y4uKbvj6NPvmJE2td0L4cqQTIVWrx2MUS0zuONDQ38BA2/GaLU8D/aOapH9E
 HkWM8Bc5jI66Ulw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-xilinx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index c58a7e1349b4b226057c6d045f901c7fea5da449..aaaa741179805d54e1cd1425579eb52a3579d6e5 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -148,7 +148,7 @@ static int xgpio_get(struct gpio_chip *gc, unsigned int gpio)
  * This function writes the specified value in to the specified signal of the
  * GPIO device.
  */
-static void xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+static int xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	unsigned long flags;
 	struct xgpio_instance *chip = gpiochip_get_data(gc);
@@ -162,6 +162,8 @@ static void xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	xgpio_write_ch(chip, XGPIO_DATA_OFFSET, bit, chip->state);
 
 	raw_spin_unlock_irqrestore(&chip->gpio_lock, flags);
+
+	return 0;
 }
 
 /**
@@ -600,7 +602,7 @@ static int xgpio_probe(struct platform_device *pdev)
 	chip->gc.direction_input = xgpio_dir_in;
 	chip->gc.direction_output = xgpio_dir_out;
 	chip->gc.get = xgpio_get;
-	chip->gc.set = xgpio_set;
+	chip->gc.set_rv = xgpio_set;
 	chip->gc.request = xgpio_request;
 	chip->gc.free = xgpio_free;
 	chip->gc.set_multiple = xgpio_set_multiple;

-- 
2.48.1


