Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CEBB3BF5F2
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jul 2021 09:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbhGHHH0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Jul 2021 03:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230442AbhGHHHR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Jul 2021 03:07:17 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8916C061762;
        Thu,  8 Jul 2021 00:04:35 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id f17so6118721wrt.6;
        Thu, 08 Jul 2021 00:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tNTInr5IxLa0v7wLilD1mcRTGKqtOCNhhjsXECS7NAM=;
        b=i4Dg+LJaiQMGqhyyUKyrEmb6dSSY274TTdFXoaZgUiT7aXCQHuTs4GLMqHfN+HwOh9
         QGcGpOXVavm/bjH5hfJNQX/rmP8z1iiTL+h5CSDsT5pXSITZUXTrAaIManekzaGJ2qdY
         xJx3jn38/Rip5KMj8x3bq4wU6pzG3+hkSKQZRlXzWJ7DGX9MxFoIDYFN9PzJCsuMnMPb
         T6BmzngO94C2UBYElE4pEa5Ap5gi2OHaY40M5I8BQxeIw7E6oTJ+d4YOJB8OkJOrfkJF
         Y/LyFukavxgm33QbXCrTQCxNAkWELi+bdGQVUsMM0ajWwO+e0ec5hzBDUfYBPuXbUS4u
         7xtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tNTInr5IxLa0v7wLilD1mcRTGKqtOCNhhjsXECS7NAM=;
        b=OBuCw0zRruwikJgvsOLEh7Xlzr2jaBk+ri/McIYkBGmrluwlgrcWz5FvtREfY42XGJ
         u0N38MJ2x09/hl2pg/1h2K9y0SacBMyLkOHRcp30xzK6U74v9c5gvHfS4D7KRPrRMc5A
         vhHE9wQ5+Dqoh3ae29qDvJnvcLH9G/Jcvl5qOqH33RgAwCSlEmKxTVeV13IxSBUR7sD/
         qLKieeRoHFFBJ8jfF6n1uYKa2Cbtfr3vqlMRnAbJ+UeuX6GJhtq47vbSN7SPEBpkuvvo
         w5tInod0ndgmnCeigNM/BfJFVHUyl2rI84cY90IqWcRdVFGoKG+/ePE68RIO+O8Vke0f
         R0QA==
X-Gm-Message-State: AOAM532VOq6hDUAqhi2zkAwaeajsnxoN3GV9DXALaEnij25wlQk+JmpZ
        HlxkBqvAJGiWbV/uNK2WXUNkkVpL+HHHjA==
X-Google-Smtp-Source: ABdhPJzwc7jUz4l6lCr6vRLP7M5sCIq1Nl4php9uprqZPIU5nxSk/qywCKNlfOhKLVeiVYTs13f/kw==
X-Received: by 2002:a5d:4e43:: with SMTP id r3mr32661749wrt.132.1625727874198;
        Thu, 08 Jul 2021 00:04:34 -0700 (PDT)
Received: from localhost.localdomain (98.red-81-38-58.dynamicip.rima-tde.net. [81.38.58.98])
        by smtp.gmail.com with ESMTPSA id u15sm8093305wmq.1.2021.07.08.00.04.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Jul 2021 00:04:33 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, gregory.0xf0@gmail.com,
        bgolaszewski@baylibre.com, f.fainelli@gmail.com,
        matthias.bgg@gmail.com, opensource@vdorst.com,
        andy.shevchenko@gmail.com, git@johnthomson.fastmail.com.au,
        neil@brown.name, hofrat@osadl.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] gpio: mt7621: support gpio-line-names property
Date:   Thu,  8 Jul 2021 09:04:28 +0200
Message-Id: <20210708070429.31871-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708070429.31871-1-sergio.paracuellos@gmail.com>
References: <20210708070429.31871-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver uses multiple gpiochip banks per device.
To support 'gpio-line-names' along the banks 'offset'
for each bank must be set explicitly.

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

