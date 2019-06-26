Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5370256AF5
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 15:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbfFZNnN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 09:43:13 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:16977 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbfFZNnN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 09:43:13 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d13766e0000>; Wed, 26 Jun 2019 06:43:10 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 26 Jun 2019 06:43:12 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 26 Jun 2019 06:43:12 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 26 Jun
 2019 13:43:12 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 26 Jun 2019 13:43:12 +0000
Received: from moonraker.nvidia.com (Not Verified[10.21.132.148]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d13766e0000>; Wed, 26 Jun 2019 06:43:11 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <gregkh@linuxfoundation.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] gpio: tegra: Clean-up debugfs initialisation
Date:   Wed, 26 Jun 2019 14:42:58 +0100
Message-ID: <20190626134258.26991-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561556590; bh=1QvTJ+i/3pGnKJ2oaxpkTtqqpxbadolSu4kWtM0U694=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=J/x0Ye7ExrC6TisZTW7YFyP5eOHtbq6bPkc4xPfY6TlZ297vvLXvSo6+x+v15lcK+
         p9rIIZGLVOMUwE4NAKorbnbktdyHEFJH4t3ZjMRUtV+s2pWr3KS6feS8zeUmDDy0kN
         UwAogVzClCIxa+zYTZiko3LgAUibxelO7yzjxzWOghRjWLeH4mOQvknmHD3oPPqUej
         4pbKVxf0q32eNG/Q7O9U+AB5Tu0N/5F3UTkhcICC3FzcfarLIPgNJMR6yDm/CSORjF
         ijELy3w27uaqv5B7cOrS73NaY6RCRynGkzANXat/BDXGv4C+77q4xLDZvAUQhdebtB
         IilDGAgQAMguA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The function tegra_gpio_debuginit() just calls debugfs_create_file()
and given that there is already a stub function implemented for
debugfs_create_file() when CONFIG_DEBUG_FS is not enabled, there is
no need for the function tegra_gpio_debuginit() and so remove it.

Finally, use a space and not a tab between the #ifdef and
CONFIG_DEBUG_FS.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/gpio/gpio-tegra.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 0f59161a4701..59b99d8c3647 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -508,7 +508,7 @@ static int tegra_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
 }
 #endif
 
-#ifdef	CONFIG_DEBUG_FS
+#ifdef CONFIG_DEBUG_FS
 
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
@@ -538,19 +538,6 @@ static int tegra_dbg_gpio_show(struct seq_file *s, void *unused)
 }
 
 DEFINE_SHOW_ATTRIBUTE(tegra_dbg_gpio);
-
-static void tegra_gpio_debuginit(struct tegra_gpio_info *tgi)
-{
-	debugfs_create_file("tegra_gpio", 0444, NULL, tgi,
-			    &tegra_dbg_gpio_fops);
-}
-
-#else
-
-static inline void tegra_gpio_debuginit(struct tegra_gpio_info *tgi)
-{
-}
-
 #endif
 
 static const struct dev_pm_ops tegra_gpio_pm_ops = {
@@ -675,7 +662,8 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 		}
 	}
 
-	tegra_gpio_debuginit(tgi);
+	debugfs_create_file("tegra_gpio", 0444, NULL, tgi,
+			    &tegra_dbg_gpio_fops);
 
 	return 0;
 }
-- 
2.17.1

