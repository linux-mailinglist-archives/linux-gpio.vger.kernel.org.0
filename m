Return-Path: <linux-gpio+bounces-22070-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B524DAE6663
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 15:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD8034064DA
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 13:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478182D29C6;
	Tue, 24 Jun 2025 13:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Gj+TQiZW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CA82D238A
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 13:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771677; cv=none; b=RxIzJ3VzDI8TrMXX/AEebxYSLFSbljf8lMwj8dunc1c5AJaNFc9/qO+qYLXuUsmKOW6S+gdm58uVMVrpUAJquLghmpsASb1vRGif4ctqJ6tqtsYmiOYUck1g4uws2Q5H1/i87hISNTxtI7/H1A14nD2FHKczSlhxNSdKtz+iS9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771677; c=relaxed/simple;
	bh=pM0n60h3HD/tmH+hBKVEPyS+pbvfe8o2Q+W4NhSPShI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sCSIp5In7TQk0QXEVu0l4mtLQDnCCjoIICzA+gtlb4bx/dkDfKgYzvfL1M5B5D03ZlSfhJImXRbdvnT0B2+u53/gJ0SHfOW4VsUgJFzgVuKjxnTejus4YqfVAZsP3nUch4JvPCGUYHnHxLV5SoKhlX2qAHM27QkRAsl36yj5oyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Gj+TQiZW; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so4177125f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 06:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771673; x=1751376473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42qfBZRks5CGXOIurF+J5eyvnPR1JOmltRDytTpDnik=;
        b=Gj+TQiZWwcKDLXsiNwSpvYpa/+sIex4HpsSDDn0jnHEIJDOnDAjsuStUejo4Bvmr0f
         cwMUKoa57ufnjvlgK9xx1yzmyGiyMgNcMvmJxy+Zmca0J+GrtWeJzTCxu/+nQ6zkLvfR
         FWzrvWifVmU5j+4ztnzBaARWwZCxmfGhti+xeuyMNPAV0nJhCmJAfuVqyx6hwNG3U471
         dpEiYpjGSuTB02CwHEyfnBdxyYIh9XHWV59OWptmrN76sSPjz2LfZTADpG5eXxi3aH8E
         tGkESoYoPhC4MVN2Ku/N+JoqHpfxxireGeYu8fm8T5a7Jgo6Pt8Ri5AdMH2ykWROAHlk
         Hmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771673; x=1751376473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42qfBZRks5CGXOIurF+J5eyvnPR1JOmltRDytTpDnik=;
        b=mNiQFyE9FT6ZjCjAdTpAngxdHhfs1KnfkD9JBd2C9hiMTfKcoQ8zs5HOfzZNgFyanD
         0n0Z+oUlWmgrxg9DMOXyyeU34G94AZc7qKZJYa8hDYeHem+9r6jgK0y9yzWuW2VVvFjc
         lKoYwdXhE+SllJbtNnleC1Nl6mhCyvgE26BRs+tT5aMWuQVy5ZStIRR0v2hsSdWOgG+J
         KxMZMdSiudWVPrKUQRTdCuY2v3P0VTYNEZwYBpcyV3A5QneAccuFAPiT/4BeC60cITOz
         8pVfQ8ZsvtTB+CdRhw5uwXoe7LJeg1C9H3hZ+6TKCSbkHCv0cUHhFX84xtZ7QE/s6GAa
         8KKw==
X-Forwarded-Encrypted: i=1; AJvYcCUPKA0ocS8sfDDN3gNZKtUHgCrKPFOqM0Odhb9LdMKQ1Gwilgd6xC0dCsQRtymjewXttQ/n0p5TbkYG@vger.kernel.org
X-Gm-Message-State: AOJu0YwkC4N7A1QI7N3f/VJ3agnVlVZ2s3fqPUhcTD46/l1EoRH5XJtK
	XjOxe37oQsHNKszGA7Ffzl8ULzRLuwjmttr426tx21+7fdwPFNC49fl5RfhOiZPA1j8=
X-Gm-Gg: ASbGncthgv9WhUllGf60rUqK+r2e4Ifayrmt9OX7cCAVhottYX/WWwyUIKpYAdCVcWy
	d/KdI5OSFijvMIDaLFsAbVt3LIlUbYob/L0rcsCjqscnDn60rFAILMckq359W3mPk9cuH0OMgRz
	uFrzWX7tM639am9o3p/fwBrmuo3fR1V+h3n+amR0LuUBYZ0J4W4+1lG06tG1OBu4UNoJ4EtXPCW
	h4BpBTffVAS7Az3HVEAGUu22PeRV8Mfcux99d//FhBd2MBc8Ok1452ysC3/jxRzHunz5O+maoyG
	tEXEWfM+NniR2wvg0hiG/1JjwRU9Y0noOkUKRqZ5oDGRFFdwA3VKtHg=
X-Google-Smtp-Source: AGHT+IFDRcE0YvqSWvzHsw8Wjp0saBNngEo6sSuauX4WB6eVnw9c+hFTvCibFA5/V90NuJg61q4Heg==
X-Received: by 2002:a05:6000:2289:b0:3a4:ed2f:e80c with SMTP id ffacd0b85a97d-3a6d12de8f2mr12964118f8f.31.1750771673236;
        Tue, 24 Jun 2025 06:27:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm152588485e9.1.2025.06.24.06.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:27:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:27:40 +0200
Subject: [PATCH 8/8] gpio: en7523: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-rework-v1-8-aea12209d258@linaro.org>
References: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
In-Reply-To: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3776;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=AkIiGyeUQx2GXJPFGzxHW+/s0um0+Eyc9TO0+IVjWog=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqfNCGRfJkuzmVlo7UHdKOCMgJbG51c0tv17w
 mTEfmkCEeOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFqnzQAKCRARpy6gFHHX
 cqKUEAC5HbCZgPEeSVMPAxNIYtukMgkpkvILoOnfoZLy8Pl6S+b+XsBUpG7X54Z5vx8BIdse5eR
 WuppKaqqv+DuFJsXPrA50NZq1NCPdiQra22q9AjNGL3BTp0MXZ37jmEwtT6EJ2HacV5eQvfb7Nb
 rZxBQ361MUGhBAH2Msvr6t/W39ttDaJ0RKpFzj6uLBHQZOxNqGotiVliYPKlnyQGXWmrv4FBzS9
 kpg1YJUct/gOoO/PXlqnTBlGFxkzo4g6pHxwrbR0OtABwZ0z797oeG8RJ60QWR6s3pvDYzF2oFz
 BKQh9SMvemblHJk55DfIKwx/8kXdYX+pTfW5/3q7RedjqXrGE33DR0eheSFN+hAx5em6CvDGGkD
 HJMRagpzEjPa3tXwKXUimxbJkSFlKOXCdEDCcYreD+SET0Y8tiK9HxQmy35v1ROrbwfXr7mWhnZ
 SNW2P8YD9YU08TELbFHP2feCHm4vw+7ftG+2l/3CnHlV2OG76GPcpWgVUAOBdsp+okHA1R4bLFb
 q3V0ydqrnvAJqV5DveHTqalUW5R3EqB0P1nMOq9vWQo1pymffGyoH9IcWVNu7vMkhkuBuEbAFcY
 9ZC1JZakPmq8qio0JnQ7bk+XCS1COTJ5Q6L0+54Uipo0vwctNVHV8uCjD+1yCSQ0NpLm0MVRrBY
 jH77CQ/Ax7J+MaA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-en7523.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-en7523.c b/drivers/gpio/gpio-en7523.c
index c08069d0d1045e9df4a76cad4600bf25d4e3a7c5..cf47afc578a9cea1fb1adb97f51b143b13c66ab1 100644
--- a/drivers/gpio/gpio-en7523.c
+++ b/drivers/gpio/gpio-en7523.c
@@ -4,6 +4,7 @@
 #include <linux/io.h>
 #include <linux/bits.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -13,28 +14,23 @@
 
 /**
  * struct airoha_gpio_ctrl - Airoha GPIO driver data
- * @gc: Associated gpio_chip instance.
+ * @gen_gc: Associated gpio_generic_chip instance.
  * @data: The data register.
  * @dir: [0] The direction register for the lower 16 pins.
  * [1]: The direction register for the higher 16 pins.
  * @output: The output enable register.
  */
 struct airoha_gpio_ctrl {
-	struct gpio_chip gc;
+	struct gpio_generic_chip gen_gc;
 	void __iomem *data;
 	void __iomem *dir[2];
 	void __iomem *output;
 };
 
-static struct airoha_gpio_ctrl *gc_to_ctrl(struct gpio_chip *gc)
-{
-	return container_of(gc, struct airoha_gpio_ctrl, gc);
-}
-
 static int airoha_dir_set(struct gpio_chip *gc, unsigned int gpio,
 			  int val, int out)
 {
-	struct airoha_gpio_ctrl *ctrl = gc_to_ctrl(gc);
+	struct airoha_gpio_ctrl *ctrl = gpiochip_get_data(gc);
 	u32 dir = ioread32(ctrl->dir[gpio / 16]);
 	u32 output = ioread32(ctrl->output);
 	u32 mask = BIT((gpio % 16) * 2);
@@ -50,7 +46,7 @@ static int airoha_dir_set(struct gpio_chip *gc, unsigned int gpio,
 	iowrite32(dir, ctrl->dir[gpio / 16]);
 
 	if (out)
-		gc->set_rv(gc, gpio, val);
+		gpio_generic_chip_set(&ctrl->gen_gc, gpio, val);
 
 	iowrite32(output, ctrl->output);
 
@@ -70,7 +66,7 @@ static int airoha_dir_in(struct gpio_chip *gc, unsigned int gpio)
 
 static int airoha_get_dir(struct gpio_chip *gc, unsigned int gpio)
 {
-	struct airoha_gpio_ctrl *ctrl = gc_to_ctrl(gc);
+	struct airoha_gpio_ctrl *ctrl = gpiochip_get_data(gc);
 	u32 dir = ioread32(ctrl->dir[gpio / 16]);
 	u32 mask = BIT((gpio % 16) * 2);
 
@@ -79,6 +75,7 @@ static int airoha_get_dir(struct gpio_chip *gc, unsigned int gpio)
 
 static int airoha_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config = { };
 	struct device *dev = &pdev->dev;
 	struct airoha_gpio_ctrl *ctrl;
 	int err;
@@ -103,18 +100,21 @@ static int airoha_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(ctrl->output))
 		return PTR_ERR(ctrl->output);
 
-	err = bgpio_init(&ctrl->gc, dev, 4, ctrl->data, NULL,
-			 NULL, NULL, NULL, 0);
+	config.dev = dev;
+	config.sz = 4;
+	config.dat = ctrl->data;
+
+	err = gpio_generic_chip_init(&ctrl->gen_gc, &config);
 	if (err)
 		return dev_err_probe(dev, err, "unable to init generic GPIO");
 
-	ctrl->gc.ngpio = AIROHA_GPIO_MAX;
-	ctrl->gc.owner = THIS_MODULE;
-	ctrl->gc.direction_output = airoha_dir_out;
-	ctrl->gc.direction_input = airoha_dir_in;
-	ctrl->gc.get_direction = airoha_get_dir;
+	ctrl->gen_gc.gc.ngpio = AIROHA_GPIO_MAX;
+	ctrl->gen_gc.gc.owner = THIS_MODULE;
+	ctrl->gen_gc.gc.direction_output = airoha_dir_out;
+	ctrl->gen_gc.gc.direction_input = airoha_dir_in;
+	ctrl->gen_gc.gc.get_direction = airoha_get_dir;
 
-	return devm_gpiochip_add_data(dev, &ctrl->gc, ctrl);
+	return devm_gpiochip_add_data(dev, &ctrl->gen_gc.gc, ctrl);
 }
 
 static const struct of_device_id airoha_gpio_of_match[] = {

-- 
2.48.1


