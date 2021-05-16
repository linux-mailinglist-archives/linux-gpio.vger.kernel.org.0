Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CCEC381D1A
	for <lists+linux-gpio@lfdr.de>; Sun, 16 May 2021 08:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233320AbhEPG1z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 May 2021 02:27:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233314AbhEPG1y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 May 2021 02:27:54 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91378C06174A
        for <linux-gpio@vger.kernel.org>; Sat, 15 May 2021 23:26:40 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id l1so4382112ejb.6
        for <linux-gpio@vger.kernel.org>; Sat, 15 May 2021 23:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KNx8btLvd94ySzWldh8uV9ACMbuH6teV38a5e+QKGTY=;
        b=B3Ir2Ul2SGqG/14tEGYXFNoqMiIHhi2krjwCEuNdj1mdj7glyoAUurD8ot6Va6p9gw
         fWE02imLqvJMIY/jKcCU/b9aIPGCTcJVGDmQ3M/U0sgC/y+pSHcaNJNX0r8Gi41nGAp/
         lcdv4rPncJuanCc7EZvgLdAOyJEvmrhGGaX2tO8lr4f1eP2SFkMPXxG1ULv4AjtdgdmR
         ws45D9Uy4W8t+0Rs3tExcq+C2tNfcFs7iRdA6aX9XAdN4WTPSabe4vMCn9h9500feWe5
         EZ82Gvq61u9RNl0NvgRl5V7vuK5qtuvrP8kMoCxvJuYTK11/aVWWxO1sHZ/qsDmvOMoR
         KJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KNx8btLvd94ySzWldh8uV9ACMbuH6teV38a5e+QKGTY=;
        b=t724+YhyAGmXb/65o1lLOQfYpVGRzOC9QkvnpFAECqjjNqtc3YxzNT1aNQkxDyp22p
         hLHhJApaKXwBD7mzM0NJAw6BfxdWSSP91oJ38tWOxQSresGJEQXNKmaDED0hB23vG5sE
         uyKL2VSX5nnFDxlAulbPk9h6fVOdHytFOEd2HT8XiOjjIv/lxnrBvSM7BkXfvHyhXaAR
         nrYCvhdRUXdbPfYuOt/CtdWl8mpmJ0QkBQbwysDAApAggexjUTHYjuIVimE35WDquIf3
         JnL9laBSeEQmQRiGjsZBkE33OPqWAJGJIhkDzs7nv4BnpCFEFuI5eTsBRNr4xUSGVNrW
         B8xA==
X-Gm-Message-State: AOAM533O4m2y2yhQuqAMyOgtL8Y9gYtN2sJibqerRymI9cqRuuSziQ7Y
        2EPjJ9OjUDKZu4zfGTPhcVe7FET1sBRXoAFaLxA=
X-Google-Smtp-Source: ABdhPJxP7l6GWnbV/Cprv2M0q4lxxCKrdO583JHA7Nd/WpunF9yNTeC+u6psg1ZbJMV9LX6KmvgOYQ==
X-Received: by 2002:a17:906:c04b:: with SMTP id bm11mr54940078ejb.263.1621146399103;
        Sat, 15 May 2021 23:26:39 -0700 (PDT)
Received: from neptune.. ([188.27.131.122])
        by smtp.gmail.com with ESMTPSA id p7sm138063edw.43.2021.05.15.23.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 23:26:38 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        orsonzhai@gmail.com, baolin.wang7@gmail.com, zhang.lyra@gmail.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH] gpio: gpio-sprd: remove platform_set_drvdata() + cleanup probe
Date:   Sun, 16 May 2021 09:26:29 +0300
Message-Id: <20210516062629.13550-1-aardelean@deviqon.com>
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
 drivers/gpio/gpio-sprd.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-sprd.c b/drivers/gpio/gpio-sprd.c
index 36ea8a3bd451..25c37edcbc6c 100644
--- a/drivers/gpio/gpio-sprd.c
+++ b/drivers/gpio/gpio-sprd.c
@@ -222,7 +222,6 @@ static int sprd_gpio_probe(struct platform_device *pdev)
 {
 	struct gpio_irq_chip *irq;
 	struct sprd_gpio *sprd_gpio;
-	int ret;
 
 	sprd_gpio = devm_kzalloc(&pdev->dev, sizeof(*sprd_gpio), GFP_KERNEL);
 	if (!sprd_gpio)
@@ -259,14 +258,7 @@ static int sprd_gpio_probe(struct platform_device *pdev)
 	irq->num_parents = 1;
 	irq->parents = &sprd_gpio->irq;
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &sprd_gpio->chip, sprd_gpio);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Could not register gpiochip %d\n", ret);
-		return ret;
-	}
-
-	platform_set_drvdata(pdev, sprd_gpio);
-	return 0;
+	return devm_gpiochip_add_data(&pdev->dev, &sprd_gpio->chip, sprd_gpio);
 }
 
 static const struct of_device_id sprd_gpio_of_match[] = {
-- 
2.31.1

