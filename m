Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E23921A586
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 19:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728347AbgGIRMu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 13:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgGIRMm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 13:12:42 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7F6C08C5CE;
        Thu,  9 Jul 2020 10:12:42 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id h19so3221557ljg.13;
        Thu, 09 Jul 2020 10:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MwH9OzQNprBVTkDGom8Hyzf45RK5XVVd8yNAMaPqHFg=;
        b=S+cr2shDb1TfOejsw++p+vI3r8B+FssUPlW8yGlPlSu1mydqtkkk+YJ0M3NPW+weLz
         nhCAXHnnLE6H9A6Go6Hyg+EnUUG+pk6tEqiVLEeUWCc4X77Iavm8zr8Q17qKrhSOICLq
         3qQNdHwdfSlU5OAyecyitBri24mT5yjqJ61ChvTpHkFEHoUP7nR6RcfsulnaOvni0NMt
         ILm+txfGzhuKTfUNmLxH9ygrdd6H5we/njqYNnYqx73Tm4KcMFXd6lBwbx29sLJpdl4P
         XwN0C5dFo2YnbUqD1aXiTlGZ/RgXMSOviji3gTS0YNEksFQ1Y7wWsRu8tuLnEFKKja+v
         1O2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MwH9OzQNprBVTkDGom8Hyzf45RK5XVVd8yNAMaPqHFg=;
        b=XxsiSkrwPfiaa0k4mXW4b3yzq+1hhg6Uhhebqpp2PASvE0bsEdF9ZoI4ugT9bwRNSh
         fYquISOA5fO6uBFQ+UB64YWSP7eLFaq85CqCX6WtPVe98TWIvwnnBiH+caeGSGNGMsx9
         l7Ok5lDmtIqxH69nxfiodwXHZZmgO3nXyGJQ2ivvG+BYYafiYDyVb0Y7WiuO2YRUtzsj
         3UkZXO6F1qzXKpoEwddmpjJtTAxBp0VGmGO43jnDE9KooblUgiScQ1JJUoePZKdvRwgb
         caWE5ou2qt9NImvFvtadu/9+8Q+1yRL1YXzk5OdnKDdTq3eoy02yyLPpwjO3De9rHXyg
         0Qww==
X-Gm-Message-State: AOAM531DDZni8D95PzremhTqzQzFnUh5rF3xyx80MtaiDPKEKRpN9rnr
        JQDi/x03x3DCNAB39JUJv+Y=
X-Google-Smtp-Source: ABdhPJzYy6iDn63+WHVf7HB6iLM2INjD8TS6EzVQrtmpEO1Axca5+JaiB1Sqb/CzRODX661LJuwItg==
X-Received: by 2002:a2e:9b87:: with SMTP id z7mr35203698lji.80.1594314760687;
        Thu, 09 Jul 2020 10:12:40 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.gmail.com with ESMTPSA id y22sm998314ljn.2.2020.07.09.10.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 10:12:40 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/6] gpio: max77620: Don't shadow error code of platform_get_irq()
Date:   Thu,  9 Jul 2020 20:12:01 +0300
Message-Id: <20200709171203.12950-5-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200709171203.12950-1-digetx@gmail.com>
References: <20200709171203.12950-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The platform_get_irq() returns a positive interrupt number on success and
negative error code on failure (zero shouldn't ever happen in practice, it
would produce a noisy warning). Hence let's return the error code directly
instead of overriding it with -ENODEV.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-max77620.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 39d431da2dbc..9121d2507f60 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -264,12 +264,14 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 {
 	struct max77620_chip *chip =  dev_get_drvdata(pdev->dev.parent);
 	struct max77620_gpio *mgpio;
-	int gpio_irq;
+	unsigned int gpio_irq;
 	int ret;
 
-	gpio_irq = platform_get_irq(pdev, 0);
-	if (gpio_irq <= 0)
-		return -ENODEV;
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		return ret;
+
+	gpio_irq = ret;
 
 	mgpio = devm_kzalloc(&pdev->dev, sizeof(*mgpio), GFP_KERNEL);
 	if (!mgpio)
-- 
2.26.0

