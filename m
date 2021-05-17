Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED4F382B2D
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 13:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236827AbhEQLhY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 07:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236828AbhEQLhX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 07:37:23 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 842A3C06175F
        for <linux-gpio@vger.kernel.org>; Mon, 17 May 2021 04:36:06 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id l1so8693593ejb.6
        for <linux-gpio@vger.kernel.org>; Mon, 17 May 2021 04:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QcGpt5wEDtLrk+3qFVLpoBXykB2bKeqmmLwp+4JjPkI=;
        b=hts47UB0XM6AOcqV/LviB/gWfvERufgRTDuGVN9j62F/YZLXmRh+2H0qBsWeYsuwmA
         m4ow7P70AuciBQzi8X95xn7fV6SRs2/M6iwc12H/5SLNlqoazp9dV84i0WTYn7p5xV2A
         6Mds/B9+1hB4jHrhGhgyFYDC3hmGRPv0soTyQJiqNffB8+OfWoXAv/Z8JDbaW3qkGshE
         +wHf6oSbYcNVUa+86ITzVWQ4Ih7+g1Y3KBgyQlvbbvenyQrnYThMibgckWZdP34PML85
         bF89QfGYaAqFE7Msyeras4UVmV4DBTHGnU0OZrB6yhG/7+4/rMqhABqZxye8f/J2qxpx
         u/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QcGpt5wEDtLrk+3qFVLpoBXykB2bKeqmmLwp+4JjPkI=;
        b=R0jF7d8ITITcpsnWTo3XAfGIklkPmJSC8lGbOFY7Y8jsq+k4kWacd63TYiA1NPp+i/
         JWJ6AHub86yiOCGs2hordFLhBmcrxh6FOlhbXyoB93inI8Alzmd8HA6Q85S3ch67FHOg
         4AkpTQ4ncbyS03yDGlVNx6nJNNGPmiAC8RQH9bEt81qn6Ie4EBoJieOyq1D9M9Azfvzl
         ohYYHLzOHjSeQxuwVFS2qw9qTC8rQhO1Dys4mnCyxQSYoXmgQrzwQmRabkn6A3TnmaLJ
         dtF8djZHifrTJB7bDr9L0wZpOMXzha6oK9Dz1FecmcIYbyKC7GuA7kGxZ9t7z9Vq/SAC
         3raw==
X-Gm-Message-State: AOAM530MFOYeehd7ZMvr7M5hG0Am6hySYiJhRp3G2Ymme2HI9KSvJ0Vz
        1tFlfhwSAf2elBmpjk5D97dqRTWsNztnbRUCOE8=
X-Google-Smtp-Source: ABdhPJwPKYk3uJ3oyv7F8e1AJaekAuEiddr//uyl/5NGsUR0Th3h8MG9EQ4bb3BCMwyndvQvv2tdIA==
X-Received: by 2002:a17:907:98a9:: with SMTP id ju9mr11736205ejc.257.1621251365062;
        Mon, 17 May 2021 04:36:05 -0700 (PDT)
Received: from neptune.. ([5.2.193.191])
        by smtp.gmail.com with ESMTPSA id v24sm2903703eds.19.2021.05.17.04.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 04:36:04 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH] gpio: gpio-wm8350: remove platform_set_drvdata() + cleanup probe
Date:   Mon, 17 May 2021 14:35:39 +0300
Message-Id: <20210517113540.237495-2-aardelean@deviqon.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517113540.237495-1-aardelean@deviqon.com>
References: <20210517113540.237495-1-aardelean@deviqon.com>
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
 drivers/gpio/gpio-wm8350.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-wm8350.c b/drivers/gpio/gpio-wm8350.c
index 460f0a4b04bd..b1b131fb9804 100644
--- a/drivers/gpio/gpio-wm8350.c
+++ b/drivers/gpio/gpio-wm8350.c
@@ -105,7 +105,6 @@ static int wm8350_gpio_probe(struct platform_device *pdev)
 	struct wm8350 *wm8350 = dev_get_drvdata(pdev->dev.parent);
 	struct wm8350_platform_data *pdata = dev_get_platdata(wm8350->dev);
 	struct wm8350_gpio_data *wm8350_gpio;
-	int ret;
 
 	wm8350_gpio = devm_kzalloc(&pdev->dev, sizeof(*wm8350_gpio),
 				   GFP_KERNEL);
@@ -121,16 +120,7 @@ static int wm8350_gpio_probe(struct platform_device *pdev)
 	else
 		wm8350_gpio->gpio_chip.base = -1;
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &wm8350_gpio->gpio_chip,
-				     wm8350_gpio);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
-		return ret;
-	}
-
-	platform_set_drvdata(pdev, wm8350_gpio);
-
-	return ret;
+	return devm_gpiochip_add_data(&pdev->dev, &wm8350_gpio->gpio_chip, wm8350_gpio);
 }
 
 static struct platform_driver wm8350_gpio_driver = {
-- 
2.31.1

