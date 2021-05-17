Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5F03382B43
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 13:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236892AbhEQLiq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 07:38:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236782AbhEQLio (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 07:38:44 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47AB4C06174A
        for <linux-gpio@vger.kernel.org>; Mon, 17 May 2021 04:37:28 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id k10so8684165ejj.8
        for <linux-gpio@vger.kernel.org>; Mon, 17 May 2021 04:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I1/X7zWw77Cn/B8mk8pmFHz8eIrf1bNYDSVYUancEAA=;
        b=SZoE4G+b0SYwuFHNm0p71rlvZdr+1NQVZ0kDtn2ZAVWlxijQPJZUsDfCI6wqKksYW5
         jwHk6Q9iSBZpJ4uSVlK3hkszpwKDuoqtwBkpAZQXjHuqJvICJO6IhM4pePqDuY999/Ax
         Ade4QfUSz2WRbqAJFbiM1nQT6COOyCg1YAZvQhkGyOHEj5du79nLN0uZq6c6MMg0MiRn
         1Zw2NSVfIvXDHYRiNSqfR8gG2i06KNVMsMmvpbQppJEc3LD3PsG2T58IbO36BwvYbfqz
         zZ1XMJ/kFdPiBgeiJxPHyj5cA5UUu6c5vVWlpUb6WarSGlY3wGU/BdT+zHkNbTJivjt4
         opRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I1/X7zWw77Cn/B8mk8pmFHz8eIrf1bNYDSVYUancEAA=;
        b=qilox/9JT1LQWKPSwlflwdGRHT6p2X/FJcXRUQVbRJYCJ2weLdqrOvsI+qFL9oEMLu
         AGxKZPZKiYeGg3bLc6gOHNHsSSFVzZXg0Tx60PxIjmLluDkHnSbfRDsDHw3ATEot6IYY
         I7+xHZToCXRaF4hjYr05K873EJ2H3T8of2aTyQW/lgk1ea/sfReNgn8BbhqEIZ1koHzC
         q6YQHsRFkuxSIAdcaWbQkLdmx876CXHBUgBaxJdzvvd+hpzArzdz8nSlrkTCYHzoTBy4
         ncNmwr12LxNWcpBafLKCtXLj3kPs+gIBxicTF2dqUgl72It3QUeVVkI1FWHjf673r4Mo
         JHkg==
X-Gm-Message-State: AOAM533enqavvfCMIpkgt5KrAO1JwsiHycfgHhmJcF5ls+hkc/RIt+Gn
        LvS36eQ+fS6OziFzQmKO1ddWumfk4e/GW0LUhCc=
X-Google-Smtp-Source: ABdhPJylNfXxsATSBE+CGwXJQZFeZM8/Ee0be9GTlYhOpFvXXtwMliz8S/BkuzgVY9LP5b+flVaoWg==
X-Received: by 2002:a17:906:fcb4:: with SMTP id qw20mr11550196ejb.216.1621251446365;
        Mon, 17 May 2021 04:37:26 -0700 (PDT)
Received: from neptune.. ([5.2.193.191])
        by smtp.gmail.com with ESMTPSA id r17sm10698641edt.33.2021.05.17.04.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 04:37:26 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com, albeu@free.fr,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH] gpio: gpio-ath79: remove platform_set_drvdata() + cleanup probe
Date:   Mon, 17 May 2021 14:37:07 +0300
Message-Id: <20210517113707.238011-1-aardelean@deviqon.com>
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
 drivers/gpio/gpio-ath79.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index 678ddd375891..9b780dc5d390 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -234,7 +234,6 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
 	if (!ctrl)
 		return -ENOMEM;
-	platform_set_drvdata(pdev, ctrl);
 
 	if (np) {
 		err = of_property_read_u32(np, "ngpios", &ath79_gpio_count);
@@ -290,13 +289,7 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 		girq->handler = handle_simple_irq;
 	}
 
-	err = devm_gpiochip_add_data(dev, &ctrl->gc, ctrl);
-	if (err) {
-		dev_err(dev,
-			"cannot add AR71xx GPIO chip, error=%d", err);
-		return err;
-	}
-	return 0;
+	return devm_gpiochip_add_data(dev, &ctrl->gc, ctrl);
 }
 
 static struct platform_driver ath79_gpio_driver = {
-- 
2.31.1

