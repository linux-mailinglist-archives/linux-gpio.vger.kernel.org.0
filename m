Return-Path: <linux-gpio+bounces-25795-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D88DBB4A7EA
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 11:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5D691889E7B
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 09:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086373101A7;
	Tue,  9 Sep 2025 09:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nA9/lIsS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D2728B501
	for <linux-gpio@vger.kernel.org>; Tue,  9 Sep 2025 09:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409371; cv=none; b=gvNI87VWODIHNw9FJe3i5e/F2cVfyEGzDOIG3rnBRpM6pfbo1WX6dwU+IrO4AD0goyWtScUPaRvOBtVBaL8ed8qacrVvK2lbury986l9c9Y6rNzaswObFvBel9SupzlUFHUB5X9MJ/GbSIev8GiDFPwfz4hGJU+159RUg8tHxOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409371; c=relaxed/simple;
	bh=KDFwPnbkRvx0fTKChYEHU+W71Zlm+jzr4ejpjKKTNkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O4vBohh+YUMwiuS9IgugMQ42mgG+VzcEZIxRZcaT7T7vQ3QWYM6S7t6lzni5/J0/QS5HDe4akOqpKiG616wQBN9Mee3gB4A2DII38vk9OkG6426yFIHyNoPjdPpAJwoFTHY+o9SNxymNUkVdYRHybwyK353w38cDwPlRLoY/xPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nA9/lIsS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45dec026c78so10066915e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Sep 2025 02:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409368; x=1758014168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMmaVn+LZJgn5b7c1rWtdZrF0XHWPwWhtZTr2dtFlt4=;
        b=nA9/lIsShanpPeuAhch96lazeOCjme8KqU/uAEi64KbjdLV8KATB3/wiyJU3A/rCZw
         /o8atZkA8RweFc4AFnvTezjsOYyS63TDVU7TH0j+Ov15kZd/p89NniJWb5wO+2bj6bm4
         bzhvXYATteqCzNY2wGK87YQkTLfsiteWhJGFLQ8mFGOjs3rvWVS2WbYxFaGiipxK9blq
         qDeFN6YUAuQ6GlJncvsDlrWf1Ig1IXXa3gDivmHfWRtdmTov9V9G4sWmegHUeX4MRyLt
         v4tOLsa+B7NmEyGe+2toSQ/y1mfRfTYA6MsSZ4E4H7v1B5GvOFghxggKzskkSLouMRMF
         8jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409368; x=1758014168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMmaVn+LZJgn5b7c1rWtdZrF0XHWPwWhtZTr2dtFlt4=;
        b=VTcX7sKLn3nHfl7oJ3FcGHHpytWfrHKQIKPBMals7M9D0Em7Q5Hy5oBZ3i49XbHiFx
         ccIXWZuDZDUDkjETxhfYAiirt4w85d5Ja56J1fpJ2Yw2vG8oHfQn02+H64ni9K7gfNZH
         yaMdTT7iPDbS4f0q9LLkn45zxd3i3znJWkGctMBOHMGWhOv3t/2Gepdsr4LygQIqhZxk
         mqgO01jKwlZaiopMvc6ErX/tcPIMIZS3s4tnoO6xEtsPC7Usp1HyiN2pwexnEYSL4pOt
         owByJTWi6uo+qHO4sYTrXOjeKsfM/HcLqhbau7dVJRbvytJrj55/sPNl5efA/m+4McSb
         doVQ==
X-Gm-Message-State: AOJu0YwsIKFWF22Um+U/lyuhx6btA7sQWtcpbOJMKZgErg6Rj3EqMy9l
	g2VzsyPPhOrXY4IOp3cpnt0hW8/Kui5KCRPEcdDhGBeP3PNssJlhmX48jY02HUH7dFs=
X-Gm-Gg: ASbGncsRMiU+vUDQKDWC3BEcFMsrxI2yT1BFCcHrIzhGmatxVPVIWhE6AHxX+qRuzTG
	GAFgwl/N4QePb+6u3YSL35tO+vrKAM130DU75PMtlQtgnm+65OApkTzpIRDkTXb26ncX/DmyZnv
	mAd6aDTcNtpwwxOmpNrsUGjhQ0SBAdjQatlPW9zFR2l3OwqC6UknIHbR9+w3+qd+RLeFDocGLO4
	PU6NMGc+8nqcKMKQIbS7sBhRbvO54RtSUv0tbEyrHC0o5/Qu4ErCCzFuibSckA2XOgiKxoP575y
	GAIYkJO3YP1EA0cQ+bKU4DyuYjubp+YInqJztCFzD4XuikNRkRqxFQ2WgZ4x+/VLM2v3HKeU130
	29g+2t4ATOsRivo3cmg==
X-Google-Smtp-Source: AGHT+IFmO6VqhZ9BkxEjJhWWUjTF6UtWEURBON8fvebih0GzMhUphDe9TftqByslO0IRvxtisIwrOw==
X-Received: by 2002:a05:600c:19ce:b0:45b:b05a:aeeb with SMTP id 5b1f17b1804b1-45dddec8ff1mr97136895e9.28.1757409367901;
        Tue, 09 Sep 2025 02:16:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:16:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:40 +0200
Subject: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2177;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=OpZH1E4uX1rbCcdgDBOgsBrK0sLVF3+FQJb0MPT9Hmc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A6p94D+S/c4LzuEPR6IThg0j1mZ/5T2G686
 meGifKdh+SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wOgAKCRARpy6gFHHX
 cvcmEADOfAiuC1Ep9RvIkJ+mqoo9WSMNXkDcTeYwBaiwwjIz0muCH85jNMqW9b3ZFhtBFSJuNtX
 arXg6eVDNEk4OcNWPJoc69s1QTJ9+jgvdXEqIvD/bmYCRDMpo+jQnl8UeLBhd7CBBEa45+1a68E
 M+d7xx0SBcN6nLNJqgO912DPu80/cw/gjXeHHbHoFmaCoklpIroAj2MEnMLoRluFVHoFaQ9d+8K
 Bu4Pzdqqu0HRLMJ1LAFhIF3VYoI+tpwPNIgT3E8/+5gmTzkcVW9Z+k/HLDTuKTyzC8lur0Ery/Y
 kT014qHXyE5TGEawY/IxfimrrtPXPu+wV2svkqUHpN3Pv7Qgph9GzQ8xluK3HnRV1tt1HUK/IMe
 f7j/0tewxNFyFeAGBlEua07W3bCnMCARotAno704aWDtPSIuP314GWm3T8z+l44QTe1F7vVVj/2
 8Q8vQYPB7OxkgxJv93dnJymPuJ1f4r/osq1nj6J8nngFzM2/Kc+UleQrCg+vmNpBSv4PTsApf16
 usJOj6hIKzfx05g/FzdSTDCqDptEEALnloKNJqBv1h8Y/qzjzei+M2XQmue1W5e8k7FqFuoP0zo
 AKlT5n8Ntxzdvl3e7GrObrqLBzaR9CTUOYcDGkDl1ixM/qLuQAJZWWxzTQZWfNeu0QrOndJIM/o
 3Bex3gwvCoubkBw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sodaville.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index abd13c79ace09db228e975f93c92e727d3864ef8..6bc224d3a561077bf3438a70591e1f313ac834f3 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -9,6 +9,7 @@
 
 #include <linux/errno.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -39,7 +40,7 @@ struct sdv_gpio_chip_data {
 	void __iomem *gpio_pub_base;
 	struct irq_domain *id;
 	struct irq_chip_generic *gc;
-	struct gpio_chip chip;
+	struct gpio_generic_chip gen_gc;
 };
 
 static int sdv_gpio_pub_set_type(struct irq_data *d, unsigned int type)
@@ -180,6 +181,7 @@ static int sdv_register_irqsupport(struct sdv_gpio_chip_data *sd,
 static int sdv_gpio_probe(struct pci_dev *pdev,
 					const struct pci_device_id *pci_id)
 {
+	struct gpio_generic_chip_config config;
 	struct sdv_gpio_chip_data *sd;
 	int ret;
 	u32 mux_val;
@@ -206,15 +208,21 @@ static int sdv_gpio_probe(struct pci_dev *pdev,
 	if (!ret)
 		writel(mux_val, sd->gpio_pub_base + GPMUXCTL);
 
-	ret = bgpio_init(&sd->chip, &pdev->dev, 4,
-			sd->gpio_pub_base + GPINR, sd->gpio_pub_base + GPOUTR,
-			NULL, sd->gpio_pub_base + GPOER, NULL, 0);
+	config = (typeof(config)){
+		.dev = &pdev->dev,
+		.sz = 4,
+		.dat = sd->gpio_pub_base + GPINR,
+		.set = sd->gpio_pub_base + GPOUTR,
+		.dirout = sd->gpio_pub_base + GPOER,
+	};
+
+	ret = gpio_generic_chip_init(&sd->gen_gc, &config);
 	if (ret)
 		return ret;
 
-	sd->chip.ngpio = SDV_NUM_PUB_GPIOS;
+	sd->gen_gc.gc.ngpio = SDV_NUM_PUB_GPIOS;
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &sd->chip, sd);
+	ret = devm_gpiochip_add_data(&pdev->dev, &sd->gen_gc.gc, sd);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "gpiochip_add() failed.\n");
 		return ret;

-- 
2.48.1


