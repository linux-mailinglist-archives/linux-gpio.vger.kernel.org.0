Return-Path: <linux-gpio+bounces-25456-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D50BB417A9
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 10:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD7E13BCE58
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 08:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA6662EC0BF;
	Wed,  3 Sep 2025 08:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jRYIQ9cp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCD52EBBAF
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 08:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756886437; cv=none; b=ip5ePpMsgTE25xRZfSnrDML97afg0oH+kBgYHYIbL5TTZWT9MLY+LMXyRJ0m1o5ILGr3liM+RvkeYRpgax/rSwMdAN9e1ogr98k0r8wmubSlMXQP9iE7vccu/2xYglzNg2HD/3ZvWVh7zcCZ0FRVFmQfnFUgG1o7L3ZICBgMUGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756886437; c=relaxed/simple;
	bh=i7To5ENOaHcyrN5GVpMhJuU9dB5sZVwOfgqWcRcqpk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L8MwSYvZ68MtyW/+pe5VZGze4r56djE0I29zRNe2BQeOiB/YqZs47KIpBnusem1VAmnV+vYzg/ZxFSHqm9RRnSIfWck6Rsix/0BiaaDdkVuCL0+bI7+J2J50EHHTbM39ROrI7aGQPutO2dLMUjZuDsEq08xmwjUwCII30XzKFQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jRYIQ9cp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45b8b25296fso21775715e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 01:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756886434; x=1757491234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUs5a2nDRMHuDXCRanrQ8mp2SPyokL2I7XG6/L9Iqfs=;
        b=jRYIQ9cpPqY4nWHYUc48EN1g++oH7RjyP4Ycmab/oaeRUjaeDgtX2If4T0sJDp0bDN
         utFUo/4KQzRsG25D4mjRRrzlc1+3kvpKVX0JeGJ5QDPAkKMaKKooso+ts2LCtayMelUq
         1llPNWHDGwxoRHVya6CSW0Wj8VyDquOFZjvyIoejlC7UPhzuKWhAn+KMYXr4aEhA0dFn
         0MXp2iqLMzjjbkBZog00/LRKXKIsRahJunpJJcBlk9UMk7OXdZKAgm2bls5LPRonO3ef
         IeIlhSNFpxCv+LYtJ3CkRCgFGLFBQlg+2+Q8bMm6YYbAUOqKFk1GCiVrWdjhg0oGdPsb
         hreQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886434; x=1757491234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DUs5a2nDRMHuDXCRanrQ8mp2SPyokL2I7XG6/L9Iqfs=;
        b=LNH74CkekAVrwbY0lfG/5DjVIBoifP7D+NM0WnzcJRRSlaRF2ON3QGVEhRAC1ibTb7
         x2G47IUubu/Nrgj1sF5vW6l7SDlFu7KXHscRYFZw6OO0zTTWiFsi3AdMBtxO71YsPsqX
         6PkjlXaTi0NVC1dVHZP2m48Rd7MxdtcT083dnxpuVpXzHT3tN3XTPC4Nk54tL7lu//6e
         Ymwy7NpfHXueovblzjgzMlQjDz6Qu/O9y8vAwYrP86QMmGpx0NLocS+GT03YOTfkUCwo
         DqS/Ty0CWgHrA6hIzZSv4TaHIgCq1A4d16ZLOrHs7zL4N2kBCQlCVTfCLrdAK0EFNo/l
         /h1w==
X-Gm-Message-State: AOJu0YxnarGxqhs+H5/pOmD6mULVLud2pvZSvYVPBkuIamlU2fTHszPZ
	Gqe9O6C4uNZEhUAb1yFDo/n+t5cQHvl6iirmSEC3APGNkLxBcCP+62AVviE6QcwOfZw=
X-Gm-Gg: ASbGnct7ECRxz+LTHO/qgF2Q//f3ilS3y+Wd/AbFYDBmF4zk5VTFzDxCJaMxj9LbcLu
	8ZQNJryZ1QNByNm1wrcA8M0Yae6n4v6b1fS9k4LpD0BA9Ec36umKbUj761Zh9si7eKlMbYSa9yb
	NAIdJ3DgxIsEFIhLb4CpEgWzFo/AO5lGy+kGZy2yE1AQIBjTV0tgnNz5rSOIfHQaf2KzuYTBzyp
	e2imwvBzA68mIwKGlbsuhb+G7ckbBD9BgpYm3GhK91ODEqyMCyGeT2aZzC8ITXG6Ub4rW8jBCvz
	aH1lYltjDtdT81F5KmSqFmjVIFCYiR1qfCr7Qb2juqAtN2P+svKXbHVmUZVAixS3nBchoBp38nW
	6TM7rV2EbIuCsopRs
X-Google-Smtp-Source: AGHT+IEMba6q0Svy6j05dV6GpujDBA44kyoLSyxy6GrAMJf+eSO5tVzoWY8RSOQG3GEyGuAntTfqZw==
X-Received: by 2002:a05:600c:3b8e:b0:45c:b5eb:b0c6 with SMTP id 5b1f17b1804b1-45cb5ebb1b1mr10144145e9.5.1756886433580;
        Wed, 03 Sep 2025 01:00:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b83e954b7sm113331635e9.1.2025.09.03.01.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:00:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 10:00:15 +0200
Subject: [PATCH 11/12] gpio: ep93xx: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-gpio-mmio-gpio-conv-part3-v1-11-ff346509f408@linaro.org>
References: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
In-Reply-To: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2399;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GJsYS9qvoX3QonYp85b//aD9vVTY/JuUBAswwiFS/LU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBot/WSAvrbmquF95WoAteJAHY3x8R+laWadw/t3
 hnIC2UeZQuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLf1kgAKCRARpy6gFHHX
 csBbEAC35337SE4UYd5PJjrBlHCAdiTFv8Z7leMRU9KGJd89RudfjC33kMXkpN8LKsFBbAT3qG7
 TWwq/hVgOeYhxt1k1ltZTEmfjp7kAK2SwV+++EnD4f7loyU9uw2Fy4rAOiCn1G8ElbIJ+g6uMjL
 tBd6oSj2Cg1l749I+DqXJ5OxF7kzttxtdzeu3YrijlZZ/i4TOxmQJeOq9BIqB2nQ6TT9o/w9JFS
 zqwCRi01Plglj60lnPKR5pVByHGL+oTnpIDaXbWuLlckCYoSGANy66JsOdf2yabwVyaHAH+cIAi
 OM7saGCqrI40aL4WQC53x3CHY0klBgQsWxnUjDh6aLqKJY8pKfSc5ZbnyNpVH6VvfR8tuQQriwg
 L4zGWd94RNsGBGrMjmbBL+3pFthDRyRzHHv8pKMALQSroowGCfCAuBvx432ZWS1Yyr9GckqqB2V
 OSFR+7tbbzTLDSZOIVD6/QQfxBjykcY7+c71Vvh8AgoxttD9fU/4TcTC7MUdnKpEH2Kd/StlyNK
 7O9dU2i4sHamnUGpG4sNkhDSkXp5ZM3dBqO8Mps2uSpSO0cKBG7guQbB9nJxNLCipuvnCQvAv4y
 rvrhsSBg9uleehj3Oyq+peSKBqqSddVizZznSVO4RD0GWBEEGeSEuREoQpyeWiJtkDIPHMlg59t
 IV0RNeuOfeyASzQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ep93xx.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 08e5ae8bf4d1a80ca26680a3c7bff0b8039fa41a..c6c8170813331be567048980710226792b4b2a02 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -11,6 +11,7 @@
 
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -31,11 +32,14 @@ struct ep93xx_gpio_irq_chip {
 
 struct ep93xx_gpio_chip {
 	void __iomem			*base;
-	struct gpio_chip		gc;
+	struct gpio_generic_chip	chip;
 	struct ep93xx_gpio_irq_chip	*eic;
 };
 
-#define to_ep93xx_gpio_chip(x) container_of(x, struct ep93xx_gpio_chip, gc)
+static struct ep93xx_gpio_chip *to_ep93xx_gpio_chip(struct gpio_chip *gc)
+{
+	return container_of(to_gpio_generic_chip(gc), struct ep93xx_gpio_chip, chip);
+}
 
 static struct ep93xx_gpio_irq_chip *to_ep93xx_gpio_irq_chip(struct gpio_chip *gc)
 {
@@ -267,7 +271,7 @@ static const struct irq_chip gpio_eic_irq_chip = {
 static int ep93xx_setup_irqs(struct platform_device *pdev,
 			     struct ep93xx_gpio_chip *egc)
 {
-	struct gpio_chip *gc = &egc->gc;
+	struct gpio_chip *gc = &egc->chip.gc;
 	struct device *dev = &pdev->dev;
 	struct gpio_irq_chip *girq = &gc->irq;
 	int ret, irq, i;
@@ -327,6 +331,7 @@ static int ep93xx_setup_irqs(struct platform_device *pdev,
 
 static int ep93xx_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct ep93xx_gpio_chip *egc;
 	struct gpio_chip *gc;
 	void __iomem *data;
@@ -345,8 +350,16 @@ static int ep93xx_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(dir))
 		return PTR_ERR(dir);
 
-	gc = &egc->gc;
-	ret = bgpio_init(gc, &pdev->dev, 1, data, NULL, NULL, dir, NULL, 0);
+	gc = &egc->chip.gc;
+
+	config = (typeof(config)){
+		.dev = &pdev->dev,
+		.sz = 1,
+		.dat = data,
+		.dirout = dir,
+	};
+
+	ret = gpio_generic_chip_init(&egc->chip, &config);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "unable to init generic GPIO\n");
 

-- 
2.48.1


