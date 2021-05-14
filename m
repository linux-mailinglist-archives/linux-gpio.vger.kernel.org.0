Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51809380667
	for <lists+linux-gpio@lfdr.de>; Fri, 14 May 2021 11:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233927AbhENJme (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 May 2021 05:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbhENJmd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 May 2021 05:42:33 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96DEFC06174A
        for <linux-gpio@vger.kernel.org>; Fri, 14 May 2021 02:41:22 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id b17so34037217ede.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 May 2021 02:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vegfStSBvOKattHTaAj1hKOTQJXg06rzpIZp2U2ScrY=;
        b=qLZ3UAUk/dsKcABCxxgNfrXO01w/ruzJEPHbnVxJvHnaz2X1/srjThNWwRk/tVLvDb
         9bNryC+5ZPq39s25c9Bh5YSLTP9YpCuzicAg9YvZ5F7NqWYHS2BoATgw+S/ki6cFYqXP
         Y3V4aeq2pv9Kk86bEfilDnC5qn1FdB/a6Xn0S51QXHXQGQn3mPo6KFz33gM0qnb+ElbU
         IwKvwPk9t2gnHlq86KyVzpicOV0512IYY70nqDKXdNUZH84DR/ha17T3qWlFX66lahH4
         CT6vyLjfnq66m6Z6owDrhP7MGD+BWP2qYgef2mJMlSA361IWx7idmgdCORmpgDooDB3n
         NnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vegfStSBvOKattHTaAj1hKOTQJXg06rzpIZp2U2ScrY=;
        b=NDxwRNVzViccqjkn7zJEPmjpPRdpxsDHC9JS3Wu+ZK1MDUVWCnZgnyHfD2QDXzUjET
         f0/R22cYQzG/juTXB66pm8lPyXx14z4fTAkTc0XVpPNGGN/Adsz/PF+xfhCmcHyRQ0Vb
         QP627HM6UcwIWBSdJ7Ih5MDeUlt/J0/vLI5OBeWpqw2dOjY7BE8ABLPf/m3riZZeZypx
         j7HAkYfALBHKkwplGkrxO+fIlx9oaoQvomgjCuOVWvWUH0Y+3KOoKBT1mvy8bsgsBnzd
         O8G1nyv37RZsrH8BWtyKqZYexXDSYHVSMPwIoLuc0GtfyyAsy6Ch5hx8ZltCStTeDAYW
         KJIw==
X-Gm-Message-State: AOAM531CkLIKvpfhpHwnJpFruxXkusCW3ZHKfP5ZxvB4dUHj2JS6wTao
        wDZXfn+zy8EcamGeGfwZVgJ9zutF8CJvxJb2L98=
X-Google-Smtp-Source: ABdhPJzQQEnxmCitg0MwOq1MBV/D4pi0SCCm+QpjVvgy4uppOLZXzQyO0VeBnApGejv2fXwiphASNw==
X-Received: by 2002:a05:6402:8da:: with SMTP id d26mr55425093edz.161.1620985281146;
        Fri, 14 May 2021 02:41:21 -0700 (PDT)
Received: from neptune.. ([5.2.193.191])
        by smtp.gmail.com with ESMTPSA id x13sm2751263ejs.93.2021.05.14.02.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 02:41:20 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH] gpio: gpio-tps68470: remove platform_set_drvdata() + cleanup probe
Date:   Fri, 14 May 2021 12:41:08 +0300
Message-Id: <20210514094108.28890-1-aardelean@deviqon.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The platform_set_drvdata() call is only useful if we need to retrieve back
the private information.
Since the driver doesn't do that, it's not useful to have it.

If this is removed, we can also just do a direct return on
devm_gpiochip_add_data(). We don't need to print that this call failed as
there are other ways to log/see this during probe.

Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
---
 drivers/gpio/gpio-tps68470.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-tps68470.c b/drivers/gpio/gpio-tps68470.c
index f7f5f770e0fb..423b7bc30ae8 100644
--- a/drivers/gpio/gpio-tps68470.c
+++ b/drivers/gpio/gpio-tps68470.c
@@ -125,7 +125,6 @@ static const char *tps68470_names[TPS68470_N_GPIO] = {
 static int tps68470_gpio_probe(struct platform_device *pdev)
 {
 	struct tps68470_gpio_data *tps68470_gpio;
-	int ret;
 
 	tps68470_gpio = devm_kzalloc(&pdev->dev, sizeof(*tps68470_gpio),
 				     GFP_KERNEL);
@@ -146,16 +145,7 @@ static int tps68470_gpio_probe(struct platform_device *pdev)
 	tps68470_gpio->gc.base = -1;
 	tps68470_gpio->gc.parent = &pdev->dev;
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &tps68470_gpio->gc,
-				     tps68470_gpio);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to register gpio_chip: %d\n", ret);
-		return ret;
-	}
-
-	platform_set_drvdata(pdev, tps68470_gpio);
-
-	return ret;
+	return devm_gpiochip_add_data(&pdev->dev, &tps68470_gpio->gc, tps68470_gpio);
 }
 
 static struct platform_driver tps68470_gpio_driver = {
-- 
2.31.1

