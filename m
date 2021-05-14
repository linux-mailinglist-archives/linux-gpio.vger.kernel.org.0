Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB5438062F
	for <lists+linux-gpio@lfdr.de>; Fri, 14 May 2021 11:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232231AbhENJ1i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 May 2021 05:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232300AbhENJ1h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 May 2021 05:27:37 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C57FC061574
        for <linux-gpio@vger.kernel.org>; Fri, 14 May 2021 02:26:20 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id b25so43698493eju.5
        for <linux-gpio@vger.kernel.org>; Fri, 14 May 2021 02:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8kvfKU0MH9B5rERCE52BMVMjjCGgmv3OuoYege9feY8=;
        b=f4S3QDx6d52PFt8v5/hynLGSs+8KQWjrroeQslpzBhhRwqh8+0nxRRQ0/X6yoNXow2
         8k6HVERMpeNb8oeOF4M/IlMJWtQZloK9AKVj8fMeBErFmbM1O2xwOXS0tdpRRxKvlJTG
         Rtu4QIOpq882n+IAShHZbFzSeJryhHpXAjSUML6XbQhX2V5REcXg1B7/Qc6Xg5QDcmqx
         plJxJHvi1nn+LOpLvxOayNQtKdvgYHyEDWpTtOzZgpH1QRzoLEKdr5iZkBo2Vh0OEzH6
         BVrQHwDtHQXQVYwdnlIk6q6+h8jYcJuiU6ZuY3UoJ/fmNAZVcR67uTb4W/GiKxODS72L
         b0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8kvfKU0MH9B5rERCE52BMVMjjCGgmv3OuoYege9feY8=;
        b=Ju4SCMciutZigXptNzZxLukteHDa/ph+0Ksx7Rb/YhgkV+j0KCDqE/2X8+IZSXg2Mk
         IzQjaVpS8UKPO3gM/+13TngtjX/QUiuSvIFmh/35DgDgJM90xFl6eLDcW8gif/w/mn80
         GsrreTpL7yjL3Rss4QRKjZ35k/HTACbenIt3KR7R2MDZK7heXIh8mjJzlqePCemRj+cf
         7x05fezJDHMvMvIyhMfLcs/Z3K1i+gO39DF/54k94ZOQ4sjb7OnrIjMFWgD/yddq6NmJ
         9lQolLaRZTKWqlO9qE1lBN6fLwCE1raXHd+x2BOTzkcb2OLUiitd1l5PTtA5npoHx+Oy
         7pIg==
X-Gm-Message-State: AOAM530BGaIpzTvLa5tOc3q3KlcBzJ6DJAXWO/WFwtgc14c3xMyCyh9d
        WTtW4siOqGhvUfsBouwf9VEfL/ymmysP4YgOIGE=
X-Google-Smtp-Source: ABdhPJy+qDlaCmjh44cFYx8u66c8j/gTN/cZRPhLNnK2S99ZuQog/tlYMHkoiWncbhL4TdNoZsQwGA==
X-Received: by 2002:a17:906:2dcd:: with SMTP id h13mr2240629eji.41.1620984379050;
        Fri, 14 May 2021 02:26:19 -0700 (PDT)
Received: from neptune.. ([5.2.193.191])
        by smtp.gmail.com with ESMTPSA id u8sm3974685edo.71.2021.05.14.02.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 02:26:18 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        marek.vasut+renesas@gmail.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH] gpio: gpio-bd9571mwv: remove platform_set_drvdata() + cleanup probe
Date:   Fri, 14 May 2021 12:26:14 +0300
Message-Id: <20210514092614.21047-1-aardelean@deviqon.com>
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
 drivers/gpio/gpio-bd9571mwv.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-bd9571mwv.c b/drivers/gpio/gpio-bd9571mwv.c
index df6102b57734..9a4d55f703bb 100644
--- a/drivers/gpio/gpio-bd9571mwv.c
+++ b/drivers/gpio/gpio-bd9571mwv.c
@@ -97,25 +97,16 @@ static const struct gpio_chip template_chip = {
 static int bd9571mwv_gpio_probe(struct platform_device *pdev)
 {
 	struct bd9571mwv_gpio *gpio;
-	int ret;
 
 	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
 	if (!gpio)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, gpio);
-
 	gpio->regmap = dev_get_regmap(pdev->dev.parent, NULL);
 	gpio->chip = template_chip;
 	gpio->chip.parent = pdev->dev.parent;
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
-		return ret;
-	}
-
-	return 0;
+	return devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
 }
 
 static const struct platform_device_id bd9571mwv_gpio_id_table[] = {
-- 
2.31.1

