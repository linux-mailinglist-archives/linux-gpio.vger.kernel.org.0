Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB4363DBB43
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 16:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239530AbhG3OuI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 10:50:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239576AbhG3Ot5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 10:49:57 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B9F7C0617BA
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 07:49:39 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id da26so13582594edb.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 07:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZLLSVppmE/RVCbEA1xTEsZE8W6wm39t886R9xa0xNrY=;
        b=hprBOmjDWtssr6PK7cLmgxAg2ovHOPaZumX+uWzBmSlXfpMGzu8z1alzVsckt8o1wK
         TWfpOiQRO7jOyKJBWt3hHikxhGhbiVpcQMZL/8GQGLRxeL8poHWeAXQX2442VL7A/5oE
         COBQ1eg3tlyZSuY+0jJOhve+U+F+iGTiDBdMZ/3SZkTZdtVEXoXYYuZpICn3k0e3EXmF
         krRW+tzZAjSk9HQhFLtsncCvwk6wQaSrwtp1+ZTwFMfIPzHhlAV5a9DN7D/fTWLK7nCf
         n7vsW16cg0zDrtNGMwa7nHUn/sRCElFEgdpMtupT/IYbKA5WJ2k7DQv84r5Uywhq4tgQ
         0RKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZLLSVppmE/RVCbEA1xTEsZE8W6wm39t886R9xa0xNrY=;
        b=U/OnyJfSsJJFAdqIgCwPbSqn+CUMAsYhVCRN9vcWvwRMnTYfcoBdURmB39YTJSq6rh
         40laFCcZ1Iaw71QcHpbFDArgTGna20uHcVNp62c5mDuIfilyBrwnTEWGt2CUvD5DoF3v
         BKY4fziglSBXl8OBHeNnsRSO5xCBI59zeJigDfFJYwXDKPTfcujVQxtxKM95T6bCGXVi
         g5nHF+DAi67Wgyi5OaukOhMkLCXi+N9c2jbRPe54X55vaBOi7TyJjhOkUZXLV9/z4hz1
         5qBvThKCiP9AiKMXhmVtuXjQGLG4gOjZHDIwipmCR6ObFwwdr7jzaRxjhbw5pQhSITiV
         CNog==
X-Gm-Message-State: AOAM532KwBW4K9Rwzlz9FqX4S8M2peEvjj/0V/O4MfGhgsYQG+hzMcw7
        wDNX/ggAJBZhMKrbp5dIH7ncag==
X-Google-Smtp-Source: ABdhPJxaYUDPRno24m4L2mhXRl4xDHcwWipM1H7LYxjuZZp5osFydXTtJwofiJL/mifZMPo80yBrVA==
X-Received: by 2002:a50:cf8c:: with SMTP id h12mr3308585edk.360.1627656577615;
        Fri, 30 Jul 2021 07:49:37 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id s24sm664883ejd.19.2021.07.30.07.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:49:37 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH 09/12] dt-bindings: clock: Add bindings for Exynos850 clock controller
Date:   Fri, 30 Jul 2021 17:49:19 +0300
Message-Id: <20210730144922.29111-10-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210730144922.29111-1-semen.protsenko@linaro.org>
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add documentation for Exynos850 clock driver bindings and corresponding
clock ID constants, which will be used further both in clock driver and
in device tree files. Constants are grouped per domain basis (CMU) for
more convenient usage, but those are just unique numbers and have
nothing to do with register offsets, etc.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../bindings/clock/exynos850-clock.yaml       |  70 +++++
 include/dt-bindings/clock/exynos850.h         | 267 ++++++++++++++++++
 2 files changed, 337 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/exynos850-clock.yaml
 create mode 100644 include/dt-bindings/clock/exynos850.h

diff --git a/Documentation/devicetree/bindings/clock/exynos850-clock.yaml b/Documentation/devicetree/bindings/clock/exynos850-clock.yaml
new file mode 100644
index 000000000000..201c2b79e629
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/exynos850-clock.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/exynos850-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Clock bindings for Samsung Exynos850 clock controller
+
+maintainers:
+  - Sam Protsenko <semen.protsenko@linaro.org>
+
+description: |
+  The Exynos850 clock controller generates and supplies clock to various
+  controllers within the SoC. Each clock is assigned an identifier and client
+  nodes can use this identifier to specify the clock which they consume.
+
+  All available clocks are defined as preprocessor macros in
+  dt-bindings/clock/exynos850.h header and can be used in device tree sources.
+
+properties:
+  compatible:
+    const: samsung,exynos850-clock
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  # Clock controller node
+  - |
+    clock: clock-controller@0x120e0000 {
+        compatible = "samsung,exynos850-clock";
+        reg = <0x0 0x120e0000 0x8000>;
+        #clock-cells = <1>;
+    };
+
+  # Required external clocks (should be provided in particular board DTS)
+  - |
+    fixed-rate-clocks {
+        oscclk {
+            compatible = "samsung,exynos850-oscclk";
+            clock-frequency = <26000000>;
+        };
+    };
+
+  # UART controller node that consumes the clock generated by the clock
+  # controller
+  - |
+    #include <dt-bindings/clock/exynos850.h>
+
+    serial_0: uart@13820000 {
+        compatible = "samsung,exynos850-uart";
+        reg = <0x0 0x13820000 0x100>;
+        interrupts = <GIC_SPI INTREQ__UART IRQ_TYPE_LEVEL_HIGH>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&uart0_bus>;
+        clocks = <&clock GATE_UART_QCH>, <&clock DOUT_UART>;
+        clock-names = "gate_uart_clk0", "uart";
+    };
+
+...
diff --git a/include/dt-bindings/clock/exynos850.h b/include/dt-bindings/clock/exynos850.h
new file mode 100644
index 000000000000..b197db4427fc
--- /dev/null
+++ b/include/dt-bindings/clock/exynos850.h
@@ -0,0 +1,267 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2019 Samsung Electronics Co., Ltd.
+ * Copyright (C) 2021 Linaro Ltd.
+ *
+ * Device Tree binding constants for Exynos850 clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_EXYNOS_850_H
+#define _DT_BINDINGS_CLOCK_EXYNOS_850_H
+
+#define NONE					(0 + 0)
+#define OSCCLK					(0 + 1)
+
+#define CLK_APM_BASE				(10)
+#define UMUX_DLL_USER				(CLK_APM_BASE + 0)
+#define UMUX_CLK_APM_BUS			(CLK_APM_BASE + 1)
+#define GATE_APM_CMU_APM_QCH			(CLK_APM_BASE + 2)
+#define GATE_GREBEINTEGRATION_QCH_GREBE		(CLK_APM_BASE + 3)
+#define GATE_GREBEINTEGRATION_QCH_DBG		(CLK_APM_BASE + 4)
+#define GATE_I3C_APM_PMIC_QCH_S_I3C		(CLK_APM_BASE + 5)
+#define GATE_I3C_APM_PMIC_QCH			(CLK_APM_BASE + 6)
+#define GATE_INTMEM_QCH				(CLK_APM_BASE + 7)
+#define GATE_MAILBOX_APM_AP_QCH			(CLK_APM_BASE + 8)
+#define GATE_MAILBOX_APM_CHUB_QCH		(CLK_APM_BASE + 9)
+#define GATE_MAILBOX_APM_CP_QCH			(CLK_APM_BASE + 10)
+#define GATE_MAILBOX_APM_GNSS_QCH		(CLK_APM_BASE + 11)
+#define GATE_MAILBOX_APM_WLBT_QCH		(CLK_APM_BASE + 12)
+#define GATE_MAILBOX_AP_CHUB_QCH		(CLK_APM_BASE + 13)
+#define GATE_MAILBOX_AP_CP_QCH			(CLK_APM_BASE + 14)
+#define GATE_MAILBOX_AP_CP_S_QCH		(CLK_APM_BASE + 15)
+#define GATE_MAILBOX_AP_GNSS_QCH		(CLK_APM_BASE + 16)
+#define GATE_MAILBOX_AP_WLBT_QCH		(CLK_APM_BASE + 17)
+#define GATE_MAILBOX_CP_CHUB_QCH		(CLK_APM_BASE + 18)
+#define GATE_MAILBOX_CP_GNSS_QCH		(CLK_APM_BASE + 19)
+#define GATE_MAILBOX_CP_WLBT_QCH		(CLK_APM_BASE + 20)
+#define GATE_MAILBOX_GNSS_CHUB_QCH		(CLK_APM_BASE + 21)
+#define GATE_MAILBOX_GNSS_WLBT_QCH		(CLK_APM_BASE + 22)
+#define GATE_MAILBOX_WLBT_ABOX_QCH		(CLK_APM_BASE + 23)
+#define GATE_MAILBOX_WLBT_CHUB_QCH		(CLK_APM_BASE + 24)
+#define GATE_PMU_INTR_GEN_QCH			(CLK_APM_BASE + 25)
+#define GATE_ROM_CRC32_HOST_QCH			(CLK_APM_BASE + 26)
+#define GATE_SPEEDY_APM_QCH			(CLK_APM_BASE + 27)
+#define GATE_WDT_APM_QCH			(CLK_APM_BASE + 28)
+
+#define CLK_AUD_BASE				(50)
+#define UMUX_CLK_AUD_CPU_HCH			(CLK_AUD_BASE + 0)
+#define GATE_ABOX_QCH_CPU			(CLK_AUD_BASE + 1)
+#define GATE_ABOX_QCH_ACLK			(CLK_AUD_BASE + 2)
+#define GATE_ABOX_QCH_BCLK0			(CLK_AUD_BASE + 3)
+#define GATE_ABOX_QCH_BCLK1			(CLK_AUD_BASE + 4)
+#define GATE_ABOX_QCH_FM			(CLK_AUD_BASE + 5)
+#define GATE_ABOX_QCH_BCLK2			(CLK_AUD_BASE + 6)
+#define GATE_ABOX_QCH_CCLK_ASB			(CLK_AUD_BASE + 7)
+#define GATE_ABOX_QCH_BCLK3			(CLK_AUD_BASE + 8)
+#define GATE_ABOX_QCH_BCLK4			(CLK_AUD_BASE + 9)
+#define GATE_ABOX_QCH_BCLK5			(CLK_AUD_BASE + 10)
+#define GATE_ABOX_QCH_BCLK6			(CLK_AUD_BASE + 11)
+#define GATE_ABOX_QCH_BCLK_CNT			(CLK_AUD_BASE + 12)
+#define GATE_AUD_CMU_AUD_QCH			(CLK_AUD_BASE + 13)
+#define GATE_GPIO_AUD_QCH			(CLK_AUD_BASE + 14)
+#define GATE_SYSMMU_AUD_QCH_S1			(CLK_AUD_BASE + 15)
+#define GATE_WDT_AUD_QCH			(CLK_AUD_BASE + 16)
+#define PLL_AUD_OUT				(CLK_AUD_BASE + 17)
+#define DOUT_CLK_AUD_CPU			(CLK_AUD_BASE + 18)
+#define DOUT_CLK_AUD_CPU_ACLK			(CLK_AUD_BASE + 19)
+#define DOUT_CLK_AUD_CPU_PCLKDBG		(CLK_AUD_BASE + 20)
+#define DOUT_CLK_AUD_BUSD			(CLK_AUD_BASE + 21)
+#define DOUT_CLK_AUD_UAIF0			(CLK_AUD_BASE + 23)
+#define DOUT_CLK_AUD_UAIF1			(CLK_AUD_BASE + 24)
+#define DOUT_CLK_AUD_FM				(CLK_AUD_BASE + 25)
+#define DOUT_CLK_AUD_BUSP			(CLK_AUD_BASE + 26)
+#define DOUT_CLK_AUD_UAIF2			(CLK_AUD_BASE + 27)
+#define DOUT_CLK_AUD_CNT			(CLK_AUD_BASE + 28)
+#define DOUT_CLK_AUD_UAIF3			(CLK_AUD_BASE + 29)
+#define DOUT_CLK_AUD_UAIF4			(CLK_AUD_BASE + 30)
+#define DOUT_CLK_AUD_UAIF5			(CLK_AUD_BASE + 31)
+#define DOUT_CLK_AUD_UAIF6			(CLK_AUD_BASE + 32)
+#define DOUT_CLK_AUD_AUDIF			(CLK_AUD_BASE + 33)
+#define DOUT_CLK_AUD_MCLK			(CLK_AUD_BASE + 34)
+#define UMUX_CLK_AUD_FM				(CLK_AUD_BASE + 35)
+
+#define CLK_CHUB_BASE				(100)
+#define GATE_BAAW_C_CHUB_QCH			(CLK_CHUB_BASE  + 0)
+#define GATE_BAAW_D_CHUB_QCH			(CLK_CHUB_BASE  + 1)
+#define GATE_CHUB_CMU_CHUB_QCH			(CLK_CHUB_BASE  + 2)
+#define GATE_CM4_CHUB_QCH			(CLK_CHUB_BASE  + 3)
+#define GATE_DMIC_AHB0_QCH			(CLK_CHUB_BASE  + 4)
+#define GATE_DMIC_IF_QCH_PCLK			(CLK_CHUB_BASE  + 5)
+#define GATE_DMIC_IF_QCH_DMIC_CLK		(CLK_CHUB_BASE  + 6)
+#define GATE_HWACG_SYS_DMIC0_QCH		(CLK_CHUB_BASE  + 7)
+#define GATE_PWM_CHUB_QCH			(CLK_CHUB_BASE  + 8)
+#define GATE_SWEEPER_C_CHUB_QCH			(CLK_CHUB_BASE  + 9)
+#define GATE_SWEEPER_D_CHUB_QCH			(CLK_CHUB_BASE  + 10)
+#define GATE_TIMER_CHUB_QCH			(CLK_CHUB_BASE  + 11)
+#define GATE_WDT_CHUB_QCH			(CLK_CHUB_BASE  + 12)
+#define GATE_U_DMIC_CLK_SCAN_MUX_QCH		(CLK_CHUB_BASE  + 13)
+#define DOUT_CLK_CHUB_BUS			(CLK_CHUB_BASE  + 14)
+#define DOUT_CLK_CHUB_DMIC_IF			(CLK_CHUB_BASE  + 15)
+#define DOUT_CLK_CHUB_DMIC_IF_DIV2		(CLK_CHUB_BASE  + 16)
+#define DOUT_CLK_CHUB_DMIC			(CLK_CHUB_BASE  + 17)
+
+#define CLK_CMGP_BASE				(150)
+#define UMUX_CLK_CMGP_USI_CMGP0			(CLK_CMGP_BASE +  0)
+#define UMUX_CLK_CMGP_USI_CMGP1			(CLK_CMGP_BASE +  1)
+#define GATE_ADC_CMGP_QCH_S0			(CLK_CMGP_BASE +  2)
+#define GATE_ADC_CMGP_QCH_S1			(CLK_CMGP_BASE +  3)
+#define GATE_ADC_CMGP_QCH_ADC			(CLK_CMGP_BASE +  4)
+#define GATE_CMGP_CMU_CMGP_QCH			(CLK_CMGP_BASE +  5)
+#define GATE_GPIO_CMGP_QCH			(CLK_CMGP_BASE +  6)
+#define GATE_USI_CMGP0_QCH			(CLK_CMGP_BASE +  7)
+#define GATE_USI_CMGP1_QCH			(CLK_CMGP_BASE +  8)
+#define DOUT_CLK_CMGP_ADC			(CLK_CMGP_BASE +  9)
+#define DOUT_CLK_CMGP_USI_CMGP0			(CLK_CMGP_BASE +  10)
+#define DOUT_CLK_CMGP_USI_CMGP1			(CLK_CMGP_BASE +  11)
+
+#define CLK_TOP_BASE				(200)
+#define GATE_CMU_TOP_CMUREF_QCH			(CLK_TOP_BASE + 0)
+#define GATE_DFTMUX_CMU_QCH_CLK_CIS0		(CLK_TOP_BASE + 1)
+#define GATE_DFTMUX_CMU_QCH_CLK_CIS1		(CLK_TOP_BASE + 2)
+#define GATE_DFTMUX_CMU_QCH_CLK_CIS2		(CLK_TOP_BASE + 3)
+#define GATE_OTP_QCH				(CLK_TOP_BASE + 4)
+#define GATE_ADM_AHB_SSS_QCH			(CLK_TOP_BASE + 5)
+#define GATE_BAAW_P_CHUB_QCH			(CLK_TOP_BASE + 6)
+#define GATE_BAAW_P_GNSS_QCH			(CLK_TOP_BASE + 7)
+#define GATE_BAAW_P_MODEM_QCH			(CLK_TOP_BASE + 8)
+#define GATE_BAAW_P_WLBT_QCH			(CLK_TOP_BASE + 9)
+
+#define CLK_CORE_BASE				(250)
+#define GATE_CCI_550_QCH			(CLK_CORE_BASE + 0)
+#define GATE_CORE_CMU_CORE_QCH			(CLK_CORE_BASE + 1)
+#define GATE_GIC_QCH				(CLK_CORE_BASE + 2)
+#define GATE_GPIO_CORE_QCH			(CLK_CORE_BASE + 3)
+#define GATE_MMC_EMBD_QCH			(CLK_CORE_BASE + 4)
+#define GATE_PDMA_CORE_QCH			(CLK_CORE_BASE + 5)
+#define GATE_RTIC_QCH				(CLK_CORE_BASE + 6)
+#define GATE_SPDMA_CORE_QCH			(CLK_CORE_BASE + 7)
+#define GATE_SSS_QCH				(CLK_CORE_BASE + 8)
+#define GATE_TREX_D_CORE_QCH			(CLK_CORE_BASE + 9)
+#define GATE_TREX_P_CORE_QCH			(CLK_CORE_BASE + 10)
+#define GATE_CSSYS_DBG_QCH			(CLK_CORE_BASE + 11)
+#define GATE_SECJTAG_QCH			(CLK_CORE_BASE + 12)
+#define DOUT_CORE_MMC_EMBD			(CLK_CORE_BASE + 13)
+
+#define CLK_DPU_BASE				(300)
+#define GATE_DPU_QCH_S_DPP			(CLK_DPU_BASE  + 0)
+#define GATE_DPU_QCH_S_DMA			(CLK_DPU_BASE  + 1)
+#define GATE_DPU_QCH_S_DECON			(CLK_DPU_BASE  + 2)
+#define GATE_DPU_CMU_DPU_QCH			(CLK_DPU_BASE  + 3)
+#define GATE_SMMU_DPU_QCH			(CLK_DPU_BASE  + 4)
+#define DOUT_CLK_DPU_BUSP			(CLK_DPU_BASE  + 5)
+
+#define CLK_G3D_BASE				(350)
+#define GATE_G3D_CMU_G3D_QCH			(CLK_G3D_BASE + 0)
+#define GATE_GPU_QCH				(CLK_G3D_BASE + 1)
+#define DOUT_CLK_G3D_BUSP			(CLK_G3D_BASE + 2)
+
+#define CLK_HIS_BASE				(400)
+#define GATE_GPIO_HSI_QCH			(CLK_HIS_BASE + 0)
+#define GATE_HSI_CMU_HSI_QCH			(CLK_HIS_BASE + 1)
+#define GATE_MMC_CARD_QCH			(CLK_HIS_BASE + 2)
+#define GATE_USB20DRD_TOP_QCH_LINK		(CLK_HIS_BASE + 3)
+#define GATE_USB20DRD_TOP_QCH_20CTRL		(CLK_HIS_BASE + 4)
+#define GATE_USB20DRD_TOP_QCH_REFCLK		(CLK_HIS_BASE + 5)
+#define GATE_USB20DRD_TOP_QCH_RTC		(CLK_HIS_BASE + 6)
+#define PLL_MMC_OUT				(CLK_HIS_BASE + 7)
+#define HSI_BUS					(CLK_HIS_BASE + 8)
+#define HSI_MMC_CARD				(CLK_HIS_BASE + 9)
+#define HSI_USB20DRD				(CLK_HIS_BASE + 10)
+
+#define CLK_IS_BASE				(450)
+#define GATE_CSIS0_QCH				(CLK_IS_BASE + 0)
+#define GATE_CSIS1_QCH				(CLK_IS_BASE + 1)
+#define GATE_CSIS2_QCH				(CLK_IS_BASE + 2)
+#define GATE_IS_CMU_IS_QCH			(CLK_IS_BASE + 3)
+#define GATE_IS_TOP_QCH_S_00			(CLK_IS_BASE + 4)
+#define GATE_IS_TOP_QCH_S_02			(CLK_IS_BASE + 5)
+#define GATE_IS_TOP_QCH_S_03			(CLK_IS_BASE + 6)
+#define GATE_IS_TOP_QCH_S_04			(CLK_IS_BASE + 7)
+#define GATE_IS_TOP_QCH_S_05			(CLK_IS_BASE + 8)
+#define GATE_IS_TOP_QCH_S_06			(CLK_IS_BASE + 9)
+#define GATE_SYSMMU_IS0_QCH			(CLK_IS_BASE + 10)
+#define GATE_SYSMMU_IS1_QCH			(CLK_IS_BASE + 11)
+#define IS_BUS					(CLK_IS_BASE + 12)
+#define IS_VRA					(CLK_IS_BASE + 13)
+#define IS_ITP					(CLK_IS_BASE + 14)
+#define IS_GDC					(CLK_IS_BASE + 15)
+#define UMUX_CLK_IS_BUS				(CLK_IS_BASE + 15)
+#define UMUX_CLK_IS_ITP				(CLK_IS_BASE + 16)
+#define UMUX_CLK_IS_VRA				(CLK_IS_BASE + 17)
+#define UMUX_CLK_IS_GDC				(CLK_IS_BASE + 18)
+#define GATE_CLK_ITP				(CLK_IS_BASE + 19)
+#define GATE_CLK_VRA				(CLK_IS_BASE + 20)
+#define GATE_CLK_GDC				(CLK_IS_BASE + 21)
+#define CIS_CLK0				(CLK_IS_BASE + 22)
+#define CIS_CLK1				(CLK_IS_BASE + 23)
+#define CIS_CLK2				(CLK_IS_BASE + 24)
+
+#define CLK_MFCMSCL_BASE			(500)
+#define GATE_JPEG_QCH				(CLK_MFCMSCL_BASE + 0)
+#define GATE_M2M_QCH				(CLK_MFCMSCL_BASE + 1)
+#define GATE_MCSC_QCH				(CLK_MFCMSCL_BASE + 2)
+#define GATE_MFC_QCH				(CLK_MFCMSCL_BASE + 3)
+#define GATE_MFCMSCL_CMU_MFCMSCL_QCH		(CLK_MFCMSCL_BASE + 4)
+#define GATE_SYSMMU_MFCMSCL_QCH			(CLK_MFCMSCL_BASE + 5)
+#define GATE_CMU_MIF_CMUREF_QCH			(CLK_MFCMSCL_BASE + 6)
+#define GATE_DMC_QCH				(CLK_MFCMSCL_BASE + 7)
+#define GATE_MIF_CMU_MIF_QCH			(CLK_MFCMSCL_BASE + 8)
+#define GATE_CMU_MIF1_CMU_REF_QCH		(CLK_MFCMSCL_BASE + 9)
+#define GATE_DMC1_QCH				(CLK_MFCMSCL_BASE + 10)
+#define GATE_MIF1_CMU_MIF1_QCH			(CLK_MFCMSCL_BASE + 11)
+#define GATE_MODEM_CMU_MODEM_QCH		(CLK_MFCMSCL_BASE + 12)
+#define DOUT_CLK_MFCMSCL_BUSP			(CLK_MFCMSCL_BASE + 13)
+#define MFCMSCL_MFC				(CLK_MFCMSCL_BASE + 14)
+#define MFCMSCL_M2M				(CLK_MFCMSCL_BASE + 15)
+#define MFCMSCL_MCSC				(CLK_MFCMSCL_BASE + 16)
+#define MFCMSCL_JPEG				(CLK_MFCMSCL_BASE + 17)
+#define UMUX_CLKCMU_MFCMSCL_MFC			(CLK_MFCMSCL_BASE + 18)
+#define UMUX_CLKCMU_MFCMSCL_M2M			(CLK_MFCMSCL_BASE + 19)
+#define UMUX_CLKCMU_MFCMSCL_MCSC		(CLK_MFCMSCL_BASE + 20)
+#define UMUX_CLKCMU_MFCMSCL_JPEG		(CLK_MFCMSCL_BASE + 21)
+
+#define CLK_PERI_BASE				(550)
+#define UMUX_CLKCMU_PERI_BUS_USER		(CLK_PERI_BASE + 0)
+#define UMUX_CLKCMU_PERI_UART_USER		(CLK_PERI_BASE + 1)
+#define UMUX_CLKCMU_PERI_HSI2C_USER		(CLK_PERI_BASE + 2)
+#define UMUX_CLKCMU_PERI_SPI_USER		(CLK_PERI_BASE + 3)
+#define GATE_BUSIF_TMU_QCH			(CLK_PERI_BASE + 4)
+#define GATE_GPIO_PERI_QCH			(CLK_PERI_BASE + 5)
+#define GATE_HSI2C_0_QCH			(CLK_PERI_BASE + 6)
+#define GATE_HSI2C_1_QCH			(CLK_PERI_BASE + 7)
+#define GATE_HSI2C_2_QCH			(CLK_PERI_BASE + 8)
+#define GATE_I2C_0_QCH				(CLK_PERI_BASE + 9)
+#define GATE_I2C_1_QCH				(CLK_PERI_BASE + 10)
+#define GATE_I2C_2_QCH				(CLK_PERI_BASE + 11)
+#define GATE_I2C_3_QCH				(CLK_PERI_BASE + 12)
+#define GATE_I2C_4_QCH				(CLK_PERI_BASE + 13)
+#define GATE_I2C_5_QCH				(CLK_PERI_BASE + 14)
+#define GATE_I2C_6_QCH				(CLK_PERI_BASE + 15)
+#define GATE_MCT_QCH				(CLK_PERI_BASE + 16)
+#define GATE_OTP_CON_TOP_QCH			(CLK_PERI_BASE + 17)
+#define GATE_PWM_MOTOR_QCH			(CLK_PERI_BASE + 18)
+#define GATE_SPI_0_QCH				(CLK_PERI_BASE + 19)
+#define GATE_UART_QCH				(CLK_PERI_BASE + 20)
+#define GATE_WDT_0_QCH				(CLK_PERI_BASE + 21)
+#define GATE_WDT_1_QCH				(CLK_PERI_BASE + 22)
+#define DOUT_CLK_PERI_SPI_0			(CLK_PERI_BASE + 23)
+#define DOUT_CLK_PERI_HSI2C_0			(CLK_PERI_BASE + 24)
+#define DOUT_CLK_PERI_HSI2C_1			(CLK_PERI_BASE + 25)
+#define DOUT_CLK_PERI_HSI2C_2			(CLK_PERI_BASE + 26)
+#define DOUT_I2C_0				(CLK_PERI_BASE + 27)
+#define DOUT_I2C_1				(CLK_PERI_BASE + 28)
+#define DOUT_I2C_2				(CLK_PERI_BASE + 29)
+#define DOUT_I2C_3				(CLK_PERI_BASE + 30)
+#define DOUT_I2C_4				(CLK_PERI_BASE + 31)
+#define DOUT_I2C_5				(CLK_PERI_BASE + 32)
+#define DOUT_I2C_6				(CLK_PERI_BASE + 33)
+#define DOUT_UART				(CLK_PERI_BASE + 34)
+
+#define CLK_CLKOUT_BASE				(700)
+#define OSC_NFC					(CLK_CLKOUT_BASE + 0)
+#define OSC_AUD					(CLK_CLKOUT_BASE + 1)
+
+/* Must be greater than maximal clock ID */
+#define CLK_NR_CLKS				(1125 + 1)
+
+#endif /* _DT_BINDINGS_CLOCK_EXYNOS_850_H */
-- 
2.30.2

