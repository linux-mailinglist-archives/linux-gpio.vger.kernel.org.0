Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61C3538CD0F
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 20:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234299AbhEUSSq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 14:18:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231414AbhEUSSq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 14:18:46 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD292C0613CE
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 11:17:22 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id w12so16561697edx.1
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 11:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XMwmJaZ5GB+lc9fDld1NHW1/GpWNomISU7CUFQvXptE=;
        b=ud67qYNHNNv6PvX4CkVUTYjRaZZ1DebaBV69n/s50r2RJRzy8pFK8e5gqafc/l5O6E
         XcDPz1ZAEMM451j3sLjHEd6ZDOTSy1JSSnAOhH9pkUcBjdzjZ10mRLDA9SHLMcRAKYLe
         vMuUJCmgP48jPy9n9Fa3l6zAeXOPTh9BCtmSl1OjDfkZjdlI21iyV3jVK7+7kiQ+vfbq
         CNrbsOh+rOgUKlffBojLWvDv3foG4dNI1gSUS//KzSB1endfmw6rg0LdaIhBZW+7bp9R
         Nx13ojLVFsm3A2GCXlpTz56grFWtHuTBhHxdDKA08WcvR+8a827TQmqS7zBmF57XhXyq
         Ci8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XMwmJaZ5GB+lc9fDld1NHW1/GpWNomISU7CUFQvXptE=;
        b=l37dM4Q01QyyEgcwsKavr8rDwb2YwkClw0ifyiGL4EAbsRYvWIPgELmBRtIK4D6VIN
         to3YlQ2yEX9fJFQ712+CD0hbj6Oo9SRs8kjoUS55H6an3gvNxa7+e0wfhgZaVQWHvq25
         HvxQOFJ4qKVh2UNIQl5+vxtWzz+eazKtf+rxtfDW7xRAOTnock+W7oAKiT1K+h+D7Ydq
         /lCy8B05ejw5Xb42DUkOuyAYLKjewoITYqgR0OMQNdegRDl+GjaiNybqeCcggvuoxmHS
         hW0q/njhVXR88jwDhXtQm1zmFYLq1SITGEowdbTNMcxOhKWGsq4mZFQc++id7tRPyB3e
         PsYw==
X-Gm-Message-State: AOAM530RjcCyZeZiUBkg91pzvdn/iro0gTObdHVc6nkQK8WJ959bSVnq
        qPqThs0CXP1IFuqsu0mCQWXgjQtMC2guXRgyvCU=
X-Google-Smtp-Source: ABdhPJy/tnF3pLUYaUV6v59n/IifAXvOM0FdLnANaTYmbxBvSUkPNx+kbpX4k12ivW7Bcz86ie9Uaw==
X-Received: by 2002:aa7:c845:: with SMTP id g5mr12775506edt.219.1621621040973;
        Fri, 21 May 2021 11:17:20 -0700 (PDT)
Received: from neptune.. ([188.27.131.122])
        by smtp.gmail.com with ESMTPSA id h9sm4503438edr.10.2021.05.21.11.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 11:17:20 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH] gpio: gpio-tps65910: remove platform_set_drvdata() + cleanup probe
Date:   Fri, 21 May 2021 21:17:08 +0300
Message-Id: <20210521181708.11524-1-aardelean@deviqon.com>
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
 drivers/gpio/gpio-tps65910.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-tps65910.c b/drivers/gpio/gpio-tps65910.c
index 0c0b445c75c0..7fa8c841081f 100644
--- a/drivers/gpio/gpio-tps65910.c
+++ b/drivers/gpio/gpio-tps65910.c
@@ -165,16 +165,8 @@ static int tps65910_gpio_probe(struct platform_device *pdev)
 	}
 
 skip_init:
-	ret = devm_gpiochip_add_data(&pdev->dev, &tps65910_gpio->gpio_chip,
-				     tps65910_gpio);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
-		return ret;
-	}
-
-	platform_set_drvdata(pdev, tps65910_gpio);
-
-	return ret;
+	return devm_gpiochip_add_data(&pdev->dev, &tps65910_gpio->gpio_chip,
+				      tps65910_gpio);
 }
 
 static struct platform_driver tps65910_gpio_driver = {
-- 
2.31.1

