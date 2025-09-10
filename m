Return-Path: <linux-gpio+bounces-25875-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD72B50F43
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 09:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24A5D16E8A7
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 07:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0931C30CD8E;
	Wed, 10 Sep 2025 07:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2HLgtre7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5AC30AABE
	for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 07:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757489161; cv=none; b=rEVLg/BIfsXMcNpNch2OayEcw3tspZZlNVA/O6zuKQD2WVcPhMRZb19JFwm9/OzZAOBEUxm1O78n4VxkBbQ/vw9pYvzrSACsbvIp5MZGn20WyrJ4PqYrKCEnRsmGKpY1KhQgrUzzqAYVwHPolRvlebFwBIWLocpcQ2gegehl5v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757489161; c=relaxed/simple;
	bh=zTPR6+9Ix1OolWmD0DVmmfekb7HAJkdOFlZuCHwZjak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ozx8ICMWXOBio4uYyMbl7veAo7VbjlQg2tzPN502jXWuM4jw+HEiBJoK1Eu8mltkYkBcfCtg25J62EVbp+7+0xa8bKfQtvpgM9A1Wp2pT5sbVqu9h259NXz9yAi0slcZjS+lLQ2lyH5O57T7ZfAFNgf7BvSvMHOz3QYn2O1/6iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2HLgtre7; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45de56a042dso21631835e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 00:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757489158; x=1758093958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zF013nrJ5GJsI3fsA8ibqvOnAPNLfV95/lnk4xGU4QE=;
        b=2HLgtre7H79NrDePmsMSIlJj/lfisOoivJY5/FX0ad66X6CM8+Ek47FQxei+4EcLlT
         Q/KNCLr6uIeJeSQEdyY9UkANIv04p1SGRjV6m5TJoQxbAe5n6xTZwx9i86b/oZiUb/Jp
         7rFc9YSHPyRiyc6K3+8UpcFozzQV0wJx4BSkRriP+J7LBUi5MrIgAamFFOPxB8DvIIuw
         ulsb+ZbLkzTSI4nnBJLVQm+gzHWy9xwQaxEKng/GCpl4QtOhTz1H+YPtxFaus5HT9k6L
         U7S2VKqivOMNVI9H+fI02oOIpEIxKfT9unCThl968qbqaGkLckpvNPws0yjVY95aj58f
         4zQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757489158; x=1758093958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zF013nrJ5GJsI3fsA8ibqvOnAPNLfV95/lnk4xGU4QE=;
        b=CCQHfuDcw6VQHBFvU6O+jsrEKv5VxqffbkJf4qFZIQt38xEw7Ry1yjBniHnbn16NR1
         4L/BkTwX0cXC0A9sZgtZiTK5HS9HY7bNQqhUX4TVZUCOudPeGV70jrpsXnw4f4hfwLlq
         7E6hea9WLYwOvsGes98FiCiY0Ex+/rHgcqZWDrDyKZesKph6JOgsE4yzlnNPKyQl8zNc
         spvRHyX3QEiFtEyOqqHR6Yg9BaxiewIetnqmwdc2qKY0jZhblt6NcCKWZ/BUOtGZlh3+
         t25KIPR6eMnnu54tuRYK4CObDwyrY8vgSX5SbaxM62ilXTfSMyNXv0KeJ9nUBlf+4O2s
         xwMA==
X-Forwarded-Encrypted: i=1; AJvYcCU6YozSdofyR8P+sxnnkZQUbr5Rxqq7r9DbCol4fT+lmphZXmIJTU5Sbu5CysDDL8shT6NfvjDrUP6i@vger.kernel.org
X-Gm-Message-State: AOJu0YxWgpSwvuS0LVa0raSZznrw9hCgEauVXILQKiCOULh3siEJnGGS
	KFiSR2MJaH5xN/+5W3ps/Poa0bwNmqvGAauJpW3JXwvikD+CAOYraNfkNfq6iHHk1qE=
X-Gm-Gg: ASbGncvXNZUk2WP1z4IMQ5f49y6AJq/86of+71lJ2OOY89VRHoctYwcPt08qYwmERCM
	Oamaz6w5ldI9X0+tkja1lW4U47klvUIxZZ/TM6+7nyUivinVzq0dogAUdc05IXFL7WoiTs5NkVQ
	JrG3AKjCRuaAOTw8iaBphxrlmi7eHy1ayYHzqvbEomfYqtk1r0FoGXKY90L9RCrjR7pVmGWto/e
	bjgBYhVPYIEQ0D/nFgZlnQcaxpsgLRORZOIKVJoMm2AY3MRzeRD8GigOwEp6qMyCfx2iL88pcv7
	8zlI4DoQuf1ss7/T4vKo3Witw+tYqlVALlv440cSi9zv9pK8A6KZX6wwJserPOBMunUKVbZWe2r
	AK7+XhOYhhegYyQ1vWA==
X-Google-Smtp-Source: AGHT+IFDCPBIKWcO0wPtCekfCK5Pt9XoqR33Si9x+IdwjWaGC2asnXF0pj2h+APM1jnRfwQG3SS7dA==
X-Received: by 2002:a05:600c:4f83:b0:45c:b56c:4183 with SMTP id 5b1f17b1804b1-45dddee9c59mr136102255e9.18.1757489157517;
        Wed, 10 Sep 2025 00:25:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8236428sm16729825e9.24.2025.09.10.00.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:25:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:25:47 +0200
Subject: [PATCH 3/3] gpio: use more common syntax for compound literals
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-make-compound-literals-normal-again-v1-3-076ee7738a0b@linaro.org>
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
To: Lee Jones <lee@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, 
 Hoan Tran <hoan@os.amperecomputing.com>, Yang Shen <shenyang39@huawei.com>, 
 Imre Kaloz <kaloz@openwrt.org>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev, 
 linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14003;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=INGW7B2ADGb/rlHHC57TDLO10ReKZPd3voP5EzMoCZQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSf9wMqvNTbZ5BfVZ4pmQJ1MRpUGegkac0qkt
 ovD3xCxd/OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEn/QAKCRARpy6gFHHX
 ctLPD/4pzJYzgrK6wx3tKnjhMqfr7Nb6jtllZTqaxOJyRf3KujiHHh4tRF3I+/55rNZI79714Ik
 Fs/HKHyW7lCg2x0BLvCdtnPpDsG94K7x9BGQYBQouFFHvhTf1W94UcnlcI8HcRQXudH1TYTt0rg
 EGZl9aLf66CNHix6Q+bJ9X0KZrpYsnuzlplOQvOzdAoxDkcpsm35Xrf8ndIT8c2GYY0mUm15SZJ
 dcrmlfY9ksAsgLEM0jJNV9F5QbkoQQksjgqGWasG2FlxFSwE1W86BHCceIZIuEalr5xaidm7Gux
 phNGKngKl+Otj4ocSYzRiekJ7FDWt6BpBq/saIfm5hwFwsKQiK6gySTQRYdgmqE88C5lRNOLV7/
 /jEjTofbVQXcoFHSZUMoiWvdONflA+az6V2L7n5FCyZd1tFupJXt3LQCq954ZHp/0RMucrAQJu/
 X/zQyF/mzJ9cH5Fi1vi8iVGR3kEne9Tm5H7amZyLE7qojUoA6WtZnpTSc2B3cv6Ujolxbapitr6
 iwYRd3lgIKQYjBETwVJUngT9eGzFZYKVquj5nsDg908KkhXJeWZPyxDNmhg2mvBXjt22gopF94J
 TCThy1BrEi1FhRdA5ayZnYjRE5UHIstpGuI39eSAdioKuk/q/30kj/XcAsSHEFUihfbaVS9JNrR
 gIl2OpuL6X6TiYA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The (typeof(foo)) construct is unusual in the kernel, use a more typical
syntax by explicitly spelling out the type.

Link: https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org/
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-amdpt.c          | 2 +-
 drivers/gpio/gpio-blzp1600.c       | 2 +-
 drivers/gpio/gpio-dwapb.c          | 2 +-
 drivers/gpio/gpio-ep93xx.c         | 2 +-
 drivers/gpio/gpio-ftgpio010.c      | 2 +-
 drivers/gpio/gpio-ge.c             | 2 +-
 drivers/gpio/gpio-grgpio.c         | 2 +-
 drivers/gpio/gpio-hisi.c           | 2 +-
 drivers/gpio/gpio-idt3243x.c       | 2 +-
 drivers/gpio/gpio-ixp4xx.c         | 2 +-
 drivers/gpio/gpio-loongson-64bit.c | 2 +-
 drivers/gpio/gpio-mlxbf.c          | 2 +-
 drivers/gpio/gpio-mlxbf2.c         | 2 +-
 drivers/gpio/gpio-mlxbf3.c         | 2 +-
 drivers/gpio/gpio-mpc8xxx.c        | 2 +-
 drivers/gpio/gpio-mxs.c            | 2 +-
 drivers/gpio/gpio-rda.c            | 2 +-
 drivers/gpio/gpio-realtek-otto.c   | 2 +-
 drivers/gpio/gpio-tb10x.c          | 2 +-
 drivers/gpio/gpio-ts4800.c         | 2 +-
 drivers/gpio/gpio-vf610.c          | 2 +-
 drivers/gpio/gpio-visconti.c       | 2 +-
 drivers/gpio/gpio-xgene-sb.c       | 2 +-
 drivers/gpio/gpio-xgs-iproc.c      | 2 +-
 24 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpio/gpio-amdpt.c b/drivers/gpio/gpio-amdpt.c
index 0a9b870705b90bdc9bdab93ce5a4a33ebdafccc6..bbaf42307bc3d7df0a19b34cdb0a5aaa96c9ad3f 100644
--- a/drivers/gpio/gpio-amdpt.c
+++ b/drivers/gpio/gpio-amdpt.c
@@ -88,7 +88,7 @@ static int pt_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(pt_gpio->reg_base);
 	}
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
 		.sz = 4,
 		.dat = pt_gpio->reg_base + PT_INPUTDATA_REG,
diff --git a/drivers/gpio/gpio-blzp1600.c b/drivers/gpio/gpio-blzp1600.c
index bfb35d59fa561c43889b186fdfb8d9184b750a53..0f8c826ba876129aab078d4c9cd37d9da015e35f 100644
--- a/drivers/gpio/gpio-blzp1600.c
+++ b/drivers/gpio/gpio-blzp1600.c
@@ -230,7 +230,7 @@ static int blzp1600_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(chip->base))
 		return PTR_ERR(chip->base);
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = &pdev->dev,
 		.sz = 4,
 		.dat = chip->base + GPIO_IDATA_REG,
diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 0fb781ca9da29545dce23ddbdf3bd5927c714b4c..b42ff46d292bd8f272395956709e8dccf49106e2 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -525,7 +525,7 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
 	set = gpio->regs + GPIO_SWPORTA_DR + pp->idx * GPIO_SWPORT_DR_STRIDE;
 	dirout = gpio->regs + GPIO_SWPORTA_DDR + pp->idx * GPIO_SWPORT_DDR_STRIDE;
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = gpio->dev,
 		.sz = 4,
 		.dat = dat,
diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index c6c8170813331be567048980710226792b4b2a02..1f56e44ffc9a3c5edab016a3b66e9d63aabf88ab 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -352,7 +352,7 @@ static int ep93xx_gpio_probe(struct platform_device *pdev)
 
 	gc = &egc->chip.gc;
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = &pdev->dev,
 		.sz = 1,
 		.dat = data,
diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
index dfa2c9444960a304d411e8d20db9bce0f8afa1c6..11e6907c3b54012877254e567520d868585c1f2b 100644
--- a/drivers/gpio/gpio-ftgpio010.c
+++ b/drivers/gpio/gpio-ftgpio010.c
@@ -264,7 +264,7 @@ static int ftgpio_gpio_probe(struct platform_device *pdev)
 		 */
 		return PTR_ERR(g->clk);
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
 		.sz = 4,
 		.dat = g->base + GPIO_DATA_IN,
diff --git a/drivers/gpio/gpio-ge.c b/drivers/gpio/gpio-ge.c
index a02dd322e0d4cecd4564a71a550204983df33568..b5cbf27b8f44225341e23e88b985e26458d11a7b 100644
--- a/drivers/gpio/gpio-ge.c
+++ b/drivers/gpio/gpio-ge.c
@@ -67,7 +67,7 @@ static int __init gef_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
 		.sz = 4,
 		.dat = regs + GEF_GPIO_IN,
diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index 3b77fad00749cd5218268b267b5848515c6a26fc..5930f4c6f2b578ea55c8143078042d5e0aaf3cfd 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -353,7 +353,7 @@ static int grgpio_probe(struct platform_device *ofdev)
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
 		.sz = 4,
 		.dat = regs + GRGPIO_DATA,
diff --git a/drivers/gpio/gpio-hisi.c b/drivers/gpio/gpio-hisi.c
index 01a99ac613d94e933d30f782520776693f048d1c..d8c4ab02ceaef7941e97f4788957b1f2c268de98 100644
--- a/drivers/gpio/gpio-hisi.c
+++ b/drivers/gpio/gpio-hisi.c
@@ -292,7 +292,7 @@ static int hisi_gpio_probe(struct platform_device *pdev)
 
 	hisi_gpio->dev = dev;
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = hisi_gpio->dev,
 		.sz = 4,
 		.dat = hisi_gpio->reg_base + HISI_GPIO_EXT_PORT_WX,
diff --git a/drivers/gpio/gpio-idt3243x.c b/drivers/gpio/gpio-idt3243x.c
index 232a621ba086ef66b2d2f0d471388c77ac5caa5b..56f1f1e57b69438ccd1e7014d590de61cd5a9286 100644
--- a/drivers/gpio/gpio-idt3243x.c
+++ b/drivers/gpio/gpio-idt3243x.c
@@ -147,7 +147,7 @@ static int idt_gpio_probe(struct platform_device *pdev)
 
 	ctrl->chip.gc.parent = dev;
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = &pdev->dev,
 		.sz = 4,
 		.dat = ctrl->gpio + IDT_GPIO_DATA,
diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
index 0cf10d0ba16ef7f45ac114c34468bc263442ccca..8a3b6b192288c8093abfe6644dbb680e9e25e830 100644
--- a/drivers/gpio/gpio-ixp4xx.c
+++ b/drivers/gpio/gpio-ixp4xx.c
@@ -294,7 +294,7 @@ static int ixp4xx_gpio_probe(struct platform_device *pdev)
 	flags = 0;
 #endif
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
 		.sz = 4,
 		.dat = g->base + IXP4XX_REG_GPIN,
diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index f84f8c5372494345adc64dc21f3d0439130dc6f3..b9234e12c30208dc971160d72896d8c7c6835127 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -289,7 +289,7 @@ static int loongson_gpio_init(struct platform_device *pdev, struct loongson_gpio
 
 	lgpio->reg_base = reg_base;
 	if (lgpio->chip_data->mode == BIT_CTRL_MODE) {
-		config = (typeof(config)){
+		config = (struct gpio_generic_chip_config) {
 			.dev = &pdev->dev,
 			.sz = 8,
 			.dat = lgpio->reg_base + lgpio->chip_data->in_offset,
diff --git a/drivers/gpio/gpio-mlxbf.c b/drivers/gpio/gpio-mlxbf.c
index 843f40496be7b723c300b3ea2f19fc698a56abba..a18fedbc463e678d94f23f8561c6d2140015c939 100644
--- a/drivers/gpio/gpio-mlxbf.c
+++ b/drivers/gpio/gpio-mlxbf.c
@@ -66,7 +66,7 @@ static int mlxbf_gpio_probe(struct platform_device *pdev)
 
 	gc = &gs->chip.gc;
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
 		.sz = 8,
 		.dat = gs->base + MLXBF_GPIO_PIN_STATE,
diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index f99f66cd189ca71c9d188dff0a0b42ef2223abb3..7e3b526a6caae0ef7697c2f812370f8bf5ea6049 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -377,7 +377,7 @@ mlxbf2_gpio_probe(struct platform_device *pdev)
 
 	gc = &gs->chip.gc;
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
 		.sz = 4,
 		.dat = gs->gpio_io + YU_GPIO_DATAIN,
diff --git a/drivers/gpio/gpio-mlxbf3.c b/drivers/gpio/gpio-mlxbf3.c
index c812011bdbe65a9ee793ae1a5bfc656b523ab8ed..4770578269bae8bdbee60873d77c93d4c4712c9b 100644
--- a/drivers/gpio/gpio-mlxbf3.c
+++ b/drivers/gpio/gpio-mlxbf3.c
@@ -209,7 +209,7 @@ static int mlxbf3_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(gs->gpio_clr_io);
 	gc = &gs->chip.gc;
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
 		.sz = 4,
 		.dat = gs->gpio_io + MLXBF_GPIO_READ_DATA_IN,
diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 38643fb813c562957076aab48d804f8048cee5e4..dd2cd2cc6e6f2932a62f5fe82718c53cd765ffa6 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -345,7 +345,7 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	gc = &mpc8xxx_gc->chip.gc;
 	gc->parent = dev;
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
 		.sz = 4,
 		.dat = mpc8xxx_gc->regs + GPIO_DAT,
diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index af45d1b1af6e049899ea6773bed92fb8a84a0dff..5635694bf9f448f85b395a3da62033735a04fbdf 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -321,7 +321,7 @@ static int mxs_gpio_probe(struct platform_device *pdev)
 	irq_set_chained_handler_and_data(port->irq, mxs_gpio_irq_handler,
 					 port);
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = &pdev->dev,
 		.sz = 4,
 		.dat = port->base + PINCTRL_DIN(port),
diff --git a/drivers/gpio/gpio-rda.c b/drivers/gpio/gpio-rda.c
index bcd85a2237a532b875df9470d972ac88b95a91cc..fb479d13eb01a49218ad4229e7d4f70f096f5a2e 100644
--- a/drivers/gpio/gpio-rda.c
+++ b/drivers/gpio/gpio-rda.c
@@ -237,7 +237,7 @@ static int rda_gpio_probe(struct platform_device *pdev)
 
 	spin_lock_init(&rda_gpio->lock);
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
 		.sz = 4,
 		.dat = rda_gpio->base + RDA_GPIO_VAL,
diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
index ab711422254e9e8ff1a4e7c4016389e6d352f268..37b4f73771e651e95b6127befe579ea76e03a102 100644
--- a/drivers/gpio/gpio-realtek-otto.c
+++ b/drivers/gpio/gpio-realtek-otto.c
@@ -401,7 +401,7 @@ static int realtek_gpio_probe(struct platform_device *pdev)
 		ctrl->line_imr_pos = realtek_gpio_line_imr_pos_swapped;
 	}
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
 		.sz = 4,
 		.dat = ctrl->base + REALTEK_GPIO_REG_DATA,
diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index f20b6654b865555579bb356a336308e23b0e5af6..09a448ce3eec2f4a68da188ec88a9d0833ab65ab 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -135,7 +135,7 @@ static int tb10x_gpio_probe(struct platform_device *pdev)
 	 * the lines, no special set or clear registers and a data direction register
 	 * wher 1 means "output".
 	 */
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
 		.sz = 4,
 		.dat = tb10x_gpio->base + OFFSET_TO_REG_DATA,
diff --git a/drivers/gpio/gpio-ts4800.c b/drivers/gpio/gpio-ts4800.c
index 844347945e8e71fa0f456be0ba8de7217f6760a3..992ee231db9ff8ba47600483457e7373159f1e5d 100644
--- a/drivers/gpio/gpio-ts4800.c
+++ b/drivers/gpio/gpio-ts4800.c
@@ -39,7 +39,7 @@ static int ts4800_gpio_probe(struct platform_device *pdev)
 	else if (retval)
 		return retval;
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
 		.sz = 2,
 		.dat = base_addr + INPUT_REG_OFFSET,
diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index fa7e322a834cc2afbab7d4948cd41465867aa4c8..f3590db72b141223e0a957825e94222056aa77bb 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -305,7 +305,7 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	if (port->sdata->have_paddr)
 		flags |= BGPIOF_READ_OUTPUT_REG_SET;
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
 		.sz = 4,
 		.dat = port->gpio_base + GPIO_PDIR,
diff --git a/drivers/gpio/gpio-visconti.c b/drivers/gpio/gpio-visconti.c
index cde1581a91033e0ffa855e6cab0a36fa01f2baa1..6d5d829634ad761b6f8f63dd1565e337faf89e44 100644
--- a/drivers/gpio/gpio-visconti.c
+++ b/drivers/gpio/gpio-visconti.c
@@ -191,7 +191,7 @@ static int visconti_gpio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
 		.sz = 4,
 		.dat = priv->base + GPIO_IDATA,
diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index c559a89aadf7a77bd9cce7e5a7d4a2b241307812..28ee3f7e91b921e7f22cbdb9c2d23cd0e80d429c 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -265,7 +265,7 @@ static int xgene_gpio_sb_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = &pdev->dev,
 		.sz = 4,
 		.dat = regs + MPA_GPIO_IN_ADDR,
diff --git a/drivers/gpio/gpio-xgs-iproc.c b/drivers/gpio/gpio-xgs-iproc.c
index 9cffdedd31b1c39123b93469465f483fbb4d076a..77eb29dcc2171a8221b965fd75c4a0d9175044d0 100644
--- a/drivers/gpio/gpio-xgs-iproc.c
+++ b/drivers/gpio/gpio-xgs-iproc.c
@@ -233,7 +233,7 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(chip->base))
 		return PTR_ERR(chip->base);
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
 		.sz = 4,
 		.dat = chip->base + IPROC_GPIO_CCA_DIN,

-- 
2.48.1


