Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A23A3380611
	for <lists+linux-gpio@lfdr.de>; Fri, 14 May 2021 11:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231967AbhENJVr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 May 2021 05:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbhENJVr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 May 2021 05:21:47 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11FF4C06174A
        for <linux-gpio@vger.kernel.org>; Fri, 14 May 2021 02:20:36 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id u21so43697289ejo.13
        for <linux-gpio@vger.kernel.org>; Fri, 14 May 2021 02:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4oVlIzsgyC0dJxtrYRa2nyFwXTSIbf+GvU9OiEg4J30=;
        b=ao7uaInE5L1Ppno1CZmlqyzXD553mSlHvsskpnwNHtkvUBX9EYTeprO4GgNNSH3Uji
         bvrdUs/4JfwAPgKO15aHM/iy7oIfdU0x95VZxMg6nRc6AlvAmtA1oMjbQw6QFa40d2M4
         OrlwXHnl30DdcfN2I6fsJdIAO+WcSCtGGMEnaK3tuE5VlJT2JyalJfVIT/p5/mAa7vVf
         tVJI3BtGQPBRsZ4EF+D5mZIuKg5nh0jcaoCwHOYMZBlzvshZP+wGzS+Zuf/TgsdiG8/V
         wGNDzyiKZV282kEunh34EvdTIf8jox6RiuBX1w4kIMnx2lxmsAsAUSeQ50yt8gStrQac
         SFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4oVlIzsgyC0dJxtrYRa2nyFwXTSIbf+GvU9OiEg4J30=;
        b=WGr/UMYK2yAKku8an46A7DioaPSwfMBAwAZD9qHviqnImO71gQo9/35QjFsuaKIfFK
         NiTy45OiyVb/f4/2enDNryrcjlA/I0DuCEKtur0X8Gau5PdCXgadEJMvuBv2fBd3+CPh
         LR5rZszRmVh5xsmfH82b1TLEubJfWZOesPjij1Qfj5NdZBAYkItg6q4n60nAsLvkm2lZ
         iJc8KBOc2XO3QLvGRaHcT++tRAsJEQTW3tUq9IjXivVj91TIC7HgfoXCXLTPEmKXQrQ7
         3Kv7bBZVUyPGNtFzrwwuqGMN/4jYU1D66d6Dp8VNR3QOe9obs9fhJpsEzFQAKKMeLBHW
         XFcQ==
X-Gm-Message-State: AOAM531WshNizj4/LFEKB++HnUT3auuZvFcBE+YD9fSAmo1f6xaIgnRU
        nup10yPQcCIJb14++db+jHlpvpBczfiOaKtCyHs=
X-Google-Smtp-Source: ABdhPJw8hWROQjHe9CW4nFmSOlr4ARrNi23X2t+KrG13hniOqUamhI7vXtVjD3fbWXb+J5Y/zYdZ4g==
X-Received: by 2002:a17:907:dab:: with SMTP id go43mr5275772ejc.164.1620984034547;
        Fri, 14 May 2021 02:20:34 -0700 (PDT)
Received: from neptune.. ([5.2.193.191])
        by smtp.gmail.com with ESMTPSA id w21sm4006720edq.82.2021.05.14.02.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 02:20:34 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        thor.thayer@linux.intel.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH] gpio: gpio-altera-a10sr: remove platform_set_drvdata() + cleanup probe
Date:   Fri, 14 May 2021 12:20:17 +0300
Message-Id: <20210514092017.17922-1-aardelean@deviqon.com>
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
 drivers/gpio/gpio-altera-a10sr.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-altera-a10sr.c b/drivers/gpio/gpio-altera-a10sr.c
index b5917c48e4dc..6af51feda06f 100644
--- a/drivers/gpio/gpio-altera-a10sr.c
+++ b/drivers/gpio/gpio-altera-a10sr.c
@@ -78,7 +78,6 @@ static const struct gpio_chip altr_a10sr_gc = {
 static int altr_a10sr_gpio_probe(struct platform_device *pdev)
 {
 	struct altr_a10sr_gpio *gpio;
-	int ret;
 	struct altr_a10sr *a10sr = dev_get_drvdata(pdev->dev.parent);
 
 	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
@@ -91,15 +90,7 @@ static int altr_a10sr_gpio_probe(struct platform_device *pdev)
 	gpio->gp.parent = pdev->dev.parent;
 	gpio->gp.of_node = pdev->dev.of_node;
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &gpio->gp, gpio);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
-		return ret;
-	}
-
-	platform_set_drvdata(pdev, gpio);
-
-	return 0;
+	return devm_gpiochip_add_data(&pdev->dev, &gpio->gp, gpio);
 }
 
 static const struct of_device_id altr_a10sr_gpio_of_match[] = {
-- 
2.31.1

