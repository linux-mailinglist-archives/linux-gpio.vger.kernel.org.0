Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1D18149807
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jan 2020 23:14:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727163AbgAYWOu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jan 2020 17:14:50 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:32893 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726937AbgAYWOt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jan 2020 17:14:49 -0500
Received: by mail-qt1-f195.google.com with SMTP id d5so4560858qto.0;
        Sat, 25 Jan 2020 14:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=UkJj4zFBfQ0RJe+br+AdMGtiHywyLjIgY8luB3SXeEI=;
        b=lhwc/m/q6Eudp7LXbDR3CtGhvrQ8CWTTkAQjqGVax/afTWBnIHLtQclNNP0h7ijeIa
         x7lImPgmTE+LSpMbYBRb5VREeUuUnsXJBnr/aJfNvC1b+f+llwggL0JAXGCZWlVCa1Ad
         RXytS8xCdgl39x6T7NFFMGsTjF2AscOWUwDlusB+M31R3SuRL90pF9bZ+7dC6TRrBNjR
         4O815DsxyJ/coBYBnsUQIvzr9ReGJGyhLpaPiaZKWoAjj6QQNvjMOIIRvIyRAqscVGlT
         NMpijxgH/9ZaaHAnrRRFvEydJcOd2sAwFeCxlTf/nV6oyfqR88K0DxWigpHDsDXCBdc0
         HGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=UkJj4zFBfQ0RJe+br+AdMGtiHywyLjIgY8luB3SXeEI=;
        b=N6PR/PpXKmu/5IW8AHsjcbIcirLLMbzUp5VPUMCgT0PVNsCeJqyQbqy9/83socRPxg
         8RBgJxsjtYV1c5XG31KEhUaGjCO/vWy2d+Frc+I5bmZMJxfzISDaW+uIbnipvO+cI6D6
         CcgpuRg0NWSb84o8dSe5XyKEPeTdl4ZDIgVKSrA1Fdm/vgZUFS64+kJ3WmHO0V6dS3uz
         am7JDDLqYWHbkBC258HzJgxLQg9SZwYEPZCf8IMkFWFntXk/MuGFDr1PgLtJALmNxcBP
         HgM7x0qY3/xV8/wba9JWdst1kjBpYsMSTgPBdB/P5WgUlZl3bxVZ+3dhicvqR382S8DW
         XDIg==
X-Gm-Message-State: APjAAAX6ZcG32XYqd/qTMzpma5szm7Kr6FcpDBN4RW2tSLHo19spmA3v
        jLzZuusy3CLZJb5HwV2MJaE=
X-Google-Smtp-Source: APXvYqwSXOoy09IOGc1a7VvJxFAljyE+ahCn0P1O+4NiIIpdcPsm24GoWu6JanLRTDEP88CgrM0+eA==
X-Received: by 2002:aed:3384:: with SMTP id v4mr9186289qtd.58.1579990488791;
        Sat, 25 Jan 2020 14:14:48 -0800 (PST)
Received: from black.hsd1.ma.comcast.net ([2601:199:417f:9090:64b4:53c4:7530:53fc])
        by smtp.gmail.com with ESMTPSA id z5sm6254816qts.64.2020.01.25.14.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2020 14:14:47 -0800 (PST)
From:   Paul Thomas <pthomas8589@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Paul Thomas <pthomas8589@gmail.com>
Subject: [PATCH] GPIO, Fix bug where the wrong GPIO register is written to
Date:   Sat, 25 Jan 2020 17:14:10 -0500
Message-Id: <20200125221410.8022-1-pthomas8589@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Care is taken with "index", however with the current version
the actual xgpio_writereg is using index for data but
xgpio_regoffset(chip, i) for the offset. And since i is already
incremented it is incorrect. This patch fixes it so that index
is used for the offset too.

Signed-off-by: Paul Thomas <pthomas8589@gmail.com>
---
 There are many different ways to correct this, I'd just like it to get
 fixed. I've tested this with a 5.2 kernel, but this patch is against
 5.5rc7.

 drivers/gpio/gpio-xilinx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index a9748b5198e6..67f9f82e0db0 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -147,9 +147,10 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 	for (i = 0; i < gc->ngpio; i++) {
 		if (*mask == 0)
 			break;
+		/* Once finished with an index write it out to the register */
 		if (index !=  xgpio_index(chip, i)) {
 			xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
-				       xgpio_regoffset(chip, i),
+				       index * XGPIO_CHANNEL_OFFSET,
 				       chip->gpio_state[index]);
 			spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
 			index =  xgpio_index(chip, i);
@@ -165,7 +166,7 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 	}
 
 	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
-		       xgpio_regoffset(chip, i), chip->gpio_state[index]);
+		       index * XGPIO_CHANNEL_OFFSET, chip->gpio_state[index]);
 
 	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
 }
-- 
2.17.1

