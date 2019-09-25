Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18C93BE596
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2019 21:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439954AbfIYTWe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Sep 2019 15:22:34 -0400
Received: from atlmailgw2.ami.com ([63.147.10.42]:64000 "EHLO
        atlmailgw2.ami.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbfIYTWd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Sep 2019 15:22:33 -0400
X-AuditID: ac10606f-371ff7000000187d-cf-5d8bbe782d8d
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com [172.16.96.144])
        (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id 8B.7C.06269.87EBB8D5; Wed, 25 Sep 2019 15:22:33 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 25 Sep 2019 15:22:32 -0400
From:   Hongwei Zhang <hongweiz@ami.com>
To:     Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, Joel Stanley <joel@jms.id.au>
CC:     Hongwei Zhang <hongweiz@ami.com>, <devicetree@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Doug Anderson <armlinux@m.disordat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Russell King <linux@armlinux.org.uk>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [v2, 2/2] gpio: dts: aspeed: Add SGPIO driver
Date:   Wed, 25 Sep 2019 15:22:17 -0400
Message-ID: <1569439337-10482-3-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569439337-10482-1-git-send-email-hongweiz@ami.com>
References: <1569439337-10482-1-git-send-email-hongweiz@ami.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA02RbUhTYRzFee69u7vOZtcl9KAlNXoBU1cS+ZAhToge+hB+jMj0khcdTSeb
        zSzKZfm2wsSXcmO+pA5hDcJJFMuVThFdw2XiUhEJliUI6jSTmlJtM/DbOZzfOf8Pf4aU9FKx
        jKKohFcXcUopLaKsbG59Utm7R9knvw1GItNLK43skwz6s/oWoM33RgHabhgRogqni0Y/Wl0U
        ah8eF6CAZ5tETVs9BLL5vAL04MU4ifratwCatJto5Gx2AGT+PEGglbVaAlU6hoVouklHI8f8
        OsiIwVPVdiG2tlkBnvROkDjwuwHglelKIZ7wj5DYZqml8Zy3n8ajLQEK13cOANzXXY49Lc8B
        3r6/IcSjzzYpvG6Lz9p7RXQuj1cqtLxalp4rKvB4N6jiMdEtz8NEHZhj9CCCgexpuNBdIdQD
        ESNh7QRc9nTRYTMEYG/1FBmkaPYYdPSZiGAQwz4BsMPUGjIk+0oAXw9UCILUPvYMNLc8FQY1
        xR6F024zFdRiNgMON8yA8L14ODNeG1qNYOXQ0zYf0pJ/jN0Q2OGj4Zjha0iTLISDi4s7zEE4
        6/QR4Z1D8Hudj6oHrHFXxbir0gEIC5BwJcpCTqHML01J5goVyddVhTYQfqvqDfD7U52AYIAT
        QIaUxoiNB/TZEnEeV3abV6ty1DeVvMYJ4hhKul9ssf68KmHzuRL+Bs8X8+r/KcFExOqA8/D5
        Dm90naa8332pK3J51W2W5nRlx8ma5XeSfLNnldfSopaOpMusjaqeqONVinsfOf1FLNqqTlvU
        DiYuRV0wDWldVaWGtSr5ngFfZmfjgqxc+0knycvMYg0fEmpS/MZfkr2+mhPypbtpbaYsl/my
        xa1LVX7Jly5bimLrHkspTQF3KoFUa7i/wVaWXMQCAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add SGPIO driver support for Aspeed AST2500 SoC.

Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
---
 drivers/gpio/Kconfig             |  8 ++++++++
 drivers/gpio/Makefile            |  1 +

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index bb13c26..e94f903 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -120,6 +120,14 @@ config GPIO_ASPEED
 	help
 	  Say Y here to support Aspeed AST2400 and AST2500 GPIO controllers.
 
+config SGPIO_ASPEED
+	bool "Aspeed SGPIO support"
+	depends on (ARCH_ASPEED || COMPILE_TEST) && OF_GPIO
+	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
+	help
+	  Say Y here to support Aspeed AST2500 SGPIO functionality.
+
 config GPIO_ATH79
 	tristate "Atheros AR71XX/AR724X/AR913X GPIO support"
 	default y if ATH79
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index a4e9117..bebbd82 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -32,6 +32,7 @@ obj-$(CONFIG_GPIO_AMD_FCH)		+= gpio-amd-fch.o
 obj-$(CONFIG_GPIO_AMDPT)		+= gpio-amdpt.o
 obj-$(CONFIG_GPIO_ARIZONA)		+= gpio-arizona.o
 obj-$(CONFIG_GPIO_ASPEED)		+= gpio-aspeed.o
+obj-$(CONFIG_SGPIO_ASPEED)		+= sgpio-aspeed.o
 obj-$(CONFIG_GPIO_ATH79)		+= gpio-ath79.o
 obj-$(CONFIG_GPIO_BCM_KONA)		+= gpio-bcm-kona.o
 obj-$(CONFIG_GPIO_BD70528)		+= gpio-bd70528.o
-- 
2.7.4

