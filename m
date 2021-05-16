Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4408381D14
	for <lists+linux-gpio@lfdr.de>; Sun, 16 May 2021 08:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233243AbhEPGPs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 May 2021 02:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233214AbhEPGPr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 May 2021 02:15:47 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79C24C06174A
        for <linux-gpio@vger.kernel.org>; Sat, 15 May 2021 23:14:33 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id df21so3074808edb.3
        for <linux-gpio@vger.kernel.org>; Sat, 15 May 2021 23:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hV6WC5eXV3av99h5LQGXtV8+/Xaf5pHoRp9Aw3md/WM=;
        b=JHWFZpaYDyH2S+nfvWPrjJ7qqGLtUODW2nWSddvpDV0IER1StHfyf8OcwKfETSUiHh
         CT7Rd082zmRHz9vzOVExuL2VsKE8YCXYK2CqdiPhWAqwQNZsz8hMGxLpknuwKcIsx1bm
         SKgloSZxbfQRU40fB155fgFDfCJboC+EcSxUSe+0I0nxz0VDeuvLi5HTAjJCHCSeyT/z
         Vt7dRgMuNIzAWOMX2lyz3TVefBorXinezt8JOv1zNvRaRVOrXrj+/qU2Z3DDEO5GaKaN
         w4FemDuaSwOQpe8F195SyCX0KrHNGeYu7b0ol8o5+xiP7uLIGYnosBDS1g8OGIJ/n311
         o0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hV6WC5eXV3av99h5LQGXtV8+/Xaf5pHoRp9Aw3md/WM=;
        b=b4c+KNiEfe/vdK7a8Yp3o8Bpv3rHJbDliwLyaSp4GvVV2LWT5Gfob3n0cZ/UQ2IDp8
         8dhORgjp5AzhegkRr1mS9OaUVsrepvLw+GdS8bQ4fK1QlS6RV2KKPwuT8EIsRPeazSRL
         Xtoqa00kaB/6yP1OPxRfPTltDEJ2L4sZr2AltABfXS0ptOmi9UUx/Huu8ROB8Rh2hMpQ
         w0vCa+T9GAPGtTvoGMtVMAvildqyJn1Kd0zGljjZhaJ7EsVd//ToKEoaTVjw+uzJrOwh
         UPJ+w78evObuFSboaLb7fhlBrmW8DmL23o1ZUP2U80gOSlKpRy+LAID4DzF+Dr789Kz3
         ImAA==
X-Gm-Message-State: AOAM533x8LLv19q3Dg0JPQ+5roKVXEktyTeyiYK5Rxefjvm25dX4bor6
        7SGSkrPWXw4Yp48gTmmm7EUS4O7JpslBYnmUJmU=
X-Google-Smtp-Source: ABdhPJzXtg5orx3xmCK7tlYXqg8n78bQcYooN2LC0mIxod3nyft0KpCO6v6MLFU7Tp3VSuqt3KsVuQ==
X-Received: by 2002:aa7:cc10:: with SMTP id q16mr44692153edt.53.1621145671931;
        Sat, 15 May 2021 23:14:31 -0700 (PDT)
Received: from neptune.. ([188.27.131.122])
        by smtp.gmail.com with ESMTPSA id o8sm6396615ejm.18.2021.05.15.23.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 23:14:31 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH] gpio: gpio-stmpe: fully use convert probe to device-managed
Date:   Sun, 16 May 2021 09:14:25 +0300
Message-Id: <20210516061425.8757-1-aardelean@deviqon.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The driver doesn't look like it can be built as a kmod, so leaks cannot
happen via a rmmod mechanism.
The remove hook was removed via commit 3b52bb960ec6 ("gpio: stmpe: make
it explicitly non-modular").

The IRQ is registered via devm_request_threaded_irq(), making the driver
only partially device-managed.

In any case all resources should be made device-managed, mostly as a good
practice. That way at least the unwinding on error is happening in reverse
order (as the probe).

This change also removes platform_set_drvdata() since the information is
never retrieved to be used in the driver.

Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
---

I'm not sure if this should be marked with a Fixes tag.
But if so, it should probably be for commit 3b52bb960ec6 (also mentioned in
the comment above).

 drivers/gpio/gpio-stmpe.c | 32 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index b94ef8181428..dd4d58b4ae49 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -449,6 +449,11 @@ static void stmpe_init_irq_valid_mask(struct gpio_chip *gc,
 	}
 }
 
+static void stmpe_gpio_disable(void *stmpe)
+{
+	stmpe_disable(stmpe, STMPE_BLOCK_GPIO);
+}
+
 static int stmpe_gpio_probe(struct platform_device *pdev)
 {
 	struct stmpe *stmpe = dev_get_drvdata(pdev->dev.parent);
@@ -461,7 +466,7 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	stmpe_gpio = kzalloc(sizeof(*stmpe_gpio), GFP_KERNEL);
+	stmpe_gpio = devm_kzalloc(&pdev->dev, sizeof(*stmpe_gpio), GFP_KERNEL);
 	if (!stmpe_gpio)
 		return -ENOMEM;
 
@@ -489,7 +494,11 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 
 	ret = stmpe_enable(stmpe, STMPE_BLOCK_GPIO);
 	if (ret)
-		goto out_free;
+		return ret;
+
+	ret = devm_add_action_or_reset(&pdev->dev, stmpe_gpio_disable, stmpe);
+	if (ret)
+		return ret;
 
 	if (irq > 0) {
 		struct gpio_irq_chip *girq;
@@ -499,7 +508,7 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 				"stmpe-gpio", stmpe_gpio);
 		if (ret) {
 			dev_err(&pdev->dev, "unable to get irq: %d\n", ret);
-			goto out_disable;
+			return ret;
 		}
 
 		girq = &stmpe_gpio->chip.irq;
@@ -514,22 +523,7 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 		girq->init_valid_mask = stmpe_init_irq_valid_mask;
 	}
 
-	ret = gpiochip_add_data(&stmpe_gpio->chip, stmpe_gpio);
-	if (ret) {
-		dev_err(&pdev->dev, "unable to add gpiochip: %d\n", ret);
-		goto out_disable;
-	}
-
-	platform_set_drvdata(pdev, stmpe_gpio);
-
-	return 0;
-
-out_disable:
-	stmpe_disable(stmpe, STMPE_BLOCK_GPIO);
-	gpiochip_remove(&stmpe_gpio->chip);
-out_free:
-	kfree(stmpe_gpio);
-	return ret;
+	return devm_gpiochip_add_data(&pdev->dev, &stmpe_gpio->chip, stmpe_gpio);
 }
 
 static struct platform_driver stmpe_gpio_driver = {
-- 
2.31.1

