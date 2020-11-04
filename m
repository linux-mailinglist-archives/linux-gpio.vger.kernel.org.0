Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68CAE2A6900
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 17:04:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbgKDQEV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 11:04:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbgKDQEV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 11:04:21 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E6A8C0613D3;
        Wed,  4 Nov 2020 08:04:21 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id e7so17606823pfn.12;
        Wed, 04 Nov 2020 08:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rVmMLmH0pv1Or7mop4vVyidMLuWQhjFDYpBrW8qc8sQ=;
        b=cyBHPehaqbF8zKr0J9zafPYw0XzrrvuVkbZv5zi//iEApBXDxpukvYS8qgDLfFkEmJ
         unvvpLypu8NqtsUr1SRK9nkwOn7DGcYr5D1rAvAPCfGxPCswBgOuQ7AULi4ZTr+1a6zR
         BjvM4vCGW032VGrOksSUw6eSBiBRdrNk3pmVdQ4qBsC0n0IOO9HTEWtDnYyd7f00ADox
         y7m/QiXbm9EpjWFMkCNwNwvqXLZm5iU/QOJKCTkceo+63EOt6LZUOme9Mae4lN907DVb
         ML7IdDi3SocuYfUr/8KkhMdn/dPszwQxg++in+u/OF9cNbK+vQplD5WIq4/uRNEuFWVf
         xOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rVmMLmH0pv1Or7mop4vVyidMLuWQhjFDYpBrW8qc8sQ=;
        b=HXUe6zzBftciL76LVcNRsYbppPWhno0Wt+OQwRhX57KqwUAOLIxsJ5ZLAiE8jP4/b6
         4gMoE4CMJ1czER7ndWBWrVjT4z0pH75AkNxxM1c/uoxWrWmrHzy3pzeMXU/jUJOTV7Hd
         fi2slb46V136LzXOoVKY3u8uBIS0IuNqK1qa9u6h8EtANLCzbYMXN6k4yAZKuDZ7OEWI
         GmV/hkuT5vj/WD+NdMtv0CcC3PQe4UE4o47OPJwpuoEKL57w8mVHZjaOf7jM5sLJ3gPE
         /gzpT3yEVRIKxWfc586jqZEX0+dyMQL+4lwgwj1mnzmA5gMBN0bX/Tsg9k9vqH6GGMTr
         994g==
X-Gm-Message-State: AOAM533c+7WslAo++2TA7gbpRiSXI8DMMDwutMPgjc4k1NrG0h+0lEq2
        w5ypizq6UQaXyGF+IiEt8PD+IJjOPgLnxg==
X-Google-Smtp-Source: ABdhPJyeKU07HoPrqhM+PimiBg/r9ROJPJ5WThLXmsO6FsTlR+RzAwHqx+1goUam859rvzpiCXOZ0g==
X-Received: by 2002:a17:90a:3f0f:: with SMTP id l15mr5235984pjc.190.1604505860845;
        Wed, 04 Nov 2020 08:04:20 -0800 (PST)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id q123sm2962661pfq.56.2020.11.04.08.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 08:04:20 -0800 (PST)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/4] pinctrl: amd: fix incorrect way to disable debounce filter
Date:   Thu,  5 Nov 2020 00:03:41 +0800
Message-Id: <20201104160344.4929-2-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201104160344.4929-1-coiby.xu@gmail.com>
References: <20201104160344.4929-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The correct way to disable debounce filter is to clear bit 5 and 6
of the register.

Cc: Hans de Goede <hdegoede@redhat.com>
Message-ID: <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
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

