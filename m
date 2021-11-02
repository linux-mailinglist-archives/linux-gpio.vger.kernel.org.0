Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A08F4438E1
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 23:57:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231419AbhKBW7n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 18:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbhKBW7l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 18:59:41 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 875A5C061714;
        Tue,  2 Nov 2021 15:57:06 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id b17so594910qvl.9;
        Tue, 02 Nov 2021 15:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tf8G6SIOApaUaJO9pxLfwQw4yArH0WpJ7K2Fnq6jDtk=;
        b=Tre6hYyrdHJVK2yOzhxQyvNB6DmIhoAUYAfZnVqL6MkvLaL4Cc5QsbbuAz2OfHj5ta
         nriXAmirrdWLw9JlmZbxJ9hoykd7fpTBOykNo5D6mco7JKiJpWmDSPJXeWCjOOSEirdD
         9LM3lzaq0w1t6K+226UqDOPcJKQSA0jTriAEb55dYri7gnoNPp0u1yCApdSihSqluYeH
         0kpdcT1kkdCutOGtVcjmAVXJNxU6KUgD52/7eSUqIJ2jQqQ1UkLdWRACRWiCRWOxmFLL
         NKbgZuH7PSOK2ptvoUkJmn+fBMYzdL8Fnyqj+FFSm8ePvO8+/3fMiQyJOVAmO6q3N7oH
         hFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tf8G6SIOApaUaJO9pxLfwQw4yArH0WpJ7K2Fnq6jDtk=;
        b=7xSbVAY8PuLekFWLJ3GGdSIau4gig6ynOE0v9XIw4teEFDkiUT76AmjqprrcF1eMVp
         LmV1eWtUmpytyWEieRutizRsyfFyvYakZEkp5wy/C2C27tAW2NQ9olrwB6BCufoiir08
         N53+FA4bAxiSc6kgEp5haz5KOPT+/5YEllpHonbQio9HyZuRyxvR2znoFZ1nM/g6i610
         S2ma+JJK6A1AwGS8T7vB1Gio/kGeF5LL7hNPX/cBjZ/9ODUx3kHicxStWCqtM8W8Ho6y
         O3UyUwr/VTNqbVaWJu2CMgqEFJugtsYS6ETnawEuBuyq3iHvWJCJlYz4fHigajAoxLBT
         AYLA==
X-Gm-Message-State: AOAM533UVwDAcuSQPh52tts9Ma1xqeyKcDkEPtTJI1CSQ4flbzbwTtW0
        jXZnPp3BNGRd21XqlLDjA5s=
X-Google-Smtp-Source: ABdhPJwHWSusTYtlpK15i6eOWqx1ByT5GDJfEYYOk729XHStEVb6LE8ohkDSctHJeOh4D4atsM+upA==
X-Received: by 2002:ac8:5d86:: with SMTP id d6mr41050726qtx.194.1635893825698;
        Tue, 02 Nov 2021 15:57:05 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id v19sm351222qtk.6.2021.11.02.15.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 15:57:05 -0700 (PDT)
From:   Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To:     linux-imx@nxp.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
        stefan@agner.ch, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net,
        soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
        adrian.hunter@intel.com, jirislaby@kernel.org,
        giulio.benetti@benettiengineering.com,
        nobuhiro1.iwamatsu@toshiba.co.jp, Mr.Bossman075@gmail.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH v2 01/13] ARM: imx: add initial support for i.MXRT10xx family
Date:   Tue,  2 Nov 2021 18:56:49 -0400
Message-Id: <20211102225701.98944-2-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Giulio Benetti <giulio.benetti@benettiengineering.com>

The i.MXRT10xx family of processors features NXP's implementation of the
Arm Cortex-M7 core and in some case the Arm Cortex-M4 core too.

This patch aims to add an initial support for imxrt.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
[Jesse: removed SOC_IMXRT's 'depends on ARCH_MULTI_V7' and 'select
ARM_GIC if ARCH_MULTI_V7']
---
V1->V2:
* Remove depends ARCH_MULTI_V7
* Remove select PINCTRL_IMXRT
* Change commit description
---
 arch/arm/mach-imx/Kconfig      |  7 +++++++
 arch/arm/mach-imx/Makefile     |  2 ++
 arch/arm/mach-imx/mach-imxrt.c | 19 +++++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 arch/arm/mach-imx/mach-imxrt.c

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index b407b024dde3..5ad3a8b9b4b6 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -239,6 +239,13 @@ config SOC_IMX7ULP
 	help
 	  This enables support for Freescale i.MX7 Ultra Low Power processor.
 
+config SOC_IMXRT
+	bool "i.MXRT support"
+	depends on ARM_SINGLE_ARMV7M
+	select ARMV7M_SYSTICK if ARM_SINGLE_ARMV7M
+	help
+	  This enables support for Freescale i.MXRT Crossover processor.
+
 config SOC_VF610
 	bool "Vybrid Family VF610 support"
 	select ARM_GIC if ARCH_MULTI_V7
diff --git a/arch/arm/mach-imx/Makefile b/arch/arm/mach-imx/Makefile
index d1506ef7a537..3b1145722a44 100644
--- a/arch/arm/mach-imx/Makefile
+++ b/arch/arm/mach-imx/Makefile
@@ -65,6 +65,8 @@ obj-$(CONFIG_SOC_IMX50) += mach-imx50.o
 obj-$(CONFIG_SOC_IMX51) += mach-imx51.o
 obj-$(CONFIG_SOC_IMX53) += mach-imx53.o
 
+obj-$(CONFIG_SOC_IMXRT) += mach-imxrt.o
+
 obj-$(CONFIG_SOC_VF610) += mach-vf610.o
 
 obj-$(CONFIG_SOC_LS1021A) += mach-ls1021a.o
diff --git a/arch/arm/mach-imx/mach-imxrt.c b/arch/arm/mach-imx/mach-imxrt.c
new file mode 100644
index 000000000000..2063a3059c84
--- /dev/null
+++ b/arch/arm/mach-imx/mach-imxrt.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019
+ * Author(s): Giulio Benetti <giulio.benetti@benettiengineering.com>
+ */
+
+#include <linux/kernel.h>
+#include <asm/mach/arch.h>
+#include <asm/v7m.h>
+
+static const char *const imxrt_compat[] __initconst = {
+	"fsl,imxrt1050",
+	NULL
+};
+
+DT_MACHINE_START(IMXRTDT, "IMXRT (Device Tree Support)")
+	.dt_compat = imxrt_compat,
+	.restart = armv7m_restart,
+MACHINE_END
-- 
2.33.1

