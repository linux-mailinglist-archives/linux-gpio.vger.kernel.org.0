Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 268FA300C7D
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 20:35:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729661AbhAVTVe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 14:21:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730133AbhAVTAP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 14:00:15 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFC18C061793;
        Fri, 22 Jan 2021 10:59:34 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id b26so8953352lff.9;
        Fri, 22 Jan 2021 10:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S4LSwqzDcpzMr0Zo2i9hZKPinlaZGaigjdHHgTDKS4A=;
        b=E2MNUaADdYPlaaQzE562gYZKSbv5qtwiuLlt9vI6lEImaaVRL1gcenHtVV9CSZjjZ6
         SkrG3nw+ONuigihKysXPjN0dlQRQaoEFJ7v5u5NtB4MMiWkvQnhHAxUXYgCw6WI7biy1
         lOPjUtozeiDth2Rlab1pVloWS/nNDzzrdV9U5UNtKvo3LguyVUadeNRN4Bb7pFd2LwMk
         yZBAwPQ67/GgMN1nB1Lf0fli1N7QgpFaiONazp1vFpzczfK3p18lD1IceTd3SABisK0f
         Rc8YJKpfJ2iJ1yUG2OttQJKI92Tgc9EhN+GCozLj5RtSyBrvjXz9Usxvf/w3IlyzFHkX
         KeXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S4LSwqzDcpzMr0Zo2i9hZKPinlaZGaigjdHHgTDKS4A=;
        b=FtaQ7EfqQOLRIZdbpjqKML7NtZlFwYMSyrpLwEhOM+ysafqw2aSkoD0kUO9ahKknzB
         BcjbwgllwG3gX0LsA8whGHk4G0tPP+N10edlROOb84mReZdpZLR6K2pFpPKhnLTNeRFq
         JbQ0GVF7sN/a6r75F55ni5sm43O5uNBRxyA5HNX5IgSk36953t48vQdx1f1BBq4gBLTF
         pgdiesA9ZvJPLN1zPVE5vphGzSmoOUj9AjnpPjxU4x3Z26FmD04FazhxtOL2yPtDZXwf
         aABSLSWKsLWKJDZ/0JhEaFoTuZ1DuuHMCN9Je2TxZIe8NJBI+YmKjKI7oA9EX+8dZccV
         iSvw==
X-Gm-Message-State: AOAM531jGx0Md1d17dsdFXkMBLLJCSfM7uEfyqgFKGO3r1Bjvy+K2LXp
        hxOGSoIudwiy5U3hh0RKQ2Q=
X-Google-Smtp-Source: ABdhPJw/AtXDmHd8xhzJvD1h8l7YE1RZ8arnDWxrdiZqxWedOJF1MYqsVHfrckg//Tef14sHZ4QOwQ==
X-Received: by 2002:a19:787:: with SMTP id 129mr906428lfh.540.1611341973568;
        Fri, 22 Jan 2021 10:59:33 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id 19sm994783lft.90.2021.01.22.10.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 10:59:33 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] gpio: tegra: Support building driver as a loadable module
Date:   Fri, 22 Jan 2021 21:55:43 +0300
Message-Id: <20210122185543.16554-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122185543.16554-1-digetx@gmail.com>
References: <20210122185543.16554-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Support building driver as a loadable kernel module. This allows to
reduce size of a kernel zImage, which is important for some devices
since size of kernel partition may be limited and since some bootloader
variants have known problems in regards to the initrd placement if kernel
image is too big.

$ lsmod
Module                  Size  Used by
gpio_tegra             16384  27

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/Kconfig      |  2 +-
 drivers/gpio/gpio-tegra.c | 15 +++++++++------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 1b0acca28c59..c3ce43cc4c31 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -594,7 +594,7 @@ config GPIO_TB10X
 	select OF_GPIO
 
 config GPIO_TEGRA
-	bool "NVIDIA Tegra GPIO support"
+	tristate "NVIDIA Tegra GPIO support"
 	default ARCH_TEGRA
 	depends on ARCH_TEGRA || COMPILE_TEST
 	depends on OF_GPIO
diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 1efd6fb642c7..0be24248280a 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -798,6 +798,7 @@ static const struct of_device_id tegra_gpio_of_match[] = {
 	{ .compatible = "nvidia,tegra20-gpio", .data = &tegra20_gpio_config },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, tegra_gpio_of_match);
 
 static struct platform_driver tegra_gpio_driver = {
 	.driver = {
@@ -807,9 +808,11 @@ static struct platform_driver tegra_gpio_driver = {
 	},
 	.probe = tegra_gpio_probe,
 };
-
-static int __init tegra_gpio_init(void)
-{
-	return platform_driver_register(&tegra_gpio_driver);
-}
-subsys_initcall(tegra_gpio_init);
+module_platform_driver(tegra_gpio_driver);
+
+MODULE_DESCRIPTION("NVIDIA Tegra GPIO controller driver");
+MODULE_AUTHOR("Laxman Dewangan <ldewangan@nvidia.com>");
+MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
+MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
+MODULE_AUTHOR("Erik Gilling <konkers@google.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.29.2

