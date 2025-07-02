Return-Path: <linux-gpio+bounces-22595-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66036AF0FD6
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 11:23:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D5C54E1985
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 09:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3275E252292;
	Wed,  2 Jul 2025 09:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ktw6FF6C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC25248F54
	for <linux-gpio@vger.kernel.org>; Wed,  2 Jul 2025 09:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751448147; cv=none; b=mEh2ePqp0ZYOk1M1/XmrSEeprm7YMvvlDJmfoi4o1hv+h23oaKMpTwimeIWJx76g2A31TqIep3rTXjLPF+qQb2q3Jg4l4ZKGcH08BzuubB2pnkKiB0A/kzvm3CghVNJAxIlgJAGsp4Q0hwnPU7Z/O05wBTMVBWIIuq4EbRtKBV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751448147; c=relaxed/simple;
	bh=4hefMCOfh/HoGix1fXfXI70Km+nHiSCPUxJIkklgk/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GaS6Zun/kqveUEh7xRJ1k9TH/BJCkeC/yW2MY2hn4Lh2fRH9hRAhk5vX6VUUs0LDDJMmcrzh7qut01zGf0Nje6X5kB4FOBi+UbnTjlM8aKsruxnVfdR1b0BLhXI6wm34bYAiTjqkYzwsm2eGPTU+mOQynS4srAw8F8qrtXCsqEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ktw6FF6C; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso3797010f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jul 2025 02:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751448143; x=1752052943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z2i5IXHDrYsUc/Tn17nFSzjMPGS5SokuRGh4FjnxTpw=;
        b=Ktw6FF6CL5cwjXOcZMbg3kPKXusRx9QXUruYzh+AENztbJOLxgDgJ5E+lAx50rUHDy
         fm00MVymifJsRtDx3++GCdS/w/SJM8tPihEtqLpqVT3VJIeSB9QJC3QkxoW+GPBZ31wZ
         DjEspqqAgo0vmRZ3QO0EasSDxgIeG+YQRrwiISS/ztzSo2c0VYOCaowTzXTWR2nltZtv
         qkrEAXsyQMn4cXA6LTs+WDuHDpnD+gfFQCzu+NBsv14ArVaOQLBLxc/N1NbNFMs7WuvA
         TnVB5XbTXJCGflAt3wlnlQQlPeKlvETIqPpVNfibf6H0PgNhRBzve46uvzs4CsL02s2W
         IuBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751448143; x=1752052943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2i5IXHDrYsUc/Tn17nFSzjMPGS5SokuRGh4FjnxTpw=;
        b=gKPRQr5YMqONk7Byf8yE8Sk/2skcpEC/H/V42ieH+KoHxMqZxODBkktULm8m3cuUi/
         aQOaMcVYU9Bcvl/MzNZBDA56Qj+UELOG79Leca46bDxK0R5Q1TOfByNCPNsxKhPhUdlC
         o39nbTpMojHHOEROhhHfBmUtgeaSZHvk4Fl+Uy+kwm5GrGFvikFZqKrK2kzQPHWGFWDs
         SI4E3jtVP0ZQL6MRfnUNpwZFHhUfvr5zeV8fdp4NmbLVXcjZxCa7gEOVPPWdi/BWP2zg
         15TKzG04dOLlQVIRa/xniCjhAh432OrBiMr9fBoN2Pbjwmvb3OeigJlVO6MSp9DskNBB
         A4dA==
X-Forwarded-Encrypted: i=1; AJvYcCU5ZacaovVMtxvEObXwGlWcHy9m2GxMTiFuatLxDAEheWDdLYooPprHaMevz+i2muOEt27GuoAeaqcN@vger.kernel.org
X-Gm-Message-State: AOJu0YxNc/rksUWJfsVe4yjOR7cB/lRmI/tGhU3+P+3v63PVBytmjKbr
	b1MX2fBDfDm0mL3Zak9TF9mIkO0h3XqgCBdezyTLfHwOc+r5lZo6vFi9cu/b/jCda1w=
X-Gm-Gg: ASbGncv3mxbLWOjAwVLbrVsE/zgd0X1j8CWouPrZDy2sd2h0ebjm3+EqixUsn4fi9zm
	QUSz01hhWkerp8NW/bplRQy92Ex420Q6wNL8o6Rb+GEiQ+Gq5OpW+vI/0+1FuvqmFtkPNGkleRC
	at1VKQawL6EV/veixOVBOMeK1UtK4VuctWmv2jYYFoVdLSHX8Kwd/tYrQpyL1oNM9Kx3xnUiSzy
	uYDQJekEyXHixYE5PGzGIneCmTc90G4YBe+E3rQWtBdfj03TJsEud0HibfWm0RmA1rtdeZsr1k9
	IUl3FlgIJIRgMyUGiXSZ9j27cGUDjzjuAWsL1Q3CW+ghSiFg4py2qA==
X-Google-Smtp-Source: AGHT+IHqzoytGZsKMlgoRsXyN3XDOj0IiS+FUXoOYFtH0PT8GVRyyMyck1Y8DKbhl5NYuCMHrTWO9g==
X-Received: by 2002:a05:6000:2083:b0:3a4:f939:b53 with SMTP id ffacd0b85a97d-3b1ffcd6477mr1625551f8f.38.1751448143475;
        Wed, 02 Jul 2025 02:22:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406489sm195844165e9.27.2025.07.02.02.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:22:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:22:15 +0200
Subject: [PATCH v2 8/8] gpio: en7523: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpio-mmio-rework-v2-8-6b77aab684d8@linaro.org>
References: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
In-Reply-To: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3831;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=bWHsnwR0yWBpKvxYpjrvU4Drn4TZUDb/OIAKGQMvuaU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPpFdMyJ+UINCiz6R9O+qXkyUiIM7pZReygQU
 4K7+xodRo6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT6RQAKCRARpy6gFHHX
 cj1mD/sEuWGffBMokzY6eLNDHWa9NDI66dIkEd4DeoGLZ+5mgYBSVOY4IX/2sfJRJPC7u/NWU3N
 iGtN99VVMrQkcE/jWg2pi4VztxciMgsAjolZkYTxw9f21U6Vm9/5u8eAGM10VZqydOcBovkEa3U
 rdKOvhJpPqGiKTnSCB7/owvSsaiOxis/N39s6uaULLYd3Q/VAnVaSigE/LN9yE38iKbHXAhhi23
 byVyjQIoMa/fU+1VF6wSAZDTdnu7ewB3tItKln9yT9tntUIhCVDNTNcB6MPajPdSZVv/Wva+pKN
 QuWEiV58qhcdpV+gPxad/kI4WCIkuknzCt1Obfo9Jw+V38hnthNEOR30wfpFsEBVktQs/GE8glC
 lUilXpCPnJiD6rSUMLZJe08nNCuj3VroJT1RYCK6pjI3BGPIEQmb7yQv1TpuJ+0miVYOyXNzmsC
 P2PogiIZLhpylqVCFDR0ospXP9L/Lk9IgO4yNwEM2Z2jUi3b4NLUPFe9X8EQfrPlFxc+bvpVfXo
 m+dWjyS5i8/QDdFyTO7YzwMDxsT6Cne3LYLtL/GBLieHhx3GFNkmdm2pZkh7Y6BvkEa6d7iVJ03
 n5IiEuf2HgB2gL6nbq2X+IU7YDkJGqQBiPJyDgs8fmFFDjWaf6+jJZG6ofJYi4MzDh0UG6bodh7
 D40y/GY6tWaeFEA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
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


