Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD4B679D44
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jan 2023 16:20:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233895AbjAXPUi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Jan 2023 10:20:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232550AbjAXPUh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Jan 2023 10:20:37 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C69BD9016;
        Tue, 24 Jan 2023 07:20:33 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id r2so14211993wrv.7;
        Tue, 24 Jan 2023 07:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Lsg60nvZlEGJHZUjNzUpKHf3Vd8l4sYDLN1k8dpFYc=;
        b=Hb+jn0G/8M611T3NASyRbuvm6WKllLHxVL1tL1rEpv7brrLb0Hu6NTToNzv0tmzdeC
         JyaVBn6wQpjb343uNF/rERO2GC1ek3HJ+nRaxWnLIyEYmtt7tUE1PFwhNicKyqFpWfLm
         Sbfmh9iH8uaAZjkeIW692nwDXGcQWiJDUZKeMS9AMI/xMTZfoQv4Q7iOl91Wddji2pa5
         NqPbDh8/LtAnhzSrqAojhapIg8FxbSk/rfrvQB7CVo28gD77n1vAsuB0KU+Uf2K5ByI6
         /gL/XTwTShyrwGohsbsNeUHXqC0hBWjC2paRa1a85vRglY05W2s2yzK5Qw5fSgmhx510
         UKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Lsg60nvZlEGJHZUjNzUpKHf3Vd8l4sYDLN1k8dpFYc=;
        b=5DkOrQWyi+rIYedO2GF/H5/CxC7JMm2FFfCNvpJHPKYR1HpUCjU8d1UQKCb5x86it5
         W8YlMMzK9Gl1NBdKVVHM4uIAF0HKxYOOgE7NOPnOuUhHy8UdbWe8PX9l969So/scxPEV
         iAyTLfqY5YAUvHC921+eChPgVMoO0J0KgWJRxWN7VlmEvoF3dMFdLd/Qh5/fVAG9ylh3
         r+d7N8o3aZ5KHG0AA67H9Rjjl07zUJDRCTBbBVWwvoF3ncabeHQvJMliSGCmfSP9N2ar
         Po2c9NXjw4S3TxFigXsld03JXYH0B+DriJLJjyuwqa25t7guilQKeSZ9DttLwfQPfuWY
         lOmg==
X-Gm-Message-State: AO0yUKVBN0mzxowBxn/e9ZJsYPmEZSft8rvMV+tTjx1fjLs74OAIVeHP
        kdisuUYTyuZAHPx5N0fc7l94fjBc88Hq+w==
X-Google-Smtp-Source: AK7set+6/6FKuztBdvA1zYGewj8dNdEvHYeylIpxZhYsg1UYxByQrNAd9I2SzW1uQoCFDPnNhQsMsA==
X-Received: by 2002:a5d:5712:0:b0:2bf:b106:9f9b with SMTP id a18-20020a5d5712000000b002bfb1069f9bmr2123611wrv.10.1674573632243;
        Tue, 24 Jan 2023 07:20:32 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j12-20020a5d564c000000b002bdef155868sm1265459wrw.106.2023.01.24.07.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 07:20:31 -0800 (PST)
Date:   Tue, 24 Jan 2023 18:20:26 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Marek Vasut <marex@denx.de>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, Marc Zyngier <maz@kernel.org>,
        linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] gpio: mxc: Unlock on error path in mxc_flip_edge()
Message-ID: <Y8/3OlSVCK/0wQRj@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We recently added locking to this function but one error path was
over looked.  Drop the lock before returning.

Fixes: e5464277625c ("gpio: mxc: Protect GPIO irqchip RMW with bgpio spinlock")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpio/gpio-mxc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 6f673b2f2a1b..9d0cec4b82a3 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -249,10 +249,11 @@ static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 	} else {
 		pr_err("mxc: invalid configuration for GPIO %d: %x\n",
 		       gpio, edge);
-		return;
+		goto unlock;
 	}
 	writel(val | (edge << (bit << 1)), reg);
 
+unlock:
 	raw_spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
 }
 
-- 
2.35.1

