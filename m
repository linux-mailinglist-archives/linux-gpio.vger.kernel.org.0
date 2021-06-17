Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2B213AB517
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jun 2021 15:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231346AbhFQNqw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Jun 2021 09:46:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbhFQNqv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Jun 2021 09:46:51 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CBB4C061574
        for <linux-gpio@vger.kernel.org>; Thu, 17 Jun 2021 06:44:43 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id y7so6830838wrh.7
        for <linux-gpio@vger.kernel.org>; Thu, 17 Jun 2021 06:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=TbHA93SGD1ZOJGmaoBvLrZYlY4sDOvfXZItvN28cu2w=;
        b=ookTfhdNJOYbeUlBCRwPjuQgO5IZ8SdSZhdxoV14U3cs+YBX+4+kN663OoU4LppY13
         BiJwu3b2+JXIH3Fx8w3SGBKYC9LvoR0+ydf2455vRVNzsVFCY6skfRgpgU+QaRFlHlVl
         JSKL6P9w545KVZw8MW3/PX2RnchGfHQaQHv9tIz7tHfkavBdcssSd5oAbCLHyEtnzBR8
         atJrKL9ybsjfq7MNFIuY/RzHVOg+TFxTUvnbjU69e6PKh36oqvT1Oqrid86p5xk21yXl
         6dk+VMg9dMJZYD5Wz61mXGYW61tBbTxr8xSlMGsmm8p59UjUxpu9KoKG3xcgF8fBvFD0
         fTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TbHA93SGD1ZOJGmaoBvLrZYlY4sDOvfXZItvN28cu2w=;
        b=PrVzQVTzyE/JHhTxINSukXadOvLF/Q5mmUzpyuZs5v6nBQl+A8qE1ZtKp61xxmWFwe
         AOwRaOzNBroxYe6QIoE3Lqj0ePBFd8vS1ieu6Fg+/MCebvj36eTbNRduL3Kpu+hABYAH
         kB2PkIJ9ObWBsoJ62ecFdO+PEYMu0e2pr8tjWwpqWs1Ll/ku4osh8pjHmBBtr7LYpziF
         S4wz2cWEuYKdVdxBJ0W7d3qQqs6m1dxQCz5AYxDMGkEZ4xD1trHO/9W55/jGbA+O8xTv
         u3tMFPa0IKlf7NgACeS+PAc+XGXIfhiNAYUBpoqUALB+zk7/ObVMOjNOGubbjM+Qf5oO
         j4nA==
X-Gm-Message-State: AOAM533nQ7t4TFxRYN0aBhtejQa/NIh1hjusrip/IKYpreBor0G4Sw3X
        mFtpUCw+uPmI9BbldQ10POL7LQ==
X-Google-Smtp-Source: ABdhPJw6P3Niokngpgm1WPnAjuRcvXouTX/ZbiJUvy5eXLkAm7b/sRP77R9EbWDiZImgfKIqhkLleA==
X-Received: by 2002:adf:e3c7:: with SMTP id k7mr549353wrm.31.1623937481550;
        Thu, 17 Jun 2021 06:44:41 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:85ed:406e:1bc4:a268])
        by smtp.gmail.com with ESMTPSA id j12sm5553948wrt.69.2021.06.17.06.44.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jun 2021 06:44:40 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, michal.koziel@emlogic.no,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] gpio: mxc: Fix disabled interrupt wake-up support
Date:   Thu, 17 Jun 2021 15:54:13 +0200
Message-Id: <1623938053-790-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A disabled/masked interrupt marked as wakeup source must be re-enable
and unmasked in order to be able to wake-up the host. That can be done
by flaging the irqchip with IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND.

Note: It 'sometimes' works without that change, but only thanks to the
lazy generic interrupt disabling (keeping interrupt unmasked).

Reported-by: Michal Koziel <michal.koziel@emlogic.no>
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/gpio/gpio-mxc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 157106e..b9fdf05 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -334,7 +334,7 @@ static int mxc_gpio_init_gc(struct mxc_gpio_port *port, int irq_base)
 	ct->chip.irq_unmask = irq_gc_mask_set_bit;
 	ct->chip.irq_set_type = gpio_set_irq_type;
 	ct->chip.irq_set_wake = gpio_set_wake_irq;
-	ct->chip.flags = IRQCHIP_MASK_ON_SUSPEND;
+	ct->chip.flags = IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND;
 	ct->regs.ack = GPIO_ISR;
 	ct->regs.mask = GPIO_IMR;
 
-- 
2.7.4

