Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45A88441517
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Nov 2021 09:12:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231592AbhKAIOF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Nov 2021 04:14:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231716AbhKAIOE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Nov 2021 04:14:04 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9564FC061714;
        Mon,  1 Nov 2021 01:11:31 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id n23so5882646pgh.8;
        Mon, 01 Nov 2021 01:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4MFU2HutlN+hfSgZvL65Qfp0n8GknMYUEdMcuSPfOaA=;
        b=K8TXcsOwNdbh3diRhI2DB6ZA9vB0AGzVSNuuPgERzV3ZCX/4wnPSM8Wcjc+eC27o4N
         5cGgsir9ohZWW90UUxi7y6vpNuyanqXyrL4bXhI4/10iiEeT+Gif4495NavVXOFJCuKx
         1pPwSh9kp7lOdxLi9woKsVQpZWKFH/J/VpWaBeqVFXNLIQny+Mq/5IgJ/b8BIo/hSHrm
         7RonUdZUEo3mzo+CL+57Ym8OA1+hc2CoCJ8yMwWkjrpBVQ+dxG/OylX3Tt7qH9CsAoMG
         5gmJAtgN/0pV1/hcu73ZB5JiZafJ+gngQObRZOWPb9zr5bbxsByKFQgyi/5O7TuVjNTT
         QVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4MFU2HutlN+hfSgZvL65Qfp0n8GknMYUEdMcuSPfOaA=;
        b=zHjs5BBjIZPrFBu6EejSfqpsR2zd/MxSICJXASx7WJwCDQcKEJzKGKkQQAIUVIhZPh
         tVBuCv6AAJdGq5khQG6MtlM2SvGjzQCP5YX+QUN58FtrQR5sI4fQMmepVhtijwKumeMX
         eBP1piGU8lOUAoP0kdkQdQ1/w4D6r48bcqq9guVTQ+674iA6fQRM2cE5D8I6V5TH4wta
         YfhVyFKaZvqNY/iJVyPDJUhWh629GR2OQ9VwsSSZLLHxIXrCZNh9QsIRlVz+Xm3j+G28
         za7lQYjsBAFE1xFwM6wPBp8lD1eevWt6aSTza/nmsCzbpkWAkwiesYtTphNGvfhLnIVB
         6Q8w==
X-Gm-Message-State: AOAM533zWvIUh535XyOd3YbZ32QsLfBh7cq4R3C5rkKVkI249bYahXLs
        qnXrSh2T2g1VOsrIxrncsAP2EcEZwT7qjA==
X-Google-Smtp-Source: ABdhPJwy2togTAvbWhENugK5UCOtJja2bqFR2xQjTL4x8mFfOpW5JUYSZExzSbycaMlV/lFXSrOhdg==
X-Received: by 2002:a05:6a00:a8e:b0:47b:a658:7f4d with SMTP id b14-20020a056a000a8e00b0047ba6587f4dmr26861091pfl.82.1635754291105;
        Mon, 01 Nov 2021 01:11:31 -0700 (PDT)
Received: from scdiu3.sunplus.com ([113.196.136.192])
        by smtp.googlemail.com with ESMTPSA id d2sm15732606pfj.42.2021.11.01.01.11.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Nov 2021 01:11:30 -0700 (PDT)
From:   Wells Lu <wellslutw@gmail.com>
X-Google-Original-From: Wells Lu <wells.lu@sunplus.com>
To:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Cc:     qinjian@cqplus1.com, dvorkin@tibbo.com,
        Wells Lu <wells.lu@sunplus.com>
Subject: [PATCH v2 2/3] dt-bindings: pinctrl: Add dt-bindings for Sunplus SP7021
Date:   Mon,  1 Nov 2021 16:11:16 +0800
Message-Id: <1635754277-32429-3-git-send-email-wells.lu@sunplus.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635754277-32429-1-git-send-email-wells.lu@sunplus.com>
References: <1635324926-22319-1-git-send-email-wells.lu@sunplus.com>
 <1635754277-32429-1-git-send-email-wells.lu@sunplus.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add dt-bindings header files for Sunplus SP7021 SoC.

Signed-off-by: Wells Lu <wells.lu@sunplus.com>
---
Changes in v2:
 - Added more 'defines' in dt-bindings header files (forgot to add in v1).

 MAINTAINERS                                 |   1 +
 include/dt-bindings/pinctrl/sppctl-sp7021.h | 171 ++++++++++++++++++++++++++++
 include/dt-bindings/pinctrl/sppctl.h        |  40 +++++++
 3 files changed, 212 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/sppctl-sp7021.h
 create mode 100644 include/dt-bindings/pinctrl/sppctl.h

diff --git a/MAINTAINERS b/MAINTAINERS
index fd82c77..da6378f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14873,6 +14873,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	https://sunplus-tibbo.atlassian.net/wiki/spaces/doc/overview
 F:	drivers/pinctrl/sunplus/
+F:	include/dt-bindings/pinctrl/sppctl*
 
 PKTCDVD DRIVER
 M:	linux-block@vger.kernel.org
diff --git a/include/dt-bindings/pinctrl/sppctl-sp7021.h b/include/dt-bindings/pinctrl/sppctl-sp7021.h
new file mode 100644
index 0000000..4e07d03
--- /dev/null
+++ b/include/dt-bindings/pinctrl/sppctl-sp7021.h
@@ -0,0 +1,171 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * SP7021 pinmux pinctrl bindings.
+ * Copyright (C) Sunplus Tech/Tibbo Tech. 2020
+ * Author: Dvorkin Dmitry <dvorkin@tibbo.com>
+ */
+
+#ifndef _DT_BINDINGS_PINCTRL_SPPCTL_SP7021_H
+#define _DT_BINDINGS_PINCTRL_SPPCTL_SP7021_H
+
+#include <dt-bindings/pinctrl/sppctl.h>
+
+#define MUXF_GPIO                       0
+#define MUXF_IOP                        1
+#define MUXF_L2SW_CLK_OUT               2
+#define MUXF_L2SW_MAC_SMI_MDC           3
+#define MUXF_L2SW_LED_FLASH0            4
+#define MUXF_L2SW_LED_FLASH1            5
+#define MUXF_L2SW_LED_ON0               6
+#define MUXF_L2SW_LED_ON1               7
+#define MUXF_L2SW_MAC_SMI_MDIO          8
+#define MUXF_L2SW_P0_MAC_RMII_TXEN      9
+#define MUXF_L2SW_P0_MAC_RMII_TXD0      10
+#define MUXF_L2SW_P0_MAC_RMII_TXD1      11
+#define MUXF_L2SW_P0_MAC_RMII_CRSDV     12
+#define MUXF_L2SW_P0_MAC_RMII_RXD0      13
+#define MUXF_L2SW_P0_MAC_RMII_RXD1      14
+#define MUXF_L2SW_P0_MAC_RMII_RXER      15
+#define MUXF_L2SW_P1_MAC_RMII_TXEN      16
+#define MUXF_L2SW_P1_MAC_RMII_TXD0      17
+#define MUXF_L2SW_P1_MAC_RMII_TXD1      18
+#define MUXF_L2SW_P1_MAC_RMII_CRSDV     19
+#define MUXF_L2SW_P1_MAC_RMII_RXD0      20
+#define MUXF_L2SW_P1_MAC_RMII_RXD1      21
+#define MUXF_L2SW_P1_MAC_RMII_RXER      22
+#define MUXF_DAISY_MODE                 23
+#define MUXF_SDIO_CLK                   24
+#define MUXF_SDIO_CMD                   25
+#define MUXF_SDIO_D0                    26
+#define MUXF_SDIO_D1                    27
+#define MUXF_SDIO_D2                    28
+#define MUXF_SDIO_D3                    29
+#define MUXF_PWM0                       30
+#define MUXF_PWM1                       31
+#define MUXF_PWM2                       32
+#define MUXF_PWM3                       33
+#define MUXF_PWM4                       34
+#define MUXF_PWM5                       35
+#define MUXF_PWM6                       36
+#define MUXF_PWM7                       37
+#define MUXF_ICM0_D                     38
+#define MUXF_ICM1_D                     39
+#define MUXF_ICM2_D                     40
+#define MUXF_ICM3_D                     41
+#define MUXF_ICM0_CLK                   42
+#define MUXF_ICM1_CLK                   43
+#define MUXF_ICM2_CLK                   44
+#define MUXF_ICM3_CLK                   45
+#define MUXF_SPIM0_INT                  46
+#define MUXF_SPIM0_CLK                  47
+#define MUXF_SPIM0_EN                   48
+#define MUXF_SPIM0_DO                   49
+#define MUXF_SPIM0_DI                   50
+#define MUXF_SPIM1_INT                  51
+#define MUXF_SPIM1_CLK                  52
+#define MUXF_SPIM1_EN                   53
+#define MUXF_SPIM1_DO                   54
+#define MUXF_SPIM1_DI                   55
+#define MUXF_SPIM2_INT                  56
+#define MUXF_SPIM2_CLK                  57
+#define MUXF_SPIM2_EN                   58
+#define MUXF_SPIM2_DO                   59
+#define MUXF_SPIM2_DI                   60
+#define MUXF_SPIM3_INT                  61
+#define MUXF_SPIM3_CLK                  62
+#define MUXF_SPIM3_EN                   63
+#define MUXF_SPIM3_DO                   64
+#define MUXF_SPIM3_DI                   65
+#define MUXF_SPI0S_INT                  66
+#define MUXF_SPI0S_CLK                  67
+#define MUXF_SPI0S_EN                   68
+#define MUXF_SPI0S_DO                   69
+#define MUXF_SPI0S_DI                   70
+#define MUXF_SPI1S_INT                  71
+#define MUXF_SPI1S_CLK                  72
+#define MUXF_SPI1S_EN                   73
+#define MUXF_SPI1S_DO                   74
+#define MUXF_SPI1S_DI                   75
+#define MUXF_SPI2S_INT                  76
+#define MUXF_SPI2S_CLK                  77
+#define MUXF_SPI2S_EN                   78
+#define MUXF_SPI2S_DO                   79
+#define MUXF_SPI2S_DI                   80
+#define MUXF_SPI3S_INT                  81
+#define MUXF_SPI3S_CLK                  82
+#define MUXF_SPI3S_EN                   83
+#define MUXF_SPI3S_DO                   84
+#define MUXF_SPI3S_DI                   85
+#define MUXF_I2CM0_CLK                  86
+#define MUXF_I2CM0_DAT                  87
+#define MUXF_I2CM1_CLK                  88
+#define MUXF_I2CM1_DAT                  89
+#define MUXF_I2CM2_CLK                  90
+#define MUXF_I2CM2_DAT                  91
+#define MUXF_I2CM3_CLK                  92
+#define MUXF_I2CM3_DAT                  93
+#define MUXF_UA1_TX                     94
+#define MUXF_UA1_RX                     95
+#define MUXF_UA1_CTS                    96
+#define MUXF_UA1_RTS                    97
+#define MUXF_UA2_TX                     98
+#define MUXF_UA2_RX                     99
+#define MUXF_UA2_CTS                    100
+#define MUXF_UA2_RTS                    101
+#define MUXF_UA3_TX                     102
+#define MUXF_UA3_RX                     103
+#define MUXF_UA3_CTS                    104
+#define MUXF_UA3_RTS                    105
+#define MUXF_UA4_TX                     106
+#define MUXF_UA4_RX                     107
+#define MUXF_UA4_CTS                    108
+#define MUXF_UA4_RTS                    109
+#define MUXF_TIMER0_INT                 110
+#define MUXF_TIMER1_INT                 111
+#define MUXF_TIMER2_INT                 112
+#define MUXF_TIMER3_INT                 113
+#define MUXF_GPIO_INT0                  114
+#define MUXF_GPIO_INT1                  115
+#define MUXF_GPIO_INT2                  116
+#define MUXF_GPIO_INT3                  117
+#define MUXF_GPIO_INT4                  118
+#define MUXF_GPIO_INT5                  119
+#define MUXF_GPIO_INT6                  120
+#define MUXF_GPIO_INT7                  121
+
+#define GROP_SPI_FLASH                  122
+#define GROP_SPI_FLASH_4BIT             123
+#define GROP_SPI_NAND                   124
+#define GROP_CARD0_EMMC                 125
+#define GROP_SD_CARD                    126
+#define GROP_UA0                        127
+#define GROP_ACHIP_DEBUG                128
+#define GROP_ACHIP_UA2AXI               129
+#define GROP_FPGA_IFX                   130
+#define GROP_HDMI_TX                    131
+#define GROP_AUD_EXT_ADC_IFX0           132
+#define GROP_AUD_EXT_DAC_IFX0           133
+#define GROP_SPDIF_RX                   134
+#define GROP_SPDIF_TX                   135
+#define GROP_TDMTX_IFX0                 136
+#define GROP_TDMRX_IFX0                 137
+#define GROP_PDMRX_IFX0                 138
+#define GROP_PCM_IEC_TX                 139
+#define GROP_LCDIF                      140
+#define GROP_DVD_DSP_DEBUG              141
+#define GROP_I2C_DEBUG                  142
+#define GROP_I2C_SLAVE                  143
+#define GROP_WAKEUP                     144
+#define GROP_UART2AXI                   145
+#define GROP_USB0_I2C                   146
+#define GROP_USB1_I2C                   147
+#define GROP_USB0_OTG                   148
+#define GROP_USB1_OTG                   149
+#define GROP_UPHY0_DEBUG                150
+#define GROP_UPHY1_DEBUG                151
+#define GROP_UPHY0_EXT                  152
+#define GROP_PROBE_PORT                 153
+#define GROP_ANA_I2C_IF                 154
+#define GROP_ANA_TEST_IF                155
+
+#endif
diff --git a/include/dt-bindings/pinctrl/sppctl.h b/include/dt-bindings/pinctrl/sppctl.h
new file mode 100644
index 0000000..3e82989
--- /dev/null
+++ b/include/dt-bindings/pinctrl/sppctl.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * SP7021 pinmux pinctrl bindings.
+ * Copyright (C) Sunplus Tech/Tibbo Tech. 2020
+ * Author: Dvorkin Dmitry <dvorkin@tibbo.com>
+ */
+
+#ifndef _DT_BINDINGS_PINCTRL_SPPCTL_H
+#define _DT_BINDINGS_PINCTRL_SPPCTL_H
+
+#define IOP_G_MASTE             (0x01<<0)
+#define IOP_G_FIRST             (0x01<<1)
+
+#define SPPCTL_PCTL_G_PMUX      (0x00|IOP_G_MASTE)
+#define SPPCTL_PCTL_G_GPIO      (IOP_G_FIRST|IOP_G_MASTE)
+#define SPPCTL_PCTL_G_IOPP      (IOP_G_FIRST|0x00)
+
+#define SPPCTL_PCTL_L_OUT       (0x01<<0)
+#define SPPCTL_PCTL_L_OU1       (0x01<<1)
+#define SPPCTL_PCTL_L_INV       (0x01<<2)
+#define SPPCTL_PCTL_L_ONV       (0x01<<3)
+#define SPPCTL_PCTL_L_ODR       (0x01<<4)
+
+#define SPPCTL_PCTLE_P(v)       ((v)<<24)
+#define SPPCTL_PCTLE_G(v)       ((v)<<16)
+#define SPPCTL_PCTLE_F(v)       ((v)<<8)
+#define SPPCTL_PCTLE_L(v)       ((v)<<0)
+
+#define SPPCTL_PCTLD_P(v)       (((v)>>24) & 0xFF)
+#define SPPCTL_PCTLD_G(v)       (((v)>>16) & 0xFF)
+#define SPPCTL_PCTLD_F(v)       (((v) >> 8) & 0xFF)
+#define SPPCTL_PCTLD_L(v)       (((v) >> 0) & 0xFF)
+
+/*
+ * pack into 32-bit value:
+ * pin#{8bit}, typ{8bit}, function{8bit}, flags{8bit}
+ */
+#define SPPCTL_IOPAD(pin, typ, fun, fls) (((pin)<<24)|((typ)<<16)|((fun)<<8)|(fls))
+
+#endif
-- 
2.7.4

