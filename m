Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC18631A01
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Jun 2019 09:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726058AbfFAHMY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Jun 2019 03:12:24 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33354 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbfFAHMX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Jun 2019 03:12:23 -0400
Received: by mail-wr1-f66.google.com with SMTP id d9so7907561wrx.0
        for <linux-gpio@vger.kernel.org>; Sat, 01 Jun 2019 00:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U0o3CHgc/oBGGF4DhiVoayfCI4Q5nSrFbWJXOCfptPE=;
        b=fmvi9prJFEiqYA8NwXarV7Q2CR/tTCoFHOpAkAbgmjAmbVSdbL6y1AMZP4Ne/58jMr
         2mwkghoE2FiOVka1MhvIa46sJ89+elM/XW+kytGUDFvcHlSv/odlFxilz2vqzazLba5H
         yd3k0/wUgjLHcTKvYhDNEV71MH4SZO8v+V+Qrtd5WVoGITSVQBvfobYTYjpew5HgYxZl
         ElHvNisE8kI3gAOBOGzwSBYGJ2I7Yr7h1NPdI4lD3ajWnceAM5Yes9hrgFXa+3DKJr/i
         iBZPh3B7laPECxAuh1KzT5j5FBaxqrd32VnO7Sa/OBrinRgKEtVGEpwT8xbelUAqxCp6
         JPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U0o3CHgc/oBGGF4DhiVoayfCI4Q5nSrFbWJXOCfptPE=;
        b=pYRy+MWvUsVAb7ANKJ6grNNR4/3mpHtYxjsHvdVerS/Dl8UTo0om5kFgd0IOMfuGJ0
         9zXuQHxVBLlW+us9jyNykUyK0rK6xU7r4wNg7n88iDgdgjy7GBtII2P0Vfw/eK7TOulc
         DLWOz+ofCo+XgoeyHRrwi8fCjAZdgTHgaAiv5YtoIPfStdV1Yi39BN6bWPm7LJG6O3A6
         W0nRog8plCY54AVgVC1Xdxh8OF6JgC1gCfXwmum3EaaYSpIwcXZslenY5LpT/2htnhJP
         KeMvZpPxzMxstSg8qfwB/s3noNwwYZRP4dhwzvu8vBf1Y/UxcgiJ8q7iRaZNRNNP5PCh
         eKrg==
X-Gm-Message-State: APjAAAUp/QVaOuVX6/73HWMsj4BlaaK1YGTBj+usTswJv1nBUcK4K4Z/
        OsEyoXbGtVG3dk6wuLlYLDFlAcME
X-Google-Smtp-Source: APXvYqwwYYs4il3r6Ouc0vW+fESGUae9oHc/h31pkNNRgDfNzks6vY1BsPxpQot8HY+QBfBNmQAfxA==
X-Received: by 2002:a5d:4104:: with SMTP id l4mr9281244wrp.302.1559373142369;
        Sat, 01 Jun 2019 00:12:22 -0700 (PDT)
Received: from morpheus.roving-it.com.com (2.e.6.5.c.a.a.1.a.8.0.3.1.e.3.c.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:c3e1:308a:1aac:56e2])
        by smtp.googlemail.com with ESMTPSA id u9sm18642101wme.48.2019.06.01.00.12.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 01 Jun 2019 00:12:21 -0700 (PDT)
From:   Peter Robinson <pbrobinson@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] gpio: pca953x: Add support for the TI TCA9539
Date:   Sat,  1 Jun 2019 08:12:18 +0100
Message-Id: <20190601071218.27958-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The TI TCA9539 is a variant of the PCA953x GPIO expander,
with 16 GPIOs and interrupt functionality.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/gpio/gpio-pca953x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index b7ef33f63392..c31ad558d056 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1180,6 +1180,7 @@ static const struct of_device_id pca953x_dt_ids[] = {
 	{ .compatible = "ti,tca6408", .data = OF_953X( 8, PCA_INT), },
 	{ .compatible = "ti,tca6416", .data = OF_953X(16, PCA_INT), },
 	{ .compatible = "ti,tca6424", .data = OF_953X(24, PCA_INT), },
+	{ .compatible = "ti,tca9539", .data = OF_953X(16, PCA_INT), },
 
 	{ .compatible = "onnn,cat9554", .data = OF_953X( 8, PCA_INT), },
 	{ .compatible = "onnn,pca9654", .data = OF_953X( 8, PCA_INT), },
-- 
2.21.0

