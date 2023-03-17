Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2A796BF3EC
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Mar 2023 22:30:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbjCQVaw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Mar 2023 17:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230370AbjCQVas (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Mar 2023 17:30:48 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7822D2ED51;
        Fri, 17 Mar 2023 14:30:28 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id z21so25475095edb.4;
        Fri, 17 Mar 2023 14:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679088627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtP3CYZqCoxnhcWZCbPGOqEwUbLALR7W0MvpQx3b5ww=;
        b=C7+82QpE3EIyw72HBU0r26J0ZPWwrsfFmXUMgQCXL8Y7UhtJenZookJDFk/DSmyyRa
         jSKIDic2PAjh9i9hj5n3F1TwhCUobBM2bGxJbXkzUeg4KCirPPUWpU2eXO6Qd0rr7FS6
         EYeGR7VRMqfWTyYbn9+iV3BtSi9nEmRjup206dF75wT3QQT5udF62D6YVu/PmND35gkE
         LIcIUI3Pf7VaRnUJ4+cb/Y+AeLLAiM9ip4pqY2jyIqHR4fMlExL368V+lrxGdOsacRJw
         T1R2fIwnGrWSOZiLe4fkVFe82/aljTtQH/kdjv9AUtKYkckfwpMXtk7ddjxBTzM5g6Vk
         6Cyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679088627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtP3CYZqCoxnhcWZCbPGOqEwUbLALR7W0MvpQx3b5ww=;
        b=PGrHE0CIhq3F8FNVZyj9+W86MtsLZOeepM01ZIP5ZbK64t8v3AGASZVKPUvLnX1vpr
         6SctmFwa/ErlaEt6gpcJfPPgtLDz1U6N1gJawRAtU502mvEjBC2E86R1UO0XRKJYKtRO
         S+JY/71+itnCMZU7VXtiUce/tuUMBIywApTl0X9Wdc/0cvD3T4P6o/xcwCB2a6zEYYAm
         AyIb6jTcg3a0bj/5klRWD2hSTzUMrLnsEOpvKid6aUh42hti3CD4o0GKV9A9uBaiiXtG
         A9oAOx45zqgu+M5Gp3UDnfBBKTkogmXrUulAPkwy+tYSpgs+tPdBrbBwSD+THoWS+Op4
         fK7Q==
X-Gm-Message-State: AO0yUKVV+chfPMvW0t++aHYizufBn2GVxcbYMDFeKI/9L+PWCVzznyVT
        aVWv0J6ucRKtMewR1wnK3A0=
X-Google-Smtp-Source: AK7set9VuJqUkU6CtewQ/bAW5DA6G7CZsZbBXkRupJFSutlGGgNMvqQAxAQdk6+LSftNudkb59MFoQ==
X-Received: by 2002:aa7:c0ca:0:b0:4fb:54b7:50ea with SMTP id j10-20020aa7c0ca000000b004fb54b750eamr4951350edp.21.1679088626648;
        Fri, 17 Mar 2023 14:30:26 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id v19-20020a17090651d300b0092b86d41dbasm1404683ejk.114.2023.03.17.14.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 14:30:26 -0700 (PDT)
From:   arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
        William Dean <williamsukatube@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Andy Teng <andy.teng@mediatek.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Daniel Golle <daniel@makrotopia.org>,
        Hui Liu <hui.liu@mediatek.com>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Daniel Santos <daniel.santos@pobox.com>,
        Luiz Angelo Daros de Luca <luizluca@gmail.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        Landen Chao <Landen.Chao@mediatek.com>,
        DENG Qingfang <dqfext@gmail.com>,
        Sean Wang <sean.wang@mediatek.com>, erkin.bozoglu@xeront.com,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Subject: [PATCH v3 04/21] pinctrl: ralink: move to mediatek as mtmips
Date:   Sat, 18 Mar 2023 00:29:54 +0300
Message-Id: <20230317213011.13656-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230317213011.13656-1-arinc.unal@arinc9.com>
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

This platform from Ralink was acquired by MediaTek in 2011. Then, MediaTek
introduced new SoCs which utilise this platform. Move the driver to
mediatek pinctrl directory. Rename the ralink core driver to mtmips.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/pinctrl/Kconfig                       |  1 -
 drivers/pinctrl/Makefile                      |  1 -
 drivers/pinctrl/mediatek/Kconfig              | 51 ++++++++++-
 drivers/pinctrl/mediatek/Makefile             | 63 +++++++------
 .../{ralink => mediatek}/pinctrl-mt7620.c     | 34 +++----
 .../{ralink => mediatek}/pinctrl-mt7621.c     | 30 +++----
 .../{ralink => mediatek}/pinctrl-mt76x8.c     | 60 ++++++-------
 .../pinctrl-mtmips.c}                         | 90 +++++++++----------
 .../pinctrl-mtmips.h}                         | 16 ++--
 .../{ralink => mediatek}/pinctrl-rt2880.c     | 20 ++---
 .../{ralink => mediatek}/pinctrl-rt305x.c     | 44 ++++-----
 .../{ralink => mediatek}/pinctrl-rt3883.c     | 28 +++---
 drivers/pinctrl/ralink/Kconfig                | 40 ---------
 drivers/pinctrl/ralink/Makefile               |  9 --
 14 files changed, 246 insertions(+), 241 deletions(-)
 rename drivers/pinctrl/{ralink => mediatek}/pinctrl-mt7620.c (81%)
 rename drivers/pinctrl/{ralink => mediatek}/pinctrl-mt7621.c (80%)
 rename drivers/pinctrl/{ralink => mediatek}/pinctrl-mt76x8.c (81%)
 rename drivers/pinctrl/{ralink/pinctrl-ralink.c => mediatek/pinctrl-mtmips.c} (74%)
 rename drivers/pinctrl/{ralink/pinctrl-ralink.h => mediatek/pinctrl-mtmips.h} (75%)
 rename drivers/pinctrl/{ralink => mediatek}/pinctrl-rt2880.c (71%)
 rename drivers/pinctrl/{ralink => mediatek}/pinctrl-rt305x.c (75%)
 rename drivers/pinctrl/{ralink => mediatek}/pinctrl-rt3883.c (80%)
 delete mode 100644 drivers/pinctrl/ralink/Kconfig
 delete mode 100644 drivers/pinctrl/ralink/Makefile

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 694f47fe6d11..e2a24d668e41 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -538,7 +538,6 @@ source "drivers/pinctrl/nuvoton/Kconfig"
 source "drivers/pinctrl/nxp/Kconfig"
 source "drivers/pinctrl/pxa/Kconfig"
 source "drivers/pinctrl/qcom/Kconfig"
-source "drivers/pinctrl/ralink/Kconfig"
 source "drivers/pinctrl/renesas/Kconfig"
 source "drivers/pinctrl/samsung/Kconfig"
 source "drivers/pinctrl/spear/Kconfig"
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index c40397af024b..413b1e6b6933 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -67,7 +67,6 @@ obj-y				+= nuvoton/
 obj-y				+= nxp/
 obj-$(CONFIG_PINCTRL_PXA)	+= pxa/
 obj-$(CONFIG_ARCH_QCOM)		+= qcom/
-obj-$(CONFIG_PINCTRL_RALINK)	+= ralink/
 obj-$(CONFIG_PINCTRL_RENESAS)	+= renesas/
 obj-$(CONFIG_PINCTRL_SAMSUNG)	+= samsung/
 obj-$(CONFIG_PINCTRL_SPEAR)	+= spear/
diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index f20c28334bcb..ba21a599953c 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menu "MediaTek pinctrl drivers"
-	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on ARCH_MEDIATEK || RALINK || COMPILE_TEST
 
 config EINT_MTK
 	tristate "MediaTek External Interrupt Support"
@@ -22,6 +22,12 @@ config PINCTRL_MTK
 config PINCTRL_MTK_V2
 	tristate
 
+config PINCTRL_MTK_MTMIPS
+	bool
+	depends on RALINK
+	select PINMUX
+	select GENERIC_PINCONF
+
 config PINCTRL_MTK_MOORE
 	bool
 	depends on OF
@@ -43,6 +49,49 @@ config PINCTRL_MTK_PARIS
 	select OF_GPIO
 	select PINCTRL_MTK_V2
 
+# For MIPS SoCs
+config PINCTRL_MT7620
+	bool "MediaTek MT7620 pin control"
+	depends on SOC_MT7620 || COMPILE_TEST
+	depends on RALINK
+	default SOC_MT7620
+	select PINCTRL_MTK_MTMIPS
+
+config PINCTRL_MT7621
+	bool "MediaTek MT7621 pin control"
+	depends on SOC_MT7621 || COMPILE_TEST
+	depends on RALINK
+	default SOC_MT7621
+	select PINCTRL_MTK_MTMIPS
+
+config PINCTRL_MT76X8
+	bool "MediaTek MT76X8 pin control"
+	depends on SOC_MT7620 || COMPILE_TEST
+	depends on RALINK
+	default SOC_MT7620
+	select PINCTRL_MTK_MTMIPS
+
+config PINCTRL_RT2880
+	bool "Ralink RT2880 pin control"
+	depends on SOC_RT288X || COMPILE_TEST
+	depends on RALINK
+	default SOC_RT288X
+	select PINCTRL_MTK_MTMIPS
+
+config PINCTRL_RT305X
+	bool "Ralink RT305X pin control"
+	depends on SOC_RT305X || COMPILE_TEST
+	depends on RALINK
+	default SOC_RT305X
+	select PINCTRL_MTK_MTMIPS
+
+config PINCTRL_RT3883
+	bool "Ralink RT3883 pin control"
+	depends on SOC_RT3883 || COMPILE_TEST
+	depends on RALINK
+	default SOC_RT3883
+	select PINCTRL_MTK_MTMIPS
+
 # For ARMv7 SoCs
 config PINCTRL_MT2701
 	bool "Mediatek MT2701 pin control"
diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
index 44d197af516a..680f7e8526e0 100644
--- a/drivers/pinctrl/mediatek/Makefile
+++ b/drivers/pinctrl/mediatek/Makefile
@@ -1,32 +1,39 @@
 # SPDX-License-Identifier: GPL-2.0
 # Core
-obj-$(CONFIG_EINT_MTK)		+= mtk-eint.o
-obj-$(CONFIG_PINCTRL_MTK)	+= pinctrl-mtk-common.o
-obj-$(CONFIG_PINCTRL_MTK_V2)	+= pinctrl-mtk-common-v2.o
-obj-$(CONFIG_PINCTRL_MTK_MOORE) += pinctrl-moore.o
-obj-$(CONFIG_PINCTRL_MTK_PARIS) += pinctrl-paris.o
+obj-$(CONFIG_EINT_MTK)			+= mtk-eint.o
+obj-$(CONFIG_PINCTRL_MTK)		+= pinctrl-mtk-common.o
+obj-$(CONFIG_PINCTRL_MTK_V2)		+= pinctrl-mtk-common-v2.o
+obj-$(CONFIG_PINCTRL_MTK_MTMIPS)	+= pinctrl-mtmips.o
+obj-$(CONFIG_PINCTRL_MTK_MOORE)		+= pinctrl-moore.o
+obj-$(CONFIG_PINCTRL_MTK_PARIS)		+= pinctrl-paris.o
 
 # SoC Drivers
-obj-$(CONFIG_PINCTRL_MT2701)	+= pinctrl-mt2701.o
-obj-$(CONFIG_PINCTRL_MT2712)	+= pinctrl-mt2712.o
-obj-$(CONFIG_PINCTRL_MT8135)	+= pinctrl-mt8135.o
-obj-$(CONFIG_PINCTRL_MT8127)	+= pinctrl-mt8127.o
-obj-$(CONFIG_PINCTRL_MT6765)	+= pinctrl-mt6765.o
-obj-$(CONFIG_PINCTRL_MT6779)	+= pinctrl-mt6779.o
-obj-$(CONFIG_PINCTRL_MT6795)	+= pinctrl-mt6795.o
-obj-$(CONFIG_PINCTRL_MT6797)	+= pinctrl-mt6797.o
-obj-$(CONFIG_PINCTRL_MT7622)	+= pinctrl-mt7622.o
-obj-$(CONFIG_PINCTRL_MT7623)	+= pinctrl-mt7623.o
-obj-$(CONFIG_PINCTRL_MT7629)	+= pinctrl-mt7629.o
-obj-$(CONFIG_PINCTRL_MT7981)	+= pinctrl-mt7981.o
-obj-$(CONFIG_PINCTRL_MT7986)	+= pinctrl-mt7986.o
-obj-$(CONFIG_PINCTRL_MT8167)	+= pinctrl-mt8167.o
-obj-$(CONFIG_PINCTRL_MT8173)	+= pinctrl-mt8173.o
-obj-$(CONFIG_PINCTRL_MT8183)	+= pinctrl-mt8183.o
-obj-$(CONFIG_PINCTRL_MT8186)	+= pinctrl-mt8186.o
-obj-$(CONFIG_PINCTRL_MT8188)	+= pinctrl-mt8188.o
-obj-$(CONFIG_PINCTRL_MT8192)	+= pinctrl-mt8192.o
-obj-$(CONFIG_PINCTRL_MT8195)    += pinctrl-mt8195.o
-obj-$(CONFIG_PINCTRL_MT8365)	+= pinctrl-mt8365.o
-obj-$(CONFIG_PINCTRL_MT8516)	+= pinctrl-mt8516.o
-obj-$(CONFIG_PINCTRL_MT6397)	+= pinctrl-mt6397.o
+obj-$(CONFIG_PINCTRL_MT7620)		+= pinctrl-mt7620.o
+obj-$(CONFIG_PINCTRL_MT7621)		+= pinctrl-mt7621.o
+obj-$(CONFIG_PINCTRL_MT76X8)		+= pinctrl-mt76x8.o
+obj-$(CONFIG_PINCTRL_RT2880)		+= pinctrl-rt2880.o
+obj-$(CONFIG_PINCTRL_RT305X)		+= pinctrl-rt305x.o
+obj-$(CONFIG_PINCTRL_RT3883)		+= pinctrl-rt3883.o
+obj-$(CONFIG_PINCTRL_MT2701)		+= pinctrl-mt2701.o
+obj-$(CONFIG_PINCTRL_MT2712)		+= pinctrl-mt2712.o
+obj-$(CONFIG_PINCTRL_MT8135)		+= pinctrl-mt8135.o
+obj-$(CONFIG_PINCTRL_MT8127)		+= pinctrl-mt8127.o
+obj-$(CONFIG_PINCTRL_MT6765)		+= pinctrl-mt6765.o
+obj-$(CONFIG_PINCTRL_MT6779)		+= pinctrl-mt6779.o
+obj-$(CONFIG_PINCTRL_MT6795)		+= pinctrl-mt6795.o
+obj-$(CONFIG_PINCTRL_MT6797)		+= pinctrl-mt6797.o
+obj-$(CONFIG_PINCTRL_MT7622)		+= pinctrl-mt7622.o
+obj-$(CONFIG_PINCTRL_MT7623)		+= pinctrl-mt7623.o
+obj-$(CONFIG_PINCTRL_MT7629)		+= pinctrl-mt7629.o
+obj-$(CONFIG_PINCTRL_MT7981)		+= pinctrl-mt7981.o
+obj-$(CONFIG_PINCTRL_MT7986)		+= pinctrl-mt7986.o
+obj-$(CONFIG_PINCTRL_MT8167)		+= pinctrl-mt8167.o
+obj-$(CONFIG_PINCTRL_MT8173)		+= pinctrl-mt8173.o
+obj-$(CONFIG_PINCTRL_MT8183)		+= pinctrl-mt8183.o
+obj-$(CONFIG_PINCTRL_MT8186)		+= pinctrl-mt8186.o
+obj-$(CONFIG_PINCTRL_MT8188)		+= pinctrl-mt8188.o
+obj-$(CONFIG_PINCTRL_MT8192)		+= pinctrl-mt8192.o
+obj-$(CONFIG_PINCTRL_MT8195)		+= pinctrl-mt8195.o
+obj-$(CONFIG_PINCTRL_MT8365)		+= pinctrl-mt8365.o
+obj-$(CONFIG_PINCTRL_MT8516)		+= pinctrl-mt8516.o
+obj-$(CONFIG_PINCTRL_MT6397)		+= pinctrl-mt6397.o
diff --git a/drivers/pinctrl/ralink/pinctrl-mt7620.c b/drivers/pinctrl/mediatek/pinctrl-mt7620.c
similarity index 81%
rename from drivers/pinctrl/ralink/pinctrl-mt7620.c
rename to drivers/pinctrl/mediatek/pinctrl-mt7620.c
index 3f6ffccc6882..d2624b9b5bc4 100644
--- a/drivers/pinctrl/ralink/pinctrl-mt7620.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7620.c
@@ -3,7 +3,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
-#include "pinctrl-ralink.h"
+#include "pinctrl-mtmips.h"
 
 #define MT7620_GPIO_MODE_UART0_SHIFT	2
 #define MT7620_GPIO_MODE_UART0_MASK	0x7
@@ -52,20 +52,20 @@
 #define MT7620_GPIO_MODE_EPHY		15
 #define MT7620_GPIO_MODE_PA		20
 
-static struct ralink_pmx_func i2c_grp[] =  { FUNC("i2c", 0, 1, 2) };
-static struct ralink_pmx_func spi_grp[] = { FUNC("spi", 0, 3, 4) };
-static struct ralink_pmx_func uartlite_grp[] = { FUNC("uartlite", 0, 15, 2) };
-static struct ralink_pmx_func mdio_grp[] = {
+static struct mtmips_pmx_func i2c_grp[] =  { FUNC("i2c", 0, 1, 2) };
+static struct mtmips_pmx_func spi_grp[] = { FUNC("spi", 0, 3, 4) };
+static struct mtmips_pmx_func uartlite_grp[] = { FUNC("uartlite", 0, 15, 2) };
+static struct mtmips_pmx_func mdio_grp[] = {
 	FUNC("mdio", MT7620_GPIO_MODE_MDIO, 22, 2),
 	FUNC("refclk", MT7620_GPIO_MODE_MDIO_REFCLK, 22, 2),
 };
-static struct ralink_pmx_func rgmii1_grp[] = { FUNC("rgmii1", 0, 24, 12) };
-static struct ralink_pmx_func refclk_grp[] = { FUNC("spi refclk", 0, 37, 3) };
-static struct ralink_pmx_func ephy_grp[] = { FUNC("ephy", 0, 40, 5) };
-static struct ralink_pmx_func rgmii2_grp[] = { FUNC("rgmii2", 0, 60, 12) };
-static struct ralink_pmx_func wled_grp[] = { FUNC("wled", 0, 72, 1) };
-static struct ralink_pmx_func pa_grp[] = { FUNC("pa", 0, 18, 4) };
-static struct ralink_pmx_func uartf_grp[] = {
+static struct mtmips_pmx_func rgmii1_grp[] = { FUNC("rgmii1", 0, 24, 12) };
+static struct mtmips_pmx_func refclk_grp[] = { FUNC("spi refclk", 0, 37, 3) };
+static struct mtmips_pmx_func ephy_grp[] = { FUNC("ephy", 0, 40, 5) };
+static struct mtmips_pmx_func rgmii2_grp[] = { FUNC("rgmii2", 0, 60, 12) };
+static struct mtmips_pmx_func wled_grp[] = { FUNC("wled", 0, 72, 1) };
+static struct mtmips_pmx_func pa_grp[] = { FUNC("pa", 0, 18, 4) };
+static struct mtmips_pmx_func uartf_grp[] = {
 	FUNC("uartf", MT7620_GPIO_MODE_UARTF, 7, 8),
 	FUNC("pcm uartf", MT7620_GPIO_MODE_PCM_UARTF, 7, 8),
 	FUNC("pcm i2s", MT7620_GPIO_MODE_PCM_I2S, 7, 8),
@@ -74,20 +74,20 @@ static struct ralink_pmx_func uartf_grp[] = {
 	FUNC("gpio uartf", MT7620_GPIO_MODE_GPIO_UARTF, 7, 4),
 	FUNC("gpio i2s", MT7620_GPIO_MODE_GPIO_I2S, 7, 4),
 };
-static struct ralink_pmx_func wdt_grp[] = {
+static struct mtmips_pmx_func wdt_grp[] = {
 	FUNC("wdt rst", 0, 17, 1),
 	FUNC("wdt refclk", 0, 17, 1),
 	};
-static struct ralink_pmx_func pcie_rst_grp[] = {
+static struct mtmips_pmx_func pcie_rst_grp[] = {
 	FUNC("pcie rst", MT7620_GPIO_MODE_PCIE_RST, 36, 1),
 	FUNC("pcie refclk", MT7620_GPIO_MODE_PCIE_REF, 36, 1)
 };
-static struct ralink_pmx_func nd_sd_grp[] = {
+static struct mtmips_pmx_func nd_sd_grp[] = {
 	FUNC("nand", MT7620_GPIO_MODE_NAND, 45, 15),
 	FUNC("sd", MT7620_GPIO_MODE_SD, 47, 13)
 };
 
-static struct ralink_pmx_group mt7620a_pinmux_data[] = {
+static struct mtmips_pmx_group mt7620a_pinmux_data[] = {
 	GRP("i2c", i2c_grp, 1, MT7620_GPIO_MODE_I2C),
 	GRP("uartf", uartf_grp, MT7620_GPIO_MODE_UART0_MASK,
 		MT7620_GPIO_MODE_UART0_SHIFT),
@@ -112,7 +112,7 @@ static struct ralink_pmx_group mt7620a_pinmux_data[] = {
 
 static int mt7620_pinctrl_probe(struct platform_device *pdev)
 {
-	return ralink_pinctrl_init(pdev, mt7620a_pinmux_data);
+	return mtmips_pinctrl_init(pdev, mt7620a_pinmux_data);
 }
 
 static const struct of_device_id mt7620_pinctrl_match[] = {
diff --git a/drivers/pinctrl/ralink/pinctrl-mt7621.c b/drivers/pinctrl/mediatek/pinctrl-mt7621.c
similarity index 80%
rename from drivers/pinctrl/ralink/pinctrl-mt7621.c
rename to drivers/pinctrl/mediatek/pinctrl-mt7621.c
index fb5824922e78..b18c1a47bbeb 100644
--- a/drivers/pinctrl/ralink/pinctrl-mt7621.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7621.c
@@ -3,7 +3,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
-#include "pinctrl-ralink.h"
+#include "pinctrl-mtmips.h"
 
 #define MT7621_GPIO_MODE_UART1		1
 #define MT7621_GPIO_MODE_I2C		2
@@ -34,40 +34,40 @@
 #define MT7621_GPIO_MODE_SDHCI_SHIFT	18
 #define MT7621_GPIO_MODE_SDHCI_GPIO	1
 
-static struct ralink_pmx_func uart1_grp[] =  { FUNC("uart1", 0, 1, 2) };
-static struct ralink_pmx_func i2c_grp[] =  { FUNC("i2c", 0, 3, 2) };
-static struct ralink_pmx_func uart3_grp[] = {
+static struct mtmips_pmx_func uart1_grp[] =  { FUNC("uart1", 0, 1, 2) };
+static struct mtmips_pmx_func i2c_grp[] =  { FUNC("i2c", 0, 3, 2) };
+static struct mtmips_pmx_func uart3_grp[] = {
 	FUNC("uart3", 0, 5, 4),
 	FUNC("i2s", 2, 5, 4),
 	FUNC("spdif3", 3, 5, 4),
 };
-static struct ralink_pmx_func uart2_grp[] = {
+static struct mtmips_pmx_func uart2_grp[] = {
 	FUNC("uart2", 0, 9, 4),
 	FUNC("pcm", 2, 9, 4),
 	FUNC("spdif2", 3, 9, 4),
 };
-static struct ralink_pmx_func jtag_grp[] = { FUNC("jtag", 0, 13, 5) };
-static struct ralink_pmx_func wdt_grp[] = {
+static struct mtmips_pmx_func jtag_grp[] = { FUNC("jtag", 0, 13, 5) };
+static struct mtmips_pmx_func wdt_grp[] = {
 	FUNC("wdt rst", 0, 18, 1),
 	FUNC("wdt refclk", 2, 18, 1),
 };
-static struct ralink_pmx_func pcie_rst_grp[] = {
+static struct mtmips_pmx_func pcie_rst_grp[] = {
 	FUNC("pcie rst", MT7621_GPIO_MODE_PCIE_RST, 19, 1),
 	FUNC("pcie refclk", MT7621_GPIO_MODE_PCIE_REF, 19, 1)
 };
-static struct ralink_pmx_func mdio_grp[] = { FUNC("mdio", 0, 20, 2) };
-static struct ralink_pmx_func rgmii2_grp[] = { FUNC("rgmii2", 0, 22, 12) };
-static struct ralink_pmx_func spi_grp[] = {
+static struct mtmips_pmx_func mdio_grp[] = { FUNC("mdio", 0, 20, 2) };
+static struct mtmips_pmx_func rgmii2_grp[] = { FUNC("rgmii2", 0, 22, 12) };
+static struct mtmips_pmx_func spi_grp[] = {
 	FUNC("spi", 0, 34, 7),
 	FUNC("nand1", 2, 34, 7),
 };
-static struct ralink_pmx_func sdhci_grp[] = {
+static struct mtmips_pmx_func sdhci_grp[] = {
 	FUNC("sdhci", 0, 41, 8),
 	FUNC("nand2", 2, 41, 8),
 };
-static struct ralink_pmx_func rgmii1_grp[] = { FUNC("rgmii1", 0, 49, 12) };
+static struct mtmips_pmx_func rgmii1_grp[] = { FUNC("rgmii1", 0, 49, 12) };
 
-static struct ralink_pmx_group mt7621_pinmux_data[] = {
+static struct mtmips_pmx_group mt7621_pinmux_data[] = {
 	GRP("uart1", uart1_grp, 1, MT7621_GPIO_MODE_UART1),
 	GRP("i2c", i2c_grp, 1, MT7621_GPIO_MODE_I2C),
 	GRP_G("uart3", uart3_grp, MT7621_GPIO_MODE_UART3_MASK,
@@ -92,7 +92,7 @@ static struct ralink_pmx_group mt7621_pinmux_data[] = {
 
 static int mt7621_pinctrl_probe(struct platform_device *pdev)
 {
-	return ralink_pinctrl_init(pdev, mt7621_pinmux_data);
+	return mtmips_pinctrl_init(pdev, mt7621_pinmux_data);
 }
 
 static const struct of_device_id mt7621_pinctrl_match[] = {
diff --git a/drivers/pinctrl/ralink/pinctrl-mt76x8.c b/drivers/pinctrl/mediatek/pinctrl-mt76x8.c
similarity index 81%
rename from drivers/pinctrl/ralink/pinctrl-mt76x8.c
rename to drivers/pinctrl/mediatek/pinctrl-mt76x8.c
index 4283a54d2db0..e7d6ad2f62e4 100644
--- a/drivers/pinctrl/ralink/pinctrl-mt76x8.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt76x8.c
@@ -3,7 +3,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
-#include "pinctrl-ralink.h"
+#include "pinctrl-mtmips.h"
 
 #define MT76X8_GPIO_MODE_MASK		0x3
 
@@ -35,173 +35,173 @@
 #define MT76X8_GPIO_MODE_SPIS		2
 #define MT76X8_GPIO_MODE_GPIO		0
 
-static struct ralink_pmx_func pwm1_grp[] = {
+static struct mtmips_pmx_func pwm1_grp[] = {
 	FUNC("sdxc d6", 3, 19, 1),
 	FUNC("utif", 2, 19, 1),
 	FUNC("gpio", 1, 19, 1),
 	FUNC("pwm1", 0, 19, 1),
 };
 
-static struct ralink_pmx_func pwm0_grp[] = {
+static struct mtmips_pmx_func pwm0_grp[] = {
 	FUNC("sdxc d7", 3, 18, 1),
 	FUNC("utif", 2, 18, 1),
 	FUNC("gpio", 1, 18, 1),
 	FUNC("pwm0", 0, 18, 1),
 };
 
-static struct ralink_pmx_func uart2_grp[] = {
+static struct mtmips_pmx_func uart2_grp[] = {
 	FUNC("sdxc d5 d4", 3, 20, 2),
 	FUNC("pwm", 2, 20, 2),
 	FUNC("gpio", 1, 20, 2),
 	FUNC("uart2", 0, 20, 2),
 };
 
-static struct ralink_pmx_func uart1_grp[] = {
+static struct mtmips_pmx_func uart1_grp[] = {
 	FUNC("sw_r", 3, 45, 2),
 	FUNC("pwm", 2, 45, 2),
 	FUNC("gpio", 1, 45, 2),
 	FUNC("uart1", 0, 45, 2),
 };
 
-static struct ralink_pmx_func i2c_grp[] = {
+static struct mtmips_pmx_func i2c_grp[] = {
 	FUNC("-", 3, 4, 2),
 	FUNC("debug", 2, 4, 2),
 	FUNC("gpio", 1, 4, 2),
 	FUNC("i2c", 0, 4, 2),
 };
 
-static struct ralink_pmx_func refclk_grp[] = { FUNC("refclk", 0, 37, 1) };
-static struct ralink_pmx_func perst_grp[] = { FUNC("perst", 0, 36, 1) };
-static struct ralink_pmx_func wdt_grp[] = { FUNC("wdt", 0, 38, 1) };
-static struct ralink_pmx_func spi_grp[] = { FUNC("spi", 0, 7, 4) };
+static struct mtmips_pmx_func refclk_grp[] = { FUNC("refclk", 0, 37, 1) };
+static struct mtmips_pmx_func perst_grp[] = { FUNC("perst", 0, 36, 1) };
+static struct mtmips_pmx_func wdt_grp[] = { FUNC("wdt", 0, 38, 1) };
+static struct mtmips_pmx_func spi_grp[] = { FUNC("spi", 0, 7, 4) };
 
-static struct ralink_pmx_func sd_mode_grp[] = {
+static struct mtmips_pmx_func sd_mode_grp[] = {
 	FUNC("jtag", 3, 22, 8),
 	FUNC("utif", 2, 22, 8),
 	FUNC("gpio", 1, 22, 8),
 	FUNC("sdxc", 0, 22, 8),
 };
 
-static struct ralink_pmx_func uart0_grp[] = {
+static struct mtmips_pmx_func uart0_grp[] = {
 	FUNC("-", 3, 12, 2),
 	FUNC("-", 2, 12, 2),
 	FUNC("gpio", 1, 12, 2),
 	FUNC("uart0", 0, 12, 2),
 };
 
-static struct ralink_pmx_func i2s_grp[] = {
+static struct mtmips_pmx_func i2s_grp[] = {
 	FUNC("antenna", 3, 0, 4),
 	FUNC("pcm", 2, 0, 4),
 	FUNC("gpio", 1, 0, 4),
 	FUNC("i2s", 0, 0, 4),
 };
 
-static struct ralink_pmx_func spi_cs1_grp[] = {
+static struct mtmips_pmx_func spi_cs1_grp[] = {
 	FUNC("-", 3, 6, 1),
 	FUNC("refclk", 2, 6, 1),
 	FUNC("gpio", 1, 6, 1),
 	FUNC("spi cs1", 0, 6, 1),
 };
 
-static struct ralink_pmx_func spis_grp[] = {
+static struct mtmips_pmx_func spis_grp[] = {
 	FUNC("pwm_uart2", 3, 14, 4),
 	FUNC("utif", 2, 14, 4),
 	FUNC("gpio", 1, 14, 4),
 	FUNC("spis", 0, 14, 4),
 };
 
-static struct ralink_pmx_func gpio_grp[] = {
+static struct mtmips_pmx_func gpio_grp[] = {
 	FUNC("pcie", 3, 11, 1),
 	FUNC("refclk", 2, 11, 1),
 	FUNC("gpio", 1, 11, 1),
 	FUNC("gpio", 0, 11, 1),
 };
 
-static struct ralink_pmx_func p4led_kn_grp[] = {
+static struct mtmips_pmx_func p4led_kn_grp[] = {
 	FUNC("jtag", 3, 30, 1),
 	FUNC("utif", 2, 30, 1),
 	FUNC("gpio", 1, 30, 1),
 	FUNC("p4led_kn", 0, 30, 1),
 };
 
-static struct ralink_pmx_func p3led_kn_grp[] = {
+static struct mtmips_pmx_func p3led_kn_grp[] = {
 	FUNC("jtag", 3, 31, 1),
 	FUNC("utif", 2, 31, 1),
 	FUNC("gpio", 1, 31, 1),
 	FUNC("p3led_kn", 0, 31, 1),
 };
 
-static struct ralink_pmx_func p2led_kn_grp[] = {
+static struct mtmips_pmx_func p2led_kn_grp[] = {
 	FUNC("jtag", 3, 32, 1),
 	FUNC("utif", 2, 32, 1),
 	FUNC("gpio", 1, 32, 1),
 	FUNC("p2led_kn", 0, 32, 1),
 };
 
-static struct ralink_pmx_func p1led_kn_grp[] = {
+static struct mtmips_pmx_func p1led_kn_grp[] = {
 	FUNC("jtag", 3, 33, 1),
 	FUNC("utif", 2, 33, 1),
 	FUNC("gpio", 1, 33, 1),
 	FUNC("p1led_kn", 0, 33, 1),
 };
 
-static struct ralink_pmx_func p0led_kn_grp[] = {
+static struct mtmips_pmx_func p0led_kn_grp[] = {
 	FUNC("jtag", 3, 34, 1),
 	FUNC("rsvd", 2, 34, 1),
 	FUNC("gpio", 1, 34, 1),
 	FUNC("p0led_kn", 0, 34, 1),
 };
 
-static struct ralink_pmx_func wled_kn_grp[] = {
+static struct mtmips_pmx_func wled_kn_grp[] = {
 	FUNC("rsvd", 3, 35, 1),
 	FUNC("rsvd", 2, 35, 1),
 	FUNC("gpio", 1, 35, 1),
 	FUNC("wled_kn", 0, 35, 1),
 };
 
-static struct ralink_pmx_func p4led_an_grp[] = {
+static struct mtmips_pmx_func p4led_an_grp[] = {
 	FUNC("jtag", 3, 39, 1),
 	FUNC("utif", 2, 39, 1),
 	FUNC("gpio", 1, 39, 1),
 	FUNC("p4led_an", 0, 39, 1),
 };
 
-static struct ralink_pmx_func p3led_an_grp[] = {
+static struct mtmips_pmx_func p3led_an_grp[] = {
 	FUNC("jtag", 3, 40, 1),
 	FUNC("utif", 2, 40, 1),
 	FUNC("gpio", 1, 40, 1),
 	FUNC("p3led_an", 0, 40, 1),
 };
 
-static struct ralink_pmx_func p2led_an_grp[] = {
+static struct mtmips_pmx_func p2led_an_grp[] = {
 	FUNC("jtag", 3, 41, 1),
 	FUNC("utif", 2, 41, 1),
 	FUNC("gpio", 1, 41, 1),
 	FUNC("p2led_an", 0, 41, 1),
 };
 
-static struct ralink_pmx_func p1led_an_grp[] = {
+static struct mtmips_pmx_func p1led_an_grp[] = {
 	FUNC("jtag", 3, 42, 1),
 	FUNC("utif", 2, 42, 1),
 	FUNC("gpio", 1, 42, 1),
 	FUNC("p1led_an", 0, 42, 1),
 };
 
-static struct ralink_pmx_func p0led_an_grp[] = {
+static struct mtmips_pmx_func p0led_an_grp[] = {
 	FUNC("jtag", 3, 43, 1),
 	FUNC("rsvd", 2, 43, 1),
 	FUNC("gpio", 1, 43, 1),
 	FUNC("p0led_an", 0, 43, 1),
 };
 
-static struct ralink_pmx_func wled_an_grp[] = {
+static struct mtmips_pmx_func wled_an_grp[] = {
 	FUNC("rsvd", 3, 44, 1),
 	FUNC("rsvd", 2, 44, 1),
 	FUNC("gpio", 1, 44, 1),
 	FUNC("wled_an", 0, 44, 1),
 };
 
-static struct ralink_pmx_group mt76x8_pinmux_data[] = {
+static struct mtmips_pmx_group mt76x8_pinmux_data[] = {
 	GRP_G("pwm1", pwm1_grp, MT76X8_GPIO_MODE_MASK,
 				1, MT76X8_GPIO_MODE_PWM1),
 	GRP_G("pwm0", pwm0_grp, MT76X8_GPIO_MODE_MASK,
@@ -257,7 +257,7 @@ static struct ralink_pmx_group mt76x8_pinmux_data[] = {
 
 static int mt76x8_pinctrl_probe(struct platform_device *pdev)
 {
-	return ralink_pinctrl_init(pdev, mt76x8_pinmux_data);
+	return mtmips_pinctrl_init(pdev, mt76x8_pinmux_data);
 }
 
 static const struct of_device_id mt76x8_pinctrl_match[] = {
diff --git a/drivers/pinctrl/ralink/pinctrl-ralink.c b/drivers/pinctrl/mediatek/pinctrl-mtmips.c
similarity index 74%
rename from drivers/pinctrl/ralink/pinctrl-ralink.c
rename to drivers/pinctrl/mediatek/pinctrl-mtmips.c
index 770862f45b3f..efd77b6c56a1 100644
--- a/drivers/pinctrl/ralink/pinctrl-ralink.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtmips.c
@@ -19,23 +19,23 @@
 #include <asm/mach-ralink/ralink_regs.h>
 #include <asm/mach-ralink/mt7620.h>
 
-#include "pinctrl-ralink.h"
+#include "pinctrl-mtmips.h"
 #include "../core.h"
 #include "../pinctrl-utils.h"
 
 #define SYSC_REG_GPIO_MODE	0x60
 #define SYSC_REG_GPIO_MODE2	0x64
 
-struct ralink_priv {
+struct mtmips_priv {
 	struct device *dev;
 
 	struct pinctrl_pin_desc *pads;
 	struct pinctrl_desc *desc;
 
-	struct ralink_pmx_func **func;
+	struct mtmips_pmx_func **func;
 	int func_count;
 
-	struct ralink_pmx_group *groups;
+	struct mtmips_pmx_group *groups;
 	const char **group_names;
 	int group_count;
 
@@ -43,27 +43,27 @@ struct ralink_priv {
 	int max_pins;
 };
 
-static int ralink_get_group_count(struct pinctrl_dev *pctrldev)
+static int mtmips_get_group_count(struct pinctrl_dev *pctrldev)
 {
-	struct ralink_priv *p = pinctrl_dev_get_drvdata(pctrldev);
+	struct mtmips_priv *p = pinctrl_dev_get_drvdata(pctrldev);
 
 	return p->group_count;
 }
 
-static const char *ralink_get_group_name(struct pinctrl_dev *pctrldev,
+static const char *mtmips_get_group_name(struct pinctrl_dev *pctrldev,
 					 unsigned int group)
 {
-	struct ralink_priv *p = pinctrl_dev_get_drvdata(pctrldev);
+	struct mtmips_priv *p = pinctrl_dev_get_drvdata(pctrldev);
 
 	return (group >= p->group_count) ? NULL : p->group_names[group];
 }
 
-static int ralink_get_group_pins(struct pinctrl_dev *pctrldev,
+static int mtmips_get_group_pins(struct pinctrl_dev *pctrldev,
 				 unsigned int group,
 				 const unsigned int **pins,
 				 unsigned int *num_pins)
 {
-	struct ralink_priv *p = pinctrl_dev_get_drvdata(pctrldev);
+	struct mtmips_priv *p = pinctrl_dev_get_drvdata(pctrldev);
 
 	if (group >= p->group_count)
 		return -EINVAL;
@@ -74,35 +74,35 @@ static int ralink_get_group_pins(struct pinctrl_dev *pctrldev,
 	return 0;
 }
 
-static const struct pinctrl_ops ralink_pctrl_ops = {
-	.get_groups_count	= ralink_get_group_count,
-	.get_group_name		= ralink_get_group_name,
-	.get_group_pins		= ralink_get_group_pins,
+static const struct pinctrl_ops mtmips_pctrl_ops = {
+	.get_groups_count	= mtmips_get_group_count,
+	.get_group_name		= mtmips_get_group_name,
+	.get_group_pins		= mtmips_get_group_pins,
 	.dt_node_to_map		= pinconf_generic_dt_node_to_map_all,
 	.dt_free_map		= pinconf_generic_dt_free_map,
 };
 
-static int ralink_pmx_func_count(struct pinctrl_dev *pctrldev)
+static int mtmips_pmx_func_count(struct pinctrl_dev *pctrldev)
 {
-	struct ralink_priv *p = pinctrl_dev_get_drvdata(pctrldev);
+	struct mtmips_priv *p = pinctrl_dev_get_drvdata(pctrldev);
 
 	return p->func_count;
 }
 
-static const char *ralink_pmx_func_name(struct pinctrl_dev *pctrldev,
+static const char *mtmips_pmx_func_name(struct pinctrl_dev *pctrldev,
 					unsigned int func)
 {
-	struct ralink_priv *p = pinctrl_dev_get_drvdata(pctrldev);
+	struct mtmips_priv *p = pinctrl_dev_get_drvdata(pctrldev);
 
 	return p->func[func]->name;
 }
 
-static int ralink_pmx_group_get_groups(struct pinctrl_dev *pctrldev,
+static int mtmips_pmx_group_get_groups(struct pinctrl_dev *pctrldev,
 				       unsigned int func,
 				       const char * const **groups,
 				       unsigned int * const num_groups)
 {
-	struct ralink_priv *p = pinctrl_dev_get_drvdata(pctrldev);
+	struct mtmips_priv *p = pinctrl_dev_get_drvdata(pctrldev);
 
 	if (p->func[func]->group_count == 1)
 		*groups = &p->group_names[p->func[func]->groups[0]];
@@ -114,10 +114,10 @@ static int ralink_pmx_group_get_groups(struct pinctrl_dev *pctrldev,
 	return 0;
 }
 
-static int ralink_pmx_group_enable(struct pinctrl_dev *pctrldev,
+static int mtmips_pmx_group_enable(struct pinctrl_dev *pctrldev,
 				   unsigned int func, unsigned int group)
 {
-	struct ralink_priv *p = pinctrl_dev_get_drvdata(pctrldev);
+	struct mtmips_priv *p = pinctrl_dev_get_drvdata(pctrldev);
 	u32 mode = 0;
 	u32 reg = SYSC_REG_GPIO_MODE;
 	int i;
@@ -158,11 +158,11 @@ static int ralink_pmx_group_enable(struct pinctrl_dev *pctrldev,
 	return 0;
 }
 
-static int ralink_pmx_group_gpio_request_enable(struct pinctrl_dev *pctrldev,
+static int mtmips_pmx_group_gpio_request_enable(struct pinctrl_dev *pctrldev,
 						struct pinctrl_gpio_range *range,
 						unsigned int pin)
 {
-	struct ralink_priv *p = pinctrl_dev_get_drvdata(pctrldev);
+	struct mtmips_priv *p = pinctrl_dev_get_drvdata(pctrldev);
 
 	if (!p->gpio[pin]) {
 		dev_err(p->dev, "pin %d is not set to gpio mux\n", pin);
@@ -172,28 +172,28 @@ static int ralink_pmx_group_gpio_request_enable(struct pinctrl_dev *pctrldev,
 	return 0;
 }
 
-static const struct pinmux_ops ralink_pmx_group_ops = {
-	.get_functions_count	= ralink_pmx_func_count,
-	.get_function_name	= ralink_pmx_func_name,
-	.get_function_groups	= ralink_pmx_group_get_groups,
-	.set_mux		= ralink_pmx_group_enable,
-	.gpio_request_enable	= ralink_pmx_group_gpio_request_enable,
+static const struct pinmux_ops mtmips_pmx_group_ops = {
+	.get_functions_count	= mtmips_pmx_func_count,
+	.get_function_name	= mtmips_pmx_func_name,
+	.get_function_groups	= mtmips_pmx_group_get_groups,
+	.set_mux		= mtmips_pmx_group_enable,
+	.gpio_request_enable	= mtmips_pmx_group_gpio_request_enable,
 };
 
-static struct pinctrl_desc ralink_pctrl_desc = {
+static struct pinctrl_desc mtmips_pctrl_desc = {
 	.owner		= THIS_MODULE,
-	.name		= "ralink-pinctrl",
-	.pctlops	= &ralink_pctrl_ops,
-	.pmxops		= &ralink_pmx_group_ops,
+	.name		= "mtmips-pinctrl",
+	.pctlops	= &mtmips_pctrl_ops,
+	.pmxops		= &mtmips_pmx_group_ops,
 };
 
-static struct ralink_pmx_func gpio_func = {
+static struct mtmips_pmx_func gpio_func = {
 	.name = "gpio",
 };
 
-static int ralink_pinctrl_index(struct ralink_priv *p)
+static int mtmips_pinctrl_index(struct mtmips_priv *p)
 {
-	struct ralink_pmx_group *mux = p->groups;
+	struct mtmips_pmx_group *mux = p->groups;
 	int i, j, c = 0;
 
 	/* count the mux functions */
@@ -248,7 +248,7 @@ static int ralink_pinctrl_index(struct ralink_priv *p)
 	return 0;
 }
 
-static int ralink_pinctrl_pins(struct ralink_priv *p)
+static int mtmips_pinctrl_pins(struct mtmips_priv *p)
 {
 	int i, j;
 
@@ -313,10 +313,10 @@ static int ralink_pinctrl_pins(struct ralink_priv *p)
 	return 0;
 }
 
-int ralink_pinctrl_init(struct platform_device *pdev,
-			struct ralink_pmx_group *data)
+int mtmips_pinctrl_init(struct platform_device *pdev,
+			struct mtmips_pmx_group *data)
 {
-	struct ralink_priv *p;
+	struct mtmips_priv *p;
 	struct pinctrl_dev *dev;
 	int err;
 
@@ -324,23 +324,23 @@ int ralink_pinctrl_init(struct platform_device *pdev,
 		return -ENOTSUPP;
 
 	/* setup the private data */
-	p = devm_kzalloc(&pdev->dev, sizeof(struct ralink_priv), GFP_KERNEL);
+	p = devm_kzalloc(&pdev->dev, sizeof(struct mtmips_priv), GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
 	p->dev = &pdev->dev;
-	p->desc = &ralink_pctrl_desc;
+	p->desc = &mtmips_pctrl_desc;
 	p->groups = data;
 	platform_set_drvdata(pdev, p);
 
 	/* init the device */
-	err = ralink_pinctrl_index(p);
+	err = mtmips_pinctrl_index(p);
 	if (err) {
 		dev_err(&pdev->dev, "failed to load index\n");
 		return err;
 	}
 
-	err = ralink_pinctrl_pins(p);
+	err = mtmips_pinctrl_pins(p);
 	if (err) {
 		dev_err(&pdev->dev, "failed to load pins\n");
 		return err;
diff --git a/drivers/pinctrl/ralink/pinctrl-ralink.h b/drivers/pinctrl/mediatek/pinctrl-mtmips.h
similarity index 75%
rename from drivers/pinctrl/ralink/pinctrl-ralink.h
rename to drivers/pinctrl/mediatek/pinctrl-mtmips.h
index e6037be1e153..a7c3dd724431 100644
--- a/drivers/pinctrl/ralink/pinctrl-ralink.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtmips.h
@@ -3,8 +3,8 @@
  *  Copyright (C) 2012 John Crispin <john@phrozen.org>
  */
 
-#ifndef _PINCTRL_RALINK_H__
-#define _PINCTRL_RALINK_H__
+#ifndef _PINCTRL_MTMIPS_H__
+#define _PINCTRL_MTMIPS_H__
 
 #define FUNC(name, value, pin_first, pin_count) \
 	{ name, value, pin_first, pin_count }
@@ -19,9 +19,9 @@
 	  .func = _func, .gpio = _gpio, \
 	  .func_count = ARRAY_SIZE(_func) }
 
-struct ralink_pmx_group;
+struct mtmips_pmx_group;
 
-struct ralink_pmx_func {
+struct mtmips_pmx_func {
 	const char *name;
 	const char value;
 
@@ -35,7 +35,7 @@ struct ralink_pmx_func {
 	int enabled;
 };
 
-struct ralink_pmx_group {
+struct mtmips_pmx_group {
 	const char *name;
 	int enabled;
 
@@ -43,11 +43,11 @@ struct ralink_pmx_group {
 	const char mask;
 	const char gpio;
 
-	struct ralink_pmx_func *func;
+	struct mtmips_pmx_func *func;
 	int func_count;
 };
 
-int ralink_pinctrl_init(struct platform_device *pdev,
-			struct ralink_pmx_group *data);
+int mtmips_pinctrl_init(struct platform_device *pdev,
+			struct mtmips_pmx_group *data);
 
 #endif
diff --git a/drivers/pinctrl/ralink/pinctrl-rt2880.c b/drivers/pinctrl/mediatek/pinctrl-rt2880.c
similarity index 71%
rename from drivers/pinctrl/ralink/pinctrl-rt2880.c
rename to drivers/pinctrl/mediatek/pinctrl-rt2880.c
index d7a65fcc7755..e0366721a515 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt2880.c
+++ b/drivers/pinctrl/mediatek/pinctrl-rt2880.c
@@ -4,7 +4,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
-#include "pinctrl-ralink.h"
+#include "pinctrl-mtmips.h"
 
 #define RT2880_GPIO_MODE_I2C		BIT(0)
 #define RT2880_GPIO_MODE_UART0		BIT(1)
@@ -15,15 +15,15 @@
 #define RT2880_GPIO_MODE_SDRAM		BIT(6)
 #define RT2880_GPIO_MODE_PCI		BIT(7)
 
-static struct ralink_pmx_func i2c_grp[] = { FUNC("i2c", 0, 1, 2) };
-static struct ralink_pmx_func spi_grp[] = { FUNC("spi", 0, 3, 4) };
-static struct ralink_pmx_func uartlite_grp[] = { FUNC("uartlite", 0, 7, 8) };
-static struct ralink_pmx_func jtag_grp[] = { FUNC("jtag", 0, 17, 5) };
-static struct ralink_pmx_func mdio_grp[] = { FUNC("mdio", 0, 22, 2) };
-static struct ralink_pmx_func sdram_grp[] = { FUNC("sdram", 0, 24, 16) };
-static struct ralink_pmx_func pci_grp[] = { FUNC("pci", 0, 40, 32) };
+static struct mtmips_pmx_func i2c_grp[] = { FUNC("i2c", 0, 1, 2) };
+static struct mtmips_pmx_func spi_grp[] = { FUNC("spi", 0, 3, 4) };
+static struct mtmips_pmx_func uartlite_grp[] = { FUNC("uartlite", 0, 7, 8) };
+static struct mtmips_pmx_func jtag_grp[] = { FUNC("jtag", 0, 17, 5) };
+static struct mtmips_pmx_func mdio_grp[] = { FUNC("mdio", 0, 22, 2) };
+static struct mtmips_pmx_func sdram_grp[] = { FUNC("sdram", 0, 24, 16) };
+static struct mtmips_pmx_func pci_grp[] = { FUNC("pci", 0, 40, 32) };
 
-static struct ralink_pmx_group rt2880_pinmux_data_act[] = {
+static struct mtmips_pmx_group rt2880_pinmux_data_act[] = {
 	GRP("i2c", i2c_grp, 1, RT2880_GPIO_MODE_I2C),
 	GRP("spi", spi_grp, 1, RT2880_GPIO_MODE_SPI),
 	GRP("uartlite", uartlite_grp, 1, RT2880_GPIO_MODE_UART0),
@@ -36,7 +36,7 @@ static struct ralink_pmx_group rt2880_pinmux_data_act[] = {
 
 static int rt2880_pinctrl_probe(struct platform_device *pdev)
 {
-	return ralink_pinctrl_init(pdev, rt2880_pinmux_data_act);
+	return mtmips_pinctrl_init(pdev, rt2880_pinmux_data_act);
 }
 
 static const struct of_device_id rt2880_pinctrl_match[] = {
diff --git a/drivers/pinctrl/ralink/pinctrl-rt305x.c b/drivers/pinctrl/mediatek/pinctrl-rt305x.c
similarity index 75%
rename from drivers/pinctrl/ralink/pinctrl-rt305x.c
rename to drivers/pinctrl/mediatek/pinctrl-rt305x.c
index fa3743c7680f..77bd4d1f6122 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt305x.c
+++ b/drivers/pinctrl/mediatek/pinctrl-rt305x.c
@@ -5,7 +5,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
-#include "pinctrl-ralink.h"
+#include "pinctrl-mtmips.h"
 
 #define RT305X_GPIO_MODE_UART0_SHIFT	2
 #define RT305X_GPIO_MODE_UART0_MASK	0x7
@@ -31,9 +31,9 @@
 #define RT3352_GPIO_MODE_LNA		18
 #define RT3352_GPIO_MODE_PA		20
 
-static struct ralink_pmx_func i2c_grp[] =  { FUNC("i2c", 0, 1, 2) };
-static struct ralink_pmx_func spi_grp[] = { FUNC("spi", 0, 3, 4) };
-static struct ralink_pmx_func uartf_grp[] = {
+static struct mtmips_pmx_func i2c_grp[] =  { FUNC("i2c", 0, 1, 2) };
+static struct mtmips_pmx_func spi_grp[] = { FUNC("spi", 0, 3, 4) };
+static struct mtmips_pmx_func uartf_grp[] = {
 	FUNC("uartf", RT305X_GPIO_MODE_UARTF, 7, 8),
 	FUNC("pcm uartf", RT305X_GPIO_MODE_PCM_UARTF, 7, 8),
 	FUNC("pcm i2s", RT305X_GPIO_MODE_PCM_I2S, 7, 8),
@@ -42,28 +42,28 @@ static struct ralink_pmx_func uartf_grp[] = {
 	FUNC("gpio uartf", RT305X_GPIO_MODE_GPIO_UARTF, 7, 4),
 	FUNC("gpio i2s", RT305X_GPIO_MODE_GPIO_I2S, 7, 4),
 };
-static struct ralink_pmx_func uartlite_grp[] = { FUNC("uartlite", 0, 15, 2) };
-static struct ralink_pmx_func jtag_grp[] = { FUNC("jtag", 0, 17, 5) };
-static struct ralink_pmx_func mdio_grp[] = { FUNC("mdio", 0, 22, 2) };
-static struct ralink_pmx_func rt5350_led_grp[] = { FUNC("led", 0, 22, 5) };
-static struct ralink_pmx_func rt5350_cs1_grp[] = {
+static struct mtmips_pmx_func uartlite_grp[] = { FUNC("uartlite", 0, 15, 2) };
+static struct mtmips_pmx_func jtag_grp[] = { FUNC("jtag", 0, 17, 5) };
+static struct mtmips_pmx_func mdio_grp[] = { FUNC("mdio", 0, 22, 2) };
+static struct mtmips_pmx_func rt5350_led_grp[] = { FUNC("led", 0, 22, 5) };
+static struct mtmips_pmx_func rt5350_cs1_grp[] = {
 	FUNC("spi_cs1", 0, 27, 1),
 	FUNC("wdg_cs1", 1, 27, 1),
 };
-static struct ralink_pmx_func sdram_grp[] = { FUNC("sdram", 0, 24, 16) };
-static struct ralink_pmx_func rt3352_rgmii_grp[] = {
+static struct mtmips_pmx_func sdram_grp[] = { FUNC("sdram", 0, 24, 16) };
+static struct mtmips_pmx_func rt3352_rgmii_grp[] = {
 	FUNC("rgmii", 0, 24, 12)
 };
-static struct ralink_pmx_func rgmii_grp[] = { FUNC("rgmii", 0, 40, 12) };
-static struct ralink_pmx_func rt3352_lna_grp[] = { FUNC("lna", 0, 36, 2) };
-static struct ralink_pmx_func rt3352_pa_grp[] = { FUNC("pa", 0, 38, 2) };
-static struct ralink_pmx_func rt3352_led_grp[] = { FUNC("led", 0, 40, 5) };
-static struct ralink_pmx_func rt3352_cs1_grp[] = {
+static struct mtmips_pmx_func rgmii_grp[] = { FUNC("rgmii", 0, 40, 12) };
+static struct mtmips_pmx_func rt3352_lna_grp[] = { FUNC("lna", 0, 36, 2) };
+static struct mtmips_pmx_func rt3352_pa_grp[] = { FUNC("pa", 0, 38, 2) };
+static struct mtmips_pmx_func rt3352_led_grp[] = { FUNC("led", 0, 40, 5) };
+static struct mtmips_pmx_func rt3352_cs1_grp[] = {
 	FUNC("spi_cs1", 0, 45, 1),
 	FUNC("wdg_cs1", 1, 45, 1),
 };
 
-static struct ralink_pmx_group rt3050_pinmux_data[] = {
+static struct mtmips_pmx_group rt3050_pinmux_data[] = {
 	GRP("i2c", i2c_grp, 1, RT305X_GPIO_MODE_I2C),
 	GRP("spi", spi_grp, 1, RT305X_GPIO_MODE_SPI),
 	GRP("uartf", uartf_grp, RT305X_GPIO_MODE_UART0_MASK,
@@ -76,7 +76,7 @@ static struct ralink_pmx_group rt3050_pinmux_data[] = {
 	{ 0 }
 };
 
-static struct ralink_pmx_group rt3352_pinmux_data[] = {
+static struct mtmips_pmx_group rt3352_pinmux_data[] = {
 	GRP("i2c", i2c_grp, 1, RT305X_GPIO_MODE_I2C),
 	GRP("spi", spi_grp, 1, RT305X_GPIO_MODE_SPI),
 	GRP("uartf", uartf_grp, RT305X_GPIO_MODE_UART0_MASK,
@@ -92,7 +92,7 @@ static struct ralink_pmx_group rt3352_pinmux_data[] = {
 	{ 0 }
 };
 
-static struct ralink_pmx_group rt5350_pinmux_data[] = {
+static struct mtmips_pmx_group rt5350_pinmux_data[] = {
 	GRP("i2c", i2c_grp, 1, RT305X_GPIO_MODE_I2C),
 	GRP("spi", spi_grp, 1, RT305X_GPIO_MODE_SPI),
 	GRP("uartf", uartf_grp, RT305X_GPIO_MODE_UART0_MASK,
@@ -107,11 +107,11 @@ static struct ralink_pmx_group rt5350_pinmux_data[] = {
 static int rt305x_pinctrl_probe(struct platform_device *pdev)
 {
 	if (soc_is_rt5350())
-		return ralink_pinctrl_init(pdev, rt5350_pinmux_data);
+		return mtmips_pinctrl_init(pdev, rt5350_pinmux_data);
 	else if (soc_is_rt305x() || soc_is_rt3350())
-		return ralink_pinctrl_init(pdev, rt3050_pinmux_data);
+		return mtmips_pinctrl_init(pdev, rt3050_pinmux_data);
 	else if (soc_is_rt3352())
-		return ralink_pinctrl_init(pdev, rt3352_pinmux_data);
+		return mtmips_pinctrl_init(pdev, rt3352_pinmux_data);
 	else
 		return -EINVAL;
 }
diff --git a/drivers/pinctrl/ralink/pinctrl-rt3883.c b/drivers/pinctrl/mediatek/pinctrl-rt3883.c
similarity index 80%
rename from drivers/pinctrl/ralink/pinctrl-rt3883.c
rename to drivers/pinctrl/mediatek/pinctrl-rt3883.c
index 5f766d76bafa..eeaf344c3647 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt3883.c
+++ b/drivers/pinctrl/mediatek/pinctrl-rt3883.c
@@ -3,7 +3,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
-#include "pinctrl-ralink.h"
+#include "pinctrl-mtmips.h"
 
 #define RT3883_GPIO_MODE_UART0_SHIFT	2
 #define RT3883_GPIO_MODE_UART0_MASK	0x7
@@ -39,9 +39,9 @@
 #define RT3883_GPIO_MODE_LNA_G_GPIO	0x3
 #define RT3883_GPIO_MODE_LNA_G		_RT3883_GPIO_MODE_LNA_G(RT3883_GPIO_MODE_LNA_G_MASK)
 
-static struct ralink_pmx_func i2c_grp[] =  { FUNC("i2c", 0, 1, 2) };
-static struct ralink_pmx_func spi_grp[] = { FUNC("spi", 0, 3, 4) };
-static struct ralink_pmx_func uartf_grp[] = {
+static struct mtmips_pmx_func i2c_grp[] =  { FUNC("i2c", 0, 1, 2) };
+static struct mtmips_pmx_func spi_grp[] = { FUNC("spi", 0, 3, 4) };
+static struct mtmips_pmx_func uartf_grp[] = {
 	FUNC("uartf", RT3883_GPIO_MODE_UARTF, 7, 8),
 	FUNC("pcm uartf", RT3883_GPIO_MODE_PCM_UARTF, 7, 8),
 	FUNC("pcm i2s", RT3883_GPIO_MODE_PCM_I2S, 7, 8),
@@ -50,21 +50,21 @@ static struct ralink_pmx_func uartf_grp[] = {
 	FUNC("gpio uartf", RT3883_GPIO_MODE_GPIO_UARTF, 7, 4),
 	FUNC("gpio i2s", RT3883_GPIO_MODE_GPIO_I2S, 7, 4),
 };
-static struct ralink_pmx_func uartlite_grp[] = { FUNC("uartlite", 0, 15, 2) };
-static struct ralink_pmx_func jtag_grp[] = { FUNC("jtag", 0, 17, 5) };
-static struct ralink_pmx_func mdio_grp[] = { FUNC("mdio", 0, 22, 2) };
-static struct ralink_pmx_func lna_a_grp[] = { FUNC("lna a", 0, 32, 3) };
-static struct ralink_pmx_func lna_g_grp[] = { FUNC("lna g", 0, 35, 3) };
-static struct ralink_pmx_func pci_grp[] = {
+static struct mtmips_pmx_func uartlite_grp[] = { FUNC("uartlite", 0, 15, 2) };
+static struct mtmips_pmx_func jtag_grp[] = { FUNC("jtag", 0, 17, 5) };
+static struct mtmips_pmx_func mdio_grp[] = { FUNC("mdio", 0, 22, 2) };
+static struct mtmips_pmx_func lna_a_grp[] = { FUNC("lna a", 0, 32, 3) };
+static struct mtmips_pmx_func lna_g_grp[] = { FUNC("lna g", 0, 35, 3) };
+static struct mtmips_pmx_func pci_grp[] = {
 	FUNC("pci-dev", 0, 40, 32),
 	FUNC("pci-host2", 1, 40, 32),
 	FUNC("pci-host1", 2, 40, 32),
 	FUNC("pci-fnc", 3, 40, 32)
 };
-static struct ralink_pmx_func ge1_grp[] = { FUNC("ge1", 0, 72, 12) };
-static struct ralink_pmx_func ge2_grp[] = { FUNC("ge2", 0, 84, 12) };
+static struct mtmips_pmx_func ge1_grp[] = { FUNC("ge1", 0, 72, 12) };
+static struct mtmips_pmx_func ge2_grp[] = { FUNC("ge2", 0, 84, 12) };
 
-static struct ralink_pmx_group rt3883_pinmux_data[] = {
+static struct mtmips_pmx_group rt3883_pinmux_data[] = {
 	GRP("i2c", i2c_grp, 1, RT3883_GPIO_MODE_I2C),
 	GRP("spi", spi_grp, 1, RT3883_GPIO_MODE_SPI),
 	GRP("uartf", uartf_grp, RT3883_GPIO_MODE_UART0_MASK,
@@ -83,7 +83,7 @@ static struct ralink_pmx_group rt3883_pinmux_data[] = {
 
 static int rt3883_pinctrl_probe(struct platform_device *pdev)
 {
-	return ralink_pinctrl_init(pdev, rt3883_pinmux_data);
+	return mtmips_pinctrl_init(pdev, rt3883_pinmux_data);
 }
 
 static const struct of_device_id rt3883_pinctrl_match[] = {
diff --git a/drivers/pinctrl/ralink/Kconfig b/drivers/pinctrl/ralink/Kconfig
deleted file mode 100644
index c5fe4c31aaea..000000000000
--- a/drivers/pinctrl/ralink/Kconfig
+++ /dev/null
@@ -1,40 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-menu "Ralink pinctrl drivers"
-        depends on RALINK
-
-config PINCTRL_RALINK
-        bool "Ralink pinctrl driver"
-        select PINMUX
-        select GENERIC_PINCONF
-
-config PINCTRL_MT7620
-        bool "MT7620 pinctrl subdriver"
-        depends on RALINK && SOC_MT7620
-        select PINCTRL_RALINK
-
-config PINCTRL_MT7621
-        bool "MT7621 pinctrl subdriver"
-        depends on RALINK && SOC_MT7621
-        select PINCTRL_RALINK
-
-config PINCTRL_MT76X8
-        bool "MT76X8 pinctrl subdriver"
-        depends on RALINK && SOC_MT7620
-        select PINCTRL_RALINK
-
-config PINCTRL_RT2880
-        bool "RT2880 pinctrl subdriver"
-        depends on RALINK && SOC_RT288X
-        select PINCTRL_RALINK
-
-config PINCTRL_RT305X
-        bool "RT305X pinctrl subdriver"
-        depends on RALINK && SOC_RT305X
-        select PINCTRL_RALINK
-
-config PINCTRL_RT3883
-        bool "RT3883 pinctrl subdriver"
-        depends on RALINK && SOC_RT3883
-        select PINCTRL_RALINK
-
-endmenu
diff --git a/drivers/pinctrl/ralink/Makefile b/drivers/pinctrl/ralink/Makefile
deleted file mode 100644
index be9acf2e27fd..000000000000
--- a/drivers/pinctrl/ralink/Makefile
+++ /dev/null
@@ -1,9 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_PINCTRL_RALINK)   += pinctrl-ralink.o
-
-obj-$(CONFIG_PINCTRL_MT7620)   += pinctrl-mt7620.o
-obj-$(CONFIG_PINCTRL_MT7621)   += pinctrl-mt7621.o
-obj-$(CONFIG_PINCTRL_MT76X8)   += pinctrl-mt76x8.o
-obj-$(CONFIG_PINCTRL_RT2880)   += pinctrl-rt2880.o
-obj-$(CONFIG_PINCTRL_RT305X)   += pinctrl-rt305x.o
-obj-$(CONFIG_PINCTRL_RT3883)   += pinctrl-rt3883.o
-- 
2.37.2

