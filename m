Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 856AB257615
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 11:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728216AbgHaJKG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 05:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727992AbgHaJKB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 05:10:01 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6C89C061573;
        Mon, 31 Aug 2020 02:10:01 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id 5so274377pgl.4;
        Mon, 31 Aug 2020 02:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=72+5KESN1mSFJz5ZizKuMvDlrzop8gzGznvFUJBSrJA=;
        b=tcZNtvUG59Tbrxe5lh/j+93yv3TdD6TuJV7h49y52B1+TcQvVwEN1X0ZeGMcjO5AHA
         tjmy22nO+aVGsbNx8L7kDYH+cx8hQgqDXFROAqTfTLPrORZe1oqpZ8ZGwgTbVBlwQbL3
         5F5NwItSPJA/5Kjy86HDptqEubYjWQZhPEcaXDZC7wKdLEkCXNTEW/FZShg2F32p/j+h
         BdpwRrA6SQvrSGBIeY7WnA5e0YXZld6CeKNxBN2rHmZrMTXOSyWl5rRY76wEPqZbesWl
         rrY8N5k5JJzuKKTnqzF+LnvGU4ZHoBDoZPDAjQYFjCzSJ+m65n9MPk7ew4lvt4cWL5k7
         WrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=72+5KESN1mSFJz5ZizKuMvDlrzop8gzGznvFUJBSrJA=;
        b=WblHpbdH2ZHadpVsKRN27sMQZBQcilgsOYp4hKlp7yQ/3wiYqcQMdoNvmbULFzFEek
         QJWPOdDECp0tHzIeRSWrmOo0/5zdxd2gOox0AIkSUAIih74uro5NYiFoaivdJmH/zxiF
         eESmAzPVtXkHmZj4j/L1ATJZRE3EQ4jVagmaIp4BhLFeG9aF370aqWDuUtyXWa+yj/Wu
         9ItZ0ZQMAGX8JDth/OcGF7QYtIkiSmP0cCO2jIZNm1g2HKZv9HvQn6V5yl+nLSmyETi8
         ztMJmjORpM1vLYWu/PJn0L2kXFbu6bvNWoQz5GB7d1jwWCeMh693FSdvnIfkzilgBwIO
         t1qw==
X-Gm-Message-State: AOAM532ulN/hS8/rt9mmXsasRvb+fpE0MoAgD9sFyOixB2t5c4UrU5hR
        BA4I2gaT71glkkDPWQY//34=
X-Google-Smtp-Source: ABdhPJx3D9SiIuFZAcYlKbJ9WHchzowdfP20bmkgGKzywLcD1YFM3XwPvKILwv2aNcHD8I4r68SMmQ==
X-Received: by 2002:a63:8c0c:: with SMTP id m12mr513287pgd.73.1598865000788;
        Mon, 31 Aug 2020 02:10:00 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id z17sm7231467pfq.38.2020.08.31.02.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 02:10:00 -0700 (PDT)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Taiping Lai <taiping.lai@unisoc.com>
Subject: [PATCH v2] gpio: sprd: Clear interrupt when setting the type as edge
Date:   Mon, 31 Aug 2020 17:09:47 +0800
Message-Id: <20200831090947.18489-1-zhang.lyra@gmail.com>
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

There're a few considerations for the solution:
1) This issue is for edge interrupt only; The interrupts requested by users
   are IRQ_TYPE_LEVEL_HIGH as default, so clearing interrupt when request
   is useless.
2) The interrupt type can be set to edge when request and following up
   with clearing it though, but the problem is still there once users set
   the interrupt type to level trggier.
3) We can add a clear operation after each time of setting interrupt
   enable bit, but it is redundant for level trigger interrupt.

Therefore, the solution is this patch seems the best for now.

Fixes: 9a3821c2bb47 ("gpio: Add GPIO driver for Spreadtrum SC9860 platform")
Signed-off-by: Taiping Lai <taiping.lai@unisoc.com>
Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
---
* Changes since v1:
- Rebased on v5.9-rc1.
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

