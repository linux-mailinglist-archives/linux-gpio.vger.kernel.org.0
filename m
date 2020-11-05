Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC26B2A8A8E
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 00:19:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731330AbgKEXTj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 18:19:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729162AbgKEXTi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 18:19:38 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D35F9C0613CF;
        Thu,  5 Nov 2020 15:19:38 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id i7so2444726pgh.6;
        Thu, 05 Nov 2020 15:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5wFU/mPUt5bnAn1NYJxaqVm9bqWLQ5tB7/uIHYHp0HQ=;
        b=cn6K2b44llt5xafOSAO120AEwzEoNgw63pmlOhOEOxCQd/0fzG5KHm8RyBquoOp26I
         ppmDj+msJvT4FQRv41AYoVm4nZ6CAg9SAvX0rt0y9HEOBTbx017Fl6V/xEVpbNHdmUpE
         d5nR+ARHJi7jdguTx/McGVl7pjROBNHHrM8WcRERo4R3i+VelOsPdMJHwP/kUwmebX+v
         kujhrMX2ID9ma1rl8/aNpKTb7f7/BI72zJwwYvfsB+KyHAUJdTXM0buchCc7hg6+Boyz
         Xc0wkKeVMPLwONbmipyIGr/U7OpU3DuUCqW8bXKohMEFjoGoTPQrH1vG0Ypcu6102FMt
         R3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5wFU/mPUt5bnAn1NYJxaqVm9bqWLQ5tB7/uIHYHp0HQ=;
        b=EuTRgaabmCWQW9B+NFwifB4u9776tUHljhgOhsGSvjc/nlqhJefcVW2SYoBJSEfsvK
         dDGGdcbV6qioUF6CykpLcKCoCDPTK246HsxibNILUG9Gab9D4mZ3/DJ6pB3iLKzI8nn6
         /ZVjroxtpJcCZJuYVcUHg/EZOEkKnP0ZHoA0VWI/cTFQLdtDG+LcYbfNklNfytTAHET7
         f5JJAVCLlNqn4ZEJe2tNFuAAOyuuxN08VlDx4Rb9lj8MSfliA+QjClSvzpvBU3nFxvxE
         e/M7npl5dCZ3E+0zUHA+LGhULpi/40wAHFQDUPh7Rwh9RATfTP/7mb1wHv0AEMs4JVRX
         ZF8g==
X-Gm-Message-State: AOAM533I/wwjzhT00sVf24BVX/jwSzFSQCxqmmSIsFlH+klI256Qf6zI
        XEVoWPdLgJIxgG3YBPxxWA8=
X-Google-Smtp-Source: ABdhPJz7e1bDCO+OFo736hlZQfHXy/j66FNz6orcdPRCyRtDa0RUARQJD4awYaTYz1X6MHGmHYRGGg==
X-Received: by 2002:a17:90a:a10e:: with SMTP id s14mr4466229pjp.62.1604618378487;
        Thu, 05 Nov 2020 15:19:38 -0800 (PST)
Received: from localhost ([160.16.113.140])
        by smtp.gmail.com with ESMTPSA id k5sm3487465pjs.14.2020.11.05.15.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 15:19:38 -0800 (PST)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/4] pinctrl: amd: fix incorrect way to disable debounce filter
Date:   Fri,  6 Nov 2020 07:19:09 +0800
Message-Id: <20201105231912.69527-2-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201105231912.69527-1-coiby.xu@gmail.com>
References: <20201105231912.69527-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The correct way to disable debounce filter is to clear bit 5 and 6
of the register.

Cc: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/linux-gpio/df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com/
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/pinctrl/pinctrl-amd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 9a760f5cd7ed..d6b2b4bd337c 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -166,14 +166,14 @@ static int amd_gpio_set_debounce(struct gpio_chip *gc, unsigned offset,
 			pin_reg |= BIT(DB_TMR_OUT_UNIT_OFF);
 			pin_reg |= BIT(DB_TMR_LARGE_OFF);
 		} else {
-			pin_reg &= ~DB_CNTRl_MASK;
+			pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
 			ret = -EINVAL;
 		}
 	} else {
 		pin_reg &= ~BIT(DB_TMR_OUT_UNIT_OFF);
 		pin_reg &= ~BIT(DB_TMR_LARGE_OFF);
 		pin_reg &= ~DB_TMR_OUT_MASK;
-		pin_reg &= ~DB_CNTRl_MASK;
+		pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
 	}
 	writel(pin_reg, gpio_dev->base + offset * 4);
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
-- 
2.28.0

