Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DCC22A6511
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 14:26:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729787AbgKDN0r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 08:26:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729089AbgKDN0r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 08:26:47 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E6FDC0613D3;
        Wed,  4 Nov 2020 05:26:46 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id 11so3397398ljf.2;
        Wed, 04 Nov 2020 05:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p/FZImScqZ2Ir9kpVpIAqsDk+Y2Vxk6wtqjcKHY6zIo=;
        b=F9g0EG+8zR2NYJrImIcDQGZbG7MXyErEFMGsBf/I9p3sHAWX5ZSv/Fg6H+Yr+Ad8tC
         WFB3lYP06K16ybBL0BIyB7jcu+XnNfA5EMpeqEAynhIQM74e9xTxJRiqTdwiyKpXhnSb
         lqIGVvPNkmsQ8AbCGZIEdcMxIXK5quvXMlAJHCnOwvDD99n/dp78kxwjZ6NfxgY3r4f6
         jCnjHzv4UK89GuEwlfS8YQG0MOrDZG6ekZjjD92jxlOIWiM1u3dCLd2k9r9ZhoGIPXiy
         +I62eXd4cW7FuymezvaaIYy0tyTZ3XUOKmgCA4NWCo/YMzAtCtUD8VFLinlw82QdalRe
         oRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p/FZImScqZ2Ir9kpVpIAqsDk+Y2Vxk6wtqjcKHY6zIo=;
        b=WkAzOC8m+8uAz4AHFWIReDK0ruVfGH/q21o80wFwpYY4rZg3zLRWKvwcZXottCmdqw
         5fHbiIbu2A1URDcW1OyuVmvx84PxVZnUnfXMbzc+bla1w3nkh2ghkSEereRc6+a+R90r
         lu1Sg0VkeCh5zZh5iARuoBext6KFxcudei1JHkwXZ3DYAyOovsyc4E93hLQ6zXEUd8d6
         hsu0Qz1lxTQ00ZcBECaZ6zptn8ltmkpewnqiuPuXq4U+7uRDoX6he8A9sXarRXvmTHF+
         8nt7r/QUtkKMzoajvGWIUZAQrtYQ3DtD4GSpMegzdrrMmvIPCWRIqbK8IXWJhQCIJCRg
         U5TQ==
X-Gm-Message-State: AOAM532iRrRDR0BC6r4HDsVSRL4HR1hBEW3Yl/FUN8SO0OgnoDfncQcE
        /yTlpbcuCtV7H68tG/aBLZ4=
X-Google-Smtp-Source: ABdhPJxPrkm3OjW3KcWzFwCqoyXjeoysOxLSdStk0TzFZNuC/QQ0qxmYkRVTKBN/Om1BMw+D6DnoxA==
X-Received: by 2002:a2e:5742:: with SMTP id r2mr923779ljd.161.1604496405114;
        Wed, 04 Nov 2020 05:26:45 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru. [109.252.192.83])
        by smtp.gmail.com with ESMTPSA id 82sm409715lfb.12.2020.11.04.05.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 05:26:44 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] gpio: tegra: Add lockdep class
Date:   Wed,  4 Nov 2020 16:26:23 +0300
Message-Id: <20201104132624.17168-1-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add lockdep class in order to fix debug warnings that are coming from a
legit nested use of irq_set_irq_wake() by the Tegra GPIO driver.

 WARNING: possible recursive locking detected
 ...
  (irq_set_irq_wake) from (tegra_gpio_irq_set_wake)
  (tegra_gpio_irq_set_wake) from (irq_set_irq_wake)
  (irq_set_irq_wake) from (brcmf_sdiod_intr_register [brcmfmac])
 ...

Tested-by: Peter Geis <pgwipeout@gmail.com>
Reported-by: Peter Geis <pgwipeout@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-tegra.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 86568154cdb3..98fc78739ebf 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -560,6 +560,9 @@ static const struct dev_pm_ops tegra_gpio_pm_ops = {
 	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_gpio_suspend, tegra_gpio_resume)
 };
 
+static struct lock_class_key gpio_lock_class;
+static struct lock_class_key gpio_request_class;
+
 static int tegra_gpio_probe(struct platform_device *pdev)
 {
 	struct tegra_gpio_info *tgi;
@@ -661,6 +664,7 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 		bank = &tgi->bank_info[GPIO_BANK(gpio)];
 
 		irq_set_chip_data(irq, bank);
+		irq_set_lockdep_class(irq, &gpio_lock_class, &gpio_request_class);
 		irq_set_chip_and_handler(irq, &tgi->ic, handle_simple_irq);
 	}
 
-- 
2.27.0

