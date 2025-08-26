Return-Path: <linux-gpio+bounces-24975-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D68B35925
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 11:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 593FD2A67EF
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 09:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69C934164F;
	Tue, 26 Aug 2025 09:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YndUkXoU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7581E31812A
	for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 09:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756200929; cv=none; b=Gpr91ryk5sqh17Pc9d/WkLRtfjkdjb/fXqKs0TP0iUhAF68Nv9QECVhx78yZG1/B5tPBECNJTvMUiP5pQoFbp1pKrsaN7GplYCFNX+zSjtQxG1sksEJTUVRzxpWTaAM9QKdusmZ0aajQxee+jozP4IT/nCzAOEamaZUEP8bD9Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756200929; c=relaxed/simple;
	bh=HE7DS3ZBNcH1Lm217c5EvpLZs9j1mvQjPNTZnIFPPfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kUZbh0JdeBp3wYgDG8liSNAFdUXtMgw6FUyCE7dkxjRMBeUfSPGf0HTzOYE3LzyLKhXgPCGbp29mAOk6HkGUucb9hvhqVfldEDA/mOPD1ZVyZDwgwHFVeVMKobgMoUmy69Z5p5Xu6e5xQieTtu7cSGKRi6CxR6BdPb0QFcNA0eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YndUkXoU; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3cb9268511bso173629f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 02:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756200926; x=1756805726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4SIaXVWUkg+hHGv+4ixu8kbiUSIjwYzUEuWT5aiHX8=;
        b=YndUkXoU39uCV18EYWx5Hm1fry5A8IKJrNUiOucR/71YPS/CgAdi7U2FaOqUnQ3acW
         r9YfV2MoWHKt0daImdPX2U4YQU6ormT+HAtN2YZHQrzRhGU78A7gnpIf3hpxQ2OD9cTv
         5c7qCnGsByijkLBmBnmCA+FeynKYjhhMy1hdUuUsPUiPFyI2nqwJpYhzpV7CVQzNkCl7
         Pgeq6QOBn0GWMVWWB/jtv8LhtxDGrr2JIhTik2drey3hB6ds8lhy6cOSsMtb1R8P5ETP
         Rsj0zn+kOtj9m/GmMj5z+ui+uolPitcUihFfVP2njraGd2OgbrKIkzjjIKTUCfkBDTHA
         N8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200926; x=1756805726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m4SIaXVWUkg+hHGv+4ixu8kbiUSIjwYzUEuWT5aiHX8=;
        b=QMtCcJJm/7G8KvRSI4coq8SPFPPnz7Q9Rmoeq0XGa8AWLHto7n1PRjrZGjlEKLc8hy
         UOjkPGrK16IfsSTd20olQNM5uWhrNswb6fGJI0Me6Hw+LvlrjmH4t/CfHxxZBWCYo5wJ
         U1MGSBFxu5uXDrWWdPrJf/YWr5t/Wu22p0Uy0kbf3WxfLVEdYw7CQ5O8EN1ROr5yN3+W
         pjuGrV/bN4O/7BT00pKNiK1WtvPmf5ZYn128hgaweEBQxlw6epwugK3ez8NtVnJ6jXDM
         aKAlE587PRfJXkKQYCV81ULpWUIzb/gDAD8lgYquRlKUMmkRejzL996t+vO1bhEEWlxc
         3A0A==
X-Gm-Message-State: AOJu0YyrdnfhKYqd6YdUZcq8tXBCq5XqVZ9Sd45Qm3NjZ/hv5CF00gJf
	/8DUgxoOIEu+u/gntycQ8gYKzMn8jhyk+aQ044aehuD0TF02c5XbpEEHxhc8SykW1JY=
X-Gm-Gg: ASbGncvXftLsntgZuPo9wG3x2mtfJ3Og4NbnczsT+1A4p81XCJq+6jEylKXsBEC0K8j
	oLtuUgXxdl65XvAnT5inuNR3l63jVh+6yihUUkJwBB+GoMFfNJuHHSVa5bUVLboob+F0/OXeVhr
	RwCqRdUk1+G3c5sVbRc0/UKnLLH/9rnwx7Qxj9J1+MQ0L4R3Sqbf3oQ7Zc35dzr2kn+Y/jO+nLO
	kmgFmjkbymi5ngWlIZRbMFNaQD6cG2v7JaoE8ajsuI+8CcESeH8cPPOoetYeTLtLz9KzDWutUPL
	n3ObooQ3ZW3FOsjcI+KSUGEBBQtaTq7/ajgzkapB6K248/EOOJUT4YXHwD0xyZMuPHRgCjEALAV
	dxZE84aO6PvxsdwN9zO15gYvlcIo=
X-Google-Smtp-Source: AGHT+IHIDohXLZAKff1GENvVq+fM/lMjSRZvIzBycvaCqcgyGD6B/NWZoIVvZstUWc4ib8hSnjpLpg==
X-Received: by 2002:a05:6000:2304:b0:3ca:ad45:6363 with SMTP id ffacd0b85a97d-3caad456a18mr2848159f8f.17.1756200925783;
        Tue, 26 Aug 2025 02:35:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm15308255f8f.47.2025.08.26.02.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:35:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:35:13 +0200
Subject: [PATCH 12/12] gpio: visconti: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-mmio-gpio-conv-part2-v1-12-f67603e4b27e@linaro.org>
References: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
In-Reply-To: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Yang Shen <shenyang39@huawei.com>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2444;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=lIkE26fimxtLsnv6/OivS6nB6z654zlY0oS9FIX70Es=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorX/Og0nbErzpY3vQ9xVhUwQ4iNVAKpRoHYsW4
 LZRkjgeVXKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK1/zgAKCRARpy6gFHHX
 ciDAEADY4ihEtR9Q7yOEPZRGqxwnfxfrHl7l0+5fiDRcc1FroXh2IHJ0vTwbvBV7qbzrH2dM4Gl
 8H6mb/ToQaz7wQ05T33kB9KO4dkt80hapLHLqKrM/UJ1jgw/IE/bhrUGaAL5fy+thOMcPxUjNex
 pIJjwJHspqz1osilDW+2yP/wIgStol8GscbIWtdYoClTuoUzuj+/f3dgatzmAbio/o0BlycLE9P
 sRf2gMSwmzK+eOIvekbtPm7BfuVWzUJMavw78rz9zV66o2o5uBy1VmVmsb+Awq3/5W0QJEtE6VD
 gFSdMXDLO5UsDo0OaA2OWuZvallu5BvMqG2jhOcxkUAm3H3jzOrQy7AccA71Uza8B20IXmmxoVc
 fFJxXPABvFwfs3S40Y/WG/oG8mTHgB2ExlW8WBPtkH0jWTYjVrSZx9WjVL1f4zwX1FSCCaZkx96
 vrtYoPCC2YZSsJMvo8ys9sy0zH8RsbvydG0cfeFJHkaD4hMAeb/kxMzwRpYmj48mlxnfKpYyVii
 UXfCElyNv81k8MIzqisClidhmWj29NFXds2XVhdz3R1jXiLd3aNuhh6FRld6OgzLAg+pMETjfjT
 dUwaD/eNJr61h83U8iT3Ox7OCZLB/4KcjQGC6UCas/qCDtvDLtrG/8Cz8auDUmkQKajQQnbB793
 3E2mpLwnP78CEMA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-visconti.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-visconti.c b/drivers/gpio/gpio-visconti.c
index 5bd965c18a465f29884cbe56711b25d7e755df2d..cde1581a91033e0ffa855e6cab0a36fa01f2baa1 100644
--- a/drivers/gpio/gpio-visconti.c
+++ b/drivers/gpio/gpio-visconti.c
@@ -10,6 +10,7 @@
 
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
@@ -32,7 +33,7 @@
 struct visconti_gpio {
 	void __iomem *base;
 	spinlock_t lock; /* protect gpio register */
-	struct gpio_chip gpio_chip;
+	struct gpio_generic_chip chip;
 	struct device *dev;
 };
 
@@ -158,6 +159,7 @@ static const struct irq_chip visconti_gpio_irq_chip = {
 
 static int visconti_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct visconti_gpio *priv;
 	struct gpio_irq_chip *girq;
@@ -189,19 +191,22 @@ static int visconti_gpio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	ret = bgpio_init(&priv->gpio_chip, dev, 4,
-			 priv->base + GPIO_IDATA,
-			 priv->base + GPIO_OSET,
-			 priv->base + GPIO_OCLR,
-			 priv->base + GPIO_DIR,
-			 NULL,
-			 0);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = priv->base + GPIO_IDATA,
+		.set = priv->base + GPIO_OSET,
+		.clr = priv->base + GPIO_OCLR,
+		.dirout = priv->base + GPIO_DIR,
+	};
+
+	ret = gpio_generic_chip_init(&priv->chip, &config);
 	if (ret) {
 		dev_err(dev, "unable to init generic GPIO\n");
 		return ret;
 	}
 
-	girq = &priv->gpio_chip.irq;
+	girq = &priv->chip.gc.irq;
 	gpio_irq_chip_set_chip(girq, &visconti_gpio_irq_chip);
 	girq->fwnode = dev_fwnode(dev);
 	girq->parent_domain = parent;
@@ -210,7 +215,7 @@ static int visconti_gpio_probe(struct platform_device *pdev)
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_level_irq;
 
-	return devm_gpiochip_add_data(dev, &priv->gpio_chip, priv);
+	return devm_gpiochip_add_data(dev, &priv->chip.gc, priv);
 }
 
 static const struct of_device_id visconti_gpio_of_match[] = {

-- 
2.48.1


