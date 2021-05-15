Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3E23816B4
	for <lists+linux-gpio@lfdr.de>; Sat, 15 May 2021 09:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234087AbhEOIAj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 15 May 2021 04:00:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234009AbhEOIAi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 15 May 2021 04:00:38 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 004B9C061760
        for <linux-gpio@vger.kernel.org>; Sat, 15 May 2021 00:59:25 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id lg14so1864376ejb.9
        for <linux-gpio@vger.kernel.org>; Sat, 15 May 2021 00:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ruDxV1+JrGkaktFClfUuq6154xx3fQbfsw7mksEIy9Y=;
        b=JrVcVvCWfvm8b5KZexbt5w3BqB/YLkpXSvMsA3E9+gGxzlIgQ1VVLGdXArS3k1mWxb
         sZ/OPRv1Oliw2pxndFLmhxTnJpGWD80PtZVZSOZ43mPkxyVJf+9RndhvFv5dmlTNUY+V
         YV/Xnu9I94ySl4jX8NI9ZUi3mBdBPsJKq5r0ZqTjCE/wIPQ+JUdXBgeoQpDu8Cgjyz7/
         brEPijUIN9pDhZppJTGtqj/THjZ+PhrbbDmEG1R2gJGx6TkX7LYHPWqQ6sSQczIw2O87
         J3XKibRwPfLy4Reh9a7IJP9tkGHet0Rxsh9VUec6rse5THIlUJqn3+TvTIukZS7OAbDR
         acPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ruDxV1+JrGkaktFClfUuq6154xx3fQbfsw7mksEIy9Y=;
        b=fzj2FKYoF/qqvIF1SaieTITYij6vquK8g/rnli0YOKxOaI1MYbGNDDJM8lqtC49L/Y
         kettXZWhZFkU6Rm7gKIZh7MAMyCU5QR+1aF7xe2CllPGjM2sS/oFOo1qqzEOEhcj2ZyM
         S94eS9lE7IQ1Q3emRD2IngestVRJxPxrnhI2Ne4jOKHVnQUBvxGju1nl8oamHRzJzoKi
         8LBenHwvLkYiyVmBNyxjEmcVRqKW4RQEM/UG/67viYtWqOW38FLfOZITPTib8vExWnbE
         /dj45MwGmlemLCpyuRFAEHx8t+ykJvNckK36xznJwqUSWKBKiRwwSDKzK7mFlac/ghXK
         5nZw==
X-Gm-Message-State: AOAM532/bSqEglnmhcIaFPt+PujH6LOtYSi93z5YIX7M2k35dX5+iEL5
        eRThvZgcrNiB2YAeoEz4m2jqMuAqV4M9alLC/9w=
X-Google-Smtp-Source: ABdhPJz+mAdIayNn9GvTEbcAjrn2FCebQe6IE68YmK3rdXeyYhUFWqskChd7cVtIL1EL5M1agqzMjQ==
X-Received: by 2002:a17:906:a403:: with SMTP id l3mr53422894ejz.251.1621065564449;
        Sat, 15 May 2021 00:59:24 -0700 (PDT)
Received: from neptune.. ([188.27.131.122])
        by smtp.gmail.com with ESMTPSA id ch30sm6185520edb.92.2021.05.15.00.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 00:59:24 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        jonathanh@nvidia.com, thierry.reding@gmail.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH 2/2] gpio: gpio-tegra186: remove platform_set_drvdata() + cleanup probe
Date:   Sat, 15 May 2021 10:59:05 +0300
Message-Id: <20210515075905.12150-2-aardelean@deviqon.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515075905.12150-1-aardelean@deviqon.com>
References: <20210515075905.12150-1-aardelean@deviqon.com>
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
 drivers/gpio/gpio-tegra186.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 10d3597e9ac2..f54ae9d4254a 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -741,13 +741,7 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 		offset += port->pins;
 	}
 
-	platform_set_drvdata(pdev, gpio);
-
-	err = devm_gpiochip_add_data(&pdev->dev, &gpio->gpio, gpio);
-	if (err < 0)
-		return err;
-
-	return 0;
+	return devm_gpiochip_add_data(&pdev->dev, &gpio->gpio, gpio);
 }
 
 #define TEGRA186_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
-- 
2.31.1

