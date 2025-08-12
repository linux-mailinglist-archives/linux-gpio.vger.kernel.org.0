Return-Path: <linux-gpio+bounces-24297-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DCEB22685
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 14:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28948175C85
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 12:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF642EFD9B;
	Tue, 12 Aug 2025 12:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FXnFanVL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7476E2F49EF
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 12:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755000787; cv=none; b=AiX8ZVOG309ClGxt+Mhll8P4FDtPfqTY47RIkNX7NacPEpNsAjvPdbJGwK5WD/MC3RMFWlsQik3aE7rTNCzoPxDccmSELSH/LDQJhKr7Olrorh26MBTSpBhurxWSiqJMeD97JGWYQdeAPXN1ZqgLNi6EJJaHnZyc4EDJIW6vyU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755000787; c=relaxed/simple;
	bh=VZmT1mzJTnKz0ta2wfMvmpvQ/Njol7qiw7Xdu0aEovM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fg4DqOD4tD7r770BY6sgHeyCKRaSuj/vJKVTQQELYT9oLH47XWyoOjyhBuhbcz9aVjCKSPKZ+WFHoxDVu6b23dt8C8V1SFw7VyRE44Vxum0n2ugFkjAB649gb5s0643o1PgtvSJyLaptTThNiAGrfQ+oZK38qCc6cTZRwusPrgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FXnFanVL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-459e20ec1d9so52952755e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 05:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000784; x=1755605584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPrnuMVElbf0OVxOMvlRbagakQrZQomsS4SPCky3lf8=;
        b=FXnFanVLFPbgW0wWHZnoa2W5O1HlkRygfLT1GzY3z2CKylPCROX/qWCu4aC5wMNXXQ
         zcRQzSNE9sPofKpG3mXBx0PbSv2p/X2gTsO0xLNhEn7d1VRWbtuq6FXMIr/eMOZg3t0h
         kL4WxbBB44V2IEjl/aJbwegAtcwlT0Qf7WY+C8dNWPNGV7WZcTub5vrCy+4qWdMflsIF
         Dc4M0yZUtXAIOp0BW3FhPzOsEyQgAa44w/2Kb27rXSMPUkJ6/TE0HiNVGeTPUgdzHmyS
         JNVwkHiSUlDoXKkRi1uZvOKsPp4rgfuVkiHe313YzhF88JFyqsDr+NR0RqBdGmBvv7SU
         sf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000784; x=1755605584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPrnuMVElbf0OVxOMvlRbagakQrZQomsS4SPCky3lf8=;
        b=J3kXgROtH8PATj2RWo9OrRrLnkNJJaTo+scjFsj1408xrgBVCaFceocm3uovxpxo+F
         daPUbwC7gvvCFlAEag4thejjK6//NF1ZtfhGFVGhmqOloAJMDHIp6gjs+fgo/14z4LXk
         CopOjvHP/uL8UKUHR5XH0bfFiiRsgeH3yerDm2TJuwMs0tD9SCQGvwqHJBbd92KNDQZL
         N6lYVHmJi7EhaB/wkgbARGCzKlzxyRRqmvighGbNpuYhdq/gBba+mBCAG8T9EvpJNroI
         XVdYEDC8ywZ7Lfv7/A+nKiIxax/TTw95sVmLc6CAC6fDVCKV6UkYHXf4K25nxHdTu38E
         vuuw==
X-Gm-Message-State: AOJu0YzS9voSSDt0SBVgJNhor01rldtlYnC7RAK3d7/mk+ge4PbXmDH6
	aU59C1X88FdNfbjteyyaDM8mYFmBi5fAVV2Yqm/02ozyT9kofEqo1Z8AjmpLRieMEj9hnlZ+fSF
	9482l
X-Gm-Gg: ASbGncuvnfKivf9EpnklrJ48Pt0LQB2xgOdzf+2fOtUM4ErkpOb0K/vxDw420alBy2C
	LturmHwoD71BLi21wsIkmK6NoiulB28blSMViWYmO3bS+W0MLkre2BEC4V1OBs2bWVkJWstpuQc
	3uKUhrAEd9N1yfIuTh5Mp4/9T4heMlUwdBm034VEueDOPrZtZKIFXr4zn6PsazTmz4NLv+S6pAU
	DrwHBE24+N/Db4lVl39WgQ0STlrSUoy93182Tpxf8CaFlYSaeqgnVlShiDDNu6B3pUgLwGWQUxc
	+ttbc+WNKqoBLBHwIZqlG89OnbUandZ2v2cY6gVbDVS6nQdIYTxbUWJjwQq5vXj5+8AZ6bNfPMc
	Q+F5iJbD5nVdxOSpbEWwGhyOayg==
X-Google-Smtp-Source: AGHT+IEoMMi0CEBtjTeK1OAVQ2XJUx3abdGVGpfPoMfNdOa7/Fm+7Qs38HZJxLsTgY+6MWhlVI/Amw==
X-Received: by 2002:a05:600c:468b:b0:456:25aa:e9b0 with SMTP id 5b1f17b1804b1-459f4f9b5f6mr144387785e9.16.1755000783807;
        Tue, 12 Aug 2025 05:13:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm298878535e9.6.2025.08.12.05.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:13:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:12:53 +0200
Subject: [PATCH RESEND 11/14] gpio: rda: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-11-aac41d656979@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2916;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=VEKDyVTn7CdAc/qOsHjVELR8QjmrXUmK9abPLIIpync=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy/B8rvqZkQIoUIaWbJj2JikJSIBQRI6vwGTH
 exlHS1tHziJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvwQAKCRARpy6gFHHX
 cjwhEACH8baIpD+2+aI84ztaaLn90l4+CH4HwEvTCzlC37FxDvMiqii4Wca8Rf46f/QmI8nQOCf
 USMfGVag4jo2Le2ex1K1YmrU62y2UhS6QCq4PAz6jZylorTHByKx0ygHhk/yA9JMnkTvlsRP2Or
 Wn+LEZ383jaSF7W0XYOGbSYios5C3692nbvtb6vDrHiMW2RQDciQuwZMts9+3O4KNNjSW+UUkN9
 8jM7PlT91SmfHIa5OzrCd4alovMU036SZNAurpZv7xNEQOZDK+Z/m8sgYUwqHVlNH1kUmjsKLY2
 werUeez4QVeuEYEYO6TgDNdaIrYb8tD89ura7zRNoA+AHcnFbdzRkGM1wECJDlhgG6k1a+xz+zJ
 Fv50Kj0HDOHHsRJThA5mEwBOyDzuQVVUnA/Gl7xGfVna8HkXyOsgxJT0bbdnolLFcSdpPVGKui3
 Sn0Enw6wF7TWXTe7asipbGuiKMJn3k6W5uwUlRu8UtnB8m5NWm5EPw204LQrIE5difFvIVJB9nc
 HkeBW+1IX83brCIlcgJYO5q5ZGBbO980tM7E5upxO3asD1Z0+Lu272LjyxiGoewvWL5OlkHmrVQ
 9lEzIBB5zaFUuCea7Okr84C/6xXOAVKiAlcANFrqnrPciJhzasZ5JVLPLJi/DTQHUDBQEq8INxE
 lsTZn1blujN9PSg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-rda.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-rda.c b/drivers/gpio/gpio-rda.c
index cb2f63eee2aa10a2708ec91dfd610ed1ea76917d..bcd85a2237a532b875df9470d972ac88b95a91cc 100644
--- a/drivers/gpio/gpio-rda.c
+++ b/drivers/gpio/gpio-rda.c
@@ -8,6 +8,7 @@
 
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -35,7 +36,7 @@
 #define RDA_GPIO_BANK_NR	32
 
 struct rda_gpio {
-	struct gpio_chip chip;
+	struct gpio_generic_chip chip;
 	void __iomem *base;
 	spinlock_t lock;
 	int irq;
@@ -208,6 +209,7 @@ static const struct irq_chip rda_gpio_irq_chip = {
 
 static int rda_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct gpio_irq_chip *girq;
 	struct rda_gpio *rda_gpio;
@@ -235,24 +237,29 @@ static int rda_gpio_probe(struct platform_device *pdev)
 
 	spin_lock_init(&rda_gpio->lock);
 
-	ret = bgpio_init(&rda_gpio->chip, dev, 4,
-			 rda_gpio->base + RDA_GPIO_VAL,
-			 rda_gpio->base + RDA_GPIO_SET,
-			 rda_gpio->base + RDA_GPIO_CLR,
-			 rda_gpio->base + RDA_GPIO_OEN_SET_OUT,
-			 rda_gpio->base + RDA_GPIO_OEN_SET_IN,
-			 BGPIOF_READ_OUTPUT_REG_SET);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = rda_gpio->base + RDA_GPIO_VAL,
+		.set = rda_gpio->base + RDA_GPIO_SET,
+		.clr = rda_gpio->base + RDA_GPIO_CLR,
+		.dirout = rda_gpio->base + RDA_GPIO_OEN_SET_OUT,
+		.dirin = rda_gpio->base + RDA_GPIO_OEN_SET_IN,
+		.flags = BGPIOF_READ_OUTPUT_REG_SET,
+	};
+
+	ret = gpio_generic_chip_init(&rda_gpio->chip, &config);
 	if (ret) {
-		dev_err(dev, "bgpio_init failed\n");
+		dev_err(dev, "failed to initialize the generic GPIO chip\n");
 		return ret;
 	}
 
-	rda_gpio->chip.label = dev_name(dev);
-	rda_gpio->chip.ngpio = ngpios;
-	rda_gpio->chip.base = -1;
+	rda_gpio->chip.gc.label = dev_name(dev);
+	rda_gpio->chip.gc.ngpio = ngpios;
+	rda_gpio->chip.gc.base = -1;
 
 	if (rda_gpio->irq >= 0) {
-		girq = &rda_gpio->chip.irq;
+		girq = &rda_gpio->chip.gc.irq;
 		gpio_irq_chip_set_chip(girq, &rda_gpio_irq_chip);
 		girq->handler = handle_bad_irq;
 		girq->default_type = IRQ_TYPE_NONE;
@@ -269,7 +276,7 @@ static int rda_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rda_gpio);
 
-	return devm_gpiochip_add_data(dev, &rda_gpio->chip, rda_gpio);
+	return devm_gpiochip_add_data(dev, &rda_gpio->chip.gc, rda_gpio);
 }
 
 static const struct of_device_id rda_gpio_of_match[] = {

-- 
2.48.1


