Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 638433D7998
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 17:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236860AbhG0PUq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 11:20:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236848AbhG0PUc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jul 2021 11:20:32 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B97AC061757;
        Tue, 27 Jul 2021 08:20:32 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id n21so7829787wmq.5;
        Tue, 27 Jul 2021 08:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fF9kCZueCn/Jy3XohS/GJeKg6N20SNc6dZuJtInQBpc=;
        b=DgHlWin2WuK0dY2Acl+41XD7r+nmM2VFzDR6yW4G1It4PsUM1TWb+kxFaScXFIW6S3
         h++ek1rzpJvaSmYA7y1B8cop5UjKNS6UMnTVwWfFkwxLFmQ4LMQhVtgepDxgmxqhYCTI
         l+92mZcJ2h0J/lONVWeZj4KuLcTV8md9UdggK/Odwr8wo4YGUJNtWmtjbQkW4TRSw9Ev
         E7g9Q5s/D8V9vw6vNRYEpDefylODmz/IDhauADhhLBiCThc9tVvnflMND2omn9EELS1x
         KaHGphQL8wGtYBBV13Nd+QglHMNt2gySlyKCSVh5mYY9MQo8sX7CEMisBpkDNUhQ3WxP
         4lNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fF9kCZueCn/Jy3XohS/GJeKg6N20SNc6dZuJtInQBpc=;
        b=ehyHi76C9RcmNhH+GtKtHUNV/1H2Yby73e/NpPHYrfo6Ihz7UUX9d87R4GUFkD6v/q
         YFF51W4+C67KESRE1GB9SzMkRuG+vBlqTOFUckXdpHkXlB8JQGasepXg1Fv2/CFrpWKD
         rvKwcZQ+qTFXbDZcZHg1CddokfRkdJQ5sm0Pe010Kd/UpCU+B0QrOJ710lKEE/6eumyI
         1ly1WrzHCdnkZL6KHn9X1N79f0Edeufrj6U6W1t15MUgvXakQW8PDJAR04fWJ1LLTSDf
         404qDfZVIE/fhgi7eswtJNEFpWZ9vtWRPEtnJ9R4Tg/RAfTGTip+8CM5RiNwDU9sv81d
         oYig==
X-Gm-Message-State: AOAM53094qyzcP2azD5z+t2PflwmJnahFzU9EvI05jbiS4DiCwwpiY6M
        5a6dAxLkqhe2CSubO4qN7P3iJADRcmzAJ/tI
X-Google-Smtp-Source: ABdhPJydpmb6LagxYHNdn4jM7Q6Rs4EhM2aFjcSxsebf2eJJZWnBlr1BhvCrBNSPWnFTQaat8mnlqQ==
X-Received: by 2002:a05:600c:4141:: with SMTP id h1mr22577539wmm.83.1627399230443;
        Tue, 27 Jul 2021 08:20:30 -0700 (PDT)
Received: from localhost.localdomain (189.red-83-51-242.dynamicip.rima-tde.net. [83.51.242.189])
        by smtp.gmail.com with ESMTPSA id w185sm3372393wmb.11.2021.07.27.08.20.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Jul 2021 08:20:30 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, gregory.0xf0@gmail.com,
        bgolaszewski@baylibre.com, f.fainelli@gmail.com,
        matthias.bgg@gmail.com, opensource@vdorst.com,
        andy.shevchenko@gmail.com, git@johnthomson.fastmail.com.au,
        neil@brown.name, hofrat@osadl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] gpio: mt7621: support gpio-line-names property
Date:   Tue, 27 Jul 2021 17:20:25 +0200
Message-Id: <20210727152026.31019-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727152026.31019-1-sergio.paracuellos@gmail.com>
References: <20210727152026.31019-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver uses multiple gpiochip banks per device. To support
'gpio-line-names' along the banks 'offset' for each bank must be
set explicitly.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/gpio/gpio-mt7621.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index 82fb20dca53a..5854a9343491 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -241,6 +241,7 @@ mediatek_gpio_bank_probe(struct device *dev,
 	if (!rg->chip.label)
 		return -ENOMEM;
 
+	rg->chip.offset = bank * MTK_BANK_WIDTH;
 	rg->irq_chip.name = dev_name(dev);
 	rg->irq_chip.parent_device = dev;
 	rg->irq_chip.irq_unmask = mediatek_gpio_irq_unmask;
-- 
2.25.1

