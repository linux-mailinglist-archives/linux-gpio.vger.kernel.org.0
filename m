Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6097435B4A2
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Apr 2021 15:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235676AbhDKNbM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Apr 2021 09:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235669AbhDKNbL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Apr 2021 09:31:11 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 944A2C061574;
        Sun, 11 Apr 2021 06:30:54 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id i9so10659683qka.2;
        Sun, 11 Apr 2021 06:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2U0kajZpoqLNqZ697nPvtOzA3b5aXYBuZDP9zXOptDw=;
        b=XrmlGe0RKfI6M+SGxspAXBfF+pUNxf0Jb1Hbtly2Bxs1u3Zivnl+D+d/JcJb0Uv6DA
         nPWj/YzFxnKvSC6b5k274Khnr+jsw4FnwUUVl7TYfnxSkKsOpWT8bX4FBOUsTO1WaXXr
         E9m/EHRxARiBHLpqSHc045e9XYFJm84LF9hssqEL7wbY4maDQhp9INOtIqq6XAfU3+Oz
         aLpDhoWuTXUMJBeK56Xu1KRTdObhoOLujs6YZ8SolNyXXW//ELIWX1IdQU9x44HAiJJx
         a/wOoNfAdLM/CZoWLsejKWMdwhWKMa9LUGwvebRU5HWS4xqZOFrmmwWf2KJaDuxYfNf3
         O8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2U0kajZpoqLNqZ697nPvtOzA3b5aXYBuZDP9zXOptDw=;
        b=pBe98bzFqLCzRyWX2CA5iLT0H47Hqke70hka+plsTSpygndMSnHTExAU+3Iwt1czLf
         UPd7t9Y/NcKs1jQwkzmtNmnM0U3BUHD4Z1+yV/FmCO1svpXipWjDt0kEDvVqjMVrSPdh
         kP/WGVtnAvBEcnxs0+jiFu/43sty9ckNNMMPPOZCYDlK+wsjLJwtKSlo0wC/i2+Hiei6
         Sh6pXNR7jC9/LsXizpOknrTzdGJ+Afs94NN7UzYBImAtgnr/iwGXzALbxabXwP12up8N
         62gCGmZ1KQfjRGVRJULnGQL4niF1Mu5YyTaaA/xi7qRYweuFbHZkfr1O4IyjjduS0Vf3
         miKw==
X-Gm-Message-State: AOAM532nbeoeClWu7iVDWpXUaz5QYUMKBp5VR9PNYn+Rqoj4oZBtqL5w
        /5wWEZtBxPICN+VojPdaVs5SbgQS5AFtJg==
X-Google-Smtp-Source: ABdhPJx//vnD6C8CvtE8OrOMgGW3YUcdTG7jUI6nVveo24RsNJ7VvNZy4mWgjGmCsWXldhgrRrSXgw==
X-Received: by 2002:a05:620a:13c3:: with SMTP id g3mr10501092qkl.377.1618147853794;
        Sun, 11 Apr 2021 06:30:53 -0700 (PDT)
Received: from master-laptop.sparksnet (c-98-233-193-225.hsd1.md.comcast.net. [98.233.193.225])
        by smtp.gmail.com with ESMTPSA id l17sm5734204qtk.60.2021.04.11.06.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 06:30:53 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Jianqun Xu <jay.xu@rock-chips.com>, huangtao@rock-chips.com,
        kever.yang@rock-chips.com, linus.walleij@linaro.org,
        heiko@sntech.de
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] gpio/rockchip: drop irq_gc_lock/irq_gc_unlock for irq set type
Date:   Sun, 11 Apr 2021 09:30:30 -0400
Message-Id: <20210411133030.1663936-8-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210411133030.1663936-1-pgwipeout@gmail.com>
References: <20210411133030.1663936-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Jianqun Xu <jay.xu@rock-chips.com>

There has spin lock for irq set type already, so drop irq_gc_lock and
irq_gc_unlock.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 048e7eecddba..c9c55614bbef 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -406,7 +406,6 @@ static int rockchip_irq_set_type(struct irq_data *d, unsigned int type)
 		irq_set_handler_locked(d, handle_level_irq);
 
 	raw_spin_lock_irqsave(&bank->slock, flags);
-	irq_gc_lock(gc);
 
 	level = rockchip_gpio_readl(bank, bank->gpio_regs->int_type);
 	polarity = rockchip_gpio_readl(bank, bank->gpio_regs->int_polarity);
@@ -461,7 +460,6 @@ static int rockchip_irq_set_type(struct irq_data *d, unsigned int type)
 	rockchip_gpio_writel(bank, level, bank->gpio_regs->int_type);
 	rockchip_gpio_writel(bank, polarity, bank->gpio_regs->int_polarity);
 out:
-	irq_gc_unlock(gc);
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
 
 	return ret;
-- 
2.25.1

