Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D405ABB186
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2019 11:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406204AbfIWJgm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Sep 2019 05:36:42 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33376 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405796AbfIWJgl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Sep 2019 05:36:41 -0400
Received: by mail-wm1-f68.google.com with SMTP id r17so14546990wme.0;
        Mon, 23 Sep 2019 02:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m+aIgC2O26A/R6e5uIh8ES0o+l1xiUCC4g3FQlcbNyo=;
        b=OJQVQVpOXj4aeIAidjTjTidN1NVBNgo6HbfhyOuSPSu6RG6XarThgbhHXM+Skq+Gwv
         T2spWv6pWWPwLIoFsJ2paUPPvLJLN6rdwrksaf5ySgUoGX+wD9N6XpjSlv8megs9E9Za
         fMtIuzm+p2M8D7rclQDJG12XIR3/DEUtPtNwKcMBKOWsim+VUyy28gmE3M0QZXZN60+M
         pG8w6wupBaGWH6HQPWhR2kbpTwEO0tQLI1emXdwa+mWx683OH1s8ap1X4qGYnlT2ph80
         2sGnh2cpZr44Je3BDtuioUD4dnidi6PNdHJAmTooK8e1bAQ6uOppi133Q23YaYC9QLJK
         /ymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m+aIgC2O26A/R6e5uIh8ES0o+l1xiUCC4g3FQlcbNyo=;
        b=MYKYtiMCHaZzY3Kqa/+c6R3yTOgbFNGooq0WGi0kKjnTahTul/KnvD7itdUWQcAWmo
         2mqRSuP6AEqC6Er1R7b5NwzEHrLElFJFCyr3LVMCFfVxE+omF19e4To7791pX0poa4UW
         i6FsqiE7kBFfHKF+c2JkUNU3AvTNmk66jb2Bh2R7E13WSZZGf+V7iDnvwwb627yLsW9h
         wZyXzvwNtZ5r7ZLPDm6pdmZf9fNUQifdQtHTyiX23lMG+LPjtMy+ouRRFo9w1R9x8pgI
         MTaAfFIFKYEOavbHOnb0ogcnhY0cg01HD2TYzx0ysFtXXwljOOArbahU8o4OGeVn4o9Z
         TDKQ==
X-Gm-Message-State: APjAAAXh+GD7pywG6Locp7x5CHQWGaZJFP0JM50XDS0C+xrEZZcFYCV0
        5AJ0ry/yxaVpwDwaKWcusBW2tZ1p
X-Google-Smtp-Source: APXvYqwSI1O3ShSG1d9cGh+twp85T9eIdqEIv2mrcm/4L5nXugqq+B/6MgwAJ1wNWRne7sIvXB5rCw==
X-Received: by 2002:a1c:7d8e:: with SMTP id y136mr12655806wmc.83.1569231399583;
        Mon, 23 Sep 2019 02:36:39 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id a13sm22071360wrf.73.2019.09.23.02.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 02:36:38 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH] pinctrl: tegra: Use of_device_get_match_data()
Date:   Mon, 23 Sep 2019 11:36:37 +0200
Message-Id: <20190923093637.27968-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Use the of_device_get_match_data() helper instead of open-coding.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
index 95002e3ecaff..6b6d027c6fd0 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
@@ -7,6 +7,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/phy/phy.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
@@ -872,7 +873,6 @@ int tegra_xusb_padctl_legacy_remove(struct platform_device *pdev);
 int tegra_xusb_padctl_legacy_probe(struct platform_device *pdev)
 {
 	struct tegra_xusb_padctl *padctl;
-	const struct of_device_id *match;
 	struct resource *res;
 	struct phy *phy;
 	int err;
@@ -885,8 +885,7 @@ int tegra_xusb_padctl_legacy_probe(struct platform_device *pdev)
 	mutex_init(&padctl->lock);
 	padctl->dev = &pdev->dev;
 
-	match = of_match_node(tegra_xusb_padctl_of_match, pdev->dev.of_node);
-	padctl->soc = match->data;
+	padctl->soc = of_device_get_match_data(&pdev->dev);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	padctl->regs = devm_ioremap_resource(&pdev->dev, res);
-- 
2.23.0

