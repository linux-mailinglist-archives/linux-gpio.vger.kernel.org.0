Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87DE03D867C
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 06:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233766AbhG1ENH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 00:13:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbhG1ENB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 00:13:01 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DE73C061760;
        Tue, 27 Jul 2021 21:12:59 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id z4so788584wrv.11;
        Tue, 27 Jul 2021 21:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fF9kCZueCn/Jy3XohS/GJeKg6N20SNc6dZuJtInQBpc=;
        b=RTWajS/wlEmJgWECwbC2Qp5975wElCwcTtqNyz5LPQyGlXNxkVONyH81yoHKRZJCmD
         JmkGvXa9LsUd5IOFI6+7QFGj2Z5yV31jzdiebUZTFH+Fc0dKdwL1Dn7uawJUO4/sUyGt
         AETCf9UbN+eoXbY50uKvYj6ZWvDqJIqiatDBopdAsGQd7Io7E6dyMhQOo4/iriHCSuJ7
         J0AM2oB42248mdHsLUzJSG0DFt0a4ewquJVLc2w6t/0PYU2380pjGmnNNpLARWzuXFFr
         m3L8zdnhPf+yn7J/H7oPI/wyv+XMwhX2O2fhvz47Wp8bIPwnLc1Hr6kquLDQtqjH62UP
         mAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fF9kCZueCn/Jy3XohS/GJeKg6N20SNc6dZuJtInQBpc=;
        b=UljYj0TnT7XO2O1fARe53jEa34J9uD92DBgSIjF2A72l2tUtKDfykVXLwQvpXjzmEO
         Z7F9aGe/6k2r72YIo5FxCKuviYtUH9QqI0SXK1idcjqOuJivc89lB9O47lC0l0y2iJsD
         8xlKL/VtfTyIV2AseWxSxIeuID1M399xFka5tCJTsodxeNNzIakTIuAnoYbj8u+mLJVZ
         mLVkIn3T3h8Mv4hT7ozcz6IWz823S6n/pXrspAej2n90EzPnoVDrHF0VMzbvcrO2WZPn
         bEww+lrjZnsu9ozxXHXIoBtNzXslgUUZLHMdr6qFtBsDv/THdZS3fCon/JDqHRzw93eO
         9Xig==
X-Gm-Message-State: AOAM5306WHhGhHlsb1y/arwnwxtN055Uv6hs2RVy8rgpELrjwXlLF9Zq
        4m8YGgAb9ERoXELbCnRihOXG5NV2Dyl6EVct
X-Google-Smtp-Source: ABdhPJzuvACBda/zdszRKBSYZH7iOQpCKSJvtV8u7ZUDTc/ghOQOA4a28JtBIJ3XWdOCA9fvd+TcNQ==
X-Received: by 2002:a5d:5987:: with SMTP id n7mr27773809wri.263.1627445577955;
        Tue, 27 Jul 2021 21:12:57 -0700 (PDT)
Received: from localhost.localdomain (189.red-83-51-242.dynamicip.rima-tde.net. [83.51.242.189])
        by smtp.gmail.com with ESMTPSA id e6sm6274184wrg.18.2021.07.27.21.12.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Jul 2021 21:12:57 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, gregory.0xf0@gmail.com,
        bgolaszewski@baylibre.com, f.fainelli@gmail.com,
        matthias.bgg@gmail.com, opensource@vdorst.com,
        andy.shevchenko@gmail.com, git@johnthomson.fastmail.com.au,
        neil@brown.name, hofrat@osadl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] gpio: mt7621: support gpio-line-names property
Date:   Wed, 28 Jul 2021 06:12:52 +0200
Message-Id: <20210728041253.15382-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728041253.15382-1-sergio.paracuellos@gmail.com>
References: <20210728041253.15382-1-sergio.paracuellos@gmail.com>
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

