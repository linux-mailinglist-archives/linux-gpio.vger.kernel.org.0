Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3D8231C29
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jul 2020 11:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbgG2JfD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jul 2020 05:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgG2JfC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jul 2020 05:35:02 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6519C061794;
        Wed, 29 Jul 2020 02:35:02 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id u10so2065843plr.7;
        Wed, 29 Jul 2020 02:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/VC/uuXlxbfidiPavUNDWLqmh29pPpdY7lZrRMtmTSc=;
        b=Fnaj/oNACCtyQMFYLfrPnYYFEhKCzFNvxIB+REhxwQtfO6HNXrjwHVqcjBE4C5qOY5
         D4cojmVmzOBAOffao2GprTw330iIZXLBP0QE0bB/ncaXGv2wO6V7Q+ZVUjOXbujTnOyH
         bvSff2vbnQ6/eZZrlrHwohIPCjfsx2U0M+OhMN6A028p9rbp3YGpDGJcKBwCg12tAvvh
         z/JlB4L9gJpvs+Ok4X3m7tVKWKbNWmFiPXCsXxZjCrTFoiRXOo4T2RnDPZP0CbWIp9pg
         orntmTtxxaRQde7TOqshbXt6yleDAxbpthaaEZPTcY5bsuqPzbumF7gaZbrKfAm41Fqb
         tdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/VC/uuXlxbfidiPavUNDWLqmh29pPpdY7lZrRMtmTSc=;
        b=ZB/Ns2VxY7rDFIa1kGuCxglL1m1bwPHSokAThMmeDJWdYuZ/qgvPU0DAnfVct/Hi7u
         9rE7koYkTBhgxePEHKSr/KKSt+H45OTocar2bAfMVLSk5h6UHsy+/h+2ON3HcRqRZdk5
         DYdIPPEjpMgmmscqji9l5cSshfBWD2mpsltwJbkso9E3m1D6ePeVdIf8uvYz6xsjzrn/
         CP4LtUyrlA70/aHYdZLIH/Xge9ffQ4QahZ3fbeuIBFibHYi0JGti06DiXWRwsvq40hUw
         X7L12iENuaE+lVpugSM5wEv2ZvfEzw6gDav8QmdY24xa7zL4mkNo9x3ORSsUbdrtf0e3
         ggAQ==
X-Gm-Message-State: AOAM533/Y4s+rHi+CKlGnoblaUxV2m7UgktWd+MzoYXwbEXbZwgj5wcx
        H/GgbrFwpuRRnlK2ycNUyD4=
X-Google-Smtp-Source: ABdhPJzEexquEKUe9twCBLq1d8kcS0mozlBLo29gmEHYFZHa4AzIjwOg61M04XVBKrqC6uNu+MhaBA==
X-Received: by 2002:a17:90a:1b42:: with SMTP id q60mr8823265pjq.78.1596015302196;
        Wed, 29 Jul 2020 02:35:02 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id b21sm1677814pfp.172.2020.07.29.02.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 02:35:01 -0700 (PDT)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Taiping Lai <taiping.lai@unisoc.com>
Subject: [PATCH] gpio: sprd: Clear interrupt when setting the type as edge
Date:   Wed, 29 Jul 2020 17:34:50 +0800
Message-Id: <20200729093450.28585-1-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Taiping Lai <taiping.lai@unisoc.com>

The raw interrupt status of GPIO maybe set before the interrupt is enabled,
which would trigger the interrupt event once enabled it from user side.
This is the case for edge interrupts only. Adding a clear operation when
setting interrupt type can avoid that.

Fixes: 9a3821c2bb47 ("gpio: Add GPIO driver for Spreadtrum SC9860 platform")
Signed-off-by: Taiping Lai <taiping.lai@unisoc.com>
Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
---
 drivers/gpio/gpio-sprd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-sprd.c b/drivers/gpio/gpio-sprd.c
index d7314d39ab65..36ea8a3bd451 100644
--- a/drivers/gpio/gpio-sprd.c
+++ b/drivers/gpio/gpio-sprd.c
@@ -149,17 +149,20 @@ static int sprd_gpio_irq_set_type(struct irq_data *data,
 		sprd_gpio_update(chip, offset, SPRD_GPIO_IS, 0);
 		sprd_gpio_update(chip, offset, SPRD_GPIO_IBE, 0);
 		sprd_gpio_update(chip, offset, SPRD_GPIO_IEV, 1);
+		sprd_gpio_update(chip, offset, SPRD_GPIO_IC, 1);
 		irq_set_handler_locked(data, handle_edge_irq);
 		break;
 	case IRQ_TYPE_EDGE_FALLING:
 		sprd_gpio_update(chip, offset, SPRD_GPIO_IS, 0);
 		sprd_gpio_update(chip, offset, SPRD_GPIO_IBE, 0);
 		sprd_gpio_update(chip, offset, SPRD_GPIO_IEV, 0);
+		sprd_gpio_update(chip, offset, SPRD_GPIO_IC, 1);
 		irq_set_handler_locked(data, handle_edge_irq);
 		break;
 	case IRQ_TYPE_EDGE_BOTH:
 		sprd_gpio_update(chip, offset, SPRD_GPIO_IS, 0);
 		sprd_gpio_update(chip, offset, SPRD_GPIO_IBE, 1);
+		sprd_gpio_update(chip, offset, SPRD_GPIO_IC, 1);
 		irq_set_handler_locked(data, handle_edge_irq);
 		break;
 	case IRQ_TYPE_LEVEL_HIGH:
-- 
2.20.1

