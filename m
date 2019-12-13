Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B159411E433
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2019 14:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727127AbfLMNAi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Dec 2019 08:00:38 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53470 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbfLMNAi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Dec 2019 08:00:38 -0500
Received: by mail-wm1-f67.google.com with SMTP id w8so3047916wmd.3;
        Fri, 13 Dec 2019 05:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hGQ559nNApWoEp4fLc5NyKNERO/Sq7kGESc+bkuaG+E=;
        b=QQgXx6DE5LjdeVtTnBIQe9nt9t7LaQO6V22p5p6UYIcC2/0rR581hb0nImyJgvS3GJ
         sApUrqVcAIFt6iyE2mP8QOmDBdkf4PU6Crtg6IkFdVnm8CrsXqjuwe8+BDmN4bspL75r
         yZlHaaEF3ZyGdf4iNnFD7m2GovoQOWNuoiOmdpjxSE6DmWMzt5UqDLxEzkC54tU6Y9zk
         kZbPjR4oO/B4/Xgu2tc+f8TX7NE2udeIcIk+HjH7qYKbrbRlrBNP6zLXee/Ia8wPlQ0j
         V3SodMCCORbzz9LJo2z2T61zMUjPAzJTkqZ1waQyZ7cc5dyWpApiw244+XadelQK+ut8
         uarg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hGQ559nNApWoEp4fLc5NyKNERO/Sq7kGESc+bkuaG+E=;
        b=ZzUuGco0Cz4wzvus3uVpkcmDifgG5oej+JjvyH7giY+veHDazfiVfxGBqMjazuufJU
         erdnOT59F6E+zw4PEd17/FPoCdh50P5Ej0au8INRlTBk9pzlPymu3gBWQplbbjIivJxi
         RRj1OhVu4MZUKH4Cfd+wQG1HkKB6JmZBksNMdMuOBn95GcDWoSg8K4VIJGJRto6b4DR9
         gIPHu+PbBIGBErXsrjx/Lr+1javRX7v5S4Ff9ypIUuW50LyomA4QaQBLWVODbSrFGYO1
         vZnHDL4npE+4hM3bZ429se+2U4G8g65ZPTdmsL+7BCejGw/bVRH4c9kk8bcRO2yPwdlv
         ZJug==
X-Gm-Message-State: APjAAAXo1JLQjJ/hnKVuL2FsX9YqBdJZRPSm9GpamBObgN8NRLq8DclL
        lI2oPWunwVMcX8HcsB+88ow=
X-Google-Smtp-Source: APXvYqzGWiJNVe20i3lvFUHW03jcuaoVdCetWWs71pgtS8wrZm2oLQ5+sa8e99ajGOeQWGyObv0FPQ==
X-Received: by 2002:a7b:cc82:: with SMTP id p2mr13780915wma.159.1576242036673;
        Fri, 13 Dec 2019 05:00:36 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id s1sm10109546wmc.23.2019.12.13.05.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 05:00:35 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH] gpio: tegra186: Allow building on Tegra194-only configurations
Date:   Fri, 13 Dec 2019 14:00:34 +0100
Message-Id: <20191213130034.219227-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The driver is compatible with both Tegra186 and Tegra194, but currently
it cannot be selected if only Tegra194 support is enabled. Allow builds
with only Tegra194 support enabled to select this driver.

While at it, select this driver by default on Tegra194 builds because it
is an essential part of the system.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Note: One other option would be to simplify this and depend only on
ARCH_TEGRA, like we do for GPIO_TEGRA. This has the slighty disadvantage
that it will be built by default on all Tegra platforms, so it will end
up unused in many cases.

For now, I decided to just add the Tegra194 SoC configuration to the
conditionals, but it might be worth reconsidering the above-mentioned
simplification if this driver is applicable to any other future chips.

Thierry

 drivers/gpio/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8adffd42f8cb..6ab25fe1c423 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -553,8 +553,8 @@ config GPIO_TEGRA
 
 config GPIO_TEGRA186
 	tristate "NVIDIA Tegra186 GPIO support"
-	default ARCH_TEGRA_186_SOC
-	depends on ARCH_TEGRA_186_SOC || COMPILE_TEST
+	default ARCH_TEGRA_186_SOC || ARCH_TEGRA_194_SOC
+	depends on ARCH_TEGRA_186_SOC || ARCH_TEGRA_194_SOC || COMPILE_TEST
 	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN_HIERARCHY
-- 
2.23.0

