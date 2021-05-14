Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB5D380648
	for <lists+linux-gpio@lfdr.de>; Fri, 14 May 2021 11:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233807AbhENJd6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 May 2021 05:33:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231503AbhENJd6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 May 2021 05:33:58 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07280C06174A
        for <linux-gpio@vger.kernel.org>; Fri, 14 May 2021 02:32:47 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id k10so12554891ejj.8
        for <linux-gpio@vger.kernel.org>; Fri, 14 May 2021 02:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5dkvYwQ8CxkFUQyQjEPLhL9qrknOLCMJxEkbIJ8p7Y0=;
        b=d8nrf1ZEXN+YlTdYR7CzId6MkTm2bgp/XSLkF1P3iju9JCjVKlOe8XCQn+EzfInSri
         KPoqeZoKROzo9jwPli15zjn2AW+VVCIqxveeuMGNr8vBw2t8LSHB5WZNJb23+vjPnRq+
         2D4AbW3CXw2Top2DUHUhIiD8Tq5O9R2HKH+VSjCKH/HNE1mystBLrMCF5VrS1Aep0qAK
         bOGsmDJvL9LOkFTzjH1MdHMvo6j/7WPZ9jDUvw7ETMKUfv4MpgL2wyaZpqgJQvCpux8v
         gmx+NJMmwhjuEqPmOeS7TqhYBan554QKf/Z+YmQ1XZxpTXDgc88Oc+NuXYQMOPau1ITb
         MXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5dkvYwQ8CxkFUQyQjEPLhL9qrknOLCMJxEkbIJ8p7Y0=;
        b=K/X5se06wKQ3EvK+meTCJbPaZre6UPoFiC4tV4sCUPZ/k9Km+2uyGTrAX4Dm4lwI6F
         tSycfGghvp0X2nMlsbXi2/r9nxr3vC7lM8k3aDGUK1+9iQ9KjsUm5LwOju9QWnLRSpwr
         JMLcpI0xBtPHwTgJEFRFeFyVjMhhJnyUVf3YObXBXqNVMYHBeugkICvuvRtNdtV0Kj8y
         vG/HY2FlaPaEd3NI+JpY4cTI5sLpEHKdAfhG3izmQ8ae/9rjrdfiC7jRfAAF4AUktM8e
         zsJ5WiXPe8opLV0Hk32qUN1sYKqocpW9kC9lFQldPxO8/TqsvafWUDUouwoIpwo+Uicn
         VsRw==
X-Gm-Message-State: AOAM53389Ab3R1njFgNtBCc17k/LsFZZHHFzt31yWy1IH9sN74e704A8
        ef4uc/W2FLSb4JtMgL7tOjRw/BLd/jsL/5AFw7Q=
X-Google-Smtp-Source: ABdhPJxK3ofuQ149WFqgphHtPVKXcZBh/6pjFirMjY0I2Er9Z9n9PHIhQV2aL/R+tNFcFuzITWJZLQ==
X-Received: by 2002:a17:906:e105:: with SMTP id gj5mr49528017ejb.388.1620984765596;
        Fri, 14 May 2021 02:32:45 -0700 (PDT)
Received: from neptune.. ([5.2.193.191])
        by smtp.gmail.com with ESMTPSA id r10sm3250024ejd.112.2021.05.14.02.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 02:32:45 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        andy@kernel.org, Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH] gpio: gpio-crystalcove: remove platform_set_drvdata() + cleanup probe
Date:   Fri, 14 May 2021 12:32:26 +0300
Message-Id: <20210514093226.22703-1-aardelean@deviqon.com>
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
 drivers/gpio/gpio-crystalcove.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
index 2ba225720086..5a909f3c79e8 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -339,8 +339,6 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
 	if (!cg)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, cg);
-
 	mutex_init(&cg->buslock);
 	cg->chip.label = KBUILD_MODNAME;
 	cg->chip.direction_input = crystalcove_gpio_dir_in;
@@ -372,13 +370,7 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
 		return retval;
 	}
 
-	retval = devm_gpiochip_add_data(&pdev->dev, &cg->chip, cg);
-	if (retval) {
-		dev_warn(&pdev->dev, "add gpio chip error: %d\n", retval);
-		return retval;
-	}
-
-	return 0;
+	return devm_gpiochip_add_data(&pdev->dev, &cg->chip, cg);
 }
 
 static struct platform_driver crystalcove_gpio_driver = {
-- 
2.31.1

