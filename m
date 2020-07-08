Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8D321916C
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 22:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgGHU1A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 16:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbgGHU07 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 16:26:59 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 320CBC08C5C1;
        Wed,  8 Jul 2020 13:26:59 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id 9so55690462ljv.5;
        Wed, 08 Jul 2020 13:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G7SHiILJ/999/a4ZIPPB905VEFL70YihjnFlwnMCLEE=;
        b=psSPiJcInXe6zKfPBT+oOrrq3Y13BlguPnlUA9FMF813Z/YdEg0pQK+daNIAS9KJoI
         BNO021HQnDkLaNqP8OPHY/tRAkiY0fcKTMEzXsM0+Zzl5SYCpOEaK2Yt04uaQf78FcBf
         4oTPScQEse36nqh/5UQSfjhXiqI+ekLv745g11QrIGiaH/lYziPPOleD4UIqaZVaZTSz
         K1I9BixHRxqEffsd499lyG/Lo8U1jKEBkE5OjpMK2r/zmt/iKktVMxvumWHY2tHaluCw
         2u/CmCwh5jUPdL0UkdN/fSeTF0liPJniEMFUPieCkd0bqzsnorLJ1wjlFa2cm9HZcb8G
         +jew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G7SHiILJ/999/a4ZIPPB905VEFL70YihjnFlwnMCLEE=;
        b=OqxAQs6/xYLMqOxTLGtjIX5s6TpVID8x7dKB0lTpEqPUVFiJZEPSaiqFEKmfm2pPbG
         AjpoEVhNDsHlFawlliiWuvMVMWn+UlPMs48nMj9gKF4vlvL96wQFcY6+IrwmVV9FSr8B
         oowGNzxbX8IBA3UBT18tB5gQNJiy9jdtZe8HA+7sEd6P3nqmTyHb55U//K1gtWFPgMmR
         IfU3E8NdDliPaWrhYMviCg10yYu+Z/8Qu7wUPLubrGS9fKFwbUtVdwoinPQFkUxOo8cm
         oenIzXfUG2QltB0skRfSfsgghj+cHfr12Vmfe3oze8tsAS0RQ6B66Obe7Llw+z6LGctY
         Y/zA==
X-Gm-Message-State: AOAM533usUj6q9nrVPwmH7CbWMJ+oglYzcFNGqyYjsZVBVR/o1U2Oq2N
        +aLG68CRTgwAoJmTytT5Owc=
X-Google-Smtp-Source: ABdhPJw1M9JrZh0MzzvAYGzqkxtV3RMKqWWnqGhpKyavyCutyckHlBgH99/JSbF2m+nyA6oqx/98OA==
X-Received: by 2002:a2e:8e36:: with SMTP id r22mr34890424ljk.77.1594240017678;
        Wed, 08 Jul 2020 13:26:57 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.gmail.com with ESMTPSA id e29sm252568lfc.51.2020.07.08.13.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 13:26:57 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/6] gpio: max77620: Fix missing release of interrupt
Date:   Wed,  8 Jul 2020 23:23:51 +0300
Message-Id: <20200708202355.28507-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200708202355.28507-1-digetx@gmail.com>
References: <20200708202355.28507-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The requested interrupt is never released by the driver. Fix this by
using the resource-managed variant of request_threaded_irq().

Fixes: ab3dd9cc24d4 ("gpio: max77620: Fix interrupt handling")
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

