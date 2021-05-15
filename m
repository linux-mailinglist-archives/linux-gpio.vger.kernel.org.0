Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A11338181F
	for <lists+linux-gpio@lfdr.de>; Sat, 15 May 2021 13:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbhEOLGG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 15 May 2021 07:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235129AbhEOLFh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 15 May 2021 07:05:37 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5906DC06134D
        for <linux-gpio@vger.kernel.org>; Sat, 15 May 2021 03:58:37 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id i13so1356985edb.9
        for <linux-gpio@vger.kernel.org>; Sat, 15 May 2021 03:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2UIcZhVTZNdr19HjFjUOTgszjkrybyrCDOni+/NopqI=;
        b=o4m+VlMtdqgj8eq6Tva5ZoGJU89nY9hAXeB4PWOwzbSGzzlxPFMfoA6ub7N6gOc80x
         Ot4SkkGbxmPrKQ8j5um5EiQFFaWfyUfFk3xh3i47YWFC+tKYHFThoAo8P5Gr4yJrNRGu
         uraVIy/4kTCmc+p82Wxq7lYkahZZ69AEMsDhvscP8+g1P0+VGrHElXsrZr8wsJwNZLv/
         mWEHPyQf0m2CaionSQvShp9Y+pk7Y03OJUgHPQhxcma4jy+YZp0rlootYnuG456xi/Tw
         sCeVj8DyNTsOloqQT5AbJUagFSoVwe7R85d+VGSHLWkVJ4ROqhsZMJeQZ4DgtE1DIn2M
         WCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2UIcZhVTZNdr19HjFjUOTgszjkrybyrCDOni+/NopqI=;
        b=e9savlaTy8B9SgvyCqSeoUs71+jsphmX6wyVBfR732a63D5CVkfB0l/VI/TsF4XeUh
         ARWKNbHClvcmlp75Veo2I8Np1/fyRF4gyydXWzRcCZGJ6/8SvGafPi0D4AfPa3RPm1Uj
         Zi8BIkiBLuVA0mGk8PDwFlF4gxc/sqoL5at/RAcLa0ANkcDX8x5I6+psc7FH2DmNefov
         L2s74G/lVFQaoa8VxtM+g/sdh3HVpJzTff4vOILW4bhFJhsIgVMHYKvZfoza27Rv90FR
         hc2kC4AY7NwkTitx39bzYsQ2VNp9hWx0Tmp7PTrE3Q3IpzcQZOXhKVOh+UytU6H5LgNi
         MGWQ==
X-Gm-Message-State: AOAM5337q5Va/w2NCXrIAx7mgJh1lm+TySBcYIDAgVJyDG9KSukP371t
        6pgLfks2EiGlmPCKtWz34TtFUJ8Z12x2F6a9CsM=
X-Google-Smtp-Source: ABdhPJz5MXyR0avcV9T7mZWH0Uj0PD9k/Kxh4jnw0fdDXpasVY0k9S9bp/AzD4+vi0vR+dX5ChlcrQ==
X-Received: by 2002:a05:6402:5106:: with SMTP id m6mr61248341edd.212.1621076315727;
        Sat, 15 May 2021 03:58:35 -0700 (PDT)
Received: from neptune.. ([188.27.131.122])
        by smtp.gmail.com with ESMTPSA id gz2sm5085276ejb.76.2021.05.15.03.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 03:58:35 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH] gpio: gpio-tc3589x: emove platform_set_drvdata() + cleanup probe
Date:   Sat, 15 May 2021 13:58:31 +0300
Message-Id: <20210515105831.9439-1-aardelean@deviqon.com>
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
 drivers/gpio/gpio-tc3589x.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index 55b8dbd13d11..8d158492488f 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -357,16 +357,7 @@ static int tc3589x_gpio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &tc3589x_gpio->chip,
-				     tc3589x_gpio);
-	if (ret) {
-		dev_err(&pdev->dev, "unable to add gpiochip: %d\n", ret);
-		return ret;
-	}
-
-	platform_set_drvdata(pdev, tc3589x_gpio);
-
-	return 0;
+	return devm_gpiochip_add_data(&pdev->dev, &tc3589x_gpio->chip, tc3589x_gpio);
 }
 
 static struct platform_driver tc3589x_gpio_driver = {
-- 
2.31.1

