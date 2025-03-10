Return-Path: <linux-gpio+bounces-17367-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB6EA594D2
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 13:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0BB47A4C07
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 12:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4941B22B8C8;
	Mon, 10 Mar 2025 12:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cQOKYQdu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F8F22AE49
	for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 12:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610440; cv=none; b=rn941i2WRywozH+uBgnqza6964QwkE4PFrknCyMkUUEBmaorzbPMrpuhv3Z9y3lBGV8LWwlPw2/r4XmZ2EBjFfDlwARbIEvVm6ggL9Qrt36altnJ+GtPgviq/P+w5Oc4KcsYtPPgRIGrR4FXcquC9/b6eySlWqv3V595WF8+NN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610440; c=relaxed/simple;
	bh=Kv/7elvPz7wpCf0sc36wWWllkZ3u/gWWhEHO2uWiT08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GE8H2FqaZoqA12UbO/Hxg86csAXZ5pERI54sW/jHgHHshWKkKrSbjo4bkmRZWuzI51zGcdV1wyCra41+x7mHcAVVV4M38t9ZCbptV6jh3YqnAn9wePUKfgt9O0atKQnhvvxEV0QHNqxm9lw12SCMKInJJ6mDaMzSRARVZ63vbVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cQOKYQdu; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38f2f391864so2213779f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 05:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741610437; x=1742215237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lszqES9j7F2LGVMtpNUOeVD26d+lln3GvRS538XWj0g=;
        b=cQOKYQduUhY6Rxhz63QAGgV5vvwjbvz9A+2EQNr07zv1OhmHoBOpcqu99yPxs0d17G
         AxzjU5hlEfxmSS/xwRCKbJg9qNTKd6BoYU8lgmOS66AgQ6n6Aob+GB6KTIzyBhkBbzJg
         LsAf3icxsBLwgZXw/S0GSfpecKEu2K9MPcBjjJerA+cU+EjMIl2UDOhLKty+1yTJRfb9
         gQiIvJsxNhXSPfAh0CofcxuArqKZ8/NGd8oLtuI6u+fVkL6nqexOiApSTImegBEfA0ks
         Q7G6XsBqdGzC97hVCxPynU2Gnl++D5kQxZ122U9bI/kur0M4BdFjXVnknSefp7sWfILc
         2y5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610437; x=1742215237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lszqES9j7F2LGVMtpNUOeVD26d+lln3GvRS538XWj0g=;
        b=Zx10JRd+kHKoNCMP34sY1oZ9IE1VbgIOGClziSmvwAoJnRSraNxhxUIAJsaXWjcKI2
         OwtsawWz4RWoar5rHZHoY3tEgdzqT/fmtDxJEbTDq8/CcqwRge854sESNbclAQOSM6YS
         MuYbNnmNeuHm6gPZPnfzjgWbgAVPgJScmP4lxytNE9WngweJ92oMPKDZRae41MLhVNcU
         xE6gl5U4SKm+2d79EpOdoxdyqrJ3JP0Lxeh9U6mnKKKeXtmx1Tm4Y+7AhFqmYAhkQEa/
         yef4q1jJyj8lTpkLKBvZQkWYoW21I3gCtuIHrs2xbU1eRvTM9sWi5jPtK1Q/kPdgfCpu
         8qIg==
X-Gm-Message-State: AOJu0YyOOi37V12NL0dJyk+8VEVFJ4dAPdzBlbHZe+aRgjsu+1iJLpXI
	ws7qOSZZduIRlcKBRLjyIk2gkO6r2T3/NEyXAXtqRugvNdh7mvc85cFwZzHQL+s=
X-Gm-Gg: ASbGnctN+10dGlYSW0ogj5zvCbX8MGm7xPt0V8dcy995v2+jNP6jQnR8jdieskaCrZB
	jsmo/UK1ZfaDZn3lSVI4eDeKydzYhR+5Y5Yv+GaNyn+9RQA7D3IU6pyRQI+OYAFtbNMvk0YP7mU
	plCP0cjhlEJhbTbj+EnyGixw8l6s71YAcuQ1DCkC6GxQeViwbjru6msrWjBfTzIlsHtiaFQdgHq
	FdlnKHKrB4GRsO/mH9T0fuGlTbtrhY1o/Xd7skzph2nNJfVpdGAD5ct/aidR5HA2g93+T3z4FA2
	PjvTaGARt91UbZ57X1tWFGxj7HleaWirCZpNvA==
X-Google-Smtp-Source: AGHT+IFIKTdvrT9rBxnloV/WH4GBRL2hNbvpU0mO2aDX4msbqMvDFziuFm/yW5Rx83HoXIc3L3rZxg==
X-Received: by 2002:a05:6000:4718:b0:390:e8d4:6517 with SMTP id ffacd0b85a97d-39132d29464mr10567991f8f.21.1741610436840;
        Mon, 10 Mar 2025 05:40:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdc5sm14535865f8f.25.2025.03.10.05.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:40:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 13:40:24 +0100
Subject: [PATCH 10/15] gpio: creg-snps: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-gpiochip-set-conversion-v1-10-03798bb833eb@linaro.org>
References: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
In-Reply-To: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
To: Ray Jui <rjui@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, Michael Buesch <m@bues.ch>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Support Opensource <support.opensource@diasemi.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, chrome-platform@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1706;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=llaZ30RngMZ4hu72W9cDZbmKLpvm45e47QNDgX4Bmas=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnzt2342XxLoazV/RExABESNHdJVSqRH9mIAfVE
 p7pYx1x29GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ87dtwAKCRARpy6gFHHX
 cu0MEACQ8tL6aVapLyTQEwFqjreDlxNROdSCQo+C3oRhmbbkE/uoDoxskjkhrVYFEi6n2T2oLys
 Y/RHzOxzpaozZfCy5EUdCtacbm/QhbOH5Fg8c5/glh0OmpSItGWOw3rBzWnxZvaK9RKRIEZgTrT
 B1W/+BIZEw3g96FxSLhNYETRaex19ereZa1W4zGFoRW1cCnvoBF4pF67Px+bw3T9uYUCaG22T0O
 mF3RbIXD+MeLxxt64hhq0DOX2q+ZARAPHizmwInBi13eoRQgI2rur7EhMDMXZy6+h0GgXky2gtF
 vctwPAZTCQzNE6n/YvPdpxqNAEcNu2wRMZvUAPblu1xj8lh4Fyb6RKYz3PU+pnnmti/idoggjtf
 KlWzCylLKzNgNDS0WwtJyblV3v6JqvonW5VRxQ+wPs53WmMjHsxiRw/Ch3pSS5d/2/THxp8QUUU
 yjmfqTUlJdFMMTgqH8uCJFUTGO8P+AXeOcMGt0x92x/trFuD+WsKj0z8WrdLURDn5ggZ5tv67Y6
 pZ0krVxl7FK9I9gzJL7jPKfBGdh7kQuHqi98RW3ALxwc9+bU2g664PBqp+fFAbGILCZbGQ7d/sY
 92PVM2E4SwzZo8diOmLdcVIKFdQrmOgJeoC+kve93HJMBY9mPtUh76lZiW+HWBO4i3iu5/gv+jG
 k/gHlYC7FMga7Qw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-creg-snps.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-creg-snps.c b/drivers/gpio/gpio-creg-snps.c
index 4968232f70f2..8b49f02c7896 100644
--- a/drivers/gpio/gpio-creg-snps.c
+++ b/drivers/gpio/gpio-creg-snps.c
@@ -27,7 +27,7 @@ struct creg_gpio {
 	const struct creg_layout *layout;
 };
 
-static void creg_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
+static int creg_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 {
 	struct creg_gpio *hcg = gpiochip_get_data(gc);
 	const struct creg_layout *layout = hcg->layout;
@@ -47,13 +47,13 @@ static void creg_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 	reg |=  (value << reg_shift);
 	writel(reg, hcg->regs);
 	spin_unlock_irqrestore(&hcg->lock, flags);
+
+	return 0;
 }
 
 static int creg_gpio_dir_out(struct gpio_chip *gc, unsigned int offset, int val)
 {
-	creg_gpio_set(gc, offset, val);
-
-	return 0;
+	return creg_gpio_set(gc, offset, val);
 }
 
 static int creg_gpio_validate_pg(struct device *dev, struct creg_gpio *hcg,
@@ -167,7 +167,7 @@ static int creg_gpio_probe(struct platform_device *pdev)
 	hcg->gc.label = dev_name(dev);
 	hcg->gc.base = -1;
 	hcg->gc.ngpio = ngpios;
-	hcg->gc.set = creg_gpio_set;
+	hcg->gc.set_rv = creg_gpio_set;
 	hcg->gc.direction_output = creg_gpio_dir_out;
 
 	ret = devm_gpiochip_add_data(dev, &hcg->gc, hcg);

-- 
2.45.2


