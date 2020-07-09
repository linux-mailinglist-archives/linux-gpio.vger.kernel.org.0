Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 160D321A585
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 19:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728110AbgGIRMu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 13:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728268AbgGIRMn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 13:12:43 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37211C08C5DC;
        Thu,  9 Jul 2020 10:12:43 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id f5so3236075ljj.10;
        Thu, 09 Jul 2020 10:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u99MosogCAS3r14WcUxt5hVcjyYNPkz9/nrq/fRZnBY=;
        b=civHIhjowxn4Tr7egQT7xB3THHlroD0qRyPQkzO6Pyv9BEEbtTpWgkPIWcqqQbxfAY
         7Kn60aidsfiBax+WEaSGh9A0681K3OOvDQLN1Vv3w9VQBCR8f+bXt2WMkNXh4ntHnTau
         C5+oZY3AuYaP5SfwH07A3vk6trbj/HvmcEC/luppPZOQ7l+GDOd69wmfJeNBVdVoS+0U
         7mVGnzmHE4qxTtgvX6J4ABajVb84Na57hse33Y+UwjTTfg2a3y7BFQpMcw/bHu3kTUR/
         UB09EjNgXkrAbECDSr9wIL3gQE2E/cB+eAIRsh4L6+Jofrpl2DL6G/yW8tEeRWO2GxdS
         A55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u99MosogCAS3r14WcUxt5hVcjyYNPkz9/nrq/fRZnBY=;
        b=CVOZMW/b9lvGpACnBOOTeHsnsQhXy2iKI43GLqrDAoJA9QnoLvOjEdCBuKd5qcGm7z
         rw1qwQm8wf0cZMZvGf81LQo7BytjD3dkvkrdFU4MMufdxgKZfxgZ8lslPmdI+DF+vAL0
         9BEeUDlIa0u8b4JZsNoKq49RXmhU7X4ZpY/nPx2mpBSF0Iqo/Fx+ns7vD+LsNOSonrYf
         oaaOpvz27nUmtUEpt0AHUapG/S4xXPDni+CaHqxKNsHXXQYKIxJyJigdFVgOmpEx1KD/
         B7fVyeO19RPkD8BP1v1l/rtinWrjnDWIIv55NJZT5R2+Dvxce7k/+YUn0L7TjtdH4sLP
         mnmw==
X-Gm-Message-State: AOAM530akeLEyulZF1W1nRiIXsciRo7pSqgVGwhlI1Jp0EOANdCpPYsI
        NG9uktC+u2gawQXUBSqKM6g=
X-Google-Smtp-Source: ABdhPJx0blGxsbWIsC6VxaWTr2AqkRhDQepmakHlsYAWWALEvbwHj5E9MuRjlRWt5kYS2C1Qk8drBg==
X-Received: by 2002:a2e:9ac4:: with SMTP id p4mr35848290ljj.143.1594314761759;
        Thu, 09 Jul 2020 10:12:41 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.gmail.com with ESMTPSA id y22sm998314ljn.2.2020.07.09.10.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 10:12:41 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/6] gpio: max77620: Use irqchip template
Date:   Thu,  9 Jul 2020 20:12:02 +0300
Message-Id: <20200709171203.12950-6-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200709171203.12950-1-digetx@gmail.com>
References: <20200709171203.12950-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This change addresses one of the GPIO-core TODOs for the MAX77620 driver
which requires modern drivers to use the irqchip template. Instead of
using the GPIO's irqchip-helpers for creating the IRQ domain, the
gpio_irq_chip structure is now filled by the driver itself and then
gpiochip_add_data() takes care of instantiating the IRQ domain for us.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-max77620.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 9121d2507f60..6c516aa7732d 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -277,6 +277,7 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	if (!mgpio)
 		return -ENOMEM;
 
+	mutex_init(&mgpio->buslock);
 	mgpio->rmap = chip->rmap;
 	mgpio->dev = &pdev->dev;
 
@@ -291,6 +292,11 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	mgpio->gpio_chip.can_sleep = 1;
 	mgpio->gpio_chip.base = -1;
 
+	mgpio->gpio_chip.irq.chip = &max77620_gpio_irqchip;
+	mgpio->gpio_chip.irq.default_type = IRQ_TYPE_NONE;
+	mgpio->gpio_chip.irq.handler = handle_edge_irq;
+	mgpio->gpio_chip.irq.threaded = true;
+
 	platform_set_drvdata(pdev, mgpio);
 
 	ret = devm_gpiochip_add_data(&pdev->dev, &mgpio->gpio_chip, mgpio);
@@ -299,11 +305,6 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	mutex_init(&mgpio->buslock);
-
-	gpiochip_irqchip_add_nested(&mgpio->gpio_chip, &max77620_gpio_irqchip,
-				    0, handle_edge_irq, IRQ_TYPE_NONE);
-
 	ret = devm_request_threaded_irq(&pdev->dev, gpio_irq, NULL,
 					max77620_gpio_irqhandler, IRQF_ONESHOT,
 					"max77620-gpio", mgpio);
@@ -312,9 +313,6 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	gpiochip_set_nested_irqchip(&mgpio->gpio_chip, &max77620_gpio_irqchip,
-				    gpio_irq);
-
 	return 0;
 }
 
-- 
2.26.0

