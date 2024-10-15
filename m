Return-Path: <linux-gpio+bounces-11364-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C35BA99ECD3
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 15:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF7031C220EF
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 13:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0561E6DEE;
	Tue, 15 Oct 2024 13:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CXEeqbc1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37541C4A2D
	for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 13:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728998320; cv=none; b=kl9ufmL1cuAGmYvP4yQUvat8hy+jbRtBiDJaQxb2lRRjvr3k5AbGih70F3Rr89q1475yKiEYbNbTXKNWqlRjYSD5CjcnTnF8651Z57q1O1qOsHOUtVn4nxum/8BCrHLzRvaX4pyFAKqe0tzJTnvq0imOEY9GnvfSE6klCRDKaH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728998320; c=relaxed/simple;
	bh=CTl7TRLTqdbVoTgX7tk04gXaLUwB+Dr06qcHXlaiTIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b2KFf6JILuWNVMFzPCl0CiTQweEj8fL++4Zj/3ZIW4JlOaE1NYPt5T8j1qiSbvuoKHfqmxl1URWBTCCQxVL0j/V/Dj1emAOr5q1mYPpgeqzdqt1aKGrDLJZ+yKGbhIE8XwEcNdoDzdXGhVg7/L8alyzA/PL1/nl8Wi5SPB26SpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CXEeqbc1; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539e63c8678so3066149e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 06:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728998317; x=1729603117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmvAqLseAcbhjyldTYBk6kgveg2uJdWIgbtWH2HG6xE=;
        b=CXEeqbc1eme9UkG83DV3aq7tJMbnUhmC6kBKDm0UQx4SNwg9HcEvupJq/yPxn/10Un
         qGkEuc6dvpnZ25MJKGx4JqutCTb7C89HVf+ZqKodOYUxDU1Huq0TBFtcypeiF31RiowB
         QiAKL32r4XVLAHb1/wbkqKyEGnECHDw8FytJn1z7gphY/NdbviPA4VkCUCHZabyWvBl/
         ldD5v17DNZtslpPjA2BOkAa5m8SIVNy3YVR/82KoaesXGAEdfSlpNglww18QCbqkuCJY
         MBuZkdyBREL9zX6hyNU6492lqGwW/KJUVEKwGbI57fl+OweOjhlH0mEXkSgw5bcPFXbK
         VArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728998317; x=1729603117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmvAqLseAcbhjyldTYBk6kgveg2uJdWIgbtWH2HG6xE=;
        b=fbbBgamAg04B8ldcJ3Y5Z03+bIbO9nIc8ydOfhe+0uKW4FS55OmrVf7AiujPSui5L4
         sVc+bcmAwn0VUwJg3VBxfpgr3+31l37YcW4UprXJkU1k+meUWWeStO6Tpo6nZ8E4UVT0
         YfORe61etdDSFcge+6KBAJAYkTchm2fGlaelm0P3e9Os+TTugOE0wQsHGMw0jqE5mgSD
         5Z4EadCoKXioJ/KD7vIq90LeQESi+ALOeYgrg4IZCA1rLxAWpkJuzp6TIwbFTxeyJsqW
         7j6bz4lxRl93NCHoQAm1aQmaYyMPo3AXxRfG3UrVUm5OLrrvd3DFAyPOd27Be6UdgjrK
         tw5Q==
X-Gm-Message-State: AOJu0YzP+GTkMtrEycmRctSEUQBPdshbtTqJujfqQVXhdMN/Lc+umI7t
	/IOtY732ZF5U9MHaCHXSw2NjK9tgvvwsTSjsQmPQSWnJAs0DN6r9VeoMZNK9IR9coFERZfAMQae
	Z
X-Google-Smtp-Source: AGHT+IHpDSDAggeqdV2QFXz3TXKkVgqEVl5n2Cme+fsCB8fPnC839R+vFsgKKn1w6IlN6hiMsx+6KA==
X-Received: by 2002:a05:6512:280c:b0:52e:7448:e137 with SMTP id 2adb3069b0e04-539e54d77a1mr5722548e87.6.1728998316669;
        Tue, 15 Oct 2024 06:18:36 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:d382:b11b:c441:d747])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f6c5524sm17676405e9.44.2024.10.15.06.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 06:18:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 3/4] gpio: grgpio: use a helper variable to store the address of ofdev->dev
Date: Tue, 15 Oct 2024 15:18:31 +0200
Message-ID: <20241015131832.44678-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241015131832.44678-1-brgl@bgdev.pl>
References: <20241015131832.44678-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Instead of dereferencing the platform device pointer repeatedly, just
store its address in a helper variable.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-grgpio.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index 4b53a932a186..e11d7c4ad04d 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -328,6 +328,7 @@ static const struct irq_domain_ops grgpio_irq_domain_ops = {
 static int grgpio_probe(struct platform_device *ofdev)
 {
 	struct device_node *np = ofdev->dev.of_node;
+	struct device *dev = &ofdev->dev;
 	void  __iomem *regs;
 	struct gpio_chip *gc;
 	struct grgpio_priv *priv;
@@ -337,7 +338,7 @@ static int grgpio_probe(struct platform_device *ofdev)
 	int size;
 	int i;
 
-	priv = devm_kzalloc(&ofdev->dev, sizeof(*priv), GFP_KERNEL);
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
@@ -346,28 +347,28 @@ static int grgpio_probe(struct platform_device *ofdev)
 		return PTR_ERR(regs);
 
 	gc = &priv->gc;
-	err = bgpio_init(gc, &ofdev->dev, 4, regs + GRGPIO_DATA,
+	err = bgpio_init(gc, dev, 4, regs + GRGPIO_DATA,
 			 regs + GRGPIO_OUTPUT, NULL, regs + GRGPIO_DIR, NULL,
 			 BGPIOF_BIG_ENDIAN_BYTE_ORDER);
 	if (err) {
-		dev_err(&ofdev->dev, "bgpio_init() failed\n");
+		dev_err(dev, "bgpio_init() failed\n");
 		return err;
 	}
 
 	priv->regs = regs;
 	priv->imask = gc->read_reg(regs + GRGPIO_IMASK);
-	priv->dev = &ofdev->dev;
+	priv->dev = dev;
 
 	gc->owner = THIS_MODULE;
 	gc->to_irq = grgpio_to_irq;
-	gc->label = devm_kasprintf(&ofdev->dev, GFP_KERNEL, "%pOF", np);
+	gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);
 	gc->base = -1;
 
 	err = of_property_read_u32(np, "nbits", &prop);
 	if (err || prop <= 0 || prop > GRGPIO_MAX_NGPIO) {
 		gc->ngpio = GRGPIO_MAX_NGPIO;
-		dev_dbg(&ofdev->dev,
-			"No or invalid nbits property: assume %d\n", gc->ngpio);
+		dev_dbg(dev, "No or invalid nbits property: assume %d\n",
+			gc->ngpio);
 	} else {
 		gc->ngpio = prop;
 	}
@@ -379,7 +380,7 @@ static int grgpio_probe(struct platform_device *ofdev)
 	irqmap = (s32 *)of_get_property(np, "irqmap", &size);
 	if (irqmap) {
 		if (size < gc->ngpio) {
-			dev_err(&ofdev->dev,
+			dev_err(dev,
 				"irqmap shorter than ngpio (%d < %d)\n",
 				size, gc->ngpio);
 			return -EINVAL;
@@ -389,7 +390,7 @@ static int grgpio_probe(struct platform_device *ofdev)
 						     &grgpio_irq_domain_ops,
 						     priv);
 		if (!priv->domain) {
-			dev_err(&ofdev->dev, "Could not add irq domain\n");
+			dev_err(dev, "Could not add irq domain\n");
 			return -EINVAL;
 		}
 
@@ -419,13 +420,13 @@ static int grgpio_probe(struct platform_device *ofdev)
 
 	err = gpiochip_add_data(gc, priv);
 	if (err) {
-		dev_err(&ofdev->dev, "Could not add gpiochip\n");
+		dev_err(dev, "Could not add gpiochip\n");
 		if (priv->domain)
 			irq_domain_remove(priv->domain);
 		return err;
 	}
 
-	dev_info(&ofdev->dev, "regs=0x%p, base=%d, ngpio=%d, irqs=%s\n",
+	dev_info(dev, "regs=0x%p, base=%d, ngpio=%d, irqs=%s\n",
 		 priv->regs, gc->base, gc->ngpio, priv->domain ? "on" : "off");
 
 	return 0;
-- 
2.43.0


