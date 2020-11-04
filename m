Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DFE12A6514
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 14:27:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729942AbgKDN0s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 08:26:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729089AbgKDN0s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 08:26:48 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84131C0613D3;
        Wed,  4 Nov 2020 05:26:47 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id h6so27108798lfj.3;
        Wed, 04 Nov 2020 05:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fVnYeYzliliY5BsuwGfKGaldOY8rDQp+9hQYWemQsLc=;
        b=l1eTNNFEN4+w2i7yBBgkqaj+289N9TteLj6Rg2+nxfwPiPoHJHA3LSFyESHAw48Mpz
         Jm6tL1VzJWYKSd+3botuUMUaLA3apJ0FpATqc+OedTt1CyXtk2aWkC1iQkZC0u0y32yA
         9Lw7HYRM9rxo7e3oYBPU6UgAmFMhMPAST9DBcfEsTNLwzZ2YIrcgvHva3x/CmeE051UQ
         AxwxMmKEoRtrdnbyAgkP2sAWk8jDUjeiAVKIP/IfDwUW1Tx+XTw1+AFG0vV9UIMdECBS
         0TxnDS1m0NbAy9XCJNsPmZfdOwCqepQX+ytcuOZCeNpAqyRE1knaskxuy85/ED/2YoUg
         IWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fVnYeYzliliY5BsuwGfKGaldOY8rDQp+9hQYWemQsLc=;
        b=Oa85xq4rUs8z8A5ucUgMABolwq9dAVdSn3pbOQCpN8p9Zssmx4heOtLFRaX8fwjFjy
         B0AJHbUv5zOTUJeonFtjKbqdY5RV0FFWeznTtiXOl/EOhc/lyjXPqIjtiSfnE5aGzsuS
         FTYiaUaGDObX9pnmy7kX7SMDuKtvOFh92crm8DAh8DcjBLUKy7aSCqTVxhIugrMvNTUV
         to2/jlTELyrIzz+KElujy31tr1MRDAqHpeAR5oEWMQZe5NUEqG6AZ/JVBdPcM3QBhPMd
         q9+XNR03ieudeYVEFj/Xb2WK9hg37qNMzr7o6ADoHEH97KzpnBCXwDF6244KkEredfE6
         R/Aw==
X-Gm-Message-State: AOAM531deC++PJPGNwQd7uTurWMe9NQ1rrUUysz9DmFHO9g/1o2O1hqT
        2GxmIRM3dhDIjElQIv8e80C2+UBj/rU=
X-Google-Smtp-Source: ABdhPJxmfzZFf3IT4zGgwTQY+FMZOv6cypSydER/UAZe3j0NgPcIGktaRqUS5+8KNooyqmTWwZ/UwA==
X-Received: by 2002:ac2:48bb:: with SMTP id u27mr8838590lfg.516.1604496406041;
        Wed, 04 Nov 2020 05:26:46 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru. [109.252.192.83])
        by smtp.gmail.com with ESMTPSA id 82sm409715lfb.12.2020.11.04.05.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 05:26:45 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] gpio: tegra: Use raw_spinlock
Date:   Wed,  4 Nov 2020 16:26:24 +0300
Message-Id: <20201104132624.17168-2-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104132624.17168-1-digetx@gmail.com>
References: <20201104132624.17168-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use raw_spinlock in order to fix spurious messages about invalid context
when spinlock debugging is enabled. This happens because there is a legit
nested raw_spinlock->spinlock locking which debug code can't recognize and
handle.

 [ BUG: Invalid wait context ]
 ...
  (dump_stack) from (__lock_acquire)
  (__lock_acquire) from (lock_acquire)
  (lock_acquire) from (_raw_spin_lock_irqsave)
  (_raw_spin_lock_irqsave) from (tegra_gpio_irq_set_type)
  (tegra_gpio_irq_set_type) from (__irq_set_trigger)
  (__irq_set_trigger) from (__setup_irq)
  (__setup_irq) from (request_threaded_irq)
  (request_threaded_irq) from (devm_request_threaded_irq)
  (devm_request_threaded_irq) from (elants_i2c_probe)
  (elants_i2c_probe) from (i2c_device_probe)
 ...

Tested-by: Peter Geis <pgwipeout@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-tegra.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 98fc78739ebf..74a13534b9e4 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -61,8 +61,8 @@ struct tegra_gpio_info;
 struct tegra_gpio_bank {
 	unsigned int bank;
 	unsigned int irq;
-	spinlock_t lvl_lock[4];
-	spinlock_t dbc_lock[4];	/* Lock for updating debounce count register */
+	raw_spinlock_t lvl_lock[4];
+	raw_spinlock_t dbc_lock[4];	/* Lock for updating debounce count register */
 #ifdef CONFIG_PM_SLEEP
 	u32 cnf[4];
 	u32 out[4];
@@ -242,12 +242,12 @@ static int tegra_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,
 	/* There is only one debounce count register per port and hence
 	 * set the maximum of current and requested debounce time.
 	 */
-	spin_lock_irqsave(&bank->dbc_lock[port], flags);
+	raw_spin_lock_irqsave(&bank->dbc_lock[port], flags);
 	if (bank->dbc_cnt[port] < debounce_ms) {
 		tegra_gpio_writel(tgi, debounce_ms, GPIO_DBC_CNT(tgi, offset));
 		bank->dbc_cnt[port] = debounce_ms;
 	}
-	spin_unlock_irqrestore(&bank->dbc_lock[port], flags);
+	raw_spin_unlock_irqrestore(&bank->dbc_lock[port], flags);
 
 	tegra_gpio_mask_write(tgi, GPIO_MSK_DBC_EN(tgi, offset), offset, 1);
 
@@ -334,14 +334,14 @@ static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	spin_lock_irqsave(&bank->lvl_lock[port], flags);
+	raw_spin_lock_irqsave(&bank->lvl_lock[port], flags);
 
 	val = tegra_gpio_readl(tgi, GPIO_INT_LVL(tgi, gpio));
 	val &= ~(GPIO_INT_LVL_MASK << GPIO_BIT(gpio));
 	val |= lvl_type << GPIO_BIT(gpio);
 	tegra_gpio_writel(tgi, val, GPIO_INT_LVL(tgi, gpio));
 
-	spin_unlock_irqrestore(&bank->lvl_lock[port], flags);
+	raw_spin_unlock_irqrestore(&bank->lvl_lock[port], flags);
 
 	tegra_gpio_mask_write(tgi, GPIO_MSK_OE(tgi, gpio), gpio, 0);
 	tegra_gpio_enable(tgi, gpio);
@@ -675,8 +675,8 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 						 tegra_gpio_irq_handler, bank);
 
 		for (j = 0; j < 4; j++) {
-			spin_lock_init(&bank->lvl_lock[j]);
-			spin_lock_init(&bank->dbc_lock[j]);
+			raw_spin_lock_init(&bank->lvl_lock[j]);
+			raw_spin_lock_init(&bank->dbc_lock[j]);
 		}
 	}
 
-- 
2.27.0

