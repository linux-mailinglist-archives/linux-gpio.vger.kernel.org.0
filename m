Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA50C2CA8B
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2019 17:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbfE1PqJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 May 2019 11:46:09 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33035 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726243AbfE1PqJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 May 2019 11:46:09 -0400
Received: by mail-wm1-f68.google.com with SMTP id v19so2621373wmh.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 May 2019 08:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YvPe/WoFmp/q5zbztljWLv6WbDnxG3m2k+4xkeHE8vI=;
        b=cxhmLGX2ZdSJOmAHko4dD/W+AOa/TKFCzFiarXOwqxy5syhJ4YgfD3a1o79H6qv26l
         rnME+acVm4Z+eUl7yMDjBb6npXB8+dO9RS8N+oBxaBl3k9vyGw2sNtLTYVDZTV4aL34z
         PlVVH1TueZF9Y1dx6oNvoFuUSdGZAjdSPSub4ASceDITXUtIBXeXjU7wY3/2V4/x+o3c
         9RW0R2NY1loFV+YgunLuYgki7dr/vSS5D+qOd5IHBFbIyR3QN+D3hH4Npy8pPd6MzWHv
         bVWrJjReWtU8QjzYDAfSG7A4R+kAG7u0nqCtTpN6nLaLHI9Q/QEqdHGisM35CBGYfLeT
         2slw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YvPe/WoFmp/q5zbztljWLv6WbDnxG3m2k+4xkeHE8vI=;
        b=W1xHFVCeQbCgfTYI8q20PqA7qSjWPzBV7JY2IO4PS8y3AeN/IdBtehgnFxp3DKJQzw
         aLtDP1zDb7jWiLIueDXgGWdHfGEf+hqIYaatueyb/qAoFKpnZr1DHX3vE6U+tCpsGFli
         YlHBCEK9z7ucoce+POQkqRg1dzXHuDvCDmMEV4je3pfGcoijSzTirXTJGAQZSkc2o7By
         EE8+DT3WetP9Ve34IKblwR42bXS3xfjLtaCbVsspCjcuY5vrTjAMxIeS37WnNbu99KGm
         /rw3s+YwvRWMEbrgQu9dHZxxSqC6Rd4HeqRiHZorfibsZNFgwSrlx8utS4mKz7Z2s1cz
         q2Hw==
X-Gm-Message-State: APjAAAXQ1HvVHJShZSRASnFmF6zJkvv8PYQeXngCOA2nAJSTxTkTOSO/
        OY+7yFoXMSzIBsYKuzswsMUIyw==
X-Google-Smtp-Source: APXvYqyljSDWAYqixD/7c/Su+cisPLhxrUQTPrOE4i8VpAYUfJ8s79CeAJLRR1A67vb5mBHifmQxDg==
X-Received: by 2002:a1c:e914:: with SMTP id q20mr3839340wmc.55.1559058367135;
        Tue, 28 May 2019 08:46:07 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id l18sm38546703wrh.54.2019.05.28.08.46.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 08:46:06 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, inux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: em: use the managed version of gpiochip_add_data()
Date:   Tue, 28 May 2019 17:46:01 +0200
Message-Id: <20190528154601.7597-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the managed variant of gpiochip_add_data() and remove the call to
gpiochip_remove().

Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-em.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index 40f8c38bec1c..299101d25fa8 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -359,7 +359,7 @@ static int em_gio_probe(struct platform_device *pdev)
 		goto err1;
 	}
 
-	ret = gpiochip_add_data(gpio_chip, p);
+	ret = devm_gpiochip_add_data(&pdev->dev, gpio_chip, p);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to add GPIO controller\n");
 		goto err1;
@@ -376,8 +376,6 @@ static int em_gio_remove(struct platform_device *pdev)
 {
 	struct em_gio_priv *p = platform_get_drvdata(pdev);
 
-	gpiochip_remove(&p->gpio_chip);
-
 	irq_domain_remove(p->irq_domain);
 	return 0;
 }
-- 
2.21.0

