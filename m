Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8643646E95B
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Dec 2021 14:48:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbhLINu4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Dec 2021 08:50:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbhLINuz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Dec 2021 08:50:55 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E45AC061746
        for <linux-gpio@vger.kernel.org>; Thu,  9 Dec 2021 05:47:22 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id k2so9075441lji.4
        for <linux-gpio@vger.kernel.org>; Thu, 09 Dec 2021 05:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P6qFI3DTqgugF8SKfHhJul9Y0oT0j9ZKA+GiAtvMhPs=;
        b=adzwLTkG7LH2OZtwnApdMmiFwIcecqrwWmM3Jg6Rkm5ILllR832JTaVlq0PZKfaVkm
         ux7/BdQjoRUneKywPrXaSKQI6VTOLjBDOjj8XDZ+CinWC79+AonXEuof6NUjBxJEUv6w
         y/fz+LszoTmKVqB2kbfN8ihukX3aDa6Hdalw4Y2D/LNiE9QOp+it4IJn0Ek4q4qI4HSB
         EYATjm/21yX3hI8GcCTyK0Gzio6yDp+Yz0XD1zqOLDuhe6au1rG8M1sEUMFN4OHvUyXQ
         c++8Ck0RIbfGcJoZmxmlZoDGh0aWr7tPxRWlKpTBtT9jQkDGJ2bn42laWLqTv4Zjq9dd
         NqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P6qFI3DTqgugF8SKfHhJul9Y0oT0j9ZKA+GiAtvMhPs=;
        b=JlGSFEXKj0Bf4Us5oYw23xRRzGresPvqsFtw7xn5ieiqTVQuId+lM8wMd6a/7jUYS/
         9UtbExwShW934izFWKuJYwfxKMyBAZ8OtgtjcFUiv6U652CColQ85r8SKxVZgUdOHfRT
         zE8rdUx5gPqZacqAefRVHfjSZrPb0ANwmmDTXINWvkpp0y5srM3/f+RU/5xECbzhMJ6h
         aMGg5nVVaAjcjPWsUccgmkDNB+yJ5LIZhM5vlAJ74R9yGzhb3cy2SxPpTKcC8ghxnibc
         vUvllgN/lutp4WMq2rMgfBZQh3CWTL/cnnt46Y1HBWu28+SXkA3PEberYqVec87cGIVM
         Th2Q==
X-Gm-Message-State: AOAM531ZzrYXKZ69zExSqXateUnd52LSZkwGDUME3KjehfDd6AlI8ty2
        21S1YstlqX/ecKH/2A6UdE3V0YktqGiKJg==
X-Google-Smtp-Source: ABdhPJwmNqBy7HSkq3hJl9awHuPXxzPM3wkReN3GUwtE+nrdo0TSUbEef8vdYlRnt1JoeLHM4VWX1A==
X-Received: by 2002:a2e:a482:: with SMTP id h2mr6138539lji.87.1639057639856;
        Thu, 09 Dec 2021 05:47:19 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id h1sm532436lfp.249.2021.12.09.05.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 05:47:19 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] pinctrl: bcm2835: Silence uninit warning
Date:   Thu,  9 Dec 2021 14:45:13 +0100
Message-Id: <20211209134513.306212-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The uninitialized variable would be caught by the BUG_ON()
logic below, but the kernel test robot cannot see that.
Silence the warning by initializing the variable.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 2abcc6ce4eba..e473fc1509d3 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -407,7 +407,7 @@ static void bcm2835_gpio_irq_handler(struct irq_desc *desc)
 	struct bcm2835_pinctrl *pc = gpiochip_get_data(chip);
 	struct irq_chip *host_chip = irq_desc_get_chip(desc);
 	int irq = irq_desc_get_irq(desc);
-	int group;
+	int group = 0;
 	int i;
 
 	for (i = 0; i < BCM2835_NUM_IRQS; i++) {
-- 
2.33.1

