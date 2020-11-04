Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6CD2A70F1
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 00:07:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730704AbgKDXHf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 18:07:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728301AbgKDXHe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 18:07:34 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A74A9C0613CF;
        Wed,  4 Nov 2020 15:07:34 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id u4so120562pgr.9;
        Wed, 04 Nov 2020 15:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6Zz/F/9DywCXKrdJ727enMYsohyIoEZCj37+BjAtekg=;
        b=hPiMdy44bejB5JwQ3/j/JS1hhaXkizeC5ZoCj50REvR3cWalY5fmMuk+X+6VXcl8TB
         KdmTitTzob1Fpn+epQkxgeR603NHv8pNJmTNYPejaHEdkowexM5r9F4ZN4Ks74oihnb8
         JIv3JjmOkQK8zrso/3c7gRfN1YkXqOFBZN+mqKDjhxy4gZYvLZDwOWaifLU4Wp1JfSWS
         cQWu6YLSE1N5k5XdO26ZgRXSqr4CkZikbiil4GDXyKm4FG84vtOkbzxo7pLvxZOF++lg
         DXFJvRN8Iv4kJtBCAM+jsLcdKLJ0iCBl1zU4qTI+sFyGm4rcTXQ6Vk8hQjPUHQYlKXm3
         dcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6Zz/F/9DywCXKrdJ727enMYsohyIoEZCj37+BjAtekg=;
        b=KCoGkPG5YhaiclS/FwaTh9ep0DzuIQz42xnmkplJySeRroKOx4HpGPk122+3Mx08/F
         MVTUhr42oQotkcv8q2bmYhp+M20qs5wGbArtyREqS7f872F3SAHb4XJJSXIcewpJMJ5G
         Y5ANSztJljOQa3kIvCjyB9d3PNgbLTJ7mfiurbMZy7GO6/ZXtin0U4XduQWeS2QZ89SL
         VBaE+JMmKuALU8tQ05AvKOwuZcu3fRKrU4lfD2Hk4EFZTcKTFQ42LaXYg/NJFAEW9TQT
         zbQ38rTkU0bxO10qGNnNxoUqHzId51Ds2B+O6miJkSrxcJUaTFJVB4PZNyfW+VxTqcLM
         jxNQ==
X-Gm-Message-State: AOAM531LooiuVJ/U64QDmG53C6WngIJCb5Hvjp6ZCJhe8Ia+wr6+sC4d
        4Gd5F15ZChKw/wWvWZxBeSA=
X-Google-Smtp-Source: ABdhPJzg36HSJ0tpCFqU8eOZAuUdlY1LBn7cEZYOmlZqTuJMui9eXdxalnWdI250zvWdkWTstwCiEw==
X-Received: by 2002:a63:4644:: with SMTP id v4mr236233pgk.351.1604531254268;
        Wed, 04 Nov 2020 15:07:34 -0800 (PST)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id y203sm3658197pfb.70.2020.11.04.15.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 15:07:33 -0800 (PST)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/4] pinctrl: amd: use higher precision for 512 RtcClk
Date:   Thu,  5 Nov 2020 07:07:01 +0800
Message-Id: <20201104230703.21466-3-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201104230703.21466-1-coiby.xu@gmail.com>
References: <20201104230703.21466-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RTC is 32.768kHz thus 512 RtcClk equals 15625 usec.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Suggested-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/linux-gpio/2f4706a1-502f-75f0-9596-cc25b4933b6c@redhat.com/
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/pinctrl/pinctrl-amd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index d6b2b4bd337c..4aea3e05e8c6 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -156,7 +156,7 @@ static int amd_gpio_set_debounce(struct gpio_chip *gc, unsigned offset,
 			pin_reg |= BIT(DB_TMR_OUT_UNIT_OFF);
 			pin_reg &= ~BIT(DB_TMR_LARGE_OFF);
 		} else if (debounce < 250000) {
-			time = debounce / 15600;
+			time = debounce / 15625;
 			pin_reg |= time & DB_TMR_OUT_MASK;
 			pin_reg &= ~BIT(DB_TMR_OUT_UNIT_OFF);
 			pin_reg |= BIT(DB_TMR_LARGE_OFF);
--
2.28.0

