Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A84F9BD24C
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2019 21:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441821AbfIXTCq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Sep 2019 15:02:46 -0400
Received: from atlmailgw2.ami.com ([63.147.10.42]:61772 "EHLO
        atlmailgw2.ami.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436864AbfIXTCq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Sep 2019 15:02:46 -0400
X-AuditID: ac10606f-35bff7000000187d-96-5d8a68556f82
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com [172.16.96.144])
        (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id 00.0A.06269.5586A8D5; Tue, 24 Sep 2019 15:02:45 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 24 Sep 2019 15:02:45 -0400
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
Subject: [v1, 0/1] gpio: dts: aspeed: Add SGPIO driver
Date:   Tue, 24 Sep 2019 15:02:20 -0400
Message-ID: <1569351740-6285-2-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569351740-6285-1-git-send-email-hongweiz@ami.com>
References: <1569351740-6285-1-git-send-email-hongweiz@ami.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRmVeSWpSXmKPExsWyRiBhgm5oRlesQecNS4s569ewWey6zGHx
        /8NuRovv+2exWvyddIzdounQKTaLL3NPsVjMP3KO1eL3+b/MFlP+LGey2PT4GqtF8+pzzBab
        5/9htLi8aw6bxaGpexktll6/yGTx/lMnk0Xr3iPsFjemNLBZ7L33mdFBxONq+y52jzXz1jB6
        XL52kdnj969JjB7vb7Sye1z8eIzZY9OqTjaPO9f2sHmcmPGbxWPCogOMHpuX1Hucn7GQ0eNv
        41d2jxPTv7N4fN4kF8AfxWWTkpqTWZZapG+XwJUxcct+5oL3YhXzP0xnbmCcJ9TFyMkhIWAi
        sfNRO1sXIxeHkMAuJolDJ58zQziHGSUWfz7AAlLFJqAmsXfzHCaQhIhAP6PEgjlzwRxmga2s
        EtsPNLGCVAkLmEl0Tp0LZrMIqEp0nX7ICGLzCthL/Fiygh1in5zEzXOdzCA2p4CDxOXFH8A2
        CAHVrF5wEqpeUOLkzCdgcWYBCYmDL14wQ9TIStw69JgJYo6CxPO+xywTGAVmIWmZhaRlASPT
        KkahxJKc3MTMnPRyI73E3Ey95PzcTYyQeM3fwfjxo/khRiYOxkOMEhzMSiK8s2S6YoV4UxIr
        q1KL8uOLSnNSiw8xSnOwKInzrlrzLUZIID2xJDU7NbUgtQgmy8TBKdXAWF8y6cKvGLcrDjcc
        gm7uCVx1dPt3yXfnuMvSFc9JMb4I7D1uvXRP1rTtJUsvXGVIObRykVXvhXkX303/qzPBS+b9
        wjwNr8fbelqf3y61VFJgS12XpjPnk+Ujy2OiUxlrHWab/XKfse7Hd03vAsN66eiw3Yu39xed
        V7CK7DopeMBIY15z2boHXUosxRmJhlrMRcWJAK0+dlrFAgAA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add SGPIO driver support for Aspeed AST2500 SoC.

Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
---
 arch/arm/Kconfig                 |  2 ++
 arch/arm/boot/dts/aspeed-g5.dtsi | 16 +++++++++++++++-
 drivers/gpio/Kconfig             |  8 ++++++++
 drivers/gpio/Makefile            |  1 +
 4 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 2436021..c9f08ab 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1460,6 +1460,8 @@ config ARCH_NR_GPIO
 	default 416 if ARCH_SUNXI
 	default 392 if ARCH_U8500
 	default 352 if ARCH_VT8500
+	default 312 if MACH_ASPEED_G5
+	default 304 if MACH_ASPEED_G4
 	default 288 if ARCH_ROCKCHIP
 	default 264 if MACH_H4700
 	default 0
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 00f05bd..85da7ea 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -311,7 +311,7 @@
 				#gpio-cells = <2>;
 				gpio-controller;
 				compatible = "aspeed,ast2500-gpio";
-				reg = <0x1e780000 0x1000>;
+				reg = <0x1e780000 0x200>;
 				interrupts = <20>;
 				gpio-ranges = <&pinctrl 0 0 232>;
 				clocks = <&syscon ASPEED_CLK_APB>;
@@ -319,6 +319,20 @@
 				#interrupt-cells = <2>;
 			};
 
+			sgpio: sgpio@1e780200 {
+				#gpio-cells = <2>;
+				compatible = "aspeed,ast2500-sgpio";
+				gpio-controller;
+				interrupts = <40>;
+				reg = <0x1e780200 0x0100>;
+				clocks = <&syscon ASPEED_CLK_APB>;
+				interrupt-controller;
+				ngpios = <8>;
+				bus-frequency = <12000000>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_sgpm_default>;
+			};
+
 			rtc: rtc@1e781000 {
 				compatible = "aspeed,ast2500-rtc";
 				reg = <0x1e781000 0x18>;
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

