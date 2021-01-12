Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 434722F31C0
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Jan 2021 14:31:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727305AbhALNbB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jan 2021 08:31:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727203AbhALNbB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jan 2021 08:31:01 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7C71C061575;
        Tue, 12 Jan 2021 05:30:20 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id f11so2821236ljm.8;
        Tue, 12 Jan 2021 05:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1tBrEmrNL7DhkzlrYoGObtf/1sHRg3FkyKyrUC6Mlec=;
        b=tC2QrZ2mPJ1t4HmltKvpezHworgWx1ZN/BlpudndmQGANsBsqf0vCHDIHIoyZ7/NpN
         yv/EBupfZ+WI0lm53cjUdPX3oYNAze8FYqH99SmJUF4MPymZHM/zt/liVFvkSOOyCI9Y
         NMR7VWNouxmt8r6BFbiYhxgdLhpo8yq8LOhcnuSbJq4HHhZkuSvw/rYc79tEmeR1rbUV
         fmicVyDnm1buO2MED3mbIAIfHK2sPKtKo9tjsviM5NIDCzAY2A8Nc/daKmNGMt1Le64l
         AdIZI1Qawz5vSwgKAurBQ/9JDzOwisv4VqUIaaDT++tuch0nrU2cPqcwRDR7KxRQc64d
         o0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1tBrEmrNL7DhkzlrYoGObtf/1sHRg3FkyKyrUC6Mlec=;
        b=ow9KHeQm7aLLiEyVXxicMUoy5BGBzmAcfBbUyqv49/vz44lMSeUWkShiMVY1tE1Nhd
         Tyn+WgwJEt23y5PiIve2JfsAeL0wDLIrdHEh3KtJq27aJI0Jb4OMDymce5YJvMR8WmUh
         sONgh16wB+wrdZzgmeLHeHtuI5ah0+Tps9YP0kkA5wwTZbsp4pZ339ZiS43hb0+1lNqm
         iOhA6RJ1jM/RPrbgwo+TBlFUdFS+SNOZzbRcIWJ0sTjN8Z1kNsbDy3pP4nfnb9aoV9X9
         VUeC8UFEaQrVeFvydRrFZDqrVVM4hiA2/GfYoIErfho4Zb9acBPQGhdjfbF0PmNai8Lv
         5Abw==
X-Gm-Message-State: AOAM532PNMFTjSRVqMVKDVd5zH8k2e+imDvh75JklxNf4jz2RQyavukq
        3WuddZhqxh779s05drKq54E=
X-Google-Smtp-Source: ABdhPJz9QWQQq6DpILyijCAdUx7IVDkQtqMZzfZ9zygtaSOVDlZ5mbUnFtx9IyCp7dzoUvt5cUeM7w==
X-Received: by 2002:a2e:9847:: with SMTP id e7mr2056825ljj.388.1610458219308;
        Tue, 12 Jan 2021 05:30:19 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u30sm394042lfc.238.2021.01.12.05.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 05:30:18 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matt Merhar <mattmerhar@protonmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] gpio: tegra: Fix wake interrupt
Date:   Tue, 12 Jan 2021 16:30:09 +0300
Message-Id: <20210112133010.21397-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The GPIO bank wake interrupt setting was erroneously removed after
conversion to gpio_irq_chip, thus the wake interrupt programming is
broken now. Secondly, the wake_enb of the GPIO driver should be changed
only after the successful toggling of the IRQ wake-state. Restore the wake
interrupt setting and the programming order.

Fixes: efcdca286eef ("gpio: tegra: Convert to gpio_irq_chip")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-tegra.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index b8a4fd07c559..6c79e9d2f932 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -541,6 +541,7 @@ static int tegra_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
 	struct tegra_gpio_bank *bank;
 	unsigned int gpio = d->hwirq;
 	u32 port, bit, mask;
+	int err;
 
 	bank = &tgi->bank_info[GPIO_BANK(d->hwirq)];
 
@@ -548,14 +549,23 @@ static int tegra_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
 	bit = GPIO_BIT(gpio);
 	mask = BIT(bit);
 
+	err = irq_set_irq_wake(tgi->irqs[bank->bank], enable);
+	if (err)
+		return err;
+
+	if (d->parent_data) {
+		err = irq_chip_set_wake_parent(d, enable);
+		if (err) {
+			irq_set_irq_wake(tgi->irqs[bank->bank], !enable);
+			return err;
+		}
+	}
+
 	if (enable)
 		bank->wake_enb[port] |= mask;
 	else
 		bank->wake_enb[port] &= ~mask;
 
-	if (d->parent_data)
-		return irq_chip_set_wake_parent(d, enable);
-
 	return 0;
 }
 #endif
-- 
2.29.2

