Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17DB33DBB51
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 16:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239656AbhG3Ou1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 10:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239599AbhG3OuH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 10:50:07 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED363C0617BD
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 07:49:41 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id da26so13582856edb.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 07:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w5IUoHym33qb5aKNo6C9Jpupu1+vF2LE3nSMGuB+h6c=;
        b=Oh/SWTvG2C0zlYA0AomNg5dvyIzf+x0z3JXNTCuV6WeyU8pzmtGsAwrfXFl/BQxz+R
         to4gSSyxpr9K04RKOah+p/1W6ihKqm6PUf2pYcWCo5SI4fGQU9qjbQP+187uvWyPiNMI
         PRJHNBVimqObI0hUe30OmR8x5KwI/6IM4Kw2Dcpzr1oDopxkD10HY30cx1rAklDn9CdN
         BBXdqS9VPBEZhYa5Pzlb2q2lggUkCVj0Sr2DfZs23pt79mQOTuDi4Wm2r/+tjaAlVqSM
         GHgBz0uYSio+7iYAha7J3lM77QgVSYLISh7GBnWRT2VUKig2ZMws/hxHam838l4Dn/Tw
         lDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w5IUoHym33qb5aKNo6C9Jpupu1+vF2LE3nSMGuB+h6c=;
        b=HzENqhsqL7hzxM1BbbLv8+fP7BbuG4bouA9SCXDkykxyb6QQnY1rUW5D/5XAJxD+h7
         dxiFKmQ4cBADJQcc8DGV6TEQ7kvqfC7JrUCo/vj/qnXEaoTqKijJ2E376PRg/wlGYUQs
         a7x0DZojP7RmAu/1g0ovnM+AGKOLn47/Vy+oztWXtoHZBdOk9iT+9uiiqMHee12Qu2Ib
         3y6mx5h0cK7wPF/LWCwKAm43aW4dRqBppDnpjEezcZPbOnHZP6FL6nNbVKqmF10V/0CL
         vIlG/VH0ROr4udVWaTIg25Zw+VOOFKeqNcT7KgAfsBVq8ANyzWTkx/13Sl2Her7TjE7G
         fKCg==
X-Gm-Message-State: AOAM532ljNQ7pcuKEaV66jfHRiGMrw8QOc7+WrTb6OMKiT+ONMnw7pay
        tM4lDTLbeE3/LPzxD2HIQ4NAOr2+DgQhsEnjYyk=
X-Google-Smtp-Source: ABdhPJzeTmOxlnmjhXO/TMVsWECEYAYeuWP4ng1ulFcXC7ADHcAUgQ/JMQ8PgNeIm8Fsy6beGS844A==
X-Received: by 2002:a05:6402:1601:: with SMTP id f1mr3352491edv.388.1627656580569;
        Fri, 30 Jul 2021 07:49:40 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id f5sm643991ejj.45.2021.07.30.07.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:49:40 -0700 (PDT)
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
Subject: [PATCH 11/12] dt-bindings: interrupt-controller: Add IRQ constants for Exynos850
Date:   Fri, 30 Jul 2021 17:49:21 +0300
Message-Id: <20210730144922.29111-12-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210730144922.29111-1-semen.protsenko@linaro.org>
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add external GIC interrupt constants for SPI[479:0] for Exynos850 SoC.
Interrupt names were taken from TRM without change, hence double
underscore in const namings.

Only level-sensitive interrupt is allowed for each SPI, so each SPI
should be configured as level-sensitive in GIC.

Also update MAINTAINERS file, so that Exynos interrupt binding headers
are covered in "ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
section.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 MAINTAINERS                                   |   1 +
 .../interrupt-controller/exynos850.h          | 290 ++++++++++++++++++
 2 files changed, 291 insertions(+)
 create mode 100644 include/dt-bindings/interrupt-controller/exynos850.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 4483ccb46883..ceb929e6bfa7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2488,6 +2488,7 @@ F:	drivers/pwm/pwm-samsung.c
 F:	drivers/soc/samsung/
 F:	drivers/tty/serial/samsung*
 F:	include/clocksource/samsung_pwm.h
+F:	include/dt-bindings/interrupt-controller/exynos*.h
 F:	include/linux/platform_data/*s3c*
 F:	include/linux/serial_s3c.h
 F:	include/linux/soc/samsung/
diff --git a/include/dt-bindings/interrupt-controller/exynos850.h b/include/dt-bindings/interrupt-controller/exynos850.h
new file mode 100644
index 000000000000..0c24ba2e27da
--- /dev/null
+++ b/include/dt-bindings/interrupt-controller/exynos850.h
@@ -0,0 +1,290 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017 Samsung Electronics Co., Ltd.
+ * Copyright (C) 2021 Linaro Ltd.
+ *
+ * Device Tree binding constants for Exynos850 interrupt controller.
+ */
+
+#ifndef _DT_BINDINGS_INTERRUPT_CONTROLLER_EXYNOS_850_H
+#define _DT_BINDINGS_INTERRUPT_CONTROLLER_EXYNOS_850_H
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+#define INTREQ__ADC_CMGP2AP				0
+#define INTREQ__ALIVE_EINT0				1
+#define INTREQ__ALIVE_EINT1				2
+#define INTREQ__ALIVE_EINT2				3
+#define INTREQ__ALIVE_EINT3				4
+#define INTREQ__ALIVE_EINT4				5
+#define INTREQ__ALIVE_EINT5				6
+#define INTREQ__ALIVE_EINT6				7
+#define INTREQ__ALIVE_EINT7				8
+#define INTREQ__ALIVE_EINT8				9
+#define INTREQ__ALIVE_EINT9				10
+#define INTREQ__ALIVE_EINT10				11
+#define INTREQ__ALIVE_EINT11				12
+#define INTREQ__ALIVE_EINT12				13
+#define INTREQ__ALIVE_EINT13				14
+#define INTREQ__ALIVE_EINT14				15
+#define INTREQ__ALIVE_EINT15				16
+#define INTREQ__ALIVE_EINT16				17
+#define INTREQ__ALIVE_EINT17				18
+#define INTREQ__ALIVE_EINT18				19
+#define INTREQ__ALIVE_EINT19				20
+#define INTREQ__ALIVE_EINT20				21
+#define INTREQ__ALIVE_EINT21				22
+#define INTREQ__ALIVE_EINT22				23
+#define INTREQ__ALIVE_EINT23				24
+#define INTREQ__ALIVE_EINT24				25
+#define INTREQ__ALIVE_EINT25				26
+#define INTREQ__ALIVE_EINT26				27
+#define INTREQ__ALIVE_EINT27				28
+#define INTREQ__ALIVE_EINT28				29
+#define INTREQ__ALIVE_EINT29				30
+#define INTREQ__ALIVE_EINT30				31
+#define INTREQ__ALIVE_EINT31				32
+#define INTREQ__ALIVE_EINT32				33
+#define INTREQ__ALIVE_EINT33				34
+#define INTREQ__ALIVE_EINT34				35
+#define INTREQ__ALIVE_EINT35				36
+#define INTREQ__ALIVE_GNSS_ACTIVE			37
+#define INTREQ__ALIVE_WLBT_ACTIVE			38
+#define INTREQ__CMGP_EXT_INTM00				39
+#define INTREQ__CMGP_EXT_INTM01				40
+#define INTREQ__CMGP_EXT_INTM02				41
+#define INTREQ__CMGP_EXT_INTM03				42
+#define INTREQ__CMGP_EXT_INTM04				43
+#define INTREQ__CMGP_EXT_INTM05				44
+#define INTREQ__CMGP_EXT_INTM06				45
+#define INTREQ__CMGP_EXT_INTM07				46
+#define INTREQ__COMB_SFI_CE_NONSECURE_SYSREG_APM	47
+#define INTREQ__COMB_SFI_UCE_NONSECURE_SYSREG_APM	48
+#define INTREQ__MAILBOX_APM2AP				49
+#define INTREQ__MAILBOX_CHUB2AP				50
+#define INTREQ__MAILBOX_CP2AP				51
+#define INTREQ__MAILBOX_CP2AP_S				52
+#define INTREQ__MAILBOX_GNSS2AP				53
+#define INTREQ__MAILBOX_WLBT2AP				54
+#define INTREQ__NOTIFY					55
+#define INTREQ__PMIC					56
+#define INTREQ__RTC_ALARM_INT				57
+#define INTREQ__RTC_TIC_INT_0				58
+#define INTREQ__SPEEDY_APM				59
+#define INTREQ__TOP_RTC_ALARM_INT			60
+#define INTREQ__TOP_RTC_TIC_INT_0			61
+#define INTREQ__USI_CMGP0				62
+#define INTREQ__USI_CMGP1				63
+#define INTREQ__AUD_ABOX_GIC400_MCPU			64
+#define INTREQ__AUD_WDT					65
+#define INTREQ__SYSMMU_ABOX_S1_NS			66
+#define INTREQ__SYSMMU_ABOX_S1_S			67
+#define INTREQ__PWM_CHUB_0				68
+#define INTREQ__PWM_CHUB_1				69
+#define INTREQ__PWM_CHUB_2				70
+#define INTREQ__PWM_CHUB_3				71
+#define INTREQ__TIMER_CHUB				72
+#define INTREQ__WDT_CHUB				73
+#define INTREQ__CPUCL0_CLUSTERPMUIRQ			74
+#define INTREQ__CPUCL0_COMMIRQ_0			75
+#define INTREQ__CPUCL0_COMMIRQ_1			76
+#define INTREQ__CPUCL0_COMMIRQ_2			77
+#define INTREQ__CPUCL0_COMMIRQ_3			78
+#define INTREQ__CPUCL0_ERRIRQ_0				79
+#define INTREQ__CPUCL0_ERRIRQ_1				80
+#define INTREQ__CPUCL0_ERRIRQ_2				81
+#define INTREQ__CPUCL0_ERRIRQ_3				82
+#define INTREQ__CPUCL0_ERRIRQ_4				83
+#define INTREQ__CPUCL0_FAULTIRQ_0			84
+#define INTREQ__CPUCL0_FAULTIRQ_1			85
+#define INTREQ__CPUCL0_FAULTIRQ_2			86
+#define INTREQ__CPUCL0_FAULTIRQ_3			87
+#define INTREQ__CPUCL0_FAULTIRQ_4			88
+#define INTREQ__CPUCL0_PMUIRQ_0				89
+#define INTREQ__CPUCL0_PMUIRQ_1				90
+#define INTREQ__CPUCL0_PMUIRQ_2				91
+#define INTREQ__CPUCL0_PMUIRQ_3				92
+#define INTREQ__CPUCL1_CLUSTERPMUIRQ			93
+#define INTREQ__CPUCL1_COMMIRQ_0			94
+#define INTREQ__CPUCL1_COMMIRQ_1			95
+#define INTREQ__CPUCL1_COMMIRQ_2			96
+#define INTREQ__CPUCL1_COMMIRQ_3			97
+#define INTREQ__CPUCL1_ERRIRQ_0				98
+#define INTREQ__CPUCL1_ERRIRQ_1				99
+#define INTREQ__CPUCL1_ERRIRQ_2				100
+#define INTREQ__CPUCL1_ERRIRQ_3				101
+#define INTREQ__CPUCL1_ERRIRQ_4				102
+#define INTREQ__CPUCL1_FAULTIRQ_0			103
+#define INTREQ__CPUCL1_FAULTIRQ_1			104
+#define INTREQ__CPUCL1_FAULTIRQ_2			105
+#define INTREQ__CPUCL1_FAULTIRQ_3			106
+#define INTREQ__CPUCL1_FAULTIRQ_4			107
+#define INTREQ__CPUCL1_PMUIRQ_0				108
+#define INTREQ__CPUCL1_PMUIRQ_1				109
+#define INTREQ__CPUCL1_PMUIRQ_2				110
+#define INTREQ__CPUCL1_PMUIRQ_3				111
+#define INTREQ__DECON0_EXTRA				112
+#define INTREQ__DECON0_FRAME_DONE			113
+#define INTREQ__DECON0_FRAME_START			114
+#define INTREQ__DECON0_UNDER_FLOW			115
+#define INTREQ__DPP_VG0					116
+#define INTREQ__DPU_DMA_G0				117
+#define INTREQ__DPU_DMA_G1				118
+#define INTREQ__DPU_DMA_GF				119
+#define INTREQ__DPU_DMA_VG0				120
+#define INTREQ__DSIM0					121
+#define INTREQ__SMMU_DPU_NS				122
+#define INTREQ__SMMU_DPU_S				123
+#define INTREQ__G3D_IRQEVENT				124
+#define INTREQ__G3D_IRQGPU				125
+#define INTREQ__G3D_IRQJOB				126
+#define INTREQ__G3D_IRQMMU				127
+#define INTREQ__GNSS_SW_INT				128
+#define INTREQ__GNSS_WAKEUP_INT				129
+#define INTREQ__GNSS_WDOG_RESET				130
+#define INTREQ__GPIO_HSI				131
+#define INTREQ__MMC_CARD				132
+#define INTREQ__PPMU_HSI_UPPER				133
+#define INTREQ__USB2_REMOTE_CONNECT			134
+#define INTREQ__USB2_REMOTE_TIMER			135
+#define INTREQ__USB2_REMOTE_WAKEUP			136
+#define INTREQ__USB20DRD_0				137
+#define INTREQ__USB20DRD_1				138
+#define INTREQ__USB20_PHY_FSVMINUS			139
+#define INTREQ__USB20_PHY_FSVPLUS			140
+#define INTREQ__CSIS0					141
+#define INTREQ__CSIS1					142
+#define INTREQ__CSIS2					143
+#define INTREQ__CSIS_DMA_0				144
+#define INTREQ__CSIS_DMA_1				145
+#define INTREQ__GDC					146
+#define INTREQ__IPP0_0					147
+#define INTREQ__CPUCL0_CTIIRQ_0				148
+#define INTREQ__CPUCL0_CTIIRQ_1				149
+#define INTREQ__CPUCL0_CTIIRQ_2				150
+#define INTREQ__CPUCL0_CTIIRQ_3				151
+#define INTREQ__CPUCL1_CTIIRQ_0				152
+#define INTREQ__CPUCL1_CTIIRQ_1				153
+#define INTREQ__CPUCL1_CTIIRQ_2				154
+#define INTREQ__CPUCL1_CTIIRQ_3				155
+#define INTREQ__IPP0_1					156
+#define INTREQ__IPP1_0					157
+#define INTREQ__IPP1_1					158
+#define INTREQ__ITP_0					159
+#define INTREQ__ITP_1					160
+#define INTREQ__MCSC_IS					161
+#define INTREQ__PPMU_IS0_UPPER_OR_NORMAL		162
+#define INTREQ__PPMU_IS1_UPPER_OR_NORMAL		163
+#define INTREQ__SYSMMU_IS0_S1_NS			164
+#define INTREQ__SYSMMU_IS0_S1_S				165
+#define INTREQ__SYSMMU_IS1_S1_NS			166
+#define INTREQ__SYSMMU_IS1_S1_S				167
+#define INTREQ__VRA					168
+#define INTREQ__JPEG					169
+#define INTREQ__M2M					170
+#define INTREQ__MCSC_MFC				171
+#define INTREQ__MFC					172
+#define INTREQ__PPMU_MFCMSCL_interrupt_upper_or_normal	173
+#define INTREQ__SYSMMU_MFCMSCL_S1_NS			174
+#define INTREQ__SYSMMU_MFCMSCL_S1_S			175
+#define INTREQ__DERATE_INTR_MIF0			176
+#define INTREQ__DMC_INTR_MIF0				177
+#define INTREQ__DMC_PEREV_INTR_MIF0			178
+#define INTREQ__HIGHTEMP_INTR_MIF0			179
+#define INTREQ__NORMTEMP_INTR_MIF0			180
+#define INTREQ__PPMU_UPPER_OR_NORMAL_MIF0		181
+#define INTREQ__TEMPERR_INTR_MIF0			182
+#define INTREQ__DERATE_INTR_MIF1			183
+#define INTREQ__DMC_INTR_MIF1				184
+#define INTREQ__DMC_PEREV_INTR_MIF1			185
+#define INTREQ__HIGHTEMP_INTR_MIF1			186
+#define INTREQ__NORMTEMP_INTR_MIF1			187
+#define INTREQ__PPMU_UPPER_OR_NORMAL_MIF1		188
+#define INTREQ__TEMPERR_INTR_MIF1			189
+#define INTREQ__RESET_REQ				190
+#define INTREQ__SFR_BUS_RDY				191
+#define INTREQ__GPIO_PERI				192
+#define INTREQ__HSI2C_0					193
+#define INTREQ__HSI2C_1					194
+#define INTREQ__HSI2C_2					195
+#define INTREQ__I2C_0					196
+#define INTREQ__I2C_1					197
+#define INTREQ__I2C_2					198
+#define INTREQ__I2C_3					199
+#define INTREQ__I2C_4					200
+#define INTREQ__I2C_5					201
+#define INTREQ__I2C_6					202
+#define INTREQ__MCT_G0					203
+#define INTREQ__MCT_G1					204
+#define INTREQ__MCT_G2					205
+#define INTREQ__MCT_G3					206
+#define INTREQ__MCT_L0					207
+#define INTREQ__MCT_L1					208
+#define INTREQ__MCT_L2					209
+#define INTREQ__MCT_L3					210
+#define INTREQ__MCT_L4					211
+#define INTREQ__MCT_L5					212
+#define INTREQ__MCT_L6					213
+#define INTREQ__MCT_L7					214
+#define INTREQ__OTP_CON					215
+#define INTREQ__PWM0					216
+#define INTREQ__PWM1					217
+#define INTREQ__PWM2					218
+#define INTREQ__PWM3					219
+#define INTREQ__PWM4					220
+#define INTREQ__SPI_0					221
+
+#define INTREQ__SECURE_LOG				224
+#define INTREQ__TBASE					223
+#define INTREQ__RPMB					225
+
+#define INTREQ__TMU					226
+#define INTREQ__UART					227
+#define INTREQ__WDT_0					228
+#define INTREQ__WDT_1					229
+#define INTREQ__WB2AP_CFG_REQ				230
+#define INTREQ__WB2AP_WDOG_RESET_REQ_IRQ		231
+#define INTREQ__CCI_NEVNTCNTOVERFLOW_7			438
+#define INTREQ__CCI_NEVNTCNTOVERFLOW_6			439
+#define INTREQ__CCI_NEVNTCNTOVERFLOW_5			440
+#define INTREQ__CCI_NEVNTCNTOVERFLOW_4			441
+#define INTREQ__CCI_NEVNTCNTOVERFLOW_3			442
+#define INTREQ__CCI_NEVNTCNTOVERFLOW_2			443
+#define INTREQ__CCI_NEVNTCNTOVERFLOW_1			444
+#define INTREQ__CCI_NEVNTCNTOVERFLOW_0			445
+#define INTREQ__CCI_NERR				446
+#define INTREQ__PPMU_ACE_CPUCL1_LOW			447
+#define INTREQ__PPMU_ACE_CPUCL1_UPN			448
+#define INTREQ__PPMU_ACE_CPUCL0_LOW			449
+#define INTREQ__PPMU_ACE_CPUCL0_UPN			450
+#define INTREQ__GPIO_CORE				451
+#define INTREQ__MMC_EMBD_CORE				452
+#define INTREQ__RTIC					453
+#define INTREQ__SSS_WDT2				454
+#define INTREQ__SSS_WDT1				455
+#define INTREQ__SSS_KM					456
+#define INTREQ__SSS_MAILBOX				457
+#define INTREQ__SSS					458
+#define INTREQ__TREX_P_CORE_PPMU_M_PERI			459
+#define INTREQ__TREX_P_CORE_PPMU_M_CPU			460
+#define INTREQ__TREX_P_CORE_DEBUG_INT			461
+#define INTREQ__TREX_D_CORE_DEBUG_INT			462
+#define INTREQ__TREX_D_CORE_PPMU_S_PERI			463
+#define INTREQ__TREX_D_CORE_PPMU_NRT_MEM1		464
+#define INTREQ__TREX_D_CORE_PPMU_NRT_MEM0		465
+#define INTREQ__TREX_D_CORE_PPMU_RT_MEM1		466
+#define INTREQ__TREX_D_CORE_PPMU_RT_MEM0		467
+#define INTREQ__TREX_D_CORE_PPMU_CP_MEM1		468
+#define INTREQ__TREX_D_CORE_PPMU_CP_MEM0		469
+#define INTREQ__TREX_D_CORE_PPMU_WLBT			470
+#define INTREQ__TREX_D_CORE_PPMU_MODEM1			471
+#define INTREQ__TREX_D_CORE_PPMU_MODEM0			472
+#define INTREQ__TREX_D_CORE_PPMU_GNSS			473
+#define INTREQ__TREX_D_CORE_PPMU_G3D			474
+#define INTREQ__TREX_D_CORE_PPMU_COREX			475
+#define INTREQ__TREX_D_CORE_PPMU_CHUB			476
+#define INTREQ__TREX_D_CORE_PPMU_APM			477
+#define INTREQ__SPDMA0					478
+#define INTREQ__PDMA0					479
+
+#endif	/* _DT_BINDINGS_INTERRUPT_CONTROLLER_EXYNOS_850_H */
-- 
2.30.2

