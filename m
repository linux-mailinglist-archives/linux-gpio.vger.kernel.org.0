Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAFE921A58A
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 19:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728175AbgGIRMl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 13:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728110AbgGIRMk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 13:12:40 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F3B8C08C5CE;
        Thu,  9 Jul 2020 10:12:40 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id e8so3284780ljb.0;
        Thu, 09 Jul 2020 10:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pPsaxFMPGXuMGU5xfWvs2V1FaJ6pHtqnWBB2UZa9jss=;
        b=WWQDN8WS7ffY7kViOBOudsX+3MPTwXEkwgebt8Ts0heK67MX/ag0axE0zMSPngNDqA
         C3B1FmAYr+f3ohkOHiJv810O6dtfNx4eJ1+vdiYmlV4mDhDOEqxka9JdE7rz7MWC9Gi4
         +9dQpIsbB2uARwTK6lcB/iS+WOcTes0C1Egt04RM/X3AOq9e9iDhRsRl6VLdNA8VV9ZP
         zQeidcgxW9Yf/5RleJtDwi7rrLhOjkZ6CnH6Iyc/dhB9X/I7a88zUQdJcOaR8qMtA31K
         E3CPxr2yic6Bn5YlmPJ4KrOi+jwJgBw4EaJjy/tzlaa7ykumkEu5SqLFk3U37SXfPgLP
         3g9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pPsaxFMPGXuMGU5xfWvs2V1FaJ6pHtqnWBB2UZa9jss=;
        b=ksNEazePHBMTzebeLI5Ks5JbKP4gIWauXBhH/6+jEGW03ezUVFxqFrKug4ZZ9VQubW
         zw1eK9Df4oLFAKS40u22qfl5GpLN0Q+Pox/yr2tObSC8G4UMa/wqYC/Mm0dOsvQEoizq
         oJgiy8dTLIxwuL5pXko65zeiCc7TaH0D7ghZ6LxnM1zor19huJRvqc5w5GlPYu1QmJjn
         uAjvz5JpDpc0zklfv5IRRtvBBdQWr9mKAVQzA1Ziz5YX/UNdxhXkgH30df07WeM47jjM
         z4BM2RYiJZtCRZ6qkYg/7nkpnhaczu6uOWrN1c3nRm/u5lDpQN+K9yzwUtYGzGSS9cjb
         NIgg==
X-Gm-Message-State: AOAM533VyKIRNcIRhXjAJHd84j6RgCdQ0JEOqtAuS7c7Jhv/SDyi9vL2
        nixmpZSkWiWZ/tGnC7bj1RI=
X-Google-Smtp-Source: ABdhPJyivzoUWxEAKZ4DmW38Uy/Ab5dtgH6ExKZAg389uvzhBUuj+dManw2W8JkbgzScuCODCd6ebQ==
X-Received: by 2002:a2e:9dd6:: with SMTP id x22mr18890532ljj.199.1594314758700;
        Thu, 09 Jul 2020 10:12:38 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.gmail.com with ESMTPSA id y22sm998314ljn.2.2020.07.09.10.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 10:12:38 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/6] gpio: max77620: Fix missing release of interrupt
Date:   Thu,  9 Jul 2020 20:11:59 +0300
Message-Id: <20200709171203.12950-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200709171203.12950-1-digetx@gmail.com>
References: <20200709171203.12950-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The requested interrupt is never released by the driver. Fix this by
using the resource-managed variant of request_threaded_irq().

Fixes: ab3dd9cc24d4 ("gpio: max77620: Fix interrupt handling")
Cc: <stable@vger.kernel.org> # 5.5+
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-max77620.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 4c0c9ec2587d..7f7e8d4bf0d3 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -305,8 +305,9 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	gpiochip_irqchip_add_nested(&mgpio->gpio_chip, &max77620_gpio_irqchip,
 				    0, handle_edge_irq, IRQ_TYPE_NONE);
 
-	ret = request_threaded_irq(gpio_irq, NULL, max77620_gpio_irqhandler,
-				   IRQF_ONESHOT, "max77620-gpio", mgpio);
+	ret = devm_request_threaded_irq(&pdev->dev, gpio_irq, NULL,
+					max77620_gpio_irqhandler, IRQF_ONESHOT,
+					"max77620-gpio", mgpio);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to request IRQ: %d\n", ret);
 		return ret;
-- 
2.26.0

